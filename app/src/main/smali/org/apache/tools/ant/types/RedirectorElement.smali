.class public Lorg/apache/tools/ant/types/RedirectorElement;
.super Lorg/apache/tools/ant/types/DataType;
.source "RedirectorElement.java"


# static fields
.field static class$org$apache$tools$ant$util$MergingMapper:Ljava/lang/Class;


# instance fields
.field private alwaysLog:Ljava/lang/Boolean;

.field private append:Ljava/lang/Boolean;

.field private createEmptyFiles:Ljava/lang/Boolean;

.field private errorEncoding:Ljava/lang/String;

.field private errorFilterChains:Ljava/util/Vector;

.field private errorMapper:Lorg/apache/tools/ant/types/Mapper;

.field private errorProperty:Ljava/lang/String;

.field private inputEncoding:Ljava/lang/String;

.field private inputFilterChains:Ljava/util/Vector;

.field private inputMapper:Lorg/apache/tools/ant/types/Mapper;

.field private inputString:Ljava/lang/String;

.field private logError:Ljava/lang/Boolean;

.field private logInputString:Ljava/lang/Boolean;

.field private outputEncoding:Ljava/lang/String;

.field private outputFilterChains:Ljava/util/Vector;

.field private outputMapper:Lorg/apache/tools/ant/types/Mapper;

.field private outputProperty:Ljava/lang/String;

.field private usingError:Z

.field private usingInput:Z

.field private usingOutput:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 39
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingInput:Z

    .line 44
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingOutput:Z

    .line 49
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingError:Z

    .line 86
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputFilterChains:Ljava/util/Vector;

    .line 89
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputFilterChains:Ljava/util/Vector;

    .line 92
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorFilterChains:Ljava/util/Vector;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 542
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

.method private getRef()Lorg/apache/tools/ant/types/RedirectorElement;
    .locals 1

    .prologue
    .line 609
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/RedirectorElement;

    return-object v0
.end method


# virtual methods
.method public addConfiguredErrorMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 2
    .param p1, "errorMapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 154
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorMapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_2

    .line 155
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingError:Z

    if-eqz v0, :cond_1

    .line 156
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "attribute \"error\" cannot coexist with a nested <errormapper>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot have > 1 <errormapper>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 162
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    .line 163
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorMapper:Lorg/apache/tools/ant/types/Mapper;

    .line 164
    return-void
.end method

.method public addConfiguredInputMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 2
    .param p1, "inputMapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 111
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 114
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputMapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_2

    .line 115
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingInput:Z

    if-eqz v0, :cond_1

    .line 116
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "attribute \"input\" cannot coexist with a nested <inputmapper>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot have > 1 <inputmapper>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 122
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    .line 123
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputMapper:Lorg/apache/tools/ant/types/Mapper;

    .line 124
    return-void
.end method

.method public addConfiguredOutputMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 2
    .param p1, "outputMapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 132
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 134
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputMapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_2

    .line 135
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingOutput:Z

    if-eqz v0, :cond_1

    .line 136
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "attribute \"output\" cannot coexist with a nested <outputmapper>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot have > 1 <outputmapper>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    .line 143
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputMapper:Lorg/apache/tools/ant/types/Mapper;

    .line 144
    return-void
.end method

.method public configure(Lorg/apache/tools/ant/taskdefs/Redirector;)V
    .locals 1
    .param p1, "redirector"    # Lorg/apache/tools/ant/taskdefs/Redirector;

    .prologue
    .line 433
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    .line 434
    return-void
.end method

