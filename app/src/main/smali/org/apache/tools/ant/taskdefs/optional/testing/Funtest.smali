.class public Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;
.super Lorg/apache/tools/ant/Task;
.source "Funtest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$1;,
        Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;
    }
.end annotation


# static fields
.field public static final APPLICATION_EXCEPTION:Ljava/lang/String; = "Application Exception"

.field public static final APPLICATION_FORCIBLY_SHUT_DOWN:Ljava/lang/String; = "Application forcibly shut down"

.field public static final SHUTDOWN_INTERRUPTED:Ljava/lang/String; = "Shutdown interrupted"

.field public static final SKIPPING_TESTS:Ljava/lang/String; = "Condition failed -skipping tests"

.field public static final TEARDOWN_EXCEPTION:Ljava/lang/String; = "Teardown Exception"

.field public static final WARN_OVERRIDING:Ljava/lang/String; = "Overriding previous definition of "


# instance fields
.field private application:Lorg/apache/tools/ant/taskdefs/Sequential;

.field private applicationException:Lorg/apache/tools/ant/BuildException;

.field private block:Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

.field private condition:Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

.field private failOnTeardownErrors:Z

.field private failureMessage:Ljava/lang/String;

.field private failureProperty:Ljava/lang/String;

.field private reporting:Lorg/apache/tools/ant/taskdefs/Sequential;

.field private setup:Lorg/apache/tools/ant/taskdefs/Sequential;

.field private shutdownTime:J

.field private shutdownUnitMultiplier:J

.field private taskException:Lorg/apache/tools/ant/BuildException;

.field private teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

.field private teardownException:Lorg/apache/tools/ant/BuildException;

.field private testException:Lorg/apache/tools/ant/BuildException;

.field private tests:Lorg/apache/tools/ant/taskdefs/Sequential;

.field private timedTests:Lorg/apache/tools/ant/taskdefs/Parallel;

.field private timeout:J

.field private timeoutUnitMultiplier:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x1

    .line 60
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 113
    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timeoutUnitMultiplier:J

    .line 118
    const-wide/16 v0, 0x2710

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->shutdownTime:J

    .line 120
    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->shutdownUnitMultiplier:J

    .line 130
    const-string/jumbo v0, "Tests failed"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureMessage:Ljava/lang/String;

    .line 139
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failOnTeardownErrors:Z

    .line 568
    return-void
.end method

