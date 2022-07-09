.class public Lorg/apache/tools/ant/taskdefs/Parallel;
.super Lorg/apache/tools/ant/Task;
.source "Parallel.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;,
        Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;
    }
.end annotation


# static fields
.field private static final NUMBER_TRIES:I = 0x64


# instance fields
.field private daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

.field private exceptionMessage:Ljava/lang/StringBuffer;

.field private failOnAny:Z

.field private firstException:Ljava/lang/Throwable;

.field private firstLocation:Lorg/apache/tools/ant/Location;

.field private nestedTasks:Ljava/util/Vector;

.field private numExceptions:I

.field private numThreads:I

.field private numThreadsPerProcessor:I

.field private final semaphore:Ljava/lang/Object;

.field private volatile stillRunning:Z

.field private timedOut:Z

.field private timeout:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 71
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->nestedTasks:Ljava/util/Vector;

    .line 74
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->semaphore:Ljava/lang/Object;

    .line 77
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    .line 80
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreadsPerProcessor:I

    .line 104
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numExceptions:I

    .line 412
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Parallel;)J
    .locals 2
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Parallel;

    .prologue
    .line 49
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->timeout:J

    return-wide v0
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/Parallel;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Parallel;

    .prologue
    .line 49
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->semaphore:Ljava/lang/Object;

    return-object v0
.end method

