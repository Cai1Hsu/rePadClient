.class public abstract Lorg/apache/tools/ant/Task;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "Task.java"


# instance fields
.field private invalid:Z

.field private replacement:Lorg/apache/tools/ant/UnknownElement;

.field protected target:Lorg/apache/tools/ant/Target;

.field protected taskName:Ljava/lang/String;

.field protected taskType:Ljava/lang/String;

.field protected wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 86
    return-void
.end method

.method private getReplacement()Lorg/apache/tools/ant/UnknownElement;
    .locals 2

    .prologue
    .line 406
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    if-nez v0, :cond_0

    .line 407
    new-instance v0, Lorg/apache/tools/ant/UnknownElement;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->taskType:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    .line 408
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 409
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->taskType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setTaskType(Ljava/lang/String;)V

    .line 410
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->taskName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setTaskName(Ljava/lang/String;)V

    .line 411
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 412
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->target:Lorg/apache/tools/ant/Target;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 413
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setRuntimeConfigurableWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 414
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 415
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/Task;->replaceChildren(Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/UnknownElement;)V

    .line 416
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->target:Lorg/apache/tools/ant/Target;

    iget-object v1, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v0, p0, v1}, Lorg/apache/tools/ant/Target;->replaceChild(Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/Task;)V

    .line 417
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v0}, Lorg/apache/tools/ant/UnknownElement;->maybeConfigure()V

    .line 419
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->replacement:Lorg/apache/tools/ant/UnknownElement;

    return-object v0
.end method

.method private replaceChildren(Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/UnknownElement;)V
    .locals 4
    .param p1, "wrapper"    # Lorg/apache/tools/ant/RuntimeConfigurable;
    .param p2, "parentElement"    # Lorg/apache/tools/ant/UnknownElement;

    .prologue
    .line 430
    invoke-virtual {p1}, Lorg/apache/tools/ant/RuntimeConfigurable;->getChildren()Ljava/util/Enumeration;

    move-result-object v2

    .line 431
    .local v2, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 432
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 434
    .local v1, "childWrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    new-instance v0, Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->getElementTag()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    .line 436
    .local v0, "childElement":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {p2, v0}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    .line 437
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/UnknownElement;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 438
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->setRuntimeConfigurableWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 439
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->setProxy(Ljava/lang/Object;)V

    .line 440
    invoke-direct {p0, v1, v0}, Lorg/apache/tools/ant/Task;->replaceChildren(Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/UnknownElement;)V

    goto :goto_0

    .line 442
    .end local v0    # "childElement":Lorg/apache/tools/ant/UnknownElement;
    .end local v1    # "childWrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_0
    return-void
.end method


