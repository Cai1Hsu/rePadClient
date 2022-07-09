.class public Lorg/apache/tools/ant/taskdefs/condition/And;
.super Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
.source "And.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;-><init>()V

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/And;->getConditions()Ljava/util/Enumeration;

    move-result-object v1

    .line 40
    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 41
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/condition/Condition;

    .line 42
    .local v0, "c":Lorg/apache/tools/ant/taskdefs/condition/Condition;
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/condition/Condition;->eval()Z

    move-result v2

    if-nez v2, :cond_0

    .line 43
    const/4 v2, 0x0

    .line 46
    .end local v0    # "c":Lorg/apache/tools/ant/taskdefs/condition/Condition;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method
