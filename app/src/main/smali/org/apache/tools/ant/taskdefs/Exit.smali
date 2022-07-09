.class public Lorg/apache/tools/ant/taskdefs/Exit;
.super Lorg/apache/tools/ant/Task;
.source "Exit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Exit$1;,
        Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;
    }
.end annotation


# instance fields
.field private ifCondition:Ljava/lang/Object;

.field private message:Ljava/lang/String;

.field private nestedCondition:Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

.field private status:Ljava/lang/Integer;

.field private unlessCondition:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 52
    return-void
.end method

.method private nestedConditionPresent()Z
    .locals 1

    .prologue
    .line 232
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->nestedCondition:Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private testIfCondition()Z
    .locals 2

    .prologue
    .line 198
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->ifCondition:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testIfCondition(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private testNestedCondition()Z
    .locals 3

    .prologue
    .line 217
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->nestedConditionPresent()Z

    move-result v0

    .line 219
    .local v0, "result":Z
    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->ifCondition:Ljava/lang/Object;

    if-nez v1, :cond_1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->unlessCondition:Ljava/lang/Object;

    if-eqz v1, :cond_2

    .line 220
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Nested conditions not permitted in conjunction with if/unless attributes"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 224
    :cond_2
    if-eqz v0, :cond_3

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->nestedCondition:Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;->eval()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private testUnlessCondition()Z
    .locals 2

    .prologue
    .line 208
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->unlessCondition:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testUnlessCondition(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 174
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 175
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    .line 177
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public createCondition()Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->nestedCondition:Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

    if-eqz v0, :cond_0

    .line 187
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one nested condition is allowed."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;-><init>(Lorg/apache/tools/ant/taskdefs/Exit$1;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->nestedCondition:Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->nestedCondition:Lorg/apache/tools/ant/taskdefs/Exit$NestedCondition;

    return-object v0
.end method

.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->nestedConditionPresent()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->testNestedCondition()Z

    move-result v0

    .line 137
    .local v0, "fail":Z
    :goto_0
    if-eqz v0, :cond_9

    .line 138
    const/4 v1, 0x0

    .line 139
    .local v1, "text":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 140
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 163
    :cond_0
    :goto_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "failing due to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Exit;->log(Ljava/lang/String;I)V

    .line 164
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Exit;->status:Ljava/lang/Integer;

    if-nez v2, :cond_8

    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    :goto_2
    throw v2

    .line 135
    .end local v0    # "fail":Z
    .end local v1    # "text":Ljava/lang/String;
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->testIfCondition()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->testUnlessCondition()Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 142
    .restart local v0    # "fail":Z
    .restart local v1    # "text":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Exit;->ifCondition:Ljava/lang/Object;

    if-eqz v2, :cond_4

    const-string/jumbo v2, ""

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Exit;->ifCondition:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->testIfCondition()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 144
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "if="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Exit;->ifCondition:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 146
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Exit;->unlessCondition:Ljava/lang/Object;

    if-eqz v2, :cond_5

    const-string/jumbo v2, ""

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Exit;->unlessCondition:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->testUnlessCondition()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 148
    if-nez v1, :cond_6

    .line 149
    const-string/jumbo v1, ""

    .line 153
    :goto_3
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "unless="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Exit;->unlessCondition:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 155
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Exit;->nestedConditionPresent()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 156
    const-string/jumbo v1, "condition satisfied"

    goto/16 :goto_1

    .line 151
    :cond_6
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " and "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 158
    :cond_7
    if-nez v1, :cond_0

    .line 159
    const-string/jumbo v1, "No message"

    goto/16 :goto_1

    .line 164
    :cond_8
    new-instance v2, Lorg/apache/tools/ant/ExitStatusException;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Exit;->status:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/ExitStatusException;-><init>(Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 167
    .end local v1    # "text":Ljava/lang/String;
    :cond_9
    return-void
.end method

.method public setIf(Ljava/lang/Object;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/Object;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->ifCondition:Ljava/lang/Object;

    .line 84
    return-void
.end method

.method public setIf(Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Exit;->setIf(Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->message:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setStatus(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 119
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exit;->status:Ljava/lang/Integer;

    .line 120
    return-void
.end method

.method public setUnless(Ljava/lang/Object;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/Object;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exit;->unlessCondition:Ljava/lang/Object;

    .line 103
    return-void
.end method

.method public setUnless(Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Exit;->setUnless(Ljava/lang/Object;)V

    .line 112
    return-void
.end method
