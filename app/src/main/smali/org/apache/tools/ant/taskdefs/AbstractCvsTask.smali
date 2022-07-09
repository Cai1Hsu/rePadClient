.class public abstract Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;
.super Lorg/apache/tools/ant/Task;
.source "AbstractCvsTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    }
.end annotation


# static fields
.field private static final DEFAULT_COMMAND:Ljava/lang/String; = "checkout"

.field public static final DEFAULT_COMPRESSION_LEVEL:I = 0x3

.field private static final MAXIMUM_COMRESSION_LEVEL:I = 0x9


# instance fields
.field private append:Z

.field private cmd:Lorg/apache/tools/ant/types/Commandline;

.field private command:Ljava/lang/String;

.field private compression:I

.field private cvsPackage:Ljava/lang/String;

.field private cvsRoot:Ljava/lang/String;

.field private cvsRsh:Ljava/lang/String;

.field private dest:Ljava/io/File;

.field private error:Ljava/io/File;

.field private errorStream:Ljava/io/OutputStream;

.field private executeStreamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

.field private failOnError:Z

.field private modules:Ljava/util/ArrayList;

.field private noexec:Z

.field private output:Ljava/io/File;

.field private outputStream:Ljava/io/OutputStream;

.field private passFile:Ljava/io/File;

.field private port:I

.field private quiet:Z

.field private reallyquiet:Z

.field private tag:Ljava/lang/String;

.field private vecCommandlines:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 154
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 56
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cmd:Lorg/apache/tools/ant/types/Commandline;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->modules:Ljava/util/ArrayList;

    .line 61
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    .line 88
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->command:Ljava/lang/String;

    .line 93
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->quiet:Z

    .line 98
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->reallyquiet:Z

    .line 103
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->compression:I

    .line 108
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->noexec:Z

    .line 113
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->port:I

    .line 118
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    .line 126
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->append:Z

    .line 142
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->failOnError:Z

    .line 155
    return-void
.end method

