.class public Lorg/apache/tools/ant/util/OutputStreamFunneler;
.super Ljava/lang/Object;
.source "OutputStreamFunneler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/OutputStreamFunneler$1;,
        Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;
    }
.end annotation


# static fields
.field public static final DEFAULT_TIMEOUT_MILLIS:J = 0x3e8L


# instance fields
.field private closed:Z

.field private count:I

.field private out:Ljava/io/OutputStream;

.field private timeoutMillis:J


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 91
    const-wide/16 v0, 0x3e8

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/tools/ant/util/OutputStreamFunneler;-><init>(Ljava/io/OutputStream;J)V

    .line 92
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;J)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "timeoutMillis"    # J

    .prologue
    const/4 v0, 0x0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    iput v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->count:I

    .line 103
    if-nez p1, :cond_0

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "OutputStreamFunneler.<init>:  out == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 107
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->out:Ljava/io/OutputStream;

    .line 108
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->closed:Z

    .line 109
    invoke-virtual {p0, p2, p3}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->setTimeout(J)V

    .line 110
    return-void
.end method

.method static access$004(Lorg/apache/tools/ant/util/OutputStreamFunneler;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler;

    .prologue
    .line 30
    iget v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->count:I

    return v0
.end method

.method static access$100(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->dieIfClosed()V

    return-void
.end method

.method static access$200(Lorg/apache/tools/ant/util/OutputStreamFunneler;)Ljava/io/OutputStream;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler;

    .prologue
    .line 30
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->out:Ljava/io/OutputStream;

    return-object v0
.end method

.method static access$300(Lorg/apache/tools/ant/util/OutputStreamFunneler;Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler;
    .param p1, "x1"    # Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->release(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;)V

    return-void
.end method

.method private declared-synchronized close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->dieIfClosed()V

    .line 164
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->closed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 168
    monitor-exit p0

    return-void

    .line 166
    :catchall_0
    move-exception v0

    const/4 v1, 0x1

    :try_start_2
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->closed:Z

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 163
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized dieIfClosed()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->closed:Z

    if-eqz v0, :cond_0

    .line 172
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "The funneled OutputStream has been closed."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 174
    :cond_0
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized release(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;)V
    .locals 4
    .param p1, "funnel"    # Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    monitor-enter p0

    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->access$500(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v0

    if-nez v0, :cond_2

    .line 145
    :try_start_1
    iget-wide v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->timeoutMillis:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 147
    :try_start_2
    iget-wide v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->timeoutMillis:J

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    :cond_0
    :goto_0
    :try_start_3
    iget v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->count:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->count:I

    if-nez v0, :cond_1

    .line 153
    invoke-direct {p0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 156
    :cond_1
    const/4 v0, 0x1

    :try_start_4
    invoke-static {p1, v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->access$502(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;Z)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 159
    :cond_2
    monitor-exit p0

    return-void

    .line 156
    :catchall_0
    move-exception v0

    const/4 v1, 0x1

    :try_start_5
    invoke-static {p1, v1}, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->access$502(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;Z)Z

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 143
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0

    .line 148
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized getFunnelInstance()Ljava/io/OutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->dieIfClosed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 135
    :try_start_1
    new-instance v0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;-><init>(Lorg/apache/tools/ant/util/OutputStreamFunneler;Lorg/apache/tools/ant/util/OutputStreamFunneler$1;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 137
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 133
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setTimeout(J)V
    .locals 1
    .param p1, "timeoutMillis"    # J

    .prologue
    .line 121
    monitor-enter p0

    :try_start_0
    iput-wide p1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler;->timeoutMillis:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 122
    monitor-exit p0

    return-void

    .line 121
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
