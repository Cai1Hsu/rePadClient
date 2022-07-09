.class public Lorg/apache/tools/ant/listener/BigProjectLogger;
.super Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;
.source "BigProjectLogger.java"

# interfaces
.implements Lorg/apache/tools/ant/SubBuildListener;


# static fields
.field public static final FOOTER:Ljava/lang/String; = "======================================================================"

.field public static final HEADER:Ljava/lang/String; = "======================================================================"


# instance fields
.field private final subBuildLock:Ljava/lang/Object;

.field private volatile subBuildStartedRaised:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildStartedRaised:Z

    .line 39
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildLock:Ljava/lang/Object;

    return-void
.end method

.method private maybeRaiseSubBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 185
    iget-boolean v0, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildStartedRaised:Z

    if-nez v0, :cond_1

    .line 186
    iget-object v1, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildLock:Ljava/lang/Object;

    monitor-enter v1

    .line 187
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildStartedRaised:Z

    if-nez v0, :cond_0

    .line 188
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildStartedRaised:Z

    .line 189
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 191
    :cond_0
    monitor-exit v1

    .line 193
    :cond_1
    return-void

    .line 191
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->maybeRaiseSubBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 102
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 103
    invoke-super {p0, p1}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->buildFinished(Lorg/apache/tools/ant/BuildEvent;)V

    .line 104
    return-void
.end method

.method protected extractNameOrDefault(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;
    .locals 3
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    const/16 v2, 0x22

    .line 146
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->extractProjectName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 148
    const-string/jumbo v0, ""

    .line 152
    :goto_0
    return-object v0

    .line 150
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getBuildFailedMessage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-super {p0}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->getBuildFailedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " - at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/listener/BigProjectLogger;->getTimestamp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getBuildSuccessfulMessage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-super {p0}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->getBuildSuccessfulMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " - at "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/listener/BigProjectLogger;->getTimestamp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFooter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    const-string/jumbo v0, "======================================================================"

    return-object v0
.end method

.method protected getHeader()Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    const-string/jumbo v0, "======================================================================"

    return-object v0
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->maybeRaiseSubBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 113
    invoke-super {p0, p1}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->messageLogged(Lorg/apache/tools/ant/BuildEvent;)V

    .line 114
    return-void
.end method

.method public subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 5
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 157
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->extractNameOrDefault(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;

    move-result-object v1

    .line 158
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string/jumbo v0, "failing "

    .line 159
    .local v0, "failed":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/listener/BigProjectLogger;->getHeader()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "Exiting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "project "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/listener/BigProjectLogger;->getFooter()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v4

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/tools/ant/listener/BigProjectLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 165
    return-void

    .line 158
    .end local v0    # "failed":Ljava/lang/String;
    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 7
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 123
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->extractNameOrDefault(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    .line 126
    .local v3, "project":Lorg/apache/tools/ant/Project;
    if-nez v3, :cond_0

    const/4 v0, 0x0

    .line 127
    .local v0, "base":Ljava/io/File;
    :goto_0
    if-nez v0, :cond_1

    const-string/jumbo v2, "With no base directory"

    .line 131
    .local v2, "path":Ljava/lang/String;
    :goto_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/listener/BigProjectLogger;->getHeader()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "Entering project "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    sget-object v5, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/listener/BigProjectLogger;->getFooter()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/listener/BigProjectLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v6

    invoke-virtual {p0, v4, v5, v6}, Lorg/apache/tools/ant/listener/BigProjectLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 137
    return-void

    .line 126
    .end local v0    # "base":Ljava/io/File;
    .end local v2    # "path":Ljava/lang/String;
    :cond_0
    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0

    .line 127
    .restart local v0    # "base":Ljava/io/File;
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "In "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->maybeRaiseSubBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 82
    invoke-super {p0, p1}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->targetStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 83
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/listener/BigProjectLogger;->maybeRaiseSubBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 92
    invoke-super {p0, p1}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->taskStarted(Lorg/apache/tools/ant/BuildEvent;)V

    .line 93
    return-void
.end method
