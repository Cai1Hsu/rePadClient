.class public Lorg/apache/tools/ant/taskdefs/Sequential;
.super Lorg/apache/tools/ant/Task;
.source "Sequential.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# instance fields
.field private nestedTasks:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 44
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sequential;->nestedTasks:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sequential;->nestedTasks:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 54
    return-void
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sequential;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-static {v3}, Lorg/apache/tools/ant/property/LocalProperties;->get(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/property/LocalProperties;

    move-result-object v1

    .line 64
    .local v1, "localProperties":Lorg/apache/tools/ant/property/LocalProperties;
    invoke-virtual {v1}, Lorg/apache/tools/ant/property/LocalProperties;->enterScope()V

    .line 66
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Sequential;->nestedTasks:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 67
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/Task;

    .line 68
    .local v2, "nestedTask":Lorg/apache/tools/ant/Task;
    invoke-virtual {v2}, Lorg/apache/tools/ant/Task;->perform()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 71
    .end local v0    # "i":Ljava/util/Iterator;
    .end local v2    # "nestedTask":Lorg/apache/tools/ant/Task;
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Lorg/apache/tools/ant/property/LocalProperties;->exitScope()V

    throw v3

    .restart local v0    # "i":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/property/LocalProperties;->exitScope()V

    .line 73
    return-void
.end method
