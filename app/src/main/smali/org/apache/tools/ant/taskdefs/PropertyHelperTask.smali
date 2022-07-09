.class public Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;
.super Lorg/apache/tools/ant/Task;
.source "PropertyHelperTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$1;,
        Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;
    }
.end annotation


# instance fields
.field private delegates:Ljava/util/List;

.field private propertyHelper:Lorg/apache/tools/ant/PropertyHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 41
    return-void
.end method

.method private declared-synchronized getAddDelegateList()Ljava/util/List;
    .locals 1

    .prologue
    .line 140
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->delegates:Ljava/util/List;

    if-nez v0, :cond_0

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->delegates:Ljava/util/List;

    .line 143
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->delegates:Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 140
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized addConfigured(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V
    .locals 1
    .param p1, "delegate"    # Lorg/apache/tools/ant/PropertyHelper$Delegate;

    .prologue
    .line 90
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->getAddDelegateList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    monitor-exit p0

    return-void

    .line 90
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addConfigured(Lorg/apache/tools/ant/PropertyHelper;)V
    .locals 2
    .param p1, "propertyHelper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    if-eqz v0, :cond_0

    .line 80
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one PropertyHelper can be installed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 82
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    monitor-exit p0

    return-void
.end method

.method public createDelegate()Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;-><init>(Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$1;)V

    .line 99
    .local v0, "result":Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->getAddDelegateList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    return-object v0
.end method

.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    if-nez v4, :cond_0

    .line 109
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Project instance not set"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 111
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    if-nez v4, :cond_1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->delegates:Ljava/util/List;

    if-nez v4, :cond_1

    .line 112
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Either a new PropertyHelper or one or more PropertyHelper delegates are required"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 115
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    .line 116
    .local v3, "ph":Lorg/apache/tools/ant/PropertyHelper;
    if-nez v3, :cond_2

    .line 117
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v3

    .line 121
    :goto_0
    monitor-enter v3

    .line 122
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->delegates:Ljava/util/List;

    if-eqz v4, :cond_4

    .line 123
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->delegates:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 124
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 125
    .local v2, "o":Ljava/lang/Object;
    instance-of v4, v2, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;

    if-eqz v4, :cond_3

    check-cast v2, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;->access$100(Lorg/apache/tools/ant/taskdefs/PropertyHelperTask$DelegateElement;)Lorg/apache/tools/ant/PropertyHelper$Delegate;

    move-result-object v0

    .line 127
    .local v0, "delegate":Lorg/apache/tools/ant/PropertyHelper$Delegate;
    :goto_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Adding PropertyHelper delegate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->log(Ljava/lang/String;I)V

    .line 128
    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/PropertyHelper;->add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V

    goto :goto_1

    .line 131
    .end local v0    # "delegate":Lorg/apache/tools/ant/PropertyHelper$Delegate;
    .end local v1    # "iter":Ljava/util/Iterator;
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 119
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    goto :goto_0

    .line 125
    .restart local v1    # "iter":Ljava/util/Iterator;
    .restart local v2    # "o":Ljava/lang/Object;
    :cond_3
    :try_start_1
    check-cast v2, Lorg/apache/tools/ant/PropertyHelper$Delegate;

    move-object v0, v2

    goto :goto_2

    .line 131
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v2    # "o":Ljava/lang/Object;
    :cond_4
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 132
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    if-eqz v4, :cond_5

    .line 133
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Installing PropertyHelper "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->log(Ljava/lang/String;I)V

    .line 135
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "ant.PropertyHelper"

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/PropertyHelperTask;->propertyHelper:Lorg/apache/tools/ant/PropertyHelper;

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 137
    :cond_5
    return-void
.end method
