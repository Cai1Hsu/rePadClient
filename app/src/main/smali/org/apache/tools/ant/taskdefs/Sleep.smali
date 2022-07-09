.class public Lorg/apache/tools/ant/taskdefs/Sleep;
.super Lorg/apache/tools/ant/Task;
.source "Sleep.java"


# instance fields
.field private failOnError:Z

.field private hours:I

.field private milliseconds:I

.field private minutes:I

.field private seconds:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 46
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->failOnError:Z

    .line 51
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->seconds:I

    .line 56
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->hours:I

    .line 60
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->minutes:I

    .line 65
    iput v1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->milliseconds:I

    .line 73
    return-void
.end method

.method private getSleepTime()J
    .locals 6

    .prologue
    const-wide/16 v4, 0x3c

    .line 148
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->hours:I

    int-to-long v0, v0

    mul-long/2addr v0, v4

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->minutes:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    mul-long/2addr v0, v4

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->seconds:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->milliseconds:I

    int-to-long v2, v2

    add-long/2addr v0, v2

    return-wide v0
.end method


# virtual methods
.method public doSleep(J)V
    .locals 1
    .param p1, "millis"    # J

    .prologue
    .line 123
    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 127
    :goto_0
    return-void

    .line 124
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 177
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sleep;->validate()V

    .line 178
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Sleep;->getSleepTime()J

    move-result-wide v2

    .line 179
    .local v2, "sleepTime":J
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "sleeping for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " milliseconds"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Sleep;->log(Ljava/lang/String;I)V

    .line 181
    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Sleep;->doSleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .end local v2    # "sleepTime":J
    :goto_0
    return-void

    .line 182
    :catch_0
    move-exception v0

    .line 183
    .local v0, "e":Ljava/lang/Exception;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->failOnError:Z

    if-eqz v4, :cond_0

    .line 184
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 186
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    .line 187
    .local v1, "text":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/Sleep;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 136
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->failOnError:Z

    .line 137
    return-void
.end method

.method public setHours(I)V
    .locals 0
    .param p1, "hours"    # I

    .prologue
    .line 92
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->hours:I

    .line 93
    return-void
.end method

.method public setMilliseconds(I)V
    .locals 0
    .param p1, "milliseconds"    # I

    .prologue
    .line 112
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->milliseconds:I

    .line 113
    return-void
.end method

.method public setMinutes(I)V
    .locals 0
    .param p1, "minutes"    # I

    .prologue
    .line 102
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->minutes:I

    .line 103
    return-void
.end method

.method public setSeconds(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 82
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Sleep;->seconds:I

    .line 83
    return-void
.end method

.method public validate()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 161
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Sleep;->getSleepTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 162
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Negative sleep periods are not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_0
    return-void
.end method
