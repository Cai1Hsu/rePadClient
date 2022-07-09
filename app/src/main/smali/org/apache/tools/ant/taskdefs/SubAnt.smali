.class public Lorg/apache/tools/ant/taskdefs/SubAnt;
.super Lorg/apache/tools/ant/Task;
.source "SubAnt.java"


# instance fields
.field private ant:Lorg/apache/tools/ant/taskdefs/Ant;

.field private antfile:Ljava/lang/String;

.field private buildpath:Lorg/apache/tools/ant/types/Path;

.field private failOnError:Z

.field private genericantfile:Ljava/io/File;

.field private inheritAll:Z

.field private inheritRefs:Z

.field private output:Ljava/lang/String;

.field private properties:Ljava/util/Vector;

.field private propertySets:Ljava/util/Vector;

.field private references:Ljava/util/Vector;

.field private subTarget:Ljava/lang/String;

.field private targets:Ljava/util/Vector;

.field private verbose:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 68
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    .line 69
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    .line 70
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getDefaultBuildFile()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->antfile:Ljava/lang/String;

    .line 71
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->genericantfile:Ljava/io/File;

    .line 72
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    .line 73
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->inheritAll:Z

    .line 74
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->inheritRefs:Z

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->failOnError:Z

    .line 76
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->output:Ljava/lang/String;

    .line 78
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->properties:Ljava/util/Vector;

    .line 79
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->references:Ljava/util/Vector;

    .line 80
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->propertySets:Ljava/util/Vector;

    .line 83
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->targets:Ljava/util/Vector;

    return-void
.end method

.method private static copyProperty(Lorg/apache/tools/ant/taskdefs/Property;Lorg/apache/tools/ant/taskdefs/Property;)V
    .locals 1
    .param p0, "to"    # Lorg/apache/tools/ant/taskdefs/Property;
    .param p1, "from"    # Lorg/apache/tools/ant/taskdefs/Property;

    .prologue
    .line 610
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setName(Ljava/lang/String;)V

    .line 612
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getValue()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 613
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setValue(Ljava/lang/String;)V

    .line 615
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 616
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setFile(Ljava/io/File;)V

    .line 618
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getResource()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 619
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getResource()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setResource(Ljava/lang/String;)V

    .line 621
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getPrefix()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 622
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setPrefix(Ljava/lang/String;)V

    .line 624
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 625
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 627
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getEnvironment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 628
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getEnvironment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setEnvironment(Ljava/lang/String;)V

    .line 630
    :cond_5
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 631
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Property;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Property;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 633
    :cond_6
    return-void
.end method

