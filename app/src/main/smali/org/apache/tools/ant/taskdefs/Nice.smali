.class public Lorg/apache/tools/ant/taskdefs/Nice;
.super Lorg/apache/tools/ant/Task;
.source "Nice.java"


# instance fields
.field private currentPriority:Ljava/lang/String;

.field private newPriority:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    .line 60
    .local v4, "self":Ljava/lang/Thread;
    invoke-virtual {v4}, Ljava/lang/Thread;->getPriority()I

    move-result v3

    .line 61
    .local v3, "priority":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Nice;->currentPriority:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 62
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "current":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Nice;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Nice;->currentPriority:Ljava/lang/String;

    invoke-virtual {v5, v6, v0}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .end local v0    # "current":Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Nice;->newPriority:Ljava/lang/Integer;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Nice;->newPriority:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eq v3, v5, :cond_1

    .line 68
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Nice;->newPriority:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/Thread;->setPriority(I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 77
    :cond_1
    :goto_0
    return-void

    .line 69
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/SecurityException;
    const-string/jumbo v5, "Unable to set new priority -a security manager is in the way"

    const/4 v6, 0x1

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Nice;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 73
    .end local v1    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v2

    .line 74
    .local v2, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Priority out of range"

    invoke-direct {v5, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method public setCurrentPriority(Ljava/lang/String;)V
    .locals 0
    .param p1, "currentPriority"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Nice;->currentPriority:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public setNewPriority(I)V
    .locals 2
    .param p1, "newPriority"    # I

    .prologue
    .line 93
    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    const/16 v0, 0xa

    if-le p1, v0, :cond_1

    .line 94
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The thread priority is out of the range 1-10"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_1
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Nice;->newPriority:Ljava/lang/Integer;

    .line 97
    return-void
.end method
