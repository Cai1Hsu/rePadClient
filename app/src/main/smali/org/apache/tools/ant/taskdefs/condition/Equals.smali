.class public Lorg/apache/tools/ant/taskdefs/condition/Equals;
.super Ljava/lang/Object;
.source "Equals.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final REQUIRED:I = 0x3


# instance fields
.field private arg1:Ljava/lang/Object;

.field private arg2:Ljava/lang/Object;

.field private args:I

.field private caseSensitive:Z

.field private forcestring:Z

.field private trim:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->trim:Z

    .line 33
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->caseSensitive:Z

    .line 35
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->forcestring:Z

    return-void
.end method

.method private setArg1Internal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 60
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    .line 61
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->args:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->args:I

    .line 62
    return-void
.end method

.method private setArg2Internal(Ljava/lang/Object;)V
    .locals 1
    .param p1, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 87
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    .line 88
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->args:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->args:I

    .line 89
    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 125
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->args:I

    and-int/lit8 v2, v2, 0x3

    const/4 v3, 0x3

    if-eq v2, v3, :cond_0

    .line 126
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "both arg1 and arg2 are required in equals"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 128
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 129
    :cond_1
    const/4 v2, 0x1

    .line 146
    :goto_0
    return v2

    .line 131
    :cond_2
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->forcestring:Z

    if-eqz v2, :cond_5

    .line 132
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_8

    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    :goto_1
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    .line 133
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_9

    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    :goto_2
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    .line 135
    :cond_5
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->trim:Z

    if-eqz v2, :cond_6

    .line 136
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    .line 138
    :cond_6
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->trim:Z

    if-eqz v2, :cond_7

    .line 139
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    .line 141
    :cond_7
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_b

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_b

    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 143
    .local v0, "s1":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 144
    .local v1, "s2":Ljava/lang/String;
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->caseSensitive:Z

    if-eqz v2, :cond_a

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_0

    .line 132
    .end local v0    # "s1":Ljava/lang/String;
    .end local v1    # "s2":Ljava/lang/String;
    :cond_8
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg1:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 133
    :cond_9
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->arg2:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 144
    .restart local v0    # "s1":Ljava/lang/String;
    .restart local v1    # "s2":Ljava/lang/String;
    :cond_a
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    goto :goto_0

    .line 146
    .end local v0    # "s1":Ljava/lang/String;
    .end local v1    # "s2":Ljava/lang/String;
    :cond_b
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setArg1(Ljava/lang/Object;)V
    .locals 1
    .param p1, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 43
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 44
    check-cast p1, Ljava/lang/String;

    .end local p1    # "arg1":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Equals;->setArg1(Ljava/lang/String;)V

    .line 48
    :goto_0
    return-void

    .line 46
    .restart local p1    # "arg1":Ljava/lang/Object;
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Equals;->setArg1Internal(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setArg1(Ljava/lang/String;)V
    .locals 0
    .param p1, "a1"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Equals;->setArg1Internal(Ljava/lang/Object;)V

    .line 57
    return-void
.end method

.method public setArg2(Ljava/lang/Object;)V
    .locals 1
    .param p1, "arg2"    # Ljava/lang/Object;

    .prologue
    .line 70
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 71
    check-cast p1, Ljava/lang/String;

    .end local p1    # "arg2":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Equals;->setArg2(Ljava/lang/String;)V

    .line 75
    :goto_0
    return-void

    .line 73
    .restart local p1    # "arg2":Ljava/lang/Object;
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Equals;->setArg2Internal(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setArg2(Ljava/lang/String;)V
    .locals 0
    .param p1, "a2"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/condition/Equals;->setArg2Internal(Ljava/lang/Object;)V

    .line 84
    return-void
.end method

.method public setCasesensitive(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 107
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->caseSensitive:Z

    .line 108
    return-void
.end method

.method public setForcestring(Z)V
    .locals 0
    .param p1, "forcestring"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->forcestring:Z

    .line 118
    return-void
.end method

.method public setTrim(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 97
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Equals;->trim:Z

    .line 98
    return-void
.end method