.method private executeToString(Lorg/apache/tools/ant/taskdefs/Execute;)Ljava/lang/String;
    .locals 6
    .param p1, "execute"    # Lorg/apache/tools/ant/taskdefs/Execute;

    .prologue
    .line 423
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Execute;->getCommandline()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 425
    .local v0, "cmdLine":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->removeCvsPassword(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    .line 427
    .local v2, "stringBuffer":Ljava/lang/StringBuffer;
    sget-object v1, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    .line 428
    .local v1, "newLine":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironment()[Ljava/lang/String;

    move-result-object v3

    .line 430
    .local v3, "variableArray":[Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 431
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 432
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 433
    const-string/jumbo v5, "environment:"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 434
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    const/4 v4, 0x0

    .local v4, "z":I
    :goto_0
    array-length v5, v3

    if-ge v4, v5, :cond_0

    .line 436
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 437
    const-string/jumbo v5, "\t"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 438
    aget-object v5, v3, v4

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 435
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 442
    .end local v4    # "z":I
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private removeCvsPassword(Ljava/lang/String;)Ljava/lang/StringBuffer;
    .locals 9
    .param p1, "cmdLine"    # Ljava/lang/String;

    .prologue
    .line 454
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6, p1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 456
    .local v6, "stringBuffer":Ljava/lang/StringBuffer;
    const-string/jumbo v7, "-d:"

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 458
    .local v1, "start":I
    if-ltz v1, :cond_0

    .line 459
    const-string/jumbo v7, "@"

    invoke-virtual {p1, v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 460
    .local v5, "stop":I
    const-string/jumbo v7, ":"

    invoke-virtual {p1, v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 461
    .local v3, "startproto":I
    const-string/jumbo v7, ":"

    add-int/lit8 v8, v3, 0x1

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 462
    .local v4, "startuser":I
    const-string/jumbo v7, ":"

    add-int/lit8 v8, v4, 0x1

    invoke-virtual {p1, v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 463
    .local v2, "startpass":I
    const-string/jumbo v7, "@"

    invoke-virtual {p1, v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 464
    if-ltz v5, :cond_0

    if-le v2, v3, :cond_0

    if-ge v2, v5, :cond_0

    .line 465
    add-int/lit8 v0, v2, 0x1

    .local v0, "i":I
    :goto_0
    if-ge v0, v5, :cond_0

    .line 466
    add-int/lit8 v7, v0, 0x1

    const-string/jumbo v8, "*"

    invoke-virtual {v6, v0, v7, v8}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 465
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 470
    .end local v0    # "i":I
    .end local v2    # "startpass":I
    .end local v3    # "startproto":I
    .end local v4    # "startuser":I
    .end local v5    # "stop":I
    :cond_0
    return-object v6
.end method


# virtual methods
.method public addCommandArgument(Ljava/lang/String;)V
    .locals 1
    .param p1, "arg"    # Ljava/lang/String;

    .prologue
    .line 629
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->addCommandArgument(Lorg/apache/tools/ant/types/Commandline;Ljava/lang/String;)V

    .line 630
    return-void
.end method

.method public addCommandArgument(Lorg/apache/tools/ant/types/Commandline;Ljava/lang/String;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "arg"    # Ljava/lang/String;

    .prologue
    .line 643
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 644
    return-void
.end method

.method public addConfiguredCommandline(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 807
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->addConfiguredCommandline(Lorg/apache/tools/ant/types/Commandline;Z)V

    .line 808
    return-void
.end method

.method public addConfiguredCommandline(Lorg/apache/tools/ant/types/Commandline;Z)V
    .locals 2
    .param p1, "c"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "insertAtStart"    # Z

    .prologue
    .line 818
    if-nez p1, :cond_0

    .line 827
    :goto_0
    return-void

    .line 821
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->configureCommandline(Lorg/apache/tools/ant/types/Commandline;)V

    .line 822
    if-eqz p2, :cond_1

    .line 823
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    goto :goto_0

    .line 825
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public addModule(Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;)V
    .locals 1
    .param p1, "m"    # Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;

    .prologue
    .line 855
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->modules:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 856
    return-void
.end method

.method protected configureCommandline(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 6
    .param p1, "c"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v5, 0x1

    .line 765
    if-nez p1, :cond_1

    .line 792
    :cond_0
    :goto_0
    return-void

    .line 768
    :cond_1
    const-string/jumbo v2, "cvs"

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 769
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsPackage:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 770
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsPackage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 772
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->modules:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 773
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;

    .line 774
    .local v1, "m":Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 776
    .end local v1    # "m":Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    :cond_3
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->compression:I

    if-lez v2, :cond_4

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->compression:I

    const/16 v3, 0x9

    if-gt v2, v3, :cond_4

    .line 778
    invoke-virtual {p1, v5}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-z"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->compression:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 780
    :cond_4
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->quiet:Z

    if-eqz v2, :cond_5

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->reallyquiet:Z

    if-nez v2, :cond_5

    .line 781
    invoke-virtual {p1, v5}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-q"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 783
    :cond_5
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->reallyquiet:Z

    if-eqz v2, :cond_6

    .line 784
    invoke-virtual {p1, v5}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-Q"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 786
    :cond_6
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->noexec:Z

    if-eqz v2, :cond_7

    .line 787
    invoke-virtual {p1, v5}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-n"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 789
    :cond_7
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRoot:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 790
    invoke-virtual {p1, v5}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "-d"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRoot:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 391
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getCommand()Ljava/lang/String;

    move-result-object v3

    .line 393
    .local v3, "savedCommand":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getCommand()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 395
    const-string/jumbo v5, "checkout"

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setCommand(Ljava/lang/String;)V

    .line 398
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getCommand()Ljava/lang/String;

    move-result-object v0

    .line 399
    .local v0, "c":Ljava/lang/String;
    const/4 v1, 0x0

    .line 400
    .local v1, "cloned":Lorg/apache/tools/ant/types/Commandline;
    if-eqz v0, :cond_1

    .line 401
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "cloned":Lorg/apache/tools/ant/types/Commandline;
    check-cast v1, Lorg/apache/tools/ant/types/Commandline;

    .line 402
    .restart local v1    # "cloned":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 403
    invoke-virtual {p0, v1, v6}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->addConfiguredCommandline(Lorg/apache/tools/ant/types/Commandline;Z)V

    .line 407
    :cond_1
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 408
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_3

    .line 409
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    invoke-virtual {v5, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->runCommand(Lorg/apache/tools/ant/types/Commandline;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 408
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 412
    .end local v2    # "i":I
    .end local v4    # "size":I
    :catchall_0
    move-exception v5

    if-eqz v1, :cond_2

    .line 413
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->removeCommandline(Lorg/apache/tools/ant/types/Commandline;)V

    .line 415
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setCommand(Ljava/lang/String;)V

    .line 416
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->outputStream:Ljava/io/OutputStream;

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 417
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->errorStream:Ljava/io/OutputStream;

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 412
    throw v5

    .restart local v2    # "i":I
    .restart local v4    # "size":I
    :cond_3
    if-eqz v1, :cond_4

    .line 413
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->removeCommandline(Lorg/apache/tools/ant/types/Commandline;)V

    .line 415
    :cond_4
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setCommand(Ljava/lang/String;)V

    .line 416
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->outputStream:Ljava/io/OutputStream;

    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 417
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->errorStream:Ljava/io/OutputStream;

    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 419
    return-void
.end method

.method public getCommand()Ljava/lang/String;
    .locals 1

    .prologue
    .line 679
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->command:Ljava/lang/String;

    return-object v0
.end method

.method public getCvsRoot()Ljava/lang/String;
    .locals 1

    .prologue
    .line 497
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRoot:Ljava/lang/String;

    return-object v0
.end method

.method public getCvsRsh()Ljava/lang/String;
    .locals 1

    .prologue
    .line 522
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRsh:Ljava/lang/String;

    return-object v0
.end method

.method public getDest()Ljava/io/File;
    .locals 1

    .prologue
    .line 581
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    return-object v0
.end method

.method protected getErrorStream()Ljava/io/OutputStream;
    .locals 6

    .prologue
    .line 237
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->errorStream:Ljava/io/OutputStream;

    if-nez v1, :cond_0

    .line 239
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->error:Ljava/io/File;

    if-eqz v1, :cond_1

    .line 242
    :try_start_0
    new-instance v1, Ljava/io/PrintStream;

    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->error:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->append:Z

    invoke-direct {v3, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v1, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setErrorStream(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->errorStream:Ljava/io/OutputStream;

    return-object v1

    .line 246
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 250
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setErrorStream(Ljava/io/OutputStream;)V

    goto :goto_0
.end method

.method protected getExecuteStreamHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    .locals 3

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->executeStreamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    if-nez v0, :cond_0

    .line 172
    new-instance v0, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getErrorStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setExecuteStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 176
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->executeStreamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    return-object v0
.end method

.method protected getModules()Ljava/util/List;
    .locals 1

    .prologue
    .line 859
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->modules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method protected getOutputStream()Ljava/io/OutputStream;
    .locals 6

    .prologue
    .line 198
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->outputStream:Ljava/io/OutputStream;

    if-nez v1, :cond_0

    .line 200
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->output:Ljava/io/File;

    if-eqz v1, :cond_1

    .line 202
    :try_start_0
    new-instance v1, Ljava/io/PrintStream;

    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->output:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->append:Z

    invoke-direct {v3, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v1, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setOutputStream(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 215
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->outputStream:Ljava/io/OutputStream;

    return-object v1

    .line 207
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 211
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setOutputStream(Ljava/io/OutputStream;)V

    goto :goto_0
.end method

.method public getPackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 600
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsPackage:Ljava/lang/String;

    return-object v0
.end method

.method public getPassFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 558
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 540
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->port:I

    return v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 608
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->tag:Ljava/lang/String;

    return-object v0
.end method

.method protected removeCommandline(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 799
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->vecCommandlines:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 800
    return-void
.end method

.method protected runCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 13
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x1

    .line 270
    new-instance v3, Lorg/apache/tools/ant/types/Environment;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/Environment;-><init>()V

    .line 272
    .local v3, "env":Lorg/apache/tools/ant/types/Environment;
    iget v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->port:I

    if-lez v8, :cond_0

    .line 273
    new-instance v7, Lorg/apache/tools/ant/types/Environment$Variable;

    invoke-direct {v7}, Lorg/apache/tools/ant/types/Environment$Variable;-><init>()V

    .line 274
    .local v7, "var":Lorg/apache/tools/ant/types/Environment$Variable;
    const-string/jumbo v8, "CVS_CLIENT_PORT"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setKey(Ljava/lang/String;)V

    .line 275
    iget v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->port:I

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setValue(Ljava/lang/String;)V

    .line 276
    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 280
    new-instance v7, Lorg/apache/tools/ant/types/Environment$Variable;

    .end local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    invoke-direct {v7}, Lorg/apache/tools/ant/types/Environment$Variable;-><init>()V

    .line 281
    .restart local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    const-string/jumbo v8, "CVS_PSERVER_PORT"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setKey(Ljava/lang/String;)V

    .line 282
    iget v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->port:I

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setValue(Ljava/lang/String;)V

    .line 283
    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 290
    .end local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    if-nez v8, :cond_1

    .line 292
    new-instance v1, Ljava/io/File;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "cygwin.user.home"

    const-string/jumbo v10, "user.home"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    sget-char v9, Ljava/io/File;->separatorChar:C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, ".cvspass"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 297
    .local v1, "defaultPassFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 298
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setPassfile(Ljava/io/File;)V

    .line 302
    .end local v1    # "defaultPassFile":Ljava/io/File;
    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    if-eqz v8, :cond_2

    .line 303
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->isFile()Z

    move-result v8

    if-eqz v8, :cond_6

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->canRead()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 304
    new-instance v7, Lorg/apache/tools/ant/types/Environment$Variable;

    invoke-direct {v7}, Lorg/apache/tools/ant/types/Environment$Variable;-><init>()V

    .line 305
    .restart local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    const-string/jumbo v8, "CVS_PASSFILE"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setKey(Ljava/lang/String;)V

    .line 306
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setValue(Ljava/lang/String;)V

    .line 307
    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 308
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Using cvs passfile: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v12}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    .line 321
    .end local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    :cond_2
    :goto_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRsh:Ljava/lang/String;

    if-eqz v8, :cond_3

    .line 322
    new-instance v7, Lorg/apache/tools/ant/types/Environment$Variable;

    invoke-direct {v7}, Lorg/apache/tools/ant/types/Environment$Variable;-><init>()V

    .line 323
    .restart local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    const-string/jumbo v8, "CVS_RSH"

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setKey(Ljava/lang/String;)V

    .line 324
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRsh:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/Environment$Variable;->setValue(Ljava/lang/String;)V

    .line 325
    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/types/Environment;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 332
    .end local v7    # "var":Lorg/apache/tools/ant/types/Environment$Variable;
    :cond_3
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getExecuteStreamHandler()Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v4, v8, v9}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 334
    .local v4, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 335
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    if-nez v8, :cond_4

    .line 336
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v8

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    .line 339
    :cond_4
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_5

    .line 340
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 343
    :cond_5
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 344
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 345
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Environment;->getVariables()[Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/apache/tools/ant/taskdefs/Execute;->setEnvironment([Ljava/lang/String;)V

    .line 348
    :try_start_0
    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->executeToString(Lorg/apache/tools/ant/taskdefs/Execute;)Ljava/lang/String;

    move-result-object v0

    .line 350
    .local v0, "actualCommandLine":Ljava/lang/String;
    const/4 v8, 0x3

    invoke-virtual {p0, v0, v8}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    .line 351
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v5

    .line 352
    .local v5, "retCode":I
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "retCode="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x4

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    .line 354
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->failOnError:Z

    if-eqz v8, :cond_9

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 355
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "cvs exited with error code "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    sget-object v10, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "Command line was ["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "]"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 362
    .end local v0    # "actualCommandLine":Ljava/lang/String;
    .end local v5    # "retCode":I
    :catch_0
    move-exception v2

    .line 363
    .local v2, "e":Ljava/io/IOException;
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->failOnError:Z

    if-eqz v8, :cond_8

    .line 364
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v8, v2, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v8

    .line 310
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :cond_6
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->canRead()Z

    move-result v8

    if-nez v8, :cond_7

    .line 311
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "cvs passfile: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " ignored as it is not readable"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 315
    :cond_7
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "cvs passfile: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " ignored as it is not a file"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 366
    .restart local v2    # "e":Ljava/io/IOException;
    .restart local v4    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :cond_8
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Caught exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    .line 382
    .end local v2    # "e":Ljava/io/IOException;
    :cond_9
    :goto_1
    return-void

    .line 367
    :catch_1
    move-exception v2

    .line 368
    .local v2, "e":Lorg/apache/tools/ant/BuildException;
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->failOnError:Z

    if-eqz v8, :cond_a

    .line 369
    throw v2

    .line 371
    :cond_a
    invoke-virtual {v2}, Lorg/apache/tools/ant/BuildException;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    .line 372
    .local v6, "t":Ljava/lang/Throwable;
    if-nez v6, :cond_b

    .line 373
    move-object v6, v2

    .line 375
    :cond_b
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Caught exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 376
    .end local v2    # "e":Lorg/apache/tools/ant/BuildException;
    .end local v6    # "t":Ljava/lang/Throwable;
    :catch_2
    move-exception v2

    .line 377
    .local v2, "e":Ljava/lang/Exception;
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->failOnError:Z

    if-eqz v8, :cond_c

    .line 378
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v8, v2, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v8

    .line 380
    :cond_c
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Caught exception: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->log(Ljava/lang/String;I)V

    goto :goto_1
.end method

.method public setAppend(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 731
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->append:Z

    .line 732
    return-void
.end method

.method public setCommand(Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 668
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->command:Ljava/lang/String;

    .line 669
    return-void
.end method

.method public setCompression(Z)V
    .locals 1
    .param p1, "usecomp"    # Z

    .prologue
    .line 845
    if-eqz p1, :cond_0

    const/4 v0, 0x3

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->setCompressionLevel(I)V

    .line 847
    return-void

    .line 845
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setCompressionLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 835
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->compression:I

    .line 836
    return-void
.end method

.method public setCvsRoot(Ljava/lang/String;)V
    .locals 2
    .param p1, "root"    # Ljava/lang/String;

    .prologue
    .line 482
    if-eqz p1, :cond_0

    .line 483
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 484
    const/4 p1, 0x0

    .line 488
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRoot:Ljava/lang/String;

    .line 489
    return-void
.end method

.method public setCvsRsh(Ljava/lang/String;)V
    .locals 2
    .param p1, "rsh"    # Ljava/lang/String;

    .prologue
    .line 507
    if-eqz p1, :cond_0

    .line 508
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 509
    const/4 p1, 0x0

    .line 513
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsRsh:Ljava/lang/String;

    .line 514
    return-void
.end method

.method public setDate(Ljava/lang/String;)V
    .locals 1
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 653
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 654
    const-string/jumbo v0, "-D"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->addCommandArgument(Ljava/lang/String;)V

    .line 655
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->addCommandArgument(Ljava/lang/String;)V

    .line 657
    :cond_0
    return-void
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 571
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->dest:Ljava/io/File;

    .line 572
    return-void
.end method

.method public setError(Ljava/io/File;)V
    .locals 0
    .param p1, "error"    # Ljava/io/File;

    .prologue
    .line 723
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->error:Ljava/io/File;

    .line 724
    return-void
.end method

.method protected setErrorStream(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "errorStream"    # Ljava/io/OutputStream;

    .prologue
    .line 224
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->errorStream:Ljava/io/OutputStream;

    .line 225
    return-void
.end method

.method public setExecuteStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V
    .locals 0
    .param p1, "handler"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .prologue
    .line 162
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->executeStreamHandler:Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .line 163
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 742
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->failOnError:Z

    .line 743
    return-void
.end method

.method public setNoexec(Z)V
    .locals 0
    .param p1, "ne"    # Z

    .prologue
    .line 706
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->noexec:Z

    .line 707
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 0
    .param p1, "output"    # Ljava/io/File;

    .prologue
    .line 714
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->output:Ljava/io/File;

    .line 715
    return-void
.end method

.method protected setOutputStream(Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->outputStream:Ljava/io/OutputStream;

    .line 186
    return-void
.end method

.method public setPackage(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 590
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->cvsPackage:Ljava/lang/String;

    .line 591
    return-void
.end method

.method public setPassfile(Ljava/io/File;)V
    .locals 0
    .param p1, "passFile"    # Ljava/io/File;

    .prologue
    .line 549
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->passFile:Ljava/io/File;

    .line 550
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 531
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->port:I

    .line 532
    return-void
.end method

.method public setQuiet(Z)V
    .locals 0
    .param p1, "q"    # Z

    .prologue
    .line 687
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->quiet:Z

    .line 688
    return-void
.end method

.method public setReallyquiet(Z)V
    .locals 0
    .param p1, "q"    # Z

    .prologue
    .line 696
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->reallyquiet:Z

    .line 697
    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 2
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 617
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 618
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->tag:Ljava/lang/String;

    .line 619
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-r"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->addCommandArgument(Ljava/lang/String;)V

    .line 621
    :cond_0
    return-void
.end method