.method private bind(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 346
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/Task;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 347
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->init()V

    .line 348
    return-void
.end method

.method private logOverride(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "definition"    # Ljava/lang/Object;

    .prologue
    .line 182
    if-eqz p2, :cond_0

    .line 183
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Overriding previous definition of <"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x3e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->log(Ljava/lang/String;I)V

    .line 185
    :cond_0
    return-void
.end method

.method private newParallel(J)Lorg/apache/tools/ant/taskdefs/Parallel;
    .locals 3
    .param p1, "parallelTimeout"    # J

    .prologue
    .line 356
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Parallel;-><init>()V

    .line 357
    .local v0, "par":Lorg/apache/tools/ant/taskdefs/Parallel;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->bind(Lorg/apache/tools/ant/Task;)V

    .line 358
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Parallel;->setFailOnAny(Z)V

    .line 359
    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Parallel;->setTimeout(J)V

    .line 360
    return-object v0
.end method

.method private newParallel(JLorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/Parallel;
    .locals 1
    .param p1, "parallelTimeout"    # J
    .param p3, "child"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 370
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(J)Lorg/apache/tools/ant/taskdefs/Parallel;

    move-result-object v0

    .line 371
    .local v0, "par":Lorg/apache/tools/ant/taskdefs/Parallel;
    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/taskdefs/Parallel;->addTask(Lorg/apache/tools/ant/Task;)V

    .line 372
    return-object v0
.end method

.method private validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V
    .locals 3
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "role"    # Ljava/lang/String;

    .prologue
    .line 381
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-nez v0, :cond_0

    .line 382
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " task is not bound to the project"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 384
    :cond_0
    return-void
.end method


# virtual methods
.method public addApplication(Lorg/apache/tools/ant/taskdefs/Sequential;)V
    .locals 2
    .param p1, "sequence"    # Lorg/apache/tools/ant/taskdefs/Sequential;

    .prologue
    .line 203
    const-string/jumbo v0, "application"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->application:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 204
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->application:Lorg/apache/tools/ant/taskdefs/Sequential;

    .line 205
    return-void
.end method

.method public addBlock(Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;)V
    .locals 2
    .param p1, "sequence"    # Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

    .prologue
    .line 221
    const-string/jumbo v0, "block"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->block:Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 222
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->block:Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

    .line 223
    return-void
.end method

.method public addReporting(Lorg/apache/tools/ant/taskdefs/Sequential;)V
    .locals 2
    .param p1, "sequence"    # Lorg/apache/tools/ant/taskdefs/Sequential;

    .prologue
    .line 239
    const-string/jumbo v0, "reporting"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->reporting:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 240
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->reporting:Lorg/apache/tools/ant/taskdefs/Sequential;

    .line 241
    return-void
.end method

.method public addSetup(Lorg/apache/tools/ant/taskdefs/Sequential;)V
    .locals 2
    .param p1, "sequence"    # Lorg/apache/tools/ant/taskdefs/Sequential;

    .prologue
    .line 212
    const-string/jumbo v0, "setup"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->setup:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 213
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->setup:Lorg/apache/tools/ant/taskdefs/Sequential;

    .line 214
    return-void
.end method

.method public addTeardown(Lorg/apache/tools/ant/taskdefs/Sequential;)V
    .locals 2
    .param p1, "sequence"    # Lorg/apache/tools/ant/taskdefs/Sequential;

    .prologue
    .line 248
    const-string/jumbo v0, "teardown"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 249
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    .line 250
    return-void
.end method

.method public addTests(Lorg/apache/tools/ant/taskdefs/Sequential;)V
    .locals 2
    .param p1, "sequence"    # Lorg/apache/tools/ant/taskdefs/Sequential;

    .prologue
    .line 230
    const-string/jumbo v0, "tests"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->tests:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 231
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->tests:Lorg/apache/tools/ant/taskdefs/Sequential;

    .line 232
    return-void
.end method

.method public createCondition()Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
    .locals 2

    .prologue
    .line 193
    const-string/jumbo v0, "condition"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->condition:Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->logOverride(Ljava/lang/String;Ljava/lang/Object;)V

    .line 194
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;-><init>(Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$1;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->condition:Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

    .line 195
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->condition:Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

    return-object v0
.end method

.method public execute()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 398
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->setup:Lorg/apache/tools/ant/taskdefs/Sequential;

    const-string/jumbo v16, "setup"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V

    .line 399
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->application:Lorg/apache/tools/ant/taskdefs/Sequential;

    const-string/jumbo v16, "application"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V

    .line 400
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->tests:Lorg/apache/tools/ant/taskdefs/Sequential;

    const-string/jumbo v16, "tests"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V

    .line 401
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->reporting:Lorg/apache/tools/ant/taskdefs/Sequential;

    const-string/jumbo v16, "reporting"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V

    .line 402
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    const-string/jumbo v16, "teardown"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V

    .line 406
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->condition:Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

    if-eqz v15, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->condition:Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;

    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest$NestedCondition;->eval()Z

    move-result v15

    if-nez v15, :cond_0

    .line 408
    const-string/jumbo v15, "Condition failed -skipping tests"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->log(Ljava/lang/String;)V

    .line 499
    :goto_0
    return-void

    .line 412
    :cond_0
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timeout:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timeoutUnitMultiplier:J

    move-wide/from16 v18, v0

    mul-long v12, v16, v18

    .line 415
    .local v12, "timeoutMillis":J
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(J)Lorg/apache/tools/ant/taskdefs/Parallel;

    move-result-object v2

    .line 417
    .local v2, "applicationRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    new-instance v14, Lorg/apache/tools/ant/util/WorkerAnt;

    const/4 v15, 0x0

    invoke-direct {v14, v2, v15}, Lorg/apache/tools/ant/util/WorkerAnt;-><init>(Lorg/apache/tools/ant/Task;Ljava/lang/Object;)V

    .line 418
    .local v14, "worker":Lorg/apache/tools/ant/util/WorkerAnt;
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->application:Lorg/apache/tools/ant/taskdefs/Sequential;

    if-eqz v15, :cond_1

    .line 419
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->application:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-virtual {v2, v15}, Lorg/apache/tools/ant/taskdefs/Parallel;->addTask(Lorg/apache/tools/ant/Task;)V

    .line 423
    :cond_1
    const-wide/16 v10, 0x0

    .line 424
    .local v10, "testRunTimeout":J
    new-instance v9, Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-direct {v9}, Lorg/apache/tools/ant/taskdefs/Sequential;-><init>()V

    .line 425
    .local v9, "testRun":Lorg/apache/tools/ant/taskdefs/Sequential;
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->bind(Lorg/apache/tools/ant/Task;)V

    .line 426
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->block:Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

    if-eqz v15, :cond_2

    .line 428
    new-instance v5, Lorg/apache/tools/ant/TaskAdapter;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->block:Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

    invoke-direct {v5, v15}, Lorg/apache/tools/ant/TaskAdapter;-><init>(Ljava/lang/Object;)V

    .line 429
    .local v5, "ta":Lorg/apache/tools/ant/TaskAdapter;
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/TaskAdapter;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 430
    const-string/jumbo v15, "block"

    move-object/from16 v0, p0

    invoke-direct {v0, v5, v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->validateTask(Lorg/apache/tools/ant/Task;Ljava/lang/String;)V

    .line 431
    invoke-virtual {v9, v5}, Lorg/apache/tools/ant/taskdefs/Sequential;->addTask(Lorg/apache/tools/ant/Task;)V

    .line 433
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->block:Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;

    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/BlockFor;->calculateMaxWaitMillis()J

    move-result-wide v10

    .line 437
    .end local v5    # "ta":Lorg/apache/tools/ant/TaskAdapter;
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->tests:Lorg/apache/tools/ant/taskdefs/Sequential;

    if-eqz v15, :cond_3

    .line 438
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->tests:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-virtual {v9, v15}, Lorg/apache/tools/ant/taskdefs/Sequential;->addTask(Lorg/apache/tools/ant/Task;)V

    .line 439
    add-long/2addr v10, v12

    .line 442
    :cond_3
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->reporting:Lorg/apache/tools/ant/taskdefs/Sequential;

    if-eqz v15, :cond_4

    .line 443
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->reporting:Lorg/apache/tools/ant/taskdefs/Sequential;

    invoke-virtual {v9, v15}, Lorg/apache/tools/ant/taskdefs/Sequential;->addTask(Lorg/apache/tools/ant/Task;)V

    .line 444
    add-long/2addr v10, v12

    .line 449
    :cond_4
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11, v9}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(JLorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/Parallel;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timedTests:Lorg/apache/tools/ant/taskdefs/Parallel;

    .line 453
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->setup:Lorg/apache/tools/ant/taskdefs/Sequential;

    if-eqz v15, :cond_5

    .line 454
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->setup:Lorg/apache/tools/ant/taskdefs/Sequential;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(JLorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/Parallel;

    move-result-object v4

    .line 455
    .local v4, "setupRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Parallel;->execute()V

    .line 458
    .end local v4    # "setupRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    :cond_5
    invoke-virtual {v14}, Lorg/apache/tools/ant/util/WorkerAnt;->start()V

    .line 460
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timedTests:Lorg/apache/tools/ant/taskdefs/Parallel;

    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/Parallel;->execute()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 466
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    if-eqz v15, :cond_6

    .line 468
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_4

    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(JLorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/Parallel;
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_5

    move-result-object v8

    .line 469
    .local v8, "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    :try_start_3
    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Parallel;->execute()V
    :try_end_3
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_3 .. :try_end_3} :catch_6

    .line 481
    .end local v8    # "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    :cond_6
    :goto_1
    :try_start_4
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->shutdownTime:J

    move-wide/from16 v16, v0

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->shutdownUnitMultiplier:J

    move-wide/from16 v18, v0

    mul-long v6, v16, v18

    .line 482
    .local v6, "shutdownTimeMillis":J
    invoke-virtual {v14, v6, v7}, Lorg/apache/tools/ant/util/WorkerAnt;->waitUntilFinished(J)V

    .line 483
    invoke-virtual {v14}, Lorg/apache/tools/ant/util/WorkerAnt;->isAlive()Z

    move-result v15

    if-eqz v15, :cond_7

    .line 485
    const-string/jumbo v15, "Application forcibly shut down"

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->log(Ljava/lang/String;I)V

    .line 486
    invoke-virtual {v14}, Lorg/apache/tools/ant/util/WorkerAnt;->interrupt()V

    .line 487
    invoke-virtual {v14, v6, v7}, Lorg/apache/tools/ant/util/WorkerAnt;->waitUntilFinished(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_3

    .line 494
    .end local v6    # "shutdownTimeMillis":J
    :cond_7
    :goto_2
    invoke-virtual {v14}, Lorg/apache/tools/ant/util/WorkerAnt;->getBuildException()Lorg/apache/tools/ant/BuildException;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->applicationException:Lorg/apache/tools/ant/BuildException;

    .line 498
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->processExceptions()V

    goto/16 :goto_0

    .line 461
    :catch_0
    move-exception v3

    .line 463
    .local v3, "e":Lorg/apache/tools/ant/BuildException;
    :try_start_5
    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->testException:Lorg/apache/tools/ant/BuildException;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 466
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    if-eqz v15, :cond_6

    .line 468
    :try_start_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13, v15}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(JLorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/Parallel;

    move-result-object v8

    .line 469
    .restart local v8    # "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Parallel;->execute()V
    :try_end_6
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_1

    .line 470
    .end local v8    # "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    :catch_1
    move-exception v3

    .line 471
    :goto_3
    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardownException:Lorg/apache/tools/ant/BuildException;

    goto :goto_1

    .line 470
    .end local v3    # "e":Lorg/apache/tools/ant/BuildException;
    :catch_2
    move-exception v3

    .line 471
    .restart local v3    # "e":Lorg/apache/tools/ant/BuildException;
    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardownException:Lorg/apache/tools/ant/BuildException;

    .line 466
    .end local v3    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_8
    :goto_4
    throw v15

    .line 489
    :catch_3
    move-exception v3

    .line 492
    .local v3, "e":Ljava/lang/InterruptedException;
    const-string/jumbo v15, "Shutdown interrupted"

    const/16 v16, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v3, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    goto :goto_2

    .line 466
    .end local v3    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    move-object/from16 v16, v0

    if-eqz v16, :cond_8

    .line 468
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardown:Lorg/apache/tools/ant/taskdefs/Sequential;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v12, v13, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->newParallel(JLorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/Parallel;

    move-result-object v8

    .line 469
    .restart local v8    # "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Parallel;->execute()V
    :try_end_7
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_4

    .line 470
    .end local v8    # "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    :catch_4
    move-exception v3

    goto :goto_3

    :catch_5
    move-exception v3

    goto :goto_3

    .restart local v8    # "teardownRun":Lorg/apache/tools/ant/taskdefs/Parallel;
    :catch_6
    move-exception v3

    goto :goto_3
.end method

.method public getApplicationException()Lorg/apache/tools/ant/BuildException;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->applicationException:Lorg/apache/tools/ant/BuildException;

    return-object v0
.end method

.method public getTaskException()Lorg/apache/tools/ant/BuildException;
    .locals 1

    .prologue
    .line 338
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    return-object v0
.end method

.method public getTeardownException()Lorg/apache/tools/ant/BuildException;
    .locals 1

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardownException:Lorg/apache/tools/ant/BuildException;

    return-object v0
.end method

.method public getTestException()Lorg/apache/tools/ant/BuildException;
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->testException:Lorg/apache/tools/ant/BuildException;

    return-object v0
.end method

.method protected ignoringThrowable(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "thrown"    # Ljava/lang/Throwable;

    .prologue
    .line 563
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, p2, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    .line 566
    return-void
.end method

.method protected processExceptions()V
    .locals 2

    .prologue
    .line 519
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->testException:Lorg/apache/tools/ant/BuildException;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    .line 522
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->applicationException:Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_1

    .line 523
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    instance-of v0, v0, Lorg/apache/tools/ant/taskdefs/optional/testing/BuildTimeoutException;

    if-eqz v0, :cond_4

    .line 524
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->applicationException:Lorg/apache/tools/ant/BuildException;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    .line 531
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardownException:Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_2

    .line 532
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    if-nez v0, :cond_5

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failOnTeardownErrors:Z

    if-eqz v0, :cond_5

    .line 533
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardownException:Lorg/apache/tools/ant/BuildException;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    .line 541
    :cond_2
    :goto_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureProperty:Ljava/lang/String;

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureProperty:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 544
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureMessage:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->log(Ljava/lang/String;)V

    .line 545
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    if-nez v0, :cond_3

    .line 546
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureMessage:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    .line 552
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_6

    .line 553
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->taskException:Lorg/apache/tools/ant/BuildException;

    throw v0

    .line 526
    :cond_4
    const-string/jumbo v0, "Application Exception"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->applicationException:Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->ignoringThrowable(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 536
    :cond_5
    const-string/jumbo v0, "Teardown Exception"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->teardownException:Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->ignoringThrowable(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 555
    :cond_6
    return-void
.end method

.method public setFailOnTeardownErrors(Z)V
    .locals 0
    .param p1, "failOnTeardownErrors"    # Z

    .prologue
    .line 257
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failOnTeardownErrors:Z

    .line 258
    return-void
.end method

.method public setFailureMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "failureMessage"    # Ljava/lang/String;

    .prologue
    .line 265
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureMessage:Ljava/lang/String;

    .line 266
    return-void
.end method

.method public setFailureProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "failureProperty"    # Ljava/lang/String;

    .prologue
    .line 273
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->failureProperty:Ljava/lang/String;

    .line 274
    return-void
.end method

.method public setShutdownTime(J)V
    .locals 1
    .param p1, "shutdownTime"    # J

    .prologue
    .line 281
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->shutdownTime:J

    .line 282
    return-void
.end method

.method public setShutdownUnit(Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;)V
    .locals 2
    .param p1, "unit"    # Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;

    .prologue
    .line 305
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->getMultiplier()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->shutdownUnitMultiplier:J

    .line 306
    return-void
.end method

.method public setTimeout(J)V
    .locals 1
    .param p1, "timeout"    # J

    .prologue
    .line 289
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timeout:J

    .line 290
    return-void
.end method

.method public setTimeoutUnit(Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;)V
    .locals 2
    .param p1, "unit"    # Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;

    .prologue
    .line 297
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->getMultiplier()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/optional/testing/Funtest;->timeoutUnitMultiplier:J

    .line 298
    return-void
.end method