.method private createAntTask(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Ant;
    .locals 4
    .param p1, "directory"    # Ljava/io/File;

    .prologue
    .line 569
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Ant;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 570
    .local v0, "antTask":Lorg/apache/tools/ant/taskdefs/Ant;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Ant;->init()V

    .line 571
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 572
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->setTarget(Ljava/lang/String;)V

    .line 576
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->output:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 577
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->output:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->setOutput(Ljava/lang/String;)V

    .line 580
    :cond_1
    if-eqz p1, :cond_2

    .line 581
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->setDir(Ljava/io/File;)V

    .line 586
    :goto_0
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->inheritAll:Z

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->setInheritAll(Z)V

    .line 587
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->properties:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "i":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 588
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Ant;->createProperty()Lorg/apache/tools/ant/taskdefs/Property;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Property;

    invoke-static {v3, v2}, Lorg/apache/tools/ant/taskdefs/SubAnt;->copyProperty(Lorg/apache/tools/ant/taskdefs/Property;Lorg/apache/tools/ant/taskdefs/Property;)V

    goto :goto_1

    .line 583
    .end local v1    # "i":Ljava/util/Enumeration;
    :cond_2
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->setUseNativeBasedir(Z)V

    goto :goto_0

    .line 591
    .restart local v1    # "i":Ljava/util/Enumeration;
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->propertySets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 592
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/PropertySet;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    goto :goto_2

    .line 595
    :cond_4
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->inheritRefs:Z

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->setInheritRefs(Z)V

    .line 596
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->references:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 597
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Ant$Reference;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Ant;->addReference(Lorg/apache/tools/ant/taskdefs/Ant$Reference;)V

    goto :goto_3

    .line 600
    :cond_5
    return-object v0
.end method

.method private execute(Ljava/io/File;Ljava/io/File;)V
    .locals 10
    .param p1, "file"    # Ljava/io/File;
    .param p2, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 284
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v6

    if-nez v6, :cond_2

    .line 285
    :cond_0
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Invalid file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 286
    .local v3, "msg":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->failOnError:Z

    if-eqz v6, :cond_1

    .line 287
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 289
    :cond_1
    invoke-virtual {p0, v3, v9}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 322
    .end local v3    # "msg":Ljava/lang/String;
    :goto_0
    return-void

    .line 293
    :cond_2
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/SubAnt;->createAntTask(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Ant;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    .line 294
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 295
    .local v0, "antfilename":Ljava/lang/String;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v6, v0}, Lorg/apache/tools/ant/taskdefs/Ant;->setAntfile(Ljava/lang/String;)V

    .line 296
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->targets:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v4

    .line 297
    .local v4, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v4, :cond_3

    .line 298
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->targets:Ljava/util/Vector;

    invoke-virtual {v6, v2}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;

    .line 299
    .local v5, "targetElement":Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v6, v5}, Lorg/apache/tools/ant/taskdefs/Ant;->addConfiguredTarget(Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;)V

    .line 297
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 303
    .end local v5    # "targetElement":Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;
    :cond_3
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Ant;->execute()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 320
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    goto :goto_0

    .line 304
    :catch_0
    move-exception v1

    .line 305
    .local v1, "e":Lorg/apache/tools/ant/BuildException;
    :try_start_1
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->failOnError:Z

    if-nez v6, :cond_4

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/SubAnt;->isHardError(Ljava/lang/Throwable;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 306
    :cond_4
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 320
    .end local v1    # "e":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v6

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    throw v6

    .line 308
    .restart local v1    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_5
    :try_start_2
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Failure for target \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\' of: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 320
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    goto :goto_0

    .line 311
    .end local v1    # "e":Lorg/apache/tools/ant/BuildException;
    :catch_1
    move-exception v1

    .line 312
    .local v1, "e":Ljava/lang/Throwable;
    :try_start_3
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->failOnError:Z

    if-nez v6, :cond_6

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/SubAnt;->isHardError(Ljava/lang/Throwable;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 313
    :cond_6
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v6, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 315
    :cond_7
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Failure for target \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\' of: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 320
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    goto/16 :goto_0
.end method

.method private getBuildpath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 545
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->buildpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 546
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->buildpath:Lorg/apache/tools/ant/types/Path;

    .line 548
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->buildpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method private isHardError(Ljava/lang/Throwable;)Z
    .locals 2
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v0, 0x1

    .line 325
    instance-of v1, p1, Lorg/apache/tools/ant/BuildException;

    if-eqz v1, :cond_1

    .line 326
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->isHardError(Ljava/lang/Throwable;)Z

    move-result v0

    .line 332
    :cond_0
    :goto_0
    return v0

    .line 327
    :cond_1
    instance-of v1, p1, Ljava/lang/OutOfMemoryError;

    if-nez v1, :cond_0

    .line 329
    instance-of v1, p1, Ljava/lang/ThreadDeath;

    if-nez v1, :cond_0

    .line 332
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 508
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getBuildpath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 509
    return-void
.end method

.method public addConfiguredTarget(Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;)V
    .locals 3
    .param p1, "t"    # Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;

    .prologue
    .line 388
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 389
    .local v0, "name":Ljava/lang/String;
    const-string/jumbo v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 390
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "target name must not be empty"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 392
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->targets:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 393
    return-void
.end method

.method public addDirset(Lorg/apache/tools/ant/types/DirSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/DirSet;

    .prologue
    .line 473
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/SubAnt;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 474
    return-void
.end method

.method public addFilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 0
    .param p1, "list"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 498
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/SubAnt;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 499
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 486
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/SubAnt;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 487
    return-void
.end method

.method public addProperty(Lorg/apache/tools/ant/taskdefs/Property;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/taskdefs/Property;

    .prologue
    .line 441
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->properties:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 442
    return-void
.end method

.method public addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "ps"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 460
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->propertySets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 461
    return-void
.end method

.method public addReference(Lorg/apache/tools/ant/taskdefs/Ant$Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/taskdefs/Ant$Reference;

    .prologue
    .line 451
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->references:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 452
    return-void
.end method

.method public createBuildpath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 526
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getBuildpath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createBuildpathElement()Lorg/apache/tools/ant/types/Path$PathElement;
    .locals 1

    .prologue
    .line 536
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getBuildpath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 14

    .prologue
    const/4 v11, 0x1

    const/4 v13, 0x0

    const/4 v12, 0x2

    .line 185
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->buildpath:Lorg/apache/tools/ant/types/Path;

    if-nez v10, :cond_0

    .line 186
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "No buildpath specified"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 189
    :cond_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->buildpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v6

    .line 190
    .local v6, "filenames":[Ljava/lang/String;
    array-length v1, v6

    .line 191
    .local v1, "count":I
    if-ge v1, v11, :cond_2

    .line 192
    const-string/jumbo v10, "No sub-builds to iterate on"

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 270
    :cond_1
    return-void

    .line 201
    :cond_2
    const/4 v0, 0x0

    .line 202
    .local v0, "buildException":Lorg/apache/tools/ant/BuildException;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v1, :cond_d

    .line 203
    const/4 v4, 0x0

    .line 204
    .local v4, "file":Ljava/io/File;
    const/4 v8, 0x0

    .line 205
    .local v8, "subdirPath":Ljava/lang/String;
    const/4 v9, 0x0

    .line 207
    .local v9, "thrownException":Ljava/lang/Throwable;
    const/4 v2, 0x0

    .line 208
    .local v2, "directory":Ljava/io/File;
    :try_start_0
    new-instance v5, Ljava/io/File;

    aget-object v10, v6, v7

    invoke-direct {v5, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1

    .line 209
    .end local v4    # "file":Ljava/io/File;
    .local v5, "file":Ljava/io/File;
    :try_start_1
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-eqz v10, :cond_e

    .line 210
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    if-eqz v10, :cond_3

    .line 211
    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    .line 212
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Entering directory: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 214
    :cond_3
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->genericantfile:Ljava/io/File;

    if-eqz v10, :cond_7

    .line 215
    move-object v2, v5

    .line 216
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->genericantfile:Ljava/io/File;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 221
    .end local v5    # "file":Ljava/io/File;
    .restart local v4    # "file":Ljava/io/File;
    :goto_1
    :try_start_2
    invoke-direct {p0, v4, v2}, Lorg/apache/tools/ant/taskdefs/SubAnt;->execute(Ljava/io/File;Ljava/io/File;)V

    .line 222
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    if-eqz v10, :cond_4

    if-eqz v8, :cond_4

    .line 223
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Leaving directory: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    .line 242
    :cond_4
    :goto_2
    if-eqz v9, :cond_6

    .line 243
    instance-of v10, v9, Lorg/apache/tools/ant/BuildException;

    if-eqz v10, :cond_c

    .line 244
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "File \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\' failed with message \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v9}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\'."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v13}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 248
    if-nez v0, :cond_5

    move-object v0, v9

    .line 249
    check-cast v0, Lorg/apache/tools/ant/BuildException;

    .line 261
    :cond_5
    :goto_3
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    if-eqz v10, :cond_6

    if-eqz v8, :cond_6

    .line 262
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Leaving directory: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 202
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 218
    .end local v4    # "file":Ljava/io/File;
    .restart local v5    # "file":Ljava/io/File;
    :cond_7
    :try_start_3
    new-instance v4, Ljava/io/File;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->antfile:Ljava/lang/String;

    invoke-direct {v4, v5, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2

    .end local v5    # "file":Ljava/io/File;
    .restart local v4    # "file":Ljava/io/File;
    goto/16 :goto_1

    .line 225
    :catch_0
    move-exception v3

    .line 226
    .local v3, "ex":Ljava/lang/RuntimeException;
    :goto_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/Project;->isKeepGoingMode()Z

    move-result v10

    if-nez v10, :cond_9

    .line 227
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    if-eqz v10, :cond_8

    if-eqz v8, :cond_8

    .line 228
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Leaving directory: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 230
    :cond_8
    throw v3

    .line 232
    :cond_9
    move-object v9, v3

    .line 241
    goto/16 :goto_2

    .line 233
    .end local v3    # "ex":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v3

    .line 234
    .local v3, "ex":Ljava/lang/Throwable;
    :goto_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/Project;->isKeepGoingMode()Z

    move-result v10

    if-nez v10, :cond_b

    .line 235
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    if-eqz v10, :cond_a

    if-eqz v8, :cond_a

    .line 236
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Leaving directory: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 238
    :cond_a
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v10, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 240
    :cond_b
    move-object v9, v3

    goto/16 :goto_2

    .line 252
    .end local v3    # "ex":Ljava/lang/Throwable;
    :cond_c
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Target \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\' failed with message \'"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v9}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\'."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v13}, Lorg/apache/tools/ant/taskdefs/SubAnt;->log(Ljava/lang/String;I)V

    .line 255
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v9, v10}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 256
    if-nez v0, :cond_5

    .line 257
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    .end local v0    # "buildException":Lorg/apache/tools/ant/BuildException;
    invoke-direct {v0, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    .restart local v0    # "buildException":Lorg/apache/tools/ant/BuildException;
    goto/16 :goto_3

    .line 267
    .end local v2    # "directory":Ljava/io/File;
    .end local v4    # "file":Ljava/io/File;
    .end local v8    # "subdirPath":Ljava/lang/String;
    .end local v9    # "thrownException":Ljava/lang/Throwable;
    :cond_d
    if-eqz v0, :cond_1

    .line 268
    throw v0

    .line 233
    .restart local v2    # "directory":Ljava/io/File;
    .restart local v5    # "file":Ljava/io/File;
    .restart local v8    # "subdirPath":Ljava/lang/String;
    .restart local v9    # "thrownException":Ljava/lang/Throwable;
    :catch_2
    move-exception v3

    move-object v4, v5

    .end local v5    # "file":Ljava/io/File;
    .restart local v4    # "file":Ljava/io/File;
    goto :goto_5

    .line 225
    .end local v4    # "file":Ljava/io/File;
    .restart local v5    # "file":Ljava/io/File;
    :catch_3
    move-exception v3

    move-object v4, v5

    .end local v5    # "file":Ljava/io/File;
    .restart local v4    # "file":Ljava/io/File;
    goto/16 :goto_4

    .end local v4    # "file":Ljava/io/File;
    .restart local v5    # "file":Ljava/io/File;
    :cond_e
    move-object v4, v5

    .end local v5    # "file":Ljava/io/File;
    .restart local v4    # "file":Ljava/io/File;
    goto/16 :goto_1
.end method

.method protected getDefaultBuildFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    const-string/jumbo v0, "build.xml"

    return-object v0
.end method

.method public handleErrorFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleErrorFlush(Ljava/lang/String;)V

    .line 179
    :goto_0
    return-void

    .line 177
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleErrorOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 159
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 160
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleErrorOutput(Ljava/lang/String;)V

    .line 164
    :goto_0
    return-void

    .line 162
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 144
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleFlush(Ljava/lang/String;)V

    .line 149
    :goto_0
    return-void

    .line 147
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleInput([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Ant;->handleInput([BII)I

    move-result v0

    .line 132
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/apache/tools/ant/Task;->handleInput([BII)I

    move-result v0

    goto :goto_0
.end method

.method public handleOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->ant:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleOutput(Ljava/lang/String;)V

    .line 110
    :goto_0
    return-void

    .line 108
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setAntfile(Ljava/lang/String;)V
    .locals 0
    .param p1, "antfile"    # Ljava/lang/String;

    .prologue
    .line 345
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->antfile:Ljava/lang/String;

    .line 346
    return-void
.end method

.method public setBuildpath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 517
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->getBuildpath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 518
    return-void
.end method

.method public setBuildpathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 557
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/SubAnt;->createBuildpath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 558
    return-void
.end method

.method public setFailonerror(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 368
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->failOnError:Z

    .line 369
    return-void
.end method

.method public setGenericAntfile(Ljava/io/File;)V
    .locals 0
    .param p1, "afile"    # Ljava/io/File;

    .prologue
    .line 359
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->genericantfile:Ljava/io/File;

    .line 360
    return-void
.end method

.method public setInheritall(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 421
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->inheritAll:Z

    .line 422
    return-void
.end method

.method public setInheritrefs(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 431
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->inheritRefs:Z

    .line 432
    return-void
.end method

.method public setOutput(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 411
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->output:Ljava/lang/String;

    .line 412
    return-void
.end method

.method public setTarget(Ljava/lang/String;)V
    .locals 0
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 379
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->subTarget:Ljava/lang/String;

    .line 380
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "on"    # Z

    .prologue
    .line 401
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/SubAnt;->verbose:Z

    .line 402
    return-void
.end method
