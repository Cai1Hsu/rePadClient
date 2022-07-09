.class public Lorg/apache/tools/ant/taskdefs/condition/Not;
.super Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
.source "Not.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;-><init>()V

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
    const/4 v1, 0x1

    .line 40
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/Not;->countConditions()I

    move-result v0

    if-le v0, v1, :cond_0

    .line 41
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must not nest more than one condition into <not>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/Not;->countConditions()I

    move-result v0

    if-ge v0, v1, :cond_1

    .line 45
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must nest a condition into <not>"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/Not;->getConditions()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/condition/Condition;

    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/condition/Condition;->eval()Z

    move-result v0

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method
