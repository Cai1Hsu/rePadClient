.class public Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;
.super Lorg/apache/tools/ant/types/DataType;
.source "ExtensionSet.java"


# instance fields
.field private final extensions:Ljava/util/ArrayList;

.field private final extensionsFilesets:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensions:Ljava/util/ArrayList;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensionsFilesets:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addExtension(Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;)V
    .locals 1
    .param p1, "extensionAdapter"    # Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 57
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->setChecked(Z)V

    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fileSet"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 83
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->setChecked(Z)V

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensionsFilesets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    return-void
.end method

.method public addLibfileset(Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;)V
    .locals 1
    .param p1, "fileSet"    # Lorg/apache/tools/ant/taskdefs/optional/extension/LibFileSet;

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 70
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->setChecked(Z)V

    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensionsFilesets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 72
    return-void
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 125
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 140
    :goto_0
    monitor-exit p0

    return-void

    .line 128
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 129
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 125
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 131
    :cond_1
    :try_start_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 132
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter;

    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 135
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensionsFilesets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 136
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_2

    .line 138
    :cond_3
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "reference"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensionsFilesets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 118
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 120
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 121
    return-void
.end method

.method public toExtensions(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .locals 2
    .param p1, "proj"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 97
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->toExtensions(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v1

    .line 102
    :goto_0
    return-object v1

    .line 99
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->dieOnCircularReference()V

    .line 100
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensions:Ljava/util/ArrayList;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->toExtensions(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    .line 101
    .local v0, "extensionsList":Ljava/util/ArrayList;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->extensionsFilesets:Ljava/util/ArrayList;

    invoke-static {p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil;->extractExtensions(Lorg/apache/tools/ant/Project;Ljava/util/List;Ljava/util/List;)V

    .line 102
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "ExtensionSet"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionSet;->toExtensions(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
