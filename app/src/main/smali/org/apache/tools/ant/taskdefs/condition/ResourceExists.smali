.class public Lorg/apache/tools/ant/taskdefs/condition/ResourceExists;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "ResourceExists.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private resource:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/Resource;)V
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 37
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceExists;->resource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 38
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only one resource can be tested"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceExists;->resource:Lorg/apache/tools/ant/types/Resource;

    .line 41
    return-void
.end method

.method public eval()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/ResourceExists;->validate()V

    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceExists;->resource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v0

    return v0
.end method

.method protected validate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/ResourceExists;->resource:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "resource is required"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_0
    return-void
.end method
