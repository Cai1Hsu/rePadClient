.class public Lorg/apache/tools/ant/TaskConfigurationChecker;
.super Ljava/lang/Object;
.source "TaskConfigurationChecker.java"


# instance fields
.field private errors:Ljava/util/List;

.field private final task:Lorg/apache/tools/ant/Task;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->errors:Ljava/util/List;

    .line 69
    iput-object p1, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->task:Lorg/apache/tools/ant/Task;

    .line 70
    return-void
.end method


# virtual methods
.method public assertConfig(ZLjava/lang/String;)V
    .locals 1
    .param p1, "condition"    # Z
    .param p2, "errormessage"    # Ljava/lang/String;

    .prologue
    .line 78
    if-nez p1, :cond_0

    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->errors:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    :cond_0
    return-void
.end method

.method public checkErrors()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 97
    iget-object v3, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->errors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 98
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 99
    .local v2, "sb":Ljava/lang/StringBuffer;
    const-string/jumbo v3, "Configurationerror on <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    iget-object v3, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v3}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 101
    const-string/jumbo v3, ">:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 102
    const-string/jumbo v3, "line.separator"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 103
    iget-object v3, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->errors:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 104
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 105
    .local v1, "msg":Ljava/lang/String;
    const-string/jumbo v3, "- "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 106
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 107
    const-string/jumbo v3, "line.separator"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 109
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v5}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 111
    .end local v0    # "it":Ljava/util/Iterator;
    .end local v2    # "sb":Ljava/lang/StringBuffer;
    :cond_1
    return-void
.end method

.method public fail(Ljava/lang/String;)V
    .locals 1
    .param p1, "errormessage"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/TaskConfigurationChecker;->errors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method
