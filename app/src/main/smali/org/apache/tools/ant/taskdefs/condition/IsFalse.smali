.class public Lorg/apache/tools/ant/taskdefs/condition/IsFalse;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "IsFalse.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private value:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFalse;->value:Ljava/lang/Boolean;

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFalse;->value:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Nothing to test for falsehood"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFalse;->value:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setValue(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 40
    if-eqz p1, :cond_0

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFalse;->value:Ljava/lang/Boolean;

    .line 41
    return-void

    .line 40
    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method
