.class public Lorg/apache/tools/ant/taskdefs/AugmentReference;
.super Lorg/apache/tools/ant/Task;
.source "AugmentReference.java"

# interfaces
.implements Lorg/apache/tools/ant/TypeAdapter;


# instance fields
.field private id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method

.method private declared-synchronized hijackId()V
    .locals 4

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 63
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    .line 64
    .local v0, "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    invoke-virtual {v0}, Lorg/apache/tools/ant/RuntimeConfigurable;->getId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    .line 65
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 66
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " attribute \'id\' unset"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    .end local v0    # "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 68
    .restart local v0    # "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_0
    :try_start_1
    const-string/jumbo v1, "id"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->removeAttribute(Ljava/lang/String;)V

    .line 70
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "augmented reference \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->setElementTag(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .end local v0    # "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_1
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized restoreWrapperId()V
    .locals 3

    .prologue
    .line 87
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 88
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "restoring augment wrapper "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->log(Ljava/lang/String;I)V

    .line 89
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v0

    .line 90
    .local v0, "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    const-string/jumbo v1, "id"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getTaskName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/RuntimeConfigurable;->setElementTag(Ljava/lang/String;)V

    .line 92
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    .end local v0    # "wrapper":Lorg/apache/tools/ant/RuntimeConfigurable;
    :cond_0
    monitor-exit p0

    return-void

    .line 87
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method


# virtual methods
.method public checkProxyClass(Ljava/lang/Class;)V
    .locals 0
    .param p1, "proxyClass"    # Ljava/lang/Class;

    .prologue
    .line 36
    return-void
.end method

.method public execute()V
    .locals 0

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->restoreWrapperId()V

    .line 80
    return-void
.end method

.method public declared-synchronized getProxy()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 42
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    if-nez v1, :cond_0

    .line 43
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "Project owner unset"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 42
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 45
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->hijackId()V

    .line 46
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->hasReference(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 47
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 48
    .local v0, "result":Ljava/lang/Object;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "project reference "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/AugmentReference;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    monitor-exit p0

    return-object v0

    .line 51
    .end local v0    # "result":Ljava/lang/Object;
    :cond_1
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unknown reference \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/AugmentReference;->id:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public setProxy(Ljava/lang/Object;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 58
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
