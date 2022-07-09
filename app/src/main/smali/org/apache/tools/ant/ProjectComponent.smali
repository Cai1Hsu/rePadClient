.class public abstract Lorg/apache/tools/ant/ProjectComponent;
.super Ljava/lang/Object;
.source "ProjectComponent.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field protected description:Ljava/lang/String;

.field protected location:Lorg/apache/tools/ant/Location;

.field protected project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/ProjectComponent;->location:Lorg/apache/tools/ant/Location;

    .line 55
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ProjectComponent;

    .line 165
    .local v0, "pc":Lorg/apache/tools/ant/ProjectComponent;
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectComponent;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/ProjectComponent;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/ProjectComponent;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 167
    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectComponent;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getLocation()Lorg/apache/tools/ant/Location;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectComponent;->location:Lorg/apache/tools/ant/Location;

    return-object v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectComponent;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public log(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 134
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 135
    return-void
.end method

.method public log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "msgLevel"    # I

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 146
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 155
    :cond_0
    :goto_0
    return-void

    .line 151
    :cond_1
    const/4 v0, 0x2

    if-gt p2, v0, :cond_0

    .line 152
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 115
    iput-object p1, p0, Lorg/apache/tools/ant/ProjectComponent;->description:Ljava/lang/String;

    .line 116
    return-void
.end method

.method public setLocation(Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/apache/tools/ant/ProjectComponent;->location:Lorg/apache/tools/ant/Location;

    .line 103
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/ProjectComponent;->project:Lorg/apache/tools/ant/Project;

    .line 68
    return-void
.end method
