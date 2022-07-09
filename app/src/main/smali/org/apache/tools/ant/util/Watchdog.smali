.class public Lorg/apache/tools/ant/util/Watchdog;
.super Ljava/lang/Object;
.source "Watchdog.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final ERROR_INVALID_TIMEOUT:Ljava/lang/String; = "timeout less than 1."


# instance fields
.field private observers:Ljava/util/Vector;

.field private volatile stopped:Z

.field private timeout:J


# direct methods
.method public constructor <init>(J)V
    .locals 3
    .param p1, "timeout"    # J

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/Vector;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/Watchdog;->observers:Ljava/util/Vector;

    .line 35
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/tools/ant/util/Watchdog;->timeout:J

    .line 40
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/Watchdog;->stopped:Z

    .line 52
    const-wide/16 v0, 0x1

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 53
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "timeout less than 1."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 55
    :cond_0
    iput-wide p1, p0, Lorg/apache/tools/ant/util/Watchdog;->timeout:J

    .line 56
    return-void
.end method


# virtual methods
.method public addTimeoutObserver(Lorg/apache/tools/ant/util/TimeoutObserver;)V
    .locals 1
    .param p1, "to"    # Lorg/apache/tools/ant/util/TimeoutObserver;

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/tools/ant/util/Watchdog;->observers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 65
    return-void
.end method

.method protected final fireTimeoutOccured()V
    .locals 2

    .prologue
    .line 81
    iget-object v1, p0, Lorg/apache/tools/ant/util/Watchdog;->observers:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 82
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/util/TimeoutObserver;

    invoke-interface {v1, p0}, Lorg/apache/tools/ant/util/TimeoutObserver;->timeoutOccured(Lorg/apache/tools/ant/util/Watchdog;)V

    goto :goto_0

    .line 85
    :cond_0
    return-void
.end method

.method public removeTimeoutObserver(Lorg/apache/tools/ant/util/TimeoutObserver;)V
    .locals 1
    .param p1, "to"    # Lorg/apache/tools/ant/util/TimeoutObserver;

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/tools/ant/util/Watchdog;->observers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 74
    return-void
.end method

.method public declared-synchronized run()V
    .locals 6

    .prologue
    .line 112
    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 113
    .local v0, "now":J
    iget-wide v4, p0, Lorg/apache/tools/ant/util/Watchdog;->timeout:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-long v2, v0, v4

    .line 116
    .local v2, "until":J
    :goto_0
    :try_start_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/util/Watchdog;->stopped:Z

    if-nez v4, :cond_0

    cmp-long v4, v2, v0

    if-lez v4, :cond_0

    .line 117
    sub-long v4, v2, v0

    invoke-virtual {p0, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 118
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v0

    goto :goto_0

    .line 120
    :catch_0
    move-exception v4

    .line 123
    :cond_0
    :try_start_2
    iget-boolean v4, p0, Lorg/apache/tools/ant/util/Watchdog;->stopped:Z

    if-nez v4, :cond_1

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/Watchdog;->fireTimeoutOccured()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    :cond_1
    monitor-exit p0

    return-void

    .line 112
    .end local v0    # "now":J
    .end local v2    # "until":J
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized start()V
    .locals 2

    .prologue
    .line 91
    monitor-enter p0

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/Watchdog;->stopped:Z

    .line 92
    new-instance v0, Ljava/lang/Thread;

    const-string/jumbo v1, "WATCHDOG"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 93
    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 94
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    monitor-exit p0

    return-void

    .line 91
    .end local v0    # "t":Ljava/lang/Thread;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized stop()V
    .locals 1

    .prologue
    .line 101
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/Watchdog;->stopped:Z

    .line 102
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    monitor-exit p0

    return-void

    .line 101
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
