.class public Lorg/apache/tools/ant/taskdefs/CallTarget;
.super Lorg/apache/tools/ant/Task;
.source "CallTarget.java"


# instance fields
.field private callee:Lorg/apache/tools/ant/taskdefs/Ant;

.field private inheritAll:Z

.field private inheritRefs:Z

.field private targetSet:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 55
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->inheritAll:Z

    .line 57
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->inheritRefs:Z

    .line 59
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->targetSet:Z

    return-void
.end method


# virtual methods
.method public addConfiguredTarget(Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;)V
    .locals 1
    .param p1, "t"    # Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-nez v0, :cond_0

    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->init()V

    .line 165
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->addConfiguredTarget(Lorg/apache/tools/ant/taskdefs/Ant$TargetElement;)V

    .line 166
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->targetSet:Z

    .line 167
    return-void
.end method

.method public addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "ps"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-nez v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->init()V

    .line 141
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->addPropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 142
    return-void
.end method

.method public addReference(Lorg/apache/tools/ant/taskdefs/Ant$Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/taskdefs/Ant$Reference;

    .prologue
    .line 126
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-nez v0, :cond_0

    .line 127
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->init()V

    .line 129
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->addReference(Lorg/apache/tools/ant/taskdefs/Ant$Reference;)V

    .line 130
    return-void
.end method

.method public createParam()Lorg/apache/tools/ant/taskdefs/Property;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-nez v0, :cond_0

    .line 114
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->init()V

    .line 116
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Ant;->createProperty()Lorg/apache/tools/ant/taskdefs/Property;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-nez v0, :cond_0

    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->init()V

    .line 97
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->targetSet:Z

    if-nez v0, :cond_1

    .line 98
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Attribute target or at least one nested target is required."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 102
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "ant.file"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Ant;->setAntfile(Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->inheritAll:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Ant;->setInheritAll(Z)V

    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->inheritRefs:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Ant;->setInheritRefs(Z)V

    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Ant;->execute()V

    .line 106
    return-void
.end method

.method public handleErrorFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleErrorFlush(Ljava/lang/String;)V

    .line 254
    :goto_0
    return-void

    .line 252
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleErrorOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleErrorOutput(Ljava/lang/String;)V

    .line 238
    :goto_0
    return-void

    .line 236
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleErrorOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleFlush(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 216
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleFlush(Ljava/lang/String;)V

    .line 221
    :goto_0
    return-void

    .line 219
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleFlush(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public handleInput([BII)I
    .locals 1
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 201
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Ant;->handleInput([BII)I

    move-result v0

    .line 204
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lorg/apache/tools/ant/Task;->handleInput([BII)I

    move-result v0

    goto :goto_0
.end method

.method public handleOutput(Ljava/lang/String;)V
    .locals 1
    .param p1, "output"    # Ljava/lang/String;

    .prologue
    .line 178
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-eqz v0, :cond_0

    .line 179
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->handleOutput(Ljava/lang/String;)V

    .line 183
    :goto_0
    return-void

    .line 181
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->handleOutput(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public init()V
    .locals 1

    .prologue
    .line 84
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Ant;-><init>(Lorg/apache/tools/ant/Task;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Ant;->init()V

    .line 86
    return-void
.end method

.method public setInheritAll(Z)V
    .locals 0
    .param p1, "inherit"    # Z

    .prologue
    .line 67
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->inheritAll:Z

    .line 68
    return-void
.end method

.method public setInheritRefs(Z)V
    .locals 0
    .param p1, "inheritRefs"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->inheritRefs:Z

    .line 77
    return-void
.end method

.method public setTarget(Ljava/lang/String;)V
    .locals 1
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    if-nez v0, :cond_0

    .line 150
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CallTarget;->init()V

    .line 152
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->callee:Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Ant;->setTarget(Ljava/lang/String;)V

    .line 153
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/CallTarget;->targetSet:Z

    .line 154
    return-void
.end method
