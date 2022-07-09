.class public Lorg/apache/tools/ant/taskdefs/ConditionTask;
.super Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
.source "ConditionTask.java"


# instance fields
.field private alternative:Ljava/lang/Object;

.field private property:Ljava/lang/String;

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 50
    const-string/jumbo v0, "condition"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;-><init>(Ljava/lang/String;)V

    .line 42
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    .line 43
    const-string/jumbo v0, "true"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->value:Ljava/lang/Object;

    .line 44
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->alternative:Ljava/lang/Object;

    .line 51
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x4

    .line 109
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->countConditions()I

    move-result v1

    if-le v1, v2, :cond_0

    .line 110
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "You must not nest more than one condition into <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->countConditions()I

    move-result v1

    if-ge v1, v2, :cond_1

    .line 114
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "You must nest a condition into <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 116
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 117
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "The property attribute is required."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 119
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->getConditions()Ljava/util/Enumeration;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/condition/Condition;

    .line 120
    .local v0, "c":Lorg/apache/tools/ant/taskdefs/condition/Condition;
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/condition/Condition;->eval()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 121
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Condition true; setting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->log(Ljava/lang/String;I)V

    .line 122
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/PropertyHelper;->setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    :goto_0
    return-void

    .line 123
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->alternative:Ljava/lang/Object;

    if-eqz v1, :cond_4

    .line 124
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Condition false; setting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->alternative:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->log(Ljava/lang/String;I)V

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->alternative:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/PropertyHelper;->setNewProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 127
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Condition false; not setting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public setElse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "alt"    # Ljava/lang/Object;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->alternative:Ljava/lang/Object;

    .line 90
    return-void
.end method

.method public setElse(Ljava/lang/String;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/String;

    .prologue
    .line 99
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->setElse(Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->property:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 69
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/ConditionTask;->value:Ljava/lang/Object;

    .line 70
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 79
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/ConditionTask;->setValue(Ljava/lang/Object;)V

    .line 80
    return-void
.end method