.method public configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V
    .locals 5
    .param p1, "redirector"    # Lorg/apache/tools/ant/taskdefs/Redirector;
    .param p2, "sourcefile"    # Ljava/lang/String;

    .prologue
    .line 443
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 444
    invoke-direct {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getRef()Lorg/apache/tools/ant/types/RedirectorElement;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Lorg/apache/tools/ant/types/RedirectorElement;->configure(Lorg/apache/tools/ant/taskdefs/Redirector;Ljava/lang/String;)V

    .line 532
    :cond_0
    :goto_0
    return-void

    .line 447
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->dieOnCircularReference()V

    .line 448
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->alwaysLog:Ljava/lang/Boolean;

    if-eqz v4, :cond_2

    .line 449
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->alwaysLog:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAlwaysLog(Z)V

    .line 451
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logError:Ljava/lang/Boolean;

    if-eqz v4, :cond_3

    .line 452
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logError:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setLogError(Z)V

    .line 454
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->append:Ljava/lang/Boolean;

    if-eqz v4, :cond_4

    .line 455
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->append:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setAppend(Z)V

    .line 457
    :cond_4
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->createEmptyFiles:Ljava/lang/Boolean;

    if-eqz v4, :cond_5

    .line 458
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->createEmptyFiles:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setCreateEmptyFiles(Z)V

    .line 460
    :cond_5
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputProperty:Ljava/lang/String;

    if-eqz v4, :cond_6

    .line 461
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputProperty:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutputProperty(Ljava/lang/String;)V

    .line 463
    :cond_6
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorProperty:Ljava/lang/String;

    if-eqz v4, :cond_7

    .line 464
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorProperty:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setErrorProperty(Ljava/lang/String;)V

    .line 466
    :cond_7
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputString:Ljava/lang/String;

    if-eqz v4, :cond_8

    .line 467
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputString:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInputString(Ljava/lang/String;)V

    .line 469
    :cond_8
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logInputString:Ljava/lang/Boolean;

    if-eqz v4, :cond_9

    .line 470
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logInputString:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setLogInputString(Z)V

    .line 472
    :cond_9
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputMapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v4, :cond_b

    .line 473
    const/4 v2, 0x0

    .line 475
    .local v2, "inputTargets":[Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputMapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v4

    invoke-interface {v4, p2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 482
    :cond_a
    if-eqz v2, :cond_b

    array-length v4, v2

    if-lez v4, :cond_b

    .line 483
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/RedirectorElement;->toFileArray([Ljava/lang/String;)[Ljava/io/File;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInput([Ljava/io/File;)V

    .line 486
    .end local v2    # "inputTargets":[Ljava/lang/String;
    :cond_b
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputMapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v4, :cond_d

    .line 487
    const/4 v3, 0x0

    .line 489
    .local v3, "outputTargets":[Ljava/lang/String;
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputMapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v4

    invoke-interface {v4, p2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 496
    :cond_c
    if-eqz v3, :cond_d

    array-length v4, v3

    if-lez v4, :cond_d

    .line 497
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/RedirectorElement;->toFileArray([Ljava/lang/String;)[Ljava/io/File;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutput([Ljava/io/File;)V

    .line 500
    .end local v3    # "outputTargets":[Ljava/lang/String;
    :cond_d
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorMapper:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v4, :cond_f

    .line 501
    const/4 v1, 0x0

    .line 503
    .local v1, "errorTargets":[Ljava/lang/String;
    :try_start_2
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorMapper:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v4

    invoke-interface {v4, p2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v1

    .line 510
    :cond_e
    if-eqz v1, :cond_f

    array-length v4, v1

    if-lez v4, :cond_f

    .line 511
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/RedirectorElement;->toFileArray([Ljava/lang/String;)[Ljava/io/File;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setError([Ljava/io/File;)V

    .line 514
    .end local v1    # "errorTargets":[Ljava/lang/String;
    :cond_f
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputFilterChains:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-lez v4, :cond_10

    .line 515
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputFilterChains:Ljava/util/Vector;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInputFilterChains(Ljava/util/Vector;)V

    .line 517
    :cond_10
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputFilterChains:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-lez v4, :cond_11

    .line 518
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputFilterChains:Ljava/util/Vector;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutputFilterChains(Ljava/util/Vector;)V

    .line 520
    :cond_11
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorFilterChains:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-lez v4, :cond_12

    .line 521
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorFilterChains:Ljava/util/Vector;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setErrorFilterChains(Ljava/util/Vector;)V

    .line 523
    :cond_12
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputEncoding:Ljava/lang/String;

    if-eqz v4, :cond_13

    .line 524
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputEncoding:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setInputEncoding(Ljava/lang/String;)V

    .line 526
    :cond_13
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputEncoding:Ljava/lang/String;

    if-eqz v4, :cond_14

    .line 527
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputEncoding:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setOutputEncoding(Ljava/lang/String;)V

    .line 529
    :cond_14
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorEncoding:Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 530
    iget-object v4, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorEncoding:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/taskdefs/Redirector;->setErrorEncoding(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 477
    .restart local v2    # "inputTargets":[Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 478
    .local v0, "enPeaEx":Ljava/lang/NullPointerException;
    if-eqz p2, :cond_a

    .line 479
    throw v0

    .line 491
    .end local v0    # "enPeaEx":Ljava/lang/NullPointerException;
    .end local v2    # "inputTargets":[Ljava/lang/String;
    .restart local v3    # "outputTargets":[Ljava/lang/String;
    :catch_1
    move-exception v0

    .line 492
    .restart local v0    # "enPeaEx":Ljava/lang/NullPointerException;
    if-eqz p2, :cond_c

    .line 493
    throw v0

    .line 505
    .end local v0    # "enPeaEx":Ljava/lang/NullPointerException;
    .end local v3    # "outputTargets":[Ljava/lang/String;
    .restart local v1    # "errorTargets":[Ljava/lang/String;
    :catch_2
    move-exception v0

    .line 506
    .restart local v0    # "enPeaEx":Ljava/lang/NullPointerException;
    if-eqz p2, :cond_e

    .line 507
    throw v0
.end method

.method public createErrorFilterChain()Lorg/apache/tools/ant/types/FilterChain;
    .locals 2

    .prologue
    .line 418
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 419
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 421
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/FilterChain;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FilterChain;-><init>()V

    .line 422
    .local v0, "result":Lorg/apache/tools/ant/types/FilterChain;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FilterChain;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 423
    iget-object v1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorFilterChains:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 424
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    .line 425
    return-object v0
.end method

.method public createInputFilterChain()Lorg/apache/tools/ant/types/FilterChain;
    .locals 2

    .prologue
    .line 388
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 389
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 391
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/FilterChain;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FilterChain;-><init>()V

    .line 392
    .local v0, "result":Lorg/apache/tools/ant/types/FilterChain;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FilterChain;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 393
    iget-object v1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputFilterChains:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 394
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    .line 395
    return-object v0
.end method

.method protected createMergeMapper(Ljava/io/File;)Lorg/apache/tools/ant/types/Mapper;
    .locals 2
    .param p1, "destfile"    # Ljava/io/File;

    .prologue
    .line 540
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 541
    .local v0, "result":Lorg/apache/tools/ant/types/Mapper;
    sget-object v1, Lorg/apache/tools/ant/types/RedirectorElement;->class$org$apache$tools$ant$util$MergingMapper:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.util.MergingMapper"

    invoke-static {v1}, Lorg/apache/tools/ant/types/RedirectorElement;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/RedirectorElement;->class$org$apache$tools$ant$util$MergingMapper:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Mapper;->setClassname(Ljava/lang/String;)V

    .line 543
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Mapper;->setTo(Ljava/lang/String;)V

    .line 544
    return-object v0

    .line 541
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/types/RedirectorElement;->class$org$apache$tools$ant$util$MergingMapper:Ljava/lang/Class;

    goto :goto_0
.end method

.method public createOutputFilterChain()Lorg/apache/tools/ant/types/FilterChain;
    .locals 2

    .prologue
    .line 403
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 404
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 406
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/FilterChain;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FilterChain;-><init>()V

    .line 407
    .local v0, "result":Lorg/apache/tools/ant/types/FilterChain;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FilterChain;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 408
    iget-object v1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputFilterChains:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 409
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    .line 410
    return-object v0
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 10
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 575
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isChecked()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 601
    :goto_0
    return-void

    .line 578
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 579
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 581
    :cond_1
    new-array v3, v9, [Lorg/apache/tools/ant/types/Mapper;

    iget-object v5, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputMapper:Lorg/apache/tools/ant/types/Mapper;

    aput-object v5, v3, v7

    iget-object v5, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputMapper:Lorg/apache/tools/ant/types/Mapper;

    aput-object v5, v3, v6

    iget-object v5, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorMapper:Lorg/apache/tools/ant/types/Mapper;

    aput-object v5, v3, v8

    .line 582
    .local v3, "m":[Lorg/apache/tools/ant/types/Mapper;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v3

    if-ge v2, v5, :cond_3

    .line 583
    aget-object v5, v3, v2

    if-eqz v5, :cond_2

    .line 584
    aget-object v5, v3, v2

    invoke-virtual {p1, v5}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    aget-object v5, v3, v2

    invoke-virtual {v5, p1, p2}, Lorg/apache/tools/ant/types/Mapper;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 586
    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 582
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 589
    :cond_3
    new-array v4, v9, [Ljava/util/Vector;

    iget-object v5, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputFilterChains:Ljava/util/Vector;

    aput-object v5, v4, v7

    iget-object v5, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputFilterChains:Ljava/util/Vector;

    aput-object v5, v4, v6

    iget-object v5, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorFilterChains:Ljava/util/Vector;

    aput-object v5, v4, v8

    .line 591
    .local v4, "v":[Ljava/util/Vector;
    const/4 v2, 0x0

    :goto_2
    array-length v5, v4

    if-ge v2, v5, :cond_5

    .line 592
    aget-object v5, v4, v2

    if-eqz v5, :cond_4

    .line 593
    aget-object v5, v4, v2

    invoke-virtual {v5}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "fci":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 594
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FilterChain;

    .line 595
    .local v0, "fc":Lorg/apache/tools/ant/types/FilterChain;
    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/RedirectorElement;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_3

    .line 591
    .end local v0    # "fc":Lorg/apache/tools/ant/types/FilterChain;
    .end local v1    # "fci":Ljava/util/Iterator;
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 599
    :cond_5
    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/RedirectorElement;->setChecked(Z)V

    goto :goto_0
.end method

.method public setAlwaysLog(Z)V
    .locals 1
    .param p1, "alwaysLog"    # Z

    .prologue
    .line 351
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 354
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->alwaysLog:Ljava/lang/Boolean;

    .line 355
    return-void

    .line 354
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setAppend(Z)V
    .locals 1
    .param p1, "append"    # Z

    .prologue
    .line 337
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 340
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->append:Ljava/lang/Boolean;

    .line 341
    return-void

    .line 340
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setCreateEmptyFiles(Z)V
    .locals 1
    .param p1, "createEmptyFiles"    # Z

    .prologue
    .line 363
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 364
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 366
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->createEmptyFiles:Ljava/lang/Boolean;

    .line 368
    return-void

    .line 366
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setError(Ljava/io/File;)V
    .locals 2
    .param p1, "error"    # Ljava/io/File;

    .prologue
    .line 307
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 308
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 310
    :cond_0
    if-nez p1, :cond_1

    .line 311
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "error file specified as null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 313
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingError:Z

    .line 314
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/RedirectorElement;->createMergeMapper(Ljava/io/File;)Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorMapper:Lorg/apache/tools/ant/types/Mapper;

    .line 315
    return-void
.end method

.method public setErrorEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "errorEncoding"    # Ljava/lang/String;

    .prologue
    .line 271
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 272
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 274
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorEncoding:Ljava/lang/String;

    .line 275
    return-void
.end method

.method public setErrorProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "errorProperty"    # Ljava/lang/String;

    .prologue
    .line 377
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 380
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorProperty:Ljava/lang/String;

    .line 381
    return-void
.end method

.method public setInput(Ljava/io/File;)V
    .locals 2
    .param p1, "input"    # Ljava/io/File;

    .prologue
    .line 198
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 201
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputString:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 202
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"input\" and \"inputstring\" attributes cannot both be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingInput:Z

    .line 206
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/RedirectorElement;->createMergeMapper(Ljava/io/File;)Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputMapper:Lorg/apache/tools/ant/types/Mapper;

    .line 207
    return-void
.end method

.method public setInputEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "inputEncoding"    # Ljava/lang/String;

    .prologue
    .line 282
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 285
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputEncoding:Ljava/lang/String;

    .line 286
    return-void
.end method

.method public setInputString(Ljava/lang/String;)V
    .locals 2
    .param p1, "inputString"    # Ljava/lang/String;

    .prologue
    .line 214
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 217
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingInput:Z

    if-eqz v0, :cond_1

    .line 218
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The \"input\" and \"inputstring\" attributes cannot both be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 221
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputString:Ljava/lang/String;

    .line 222
    return-void
.end method

.method public setLogError(Z)V
    .locals 1
    .param p1, "logError"    # Z

    .prologue
    .line 296
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 297
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 299
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logError:Ljava/lang/Boolean;

    .line 300
    return-void

    .line 299
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setLogInputString(Z)V
    .locals 1
    .param p1, "logInputString"    # Z

    .prologue
    .line 231
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 232
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 234
    :cond_0
    if-eqz p1, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logInputString:Ljava/lang/Boolean;

    .line 235
    return-void

    .line 234
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 2
    .param p1, "out"    # Ljava/io/File;

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 245
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 247
    :cond_0
    if-nez p1, :cond_1

    .line 248
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "output file specified as null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 250
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingOutput:Z

    .line 251
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/RedirectorElement;->createMergeMapper(Ljava/io/File;)Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputMapper:Lorg/apache/tools/ant/types/Mapper;

    .line 252
    return-void
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "outputEncoding"    # Ljava/lang/String;

    .prologue
    .line 259
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 262
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputEncoding:Ljava/lang/String;

    .line 263
    return-void
.end method

.method public setOutputProperty(Ljava/lang/String;)V
    .locals 1
    .param p1, "outputProperty"    # Ljava/lang/String;

    .prologue
    .line 324
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 325
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 327
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputProperty:Ljava/lang/String;

    .line 328
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 175
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingInput:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingOutput:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->usingError:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputString:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logError:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->append:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->createEmptyFiles:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->inputEncoding:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputEncoding:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorEncoding:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->outputProperty:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->errorProperty:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/RedirectorElement;->logInputString:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 188
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 190
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 191
    return-void
.end method

.method protected toFileArray([Ljava/lang/String;)[Ljava/io/File;
    .locals 4
    .param p1, "name"    # [Ljava/lang/String;

    .prologue
    .line 553
    if-nez p1, :cond_0

    .line 554
    const/4 v2, 0x0

    .line 563
    :goto_0
    return-object v2

    .line 557
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, p1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 558
    .local v1, "list":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_2

    .line 559
    aget-object v2, p1, v0

    if-eqz v2, :cond_1

    .line 560
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/RedirectorElement;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 558
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 563
    :cond_2
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/io/File;

    goto :goto_0
.end method
