.class public Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
.super Lorg/apache/tools/ant/AntTypeDefinition;
.source "PreSetDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/PreSetDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreSetDefinition"
.end annotation


# instance fields
.field private element:Lorg/apache/tools/ant/UnknownElement;

.field private parent:Lorg/apache/tools/ant/AntTypeDefinition;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/UnknownElement;)V
    .locals 2
    .param p1, "parent"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "el"    # Lorg/apache/tools/ant/UnknownElement;

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 118
    instance-of v1, p1, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 119
    check-cast v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    .line 120
    .local v0, "p":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {p2, v1}, Lorg/apache/tools/ant/UnknownElement;->applyPreSet(Lorg/apache/tools/ant/UnknownElement;)V

    .line 121
    iget-object p1, v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    .line 123
    .end local v0    # "p":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    .line 124
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    .line 125
    return-void
.end method


# virtual methods
.method public checkClass(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 213
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->checkClass(Lorg/apache/tools/ant/Project;)V

    .line 214
    return-void
.end method

.method public create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 244
    return-object p0
.end method

.method public createObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->create(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getClassName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getPreSets()Lorg/apache/tools/ant/UnknownElement;
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    return-object v0
.end method

.method public getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z
    .locals 2
    .param p1, "other"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 255
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v1, v0, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->sameDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    check-cast p1, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    .end local p1    # "other":Lorg/apache/tools/ant/AntTypeDefinition;
    iget-object v1, p1, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->similar(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAdaptToClass(Ljava/lang/Class;)V
    .locals 2
    .param p1, "adaptToClass"    # Ljava/lang/Class;

    .prologue
    .line 168
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setAdapterClass(Ljava/lang/Class;)V
    .locals 2
    .param p1, "adapterClass"    # Ljava/lang/Class;

    .prologue
    .line 159
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setClass(Ljava/lang/Class;)V
    .locals 2
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 133
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 2
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 178
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 2
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 142
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Not supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public similarDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z
    .locals 2
    .param p1, "other"    # Lorg/apache/tools/ant/AntTypeDefinition;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 269
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->parent:Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-virtual {v1, v0, p2}, Lorg/apache/tools/ant/AntTypeDefinition;->similarDefinition(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/Project;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    check-cast p1, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    .end local p1    # "other":Lorg/apache/tools/ant/AntTypeDefinition;
    iget-object v1, p1, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->element:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/UnknownElement;->similar(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
