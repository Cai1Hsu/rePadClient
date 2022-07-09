.class public Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;
.super Ljava/lang/Object;
.source "XSLTProcess.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/XSLTProcess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Param"
.end annotation


# instance fields
.field private expression:Ljava/lang/String;

.field private ifCond:Ljava/lang/Object;

.field private name:Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;

.field private unlessCond:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 950
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 952
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->name:Ljava/lang/String;

    .line 955
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->expression:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getExpression()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1008
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->expression:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1009
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Expression attribute is missing."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1011
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->expression:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 995
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 996
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Name attribute is missing."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 998
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->name:Ljava/lang/String;

    return-object v0
.end method

.method public setExpression(Ljava/lang/String;)V
    .locals 0
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    .line 985
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->expression:Ljava/lang/String;

    .line 986
    return-void
.end method

.method public setIf(Ljava/lang/Object;)V
    .locals 0
    .param p1, "ifCond"    # Ljava/lang/Object;

    .prologue
    .line 1022
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->ifCond:Ljava/lang/Object;

    .line 1023
    return-void
.end method

.method public setIf(Ljava/lang/String;)V
    .locals 0
    .param p1, "ifProperty"    # Ljava/lang/String;

    .prologue
    .line 1032
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->setIf(Ljava/lang/Object;)V

    .line 1033
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 976
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->name:Ljava/lang/String;

    .line 977
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 967
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->project:Lorg/apache/tools/ant/Project;

    .line 968
    return-void
.end method

.method public setUnless(Ljava/lang/Object;)V
    .locals 0
    .param p1, "unlessCond"    # Ljava/lang/Object;

    .prologue
    .line 1043
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->unlessCond:Ljava/lang/Object;

    .line 1044
    return-void
.end method

.method public setUnless(Ljava/lang/String;)V
    .locals 0
    .param p1, "unlessProperty"    # Ljava/lang/String;

    .prologue
    .line 1053
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->setUnless(Ljava/lang/Object;)V

    .line 1054
    return-void
.end method

.method public shouldUse()Z
    .locals 2

    .prologue
    .line 1062
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->project:Lorg/apache/tools/ant/Project;

    invoke-static {v1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    .line 1063
    .local v0, "ph":Lorg/apache/tools/ant/PropertyHelper;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->ifCond:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testIfCondition(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->unlessCond:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testUnlessCondition(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
