.class public Lorg/apache/tools/ant/types/CommandlineJava;
.super Ljava/lang/Object;
.source "CommandlineJava.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    }
.end annotation


# instance fields
.field private assertions:Lorg/apache/tools/ant/types/Assertions;

.field private bootclasspath:Lorg/apache/tools/ant/types/Path;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private cloneVm:Z

.field private executeJar:Z

.field private javaCommand:Lorg/apache/tools/ant/types/Commandline;

.field private maxMemory:Ljava/lang/String;

.field private sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

.field private vmCommand:Lorg/apache/tools/ant/types/Commandline;

.field private vmVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 231
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmCommand:Lorg/apache/tools/ant/types/Commandline;

    .line 48
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    .line 52
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .line 53
    iput-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 54
    iput-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 56
    iput-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->maxMemory:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->assertions:Lorg/apache/tools/ant/types/Assertions;

    .line 66
    iput-boolean v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    .line 72
    iput-boolean v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->cloneVm:Z

    .line 232
    const-string/jumbo v0, "java"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJreExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/CommandlineJava;->setVm(Ljava/lang/String;)V

    .line 233
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJavaVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/CommandlineJava;->setVmversion(Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method private addCommandsToList(Ljava/util/ListIterator;)V
    .locals 6
    .param p1, "listIterator"    # Ljava/util/ListIterator;

    .prologue
    .line 417
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getActualVMCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/Commandline;->addCommandToList(Ljava/util/ListIterator;)V

    .line 419
    iget-object v4, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addDefinitionsToList(Ljava/util/ListIterator;)V

    .line 421
    invoke-direct {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->isCloneVm()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 422
    new-instance v1, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;-><init>()V

    .line 423
    .local v1, "clonedSysProperties":Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    new-instance v2, Lorg/apache/tools/ant/types/PropertySet;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/PropertySet;-><init>()V

    .line 424
    .local v2, "ps":Lorg/apache/tools/ant/types/PropertySet;
    new-instance v3, Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;-><init>()V

    .line 426
    .local v3, "sys":Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;
    const-string/jumbo v4, "system"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;->setValue(Ljava/lang/String;)V

    .line 427
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/PropertySet;->appendBuiltin(Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;)V

    .line 428
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 429
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addDefinitionsToList(Ljava/util/ListIterator;)V

    .line 432
    .end local v1    # "clonedSysProperties":Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    .end local v2    # "ps":Lorg/apache/tools/ant/types/PropertySet;
    .end local v3    # "sys":Lorg/apache/tools/ant/types/PropertySet$BuiltinPropertySetName;
    :cond_0
    const/4 v4, 0x1

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/types/CommandlineJava;->calculateBootclasspath(Z)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 433
    .local v0, "bcp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 434
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "-Xbootclasspath:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 437
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->haveClasspath()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 438
    const-string/jumbo v4, "-classpath"

    invoke-interface {p1, v4}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 439
    iget-object v4, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v5, "ignore"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 443
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getAssertions()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 444
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getAssertions()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/Assertions;->applyAssertions(Ljava/util/ListIterator;)V

    .line 450
    :cond_3
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    if-eqz v4, :cond_4

    .line 451
    const-string/jumbo v4, "-jar"

    invoke-interface {p1, v4}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 455
    :cond_4
    iget-object v4, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/Commandline;->addCommandToList(Ljava/util/ListIterator;)V

    .line 456
    return-void
.end method

.method private calculateBootclasspath(Z)Lorg/apache/tools/ant/types/Path;
    .locals 4
    .param p1, "log"    # Z

    .prologue
    const/4 v3, 0x0

    .line 675
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmVersion:Ljava/lang/String;

    const-string/jumbo v2, "1.1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 676
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    .line 677
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v2, "Ignoring bootclasspath as the target VM doesn\'t support it."

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->log(Ljava/lang/String;)V

    .line 690
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    invoke-direct {v1, v3}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    :goto_0
    return-object v1

    .line 681
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 682
    .local v0, "b":Lorg/apache/tools/ant/types/Path;
    if-nez v0, :cond_2

    .line 683
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    .end local v0    # "b":Lorg/apache/tools/ant/types/Path;
    invoke-direct {v0, v3}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 688
    .restart local v0    # "b":Lorg/apache/tools/ant/types/Path;
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->isCloneVm()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string/jumbo v1, "last"

    :goto_1
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemBootClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    goto :goto_0

    :cond_3
    const-string/jumbo v1, "ignore"

    goto :goto_1
.end method

.method private isCloneVm()Z
    .locals 2

    .prologue
    .line 700
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->cloneVm:Z

    if-nez v0, :cond_0

    const-string/jumbo v0, "true"

    const-string/jumbo v1, "ant.build.clonevm"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addSysproperties(Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .prologue
    .line 274
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addSysproperties(Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;)V

    .line 275
    return-void
.end method

.method public addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 257
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 258
    return-void
.end method

.method public addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 265
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 266
    return-void
.end method

.method public clearJavaArgs()V
    .locals 1

    .prologue
    .line 637
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->clearArgs()V

    .line 638
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 614
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/CommandlineJava;

    .line 615
    .local v0, "c":Lorg/apache/tools/ant/types/CommandlineJava;
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Commandline;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava;->vmCommand:Lorg/apache/tools/ant/types/Commandline;

    .line 616
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Commandline;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    .line 617
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .line 618
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v2, :cond_0

    .line 619
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Path;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 621
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-eqz v2, :cond_1

    .line 622
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Path;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 624
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->assertions:Lorg/apache/tools/ant/types/Assertions;

    if-eqz v2, :cond_2

    .line 625
    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->assertions:Lorg/apache/tools/ant/types/Assertions;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Assertions;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Assertions;

    iput-object v2, v0, Lorg/apache/tools/ant/types/CommandlineJava;->assertions:Lorg/apache/tools/ant/types/Assertions;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 627
    :cond_2
    return-object v0

    .line 628
    .end local v0    # "c":Lorg/apache/tools/ant/types/CommandlineJava;
    :catch_0
    move-exception v1

    .line 629
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public createBootclasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 382
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 383
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 385
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public createClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 369
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 370
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 372
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public describeCommand()Ljava/lang/String;
    .locals 1

    .prologue
    .line 482
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Commandline;->describeCommand([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public describeJavaCommand()Ljava/lang/String;
    .locals 1

    .prologue
    .line 494
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getJavaCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Commandline;->describeCommand(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getActualVMCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 4

    .prologue
    .line 502
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Commandline;

    .line 503
    .local v0, "actualVMCommand":Lorg/apache/tools/ant/types/Commandline;
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->maxMemory:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 504
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmVersion:Ljava/lang/String;

    const-string/jumbo v2, "1.1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 505
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-mx"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/CommandlineJava;->maxMemory:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 510
    :cond_0
    :goto_0
    return-object v0

    .line 507
    :cond_1
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-Xmx"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/CommandlineJava;->maxMemory:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getAssertions()Lorg/apache/tools/ant/types/Assertions;
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->assertions:Lorg/apache/tools/ant/types/Assertions;

    return-object v0
.end method

.method public getBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 577
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getClassname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 357
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    if-nez v0, :cond_0

    .line 358
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v0

    .line 360
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 569
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getCommandline()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 402
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 403
    .local v0, "commands":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 405
    .local v1, "listIterator":Ljava/util/ListIterator;
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->addCommandsToList(Ljava/util/ListIterator;)V

    .line 407
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method public getJar()Ljava/lang/String;
    .locals 1

    .prologue
    .line 336
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    if-eqz v0, :cond_0

    .line 337
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v0

    .line 339
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getJavaCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 1

    .prologue
    .line 553
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    return-object v0
.end method

.method public getSystemProperties()Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;
    .locals 1

    .prologue
    .line 603
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    return-object v0
.end method

.method public getVmCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 1

    .prologue
    .line 561
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getActualVMCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    return-object v0
.end method

.method public getVmversion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 393
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmVersion:Ljava/lang/String;

    return-object v0
.end method

.method protected haveBootclasspath(Z)Z
    .locals 1
    .param p1, "log"    # Z

    .prologue
    .line 664
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/CommandlineJava;->calculateBootclasspath(Z)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public haveClasspath()Z
    .locals 3

    .prologue
    .line 647
    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v2, "ignore"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 649
    .local v0, "fullClasspath":Lorg/apache/tools/ant/types/Path;
    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    return v1

    .line 647
    .end local v0    # "fullClasspath":Lorg/apache/tools/ant/types/Path;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 649
    .restart local v0    # "fullClasspath":Lorg/apache/tools/ant/types/Path;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public restoreSystemProperties()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 595
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 596
    return-void
.end method

.method public setAssertions(Lorg/apache/tools/ant/types/Assertions;)V
    .locals 0
    .param p1, "assertions"    # Lorg/apache/tools/ant/types/Assertions;

    .prologue
    .line 317
    iput-object p1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->assertions:Lorg/apache/tools/ant/types/Assertions;

    .line 318
    return-void
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 1
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 347
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 348
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    .line 349
    return-void
.end method

.method public setCloneVm(Z)V
    .locals 0
    .param p1, "cloneVm"    # Z

    .prologue
    .line 301
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->cloneVm:Z

    .line 302
    return-void
.end method

.method public setJar(Ljava/lang/String;)V
    .locals 1
    .param p1, "jarpathname"    # Ljava/lang/String;

    .prologue
    .line 325
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 326
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    .line 327
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 0
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 464
    iput-object p1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->maxMemory:Ljava/lang/String;

    .line 465
    return-void
.end method

.method public setSystemProperties()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 586
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->setSystem()V

    .line 587
    return-void
.end method

.method public setVm(Ljava/lang/String;)V
    .locals 1
    .param p1, "vm"    # Ljava/lang/String;

    .prologue
    .line 282
    iget-object v0, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 283
    return-void
.end method

.method public setVmversion(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 290
    iput-object p1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->vmVersion:Ljava/lang/String;

    .line 291
    return-void
.end method

.method public size()I
    .locals 3

    .prologue
    .line 523
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getActualVMCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->javaCommand:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/tools/ant/types/CommandlineJava;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v2

    add-int v0, v1, v2

    .line 526
    .local v0, "size":I
    invoke-direct {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->isCloneVm()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 527
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Properties;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 530
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->haveClasspath()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 531
    add-int/lit8 v0, v0, 0x2

    .line 534
    :cond_1
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/types/CommandlineJava;->calculateBootclasspath(Z)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 535
    add-int/lit8 v0, v0, 0x1

    .line 538
    :cond_2
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/CommandlineJava;->executeJar:Z

    if-eqz v1, :cond_3

    .line 539
    add-int/lit8 v0, v0, 0x1

    .line 542
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getAssertions()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 543
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getAssertions()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Assertions;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 545
    :cond_4
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 472
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->getCommandline()[Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/types/Commandline;->toString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
