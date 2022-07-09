.class public Lorg/apache/tools/ant/listener/ProfileLogger;
.super Lorg/apache/tools/ant/DefaultLogger;
.source "ProfileLogger.java"


# instance fields
.field private profileData:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/DefaultLogger;-><init>()V

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->profileData:Ljava/util/Map;

    return-void
.end method

.method private logFinish(Lorg/apache/tools/ant/BuildEvent;Ljava/util/Date;Ljava/lang/String;)V
    .locals 8
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;
    .param p2, "start"    # Ljava/util/Date;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 92
    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    .line 93
    .local v3, "now":Ljava/util/Date;
    const/4 v2, 0x0

    .line 94
    .local v2, "msg":Ljava/lang/String;
    if-eqz p2, :cond_0

    .line 95
    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    sub-long v0, v4, v6

    .line 96
    .local v0, "diff":J
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": finished "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "ms)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 102
    .end local v0    # "diff":J
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v5

    invoke-virtual {p0, v2, v4, v5}, Lorg/apache/tools/ant/listener/ProfileLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 103
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/listener/ProfileLogger;->log(Ljava/lang/String;)V

    .line 104
    return-void

    .line 99
    :cond_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": finished "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " (unknown duration, start not detected)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private logStart(Lorg/apache/tools/ant/BuildEvent;Ljava/util/Date;Ljava/lang/String;)V
    .locals 3
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;
    .param p2, "start"    # Ljava/util/Date;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 107
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ": started "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/tools/ant/listener/ProfileLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 109
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/listener/ProfileLogger;->log(Ljava/lang/String;)V

    .line 110
    return-void
.end method


# virtual methods
.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 59
    iget-object v2, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->profileData:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Date;

    .line 60
    .local v1, "start":Ljava/util/Date;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Target "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "name":Ljava/lang/String;
    invoke-direct {p0, p1, v1, v0}, Lorg/apache/tools/ant/listener/ProfileLogger;->logFinish(Lorg/apache/tools/ant/BuildEvent;Ljava/util/Date;Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 45
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 46
    .local v1, "now":Ljava/util/Date;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Target "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 47
    .local v0, "name":Ljava/lang/String;
    invoke-direct {p0, p1, v1, v0}, Lorg/apache/tools/ant/listener/ProfileLogger;->logStart(Lorg/apache/tools/ant/BuildEvent;Ljava/util/Date;Ljava/lang/String;)V

    .line 48
    iget-object v2, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->profileData:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 86
    iget-object v2, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->profileData:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Date;

    .line 87
    .local v1, "start":Ljava/util/Date;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "name":Ljava/lang/String;
    invoke-direct {p0, p1, v1, v0}, Lorg/apache/tools/ant/listener/ProfileLogger;->logFinish(Lorg/apache/tools/ant/BuildEvent;Ljava/util/Date;Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 72
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "name":Ljava/lang/String;
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 74
    .local v1, "now":Ljava/util/Date;
    invoke-direct {p0, p1, v1, v0}, Lorg/apache/tools/ant/listener/ProfileLogger;->logStart(Lorg/apache/tools/ant/BuildEvent;Ljava/util/Date;Ljava/lang/String;)V

    .line 75
    iget-object v2, p0, Lorg/apache/tools/ant/listener/ProfileLogger;->profileData:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    return-void
.end method
