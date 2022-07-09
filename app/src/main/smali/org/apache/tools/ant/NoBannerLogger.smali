.class public Lorg/apache/tools/ant/NoBannerLogger;
.super Lorg/apache/tools/ant/DefaultLogger;
.source "NoBannerLogger.java"


# instance fields
.field protected targetName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/DefaultLogger;-><init>()V

    .line 42
    return-void
.end method


# virtual methods
.method protected extractTargetName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;
    .locals 1
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 62
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 3
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 85
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v0

    iget v1, p0, Lorg/apache/tools/ant/NoBannerLogger;->msgOutputLevel:I

    if-gt v0, v1, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 99
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    monitor-enter p0

    .line 92
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/NoBannerLogger;->targetName:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 93
    iget-object v0, p0, Lorg/apache/tools/ant/NoBannerLogger;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/NoBannerLogger;->targetName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/NoBannerLogger;->targetName:Ljava/lang/String;

    .line 96
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    invoke-super {p0, p1}, Lorg/apache/tools/ant/DefaultLogger;->messageLogged(Lorg/apache/tools/ant/BuildEvent;)V

    goto :goto_0

    .line 96
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 1
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 71
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lorg/apache/tools/ant/NoBannerLogger;->targetName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    .line 71
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 1
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 52
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/NoBannerLogger;->extractTargetName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/NoBannerLogger;->targetName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    monitor-exit p0

    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
