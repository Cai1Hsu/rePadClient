.class public final Lorg/apache/tools/ant/types/AntFilterReader;
.super Lorg/apache/tools/ant/types/DataType;
.source "AntFilterReader.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private className:Ljava/lang/String;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private final parameters:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 34
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->parameters:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public addParam(Lorg/apache/tools/ant/types/Parameter;)V
    .locals 1
    .param p1, "param"    # Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 72
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->parameters:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 73
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 99
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 100
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 102
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AntFilterReader;->setChecked(Z)V

    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 165
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    :goto_0
    monitor-exit p0

    return-void

    .line 168
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 169
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 165
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 171
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_2

    .line 172
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/AntFilterReader;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 174
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AntFilterReader;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 57
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/AntFilterReader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AntFilterReader;->getClassName()Ljava/lang/String;

    move-result-object v0

    .line 60
    :goto_0
    return-object v0

    .line 59
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->dieOnCircularReference()V

    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->className:Ljava/lang/String;

    goto :goto_0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 111
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/AntFilterReader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AntFilterReader;->getClasspath()Lorg/apache/tools/ant/types/Path;

    .line 114
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->dieOnCircularReference()V

    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getParams()[Lorg/apache/tools/ant/types/Parameter;
    .locals 2

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/AntFilterReader;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/AntFilterReader;->getParams()[Lorg/apache/tools/ant/types/Parameter;

    .line 139
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->dieOnCircularReference()V

    .line 140
    iget-object v1, p0, Lorg/apache/tools/ant/types/AntFilterReader;->parameters:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lorg/apache/tools/ant/types/Parameter;

    .line 141
    .local v0, "params":[Lorg/apache/tools/ant/types/Parameter;
    iget-object v1, p0, Lorg/apache/tools/ant/types/AntFilterReader;->parameters:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 142
    return-object v0
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 1
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 47
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/AntFilterReader;->className:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 83
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 84
    iput-object p1, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 88
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AntFilterReader;->setChecked(Z)V

    .line 89
    return-void

    .line 86
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 127
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 128
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 156
    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->parameters:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->className:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/AntFilterReader;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_1

    .line 158
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AntFilterReader;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 160
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 161
    return-void
.end method
