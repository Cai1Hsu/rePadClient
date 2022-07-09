.class public Lorg/apache/tools/ant/taskdefs/condition/IsReference;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "IsReference.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private ref:Lorg/apache/tools/ant/types/Reference;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 60
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->ref:Lorg/apache/tools/ant/types/Reference;

    if-nez v4, :cond_0

    .line 61
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "No reference specified for isreference condition"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 65
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->ref:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/Project;->hasReference(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 85
    :cond_1
    :goto_0
    return v3

    .line 68
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->type:Ljava/lang/String;

    if-nez v4, :cond_3

    .line 69
    const/4 v3, 0x1

    goto :goto_0

    .line 71
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 72
    .local v1, "o":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getDataTypeDefinitions()Ljava/util/Hashtable;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->type:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 75
    .local v2, "typeClass":Ljava/lang/Class;
    if-nez v2, :cond_4

    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getTaskDefinitions()Ljava/util/Hashtable;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->type:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "typeClass":Ljava/lang/Class;
    check-cast v2, Ljava/lang/Class;

    .line 80
    .restart local v2    # "typeClass":Ljava/lang/Class;
    :cond_4
    if-eqz v2, :cond_1

    .line 85
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    goto :goto_0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->ref:Lorg/apache/tools/ant/types/Reference;

    .line 43
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 51
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsReference;->type:Ljava/lang/String;

    .line 52
    return-void
.end method
