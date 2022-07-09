.class public Lorg/apache/tools/ant/taskdefs/condition/Xor;
.super Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;
.source "Xor.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/ConditionBase;-><init>()V

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
    .line 38
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/Xor;->getConditions()Ljava/util/Enumeration;

    move-result-object v1

    .line 40
    .local v1, "e":Ljava/util/Enumeration;
    const/4 v2, 0x0

    .line 41
    .local v2, "state":Z
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 42
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/condition/Condition;

    .line 44
    .local v0, "c":Lorg/apache/tools/ant/taskdefs/condition/Condition;
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/condition/Condition;->eval()Z

    move-result v3

    xor-int/2addr v2, v3

    goto :goto_0

    .line 46
    .end local v0    # "c":Lorg/apache/tools/ant/taskdefs/condition/Condition;
    :cond_0
    return v2
.end method