# virtual methods
.method public final bindToOwner(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "owner"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 475
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Task;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 476
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Task;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 477
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Task;->setTaskName(Ljava/lang/String;)V

    .line 478
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Task;->setDescription(Ljava/lang/String;)V

    .line 479
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Task;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 480
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getTaskType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Task;->setTaskType(Ljava/lang/String;)V

    .line 481
    return-void
.end method

.method public execute()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 156
    return-void
.end method

.method public getOwningTarget()Lorg/apache/tools/ant/Target;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->target:Lorg/apache/tools/ant/Target;

    return-object v0
.end method

.method public getRuntimeConfigurableWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;
    .locals 2

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    if-nez v0, :cond_0

    .line 167
    new-instance v0, Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 169
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    return-object v0
.end method

.method public getTaskName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->taskName:Ljava/lang/String;

    return-object v0
.end method

.method public getTaskType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 450
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->taskType:Ljava/lang/String;

    return-object v0
.end method

.method protected getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;
    .locals 1

    .prologue
    .line 459
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    return-object v0
.end method

.method protected handleErrorFlush(Ljava/lang/String;)V
    .locals 0
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 272
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    .line 273
    return-void
.end method

.method protected handleErrorOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 261
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 262
    return-void
.end method

.method protected handleFlush(Ljava/lang/String;)V
    .locals 0
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 235
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    .line 236
    return-void
.end method

.method protected handleInput([BII)I
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
    .line 252
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->defaultInput([BII)I

    move-result v0

    return v0
.end method

.method protected handleOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 224
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 225
    return-void
.end method

.method public init()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 144
    return-void
.end method

.method protected final isInvalid()Z
    .locals 1

    .prologue
    .line 390
    iget-boolean v0, p0, Lorg/apache/tools/ant/Task;->invalid:Z

    return v0
.end method

.method public log(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 281
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 282
    return-void
.end method

.method public log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "msgLevel"    # I

    .prologue
    .line 293
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Task;Ljava/lang/String;I)V

    .line 298
    :goto_0
    return-void

    .line 296
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public log(Ljava/lang/String;Ljava/lang/Throwable;I)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;
    .param p3, "msgLevel"    # I

    .prologue
    .line 326
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 327
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Task;Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 331
    :goto_0
    return-void

    .line 329
    :cond_0
    invoke-super {p0, p1, p3}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public log(Ljava/lang/Throwable;I)V
    .locals 1
    .param p1, "t"    # Ljava/lang/Throwable;
    .param p2, "msgLevel"    # I

    .prologue
    .line 310
    if-eqz p1, :cond_0

    .line 311
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 313
    :cond_0
    return-void
.end method

.method final markInvalid()V
    .locals 1

    .prologue
    .line 378
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/Task;->invalid:Z

    .line 379
    return-void
.end method

.method public maybeConfigure()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 200
    iget-boolean v0, p0, Lorg/apache/tools/ant/Task;->invalid:Z

    if-nez v0, :cond_1

    .line 201
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->maybeConfigure(Lorg/apache/tools/ant/Project;)V

    .line 207
    :cond_0
    :goto_0
    return-void

    .line 205
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;->getReplacement()Lorg/apache/tools/ant/UnknownElement;

    goto :goto_0
.end method

.method public final perform()V
    .locals 7

    .prologue
    .line 343
    iget-boolean v5, p0, Lorg/apache/tools/ant/Task;->invalid:Z

    if-nez v5, :cond_1

    .line 344
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v5, p0}, Lorg/apache/tools/ant/Project;->fireTaskStarted(Lorg/apache/tools/ant/Task;)V

    .line 345
    const/4 v2, 0x0

    .line 347
    .local v2, "reason":Ljava/lang/Throwable;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->maybeConfigure()V

    .line 348
    invoke-static {p0}, Lorg/apache/tools/ant/dispatch/DispatchUtils;->execute(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 364
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v5, p0, v2}, Lorg/apache/tools/ant/Project;->fireTaskFinished(Lorg/apache/tools/ant/Task;Ljava/lang/Throwable;)V

    .line 371
    .end local v2    # "reason":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 349
    .restart local v2    # "reason":Ljava/lang/Throwable;
    :catch_0
    move-exception v1

    .line 350
    .local v1, "ex":Lorg/apache/tools/ant/BuildException;
    :try_start_1
    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    sget-object v6, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    if-ne v5, v6, :cond_0

    .line 351
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/BuildException;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 353
    :cond_0
    move-object v2, v1

    .line 354
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 364
    .end local v1    # "ex":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v6, p0, v2}, Lorg/apache/tools/ant/Project;->fireTaskFinished(Lorg/apache/tools/ant/Task;Ljava/lang/Throwable;)V

    throw v5

    .line 355
    :catch_1
    move-exception v1

    .line 356
    .local v1, "ex":Ljava/lang/Exception;
    move-object v2, v1

    .line 357
    :try_start_2
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    .line 358
    .local v0, "be":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-virtual {v0, v5}, Lorg/apache/tools/ant/BuildException;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 359
    throw v0

    .line 360
    .end local v0    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v1    # "ex":Ljava/lang/Exception;
    :catch_2
    move-exception v1

    .line 361
    .local v1, "ex":Ljava/lang/Error;
    move-object v2, v1

    .line 362
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 367
    .end local v1    # "ex":Ljava/lang/Error;
    .end local v2    # "reason":Ljava/lang/Throwable;
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;->getReplacement()Lorg/apache/tools/ant/UnknownElement;

    move-result-object v4

    .line 368
    .local v4, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v4}, Lorg/apache/tools/ant/UnknownElement;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    .line 369
    .local v3, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {v3}, Lorg/apache/tools/ant/Task;->perform()V

    goto :goto_0
.end method

.method public reconfigure()V
    .locals 2

    .prologue
    .line 213
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->reconfigure(Lorg/apache/tools/ant/Project;)V

    .line 216
    :cond_0
    return-void
.end method

.method public setOwningTarget(Lorg/apache/tools/ant/Target;)V
    .locals 0
    .param p1, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 95
    iput-object p1, p0, Lorg/apache/tools/ant/Task;->target:Lorg/apache/tools/ant/Target;

    .line 96
    return-void
.end method

.method public setRuntimeConfigurableWrapper(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 0
    .param p1, "wrapper"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/tools/ant/Task;->wrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 186
    return-void
.end method

.method public setTaskName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 115
    iput-object p1, p0, Lorg/apache/tools/ant/Task;->taskName:Ljava/lang/String;

    .line 116
    return-void
.end method

.method public setTaskType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lorg/apache/tools/ant/Task;->taskType:Ljava/lang/String;

    .line 135
    return-void
.end method
