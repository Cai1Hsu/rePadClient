.class public Lorg/apache/tools/ant/taskdefs/WaitFor;
.super Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
.source "WaitFor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;
    }
.end annotation


# static fields
.field public static final DEFAULT_CHECK_MILLIS:J = 0x1f4L

.field public static final DEFAULT_MAX_WAIT_MILLIS:J = 0x2bf20L

.field public static final ONE_DAY:J = 0x5265c00L

.field public static final ONE_HOUR:J = 0x36ee80L

.field public static final ONE_MILLISECOND:J = 0x1L

.field public static final ONE_MINUTE:J = 0xea60L

.field public static final ONE_SECOND:J = 0x3e8L

.field public static final ONE_WEEK:J = 0x240c8400L


# instance fields
.field private checkEvery:J

.field private checkEveryMultiplier:J

.field private maxWait:J

.field private maxWaitMultiplier:J

.field private timeoutProperty:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x1

    .line 88
    const-string/jumbo v0, "waitfor"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;-><init>(Ljava/lang/String;)V

    .line 75
    const-wide/32 v0, 0x2bf20

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWait:J

    .line 76
    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWaitMultiplier:J

    .line 80
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEvery:J

    .line 81
    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEveryMultiplier:J

    .line 89
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1, "taskName"    # Ljava/lang/String;

    .prologue
    const-wide/16 v2, 0x1

    .line 99
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;-><init>(Ljava/lang/String;)V

    .line 75
    const-wide/32 v0, 0x2bf20

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWait:J

    .line 76
    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWaitMultiplier:J

    .line 80
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEvery:J

    .line 81
    iput-wide v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEveryMultiplier:J

    .line 100
    return-void
.end method


# virtual methods
.method public calculateCheckEveryMillis()J
    .locals 4

    .prologue
    .line 187
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEvery:J

    iget-wide v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEveryMultiplier:J

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public calculateMaxWaitMillis()J
    .locals 4

    .prologue
    .line 196
    iget-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWait:J

    iget-wide v2, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWaitMultiplier:J

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->countConditions()I

    move-result v10

    if-le v10, v11, :cond_0

    .line 152
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "You must not nest more than one condition into "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getTaskName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 156
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->countConditions()I

    move-result v10

    if-ge v10, v11, :cond_1

    .line 157
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "You must nest a condition into "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getTaskName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 160
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getConditions()Ljava/util/Enumeration;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/condition/Condition;

    .line 162
    .local v0, "c":Lorg/apache/tools/ant/taskdefs/condition/Condition;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->calculateMaxWaitMillis()J

    move-result-wide v6

    .line 163
    .local v6, "maxWaitMillis":J
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->calculateCheckEveryMillis()J

    move-result-wide v2

    .line 164
    .local v2, "checkEveryMillis":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 165
    .local v8, "start":J
    add-long v4, v8, v6

    .line 167
    .local v4, "end":J
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    cmp-long v10, v10, v4

    if-gez v10, :cond_3

    .line 168
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/condition/Condition;->eval()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 169
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->processSuccess()V

    .line 179
    .end local v2    # "checkEveryMillis":J
    .end local v4    # "end":J
    .end local v6    # "maxWaitMillis":J
    .end local v8    # "start":J
    :goto_1
    return-void

    .line 172
    .restart local v2    # "checkEveryMillis":J
    .restart local v4    # "end":J
    .restart local v6    # "maxWaitMillis":J
    .restart local v8    # "start":J
    :cond_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 174
    .end local v2    # "checkEveryMillis":J
    .end local v4    # "end":J
    .end local v6    # "maxWaitMillis":J
    .end local v8    # "start":J
    :catch_0
    move-exception v1

    .line 175
    .local v1, "e":Ljava/lang/InterruptedException;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Task "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getTaskName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " interrupted, treating as timed out."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/WaitFor;->log(Ljava/lang/String;)V

    .line 178
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->processTimeout()V

    goto :goto_1
.end method

.method protected processSuccess()V
    .locals 2

    .prologue
    .line 205
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getTaskName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ": condition was met"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/WaitFor;->log(Ljava/lang/String;I)V

    .line 206
    return-void
.end method

.method protected processTimeout()V
    .locals 3

    .prologue
    .line 216
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getTaskName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ": timeout"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/WaitFor;->log(Ljava/lang/String;I)V

    .line 217
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->timeoutProperty:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 218
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WaitFor;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->timeoutProperty:Ljava/lang/String;

    const-string/jumbo v2, "true"

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    :cond_0
    return-void
.end method

.method public setCheckEvery(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 126
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEvery:J

    .line 127
    return-void
.end method

.method public setCheckEveryUnit(Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;)V
    .locals 2
    .param p1, "unit"    # Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;

    .prologue
    .line 134
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->getMultiplier()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->checkEveryMultiplier:J

    .line 135
    return-void
.end method

.method public setMaxWait(J)V
    .locals 1
    .param p1, "time"    # J

    .prologue
    .line 107
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWait:J

    .line 108
    return-void
.end method

.method public setMaxWaitUnit(Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;)V
    .locals 2
    .param p1, "unit"    # Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;

    .prologue
    .line 116
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/WaitFor$Unit;->getMultiplier()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->maxWaitMultiplier:J

    .line 117
    return-void
.end method

.method public setTimeoutProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/WaitFor;->timeoutProperty:Ljava/lang/String;

    .line 143
    return-void
.end method
