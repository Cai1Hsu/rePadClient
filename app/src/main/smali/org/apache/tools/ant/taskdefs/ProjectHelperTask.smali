.class public Lorg/apache/tools/ant/taskdefs/ProjectHelperTask;
.super Lorg/apache/tools/ant/Task;
.source "ProjectHelperTask.java"


# instance fields
.field private projectHelpers:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ProjectHelperTask;->projectHelpers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public declared-synchronized addConfigured(Lorg/apache/tools/ant/ProjectHelper;)V
    .locals 1
    .param p1, "projectHelper"    # Lorg/apache/tools/ant/ProjectHelper;

    .prologue
    .line 39
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/ProjectHelperTask;->projectHelpers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    monitor-exit p0

    return-void

    .line 39
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {}, Lorg/apache/tools/ant/ProjectHelperRepository;->getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;

    move-result-object v2

    .line 44
    .local v2, "repo":Lorg/apache/tools/ant/ProjectHelperRepository;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ProjectHelperTask;->projectHelpers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 45
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ProjectHelper;

    .line 46
    .local v0, "helper":Lorg/apache/tools/ant/ProjectHelper;
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/ProjectHelperRepository;->registerProjectHelper(Ljava/lang/Class;)V

    goto :goto_0

    .line 48
    .end local v0    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    :cond_0
    return-void
.end method