.method static access$302(Lorg/apache/tools/ant/taskdefs/Parallel;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Parallel;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->stillRunning:Z

    return p1
.end method

.method static access$402(Lorg/apache/tools/ant/taskdefs/Parallel;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Parallel;
    .param p1, "x1"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->timedOut:Z

    return p1
.end method

.method static access$500(Lorg/apache/tools/ant/taskdefs/Parallel;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Parallel;

    .prologue
    .line 49
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->failOnAny:Z

    return v0
.end method

.method private killAll([Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;)V
    .locals 4
    .param p1, "running"    # [Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    .prologue
    .line 392
    const/4 v2, 0x0

    .line 394
    .local v2, "tries":I
    :cond_0
    const/4 v1, 0x0

    .line 395
    .local v1, "oneAlive":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_2

    .line 396
    aget-object v3, p1, v0

    if-eqz v3, :cond_1

    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->isFinished()Z

    move-result v3

    if-nez v3, :cond_1

    .line 397
    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->interrupt()V

    .line 398
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 399
    const/4 v1, 0x1

    .line 395
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 402
    :cond_2
    if-eqz v1, :cond_3

    .line 403
    add-int/lit8 v2, v2, 0x1

    .line 404
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 406
    :cond_3
    if-eqz v1, :cond_4

    const/16 v3, 0x64

    if-lt v2, v3, :cond_0

    .line 407
    :cond_4
    return-void
.end method

.method private processExceptions([Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;)V
    .locals 4
    .param p1, "runnables"    # [Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    .prologue
    .line 219
    if-nez p1, :cond_1

    .line 237
    :cond_0
    return-void

    .line 222
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 223
    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->getException()Ljava/lang/Throwable;

    move-result-object v1

    .line 224
    .local v1, "t":Ljava/lang/Throwable;
    if-eqz v1, :cond_4

    .line 225
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numExceptions:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numExceptions:I

    .line 226
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstException:Ljava/lang/Throwable;

    if-nez v2, :cond_2

    .line 227
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstException:Ljava/lang/Throwable;

    .line 229
    :cond_2
    instance-of v2, v1, Lorg/apache/tools/ant/BuildException;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstLocation:Lorg/apache/tools/ant/Location;

    sget-object v3, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    if-ne v2, v3, :cond_3

    move-object v2, v1

    .line 231
    check-cast v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Lorg/apache/tools/ant/BuildException;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstLocation:Lorg/apache/tools/ant/Location;

    .line 233
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->exceptionMessage:Ljava/lang/StringBuffer;

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 234
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->exceptionMessage:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private spinThreads()V
    .locals 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 245
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->nestedTasks:Ljava/util/Vector;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->size()I

    move-result v13

    .line 246
    .local v13, "numTasks":I
    new-array v14, v13, [Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    .line 247
    .local v14, "runnables":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    const/16 v20, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->stillRunning:Z

    .line 248
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->timedOut:Z

    .line 249
    const/4 v10, 0x0

    .line 251
    .local v10, "interrupted":Z
    const/16 v17, 0x0

    .line 252
    .local v17, "threadNumber":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->nestedTasks:Ljava/util/Vector;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    .local v6, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 254
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/apache/tools/ant/Task;

    .line 255
    .local v12, "nestedTask":Lorg/apache/tools/ant/Task;
    new-instance v20, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;-><init>(Lorg/apache/tools/ant/taskdefs/Parallel;Lorg/apache/tools/ant/Task;)V

    aput-object v20, v14, v17

    .line 253
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 259
    .end local v12    # "nestedTask":Lorg/apache/tools/ant/Task;
    :cond_0
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_2

    move v11, v13

    .line 260
    .local v11, "maxRunning":I
    :goto_1
    new-array v15, v11, [Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    .line 262
    .local v15, "running":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    const/16 v17, 0x0

    .line 263
    new-instance v7, Ljava/lang/ThreadGroup;

    const-string/jumbo v20, "parallel"

    move-object/from16 v0, v20

    invoke-direct {v7, v0}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    .line 265
    .local v7, "group":Ljava/lang/ThreadGroup;
    const/4 v5, 0x0

    .line 266
    .local v5, "daemons":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    move-object/from16 v20, v0

    if-eqz v20, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;->access$000(Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;)Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    if-eqz v20, :cond_1

    .line 267
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;->access$000(Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;)Ljava/util/List;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/List;->size()I

    move-result v20

    move/from16 v0, v20

    new-array v5, v0, [Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    .line 270
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->semaphore:Ljava/lang/Object;

    move-object/from16 v20, v0

    monitor-enter v20

    .line 276
    monitor-exit v20

    .line 278
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->semaphore:Ljava/lang/Object;

    move-object/from16 v21, v0

    monitor-enter v21

    .line 280
    if-eqz v5, :cond_3

    .line 281
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    :try_start_0
    array-length v0, v5

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v8, v0, :cond_3

    .line 282
    new-instance v22, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    move-object/from16 v20, v0

    invoke-static/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;->access$000(Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;)Ljava/util/List;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-interface {v0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/apache/tools/ant/Task;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;-><init>(Lorg/apache/tools/ant/taskdefs/Parallel;Lorg/apache/tools/ant/Task;)V

    aput-object v22, v5, v8

    .line 283
    new-instance v4, Ljava/lang/Thread;

    aget-object v20, v5, v8

    move-object/from16 v0, v20

    invoke-direct {v4, v7, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;)V

    .line 284
    .local v4, "daemonThread":Ljava/lang/Thread;
    const/16 v20, 0x1

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 285
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 281
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 259
    .end local v4    # "daemonThread":Ljava/lang/Thread;
    .end local v5    # "daemons":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    .end local v7    # "group":Ljava/lang/ThreadGroup;
    .end local v8    # "i":I
    .end local v11    # "maxRunning":I
    .end local v15    # "running":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    :cond_2
    move-object/from16 v0, p0

    iget v11, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    goto/16 :goto_1

    .line 291
    .restart local v5    # "daemons":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    .restart local v7    # "group":Ljava/lang/ThreadGroup;
    .restart local v11    # "maxRunning":I
    .restart local v15    # "running":[Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;
    :cond_3
    const/4 v8, 0x0

    .restart local v8    # "i":I
    move/from16 v18, v17

    .end local v17    # "threadNumber":I
    .local v18, "threadNumber":I
    :goto_3
    if-ge v8, v11, :cond_4

    .line 292
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "threadNumber":I
    .restart local v17    # "threadNumber":I
    :try_start_1
    aget-object v20, v14, v18

    aput-object v20, v15, v8

    .line 293
    new-instance v16, Ljava/lang/Thread;

    aget-object v20, v15, v8

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v7, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;)V

    .line 294
    .local v16, "thread":Ljava/lang/Thread;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 291
    add-int/lit8 v8, v8, 0x1

    move/from16 v18, v17

    .end local v17    # "threadNumber":I
    .restart local v18    # "threadNumber":I
    goto :goto_3

    .line 297
    .end local v16    # "thread":Ljava/lang/Thread;
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->timeout:J

    move-wide/from16 v22, v0

    const-wide/16 v24, 0x0

    cmp-long v20, v22, v24

    if-eqz v20, :cond_5

    .line 299
    new-instance v19, Lorg/apache/tools/ant/taskdefs/Parallel$1;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Parallel$1;-><init>(Lorg/apache/tools/ant/taskdefs/Parallel;)V

    .line 313
    .local v19, "timeoutThread":Ljava/lang/Thread;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Thread;->start()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 318
    .end local v19    # "timeoutThread":Ljava/lang/Thread;
    :cond_5
    :goto_4
    move/from16 v0, v18

    if-ge v0, v13, :cond_a

    :try_start_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->stillRunning:Z

    move/from16 v20, v0

    if-eqz v20, :cond_a

    .line 319
    const/4 v8, 0x0

    :goto_5
    if-ge v8, v11, :cond_8

    .line 320
    aget-object v20, v15, v8

    if-eqz v20, :cond_6

    aget-object v20, v15, v8

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->isFinished()Z
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result v20

    if-eqz v20, :cond_7

    .line 321
    :cond_6
    add-int/lit8 v17, v18, 0x1

    .end local v18    # "threadNumber":I
    .restart local v17    # "threadNumber":I
    :try_start_4
    aget-object v20, v14, v18

    aput-object v20, v15, v8

    .line 322
    new-instance v16, Ljava/lang/Thread;

    aget-object v20, v15, v8

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v7, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;)V

    .line 323
    .restart local v16    # "thread":Ljava/lang/Thread;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Thread;->start()V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move/from16 v18, v17

    .line 326
    .end local v17    # "threadNumber":I
    .restart local v18    # "threadNumber":I
    goto :goto_4

    .line 319
    .end local v16    # "thread":Ljava/lang/Thread;
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 332
    :cond_8
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->semaphore:Ljava/lang/Object;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->wait()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_4

    .line 348
    :catch_0
    move-exception v9

    move/from16 v17, v18

    .line 349
    .end local v18    # "threadNumber":I
    .local v9, "ie":Ljava/lang/InterruptedException;
    .restart local v17    # "threadNumber":I
    :goto_6
    const/4 v10, 0x1

    .line 352
    .end local v9    # "ie":Ljava/lang/InterruptedException;
    :goto_7
    :try_start_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->timedOut:Z

    move/from16 v20, v0

    if-nez v20, :cond_9

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->failOnAny:Z

    move/from16 v20, v0

    if-nez v20, :cond_9

    .line 354
    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/taskdefs/Parallel;->killAll([Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;)V

    .line 356
    :cond_9
    monitor-exit v21
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 358
    if-eqz v10, :cond_e

    .line 359
    new-instance v20, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v21, "Parallel execution interrupted."

    invoke-direct/range {v20 .. v21}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 336
    .end local v17    # "threadNumber":I
    .restart local v18    # "threadNumber":I
    :cond_a
    :goto_8
    :try_start_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->stillRunning:Z

    move/from16 v20, v0

    if-eqz v20, :cond_d

    .line 337
    const/4 v8, 0x0

    :goto_9
    if-ge v8, v11, :cond_c

    .line 338
    aget-object v20, v15, v8

    if-eqz v20, :cond_b

    aget-object v20, v15, v8

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;->isFinished()Z

    move-result v20

    if-nez v20, :cond_b

    .line 342
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->semaphore:Ljava/lang/Object;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Object;->wait()V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_8

    .line 356
    :catchall_0
    move-exception v20

    move/from16 v17, v18

    .end local v18    # "threadNumber":I
    .restart local v17    # "threadNumber":I
    :goto_a
    :try_start_8
    monitor-exit v21
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v20

    .line 337
    .end local v17    # "threadNumber":I
    .restart local v18    # "threadNumber":I
    :cond_b
    add-int/lit8 v8, v8, 0x1

    goto :goto_9

    .line 346
    :cond_c
    const/16 v20, 0x0

    :try_start_9
    move/from16 v0, v20

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->stillRunning:Z
    :try_end_9
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_8

    :cond_d
    move/from16 v17, v18

    .line 350
    .end local v18    # "threadNumber":I
    .restart local v17    # "threadNumber":I
    goto :goto_7

    .line 361
    :cond_e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->timedOut:Z

    move/from16 v20, v0

    if-eqz v20, :cond_f

    .line 362
    new-instance v20, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v21, "Parallel execution timed out"

    invoke-direct/range {v20 .. v21}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 366
    :cond_f
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->exceptionMessage:Ljava/lang/StringBuffer;

    .line 367
    const/16 v20, 0x0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->numExceptions:I

    .line 368
    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->firstException:Ljava/lang/Throwable;

    .line 369
    sget-object v20, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Parallel;->firstLocation:Lorg/apache/tools/ant/Location;

    .line 370
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/apache/tools/ant/taskdefs/Parallel;->processExceptions([Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;)V

    .line 371
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/apache/tools/ant/taskdefs/Parallel;->processExceptions([Lorg/apache/tools/ant/taskdefs/Parallel$TaskRunnable;)V

    .line 373
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->numExceptions:I

    move/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_11

    .line 374
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstException:Ljava/lang/Throwable;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    instance-of v0, v0, Lorg/apache/tools/ant/BuildException;

    move/from16 v20, v0

    if-eqz v20, :cond_10

    .line 375
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstException:Ljava/lang/Throwable;

    move-object/from16 v20, v0

    check-cast v20, Lorg/apache/tools/ant/BuildException;

    throw v20

    .line 377
    :cond_10
    new-instance v20, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstException:Ljava/lang/Throwable;

    move-object/from16 v21, v0

    invoke-direct/range {v20 .. v21}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v20

    .line 379
    :cond_11
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->numExceptions:I

    move/from16 v20, v0

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-le v0, v1, :cond_12

    .line 380
    new-instance v20, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->exceptionMessage:Ljava/lang/StringBuffer;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Parallel;->firstLocation:Lorg/apache/tools/ant/Location;

    move-object/from16 v22, v0

    invoke-direct/range {v20 .. v22}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v20

    .line 383
    :cond_12
    return-void

    .line 356
    :catchall_1
    move-exception v20

    goto/16 :goto_a

    .line 348
    :catch_1
    move-exception v9

    goto/16 :goto_6
.end method

.method private updateThreadCounts()V
    .locals 2

    .prologue
    .line 212
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreadsPerProcessor:I

    if-eqz v0, :cond_0

    .line 213
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v0

    iget v1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreadsPerProcessor:I

    mul-int/2addr v0, v1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    .line 216
    :cond_0
    return-void
.end method


# virtual methods
.method public addDaemons(Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;)V
    .locals 2
    .param p1, "daemonTasks"    # Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    if-eqz v0, :cond_0

    .line 118
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one daemon group is supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->daemonTasks:Lorg/apache/tools/ant/taskdefs/Parallel$TaskList;

    .line 121
    return-void
.end method

.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->nestedTasks:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 150
    return-void
.end method

.method public execute()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 201
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Parallel;->updateThreadCounts()V

    .line 202
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    if-nez v0, :cond_0

    .line 203
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->nestedTasks:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    .line 205
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Parallel;->spinThreads()V

    .line 206
    return-void
.end method

.method public setFailOnAny(Z)V
    .locals 0
    .param p1, "failOnAny"    # Z

    .prologue
    .line 141
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->failOnAny:Z

    .line 142
    return-void
.end method

.method public setPollInterval(I)V
    .locals 0
    .param p1, "pollInterval"    # I

    .prologue
    .line 130
    return-void
.end method

.method public setThreadCount(I)V
    .locals 0
    .param p1, "numThreads"    # I

    .prologue
    .line 177
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreads:I

    .line 178
    return-void
.end method

.method public setThreadsPerProcessor(I)V
    .locals 0
    .param p1, "numThreadsPerProcessor"    # I

    .prologue
    .line 162
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->numThreadsPerProcessor:I

    .line 163
    return-void
.end method

.method public setTimeout(J)V
    .locals 1
    .param p1, "timeout"    # J

    .prologue
    .line 190
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/Parallel;->timeout:J

    .line 191
    return-void
.end method
