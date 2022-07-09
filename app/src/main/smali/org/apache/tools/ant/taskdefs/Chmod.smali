.class public Lorg/apache/tools/ant/taskdefs/Chmod;
.super Lorg/apache/tools/ant/taskdefs/ExecuteOn;
.source "Chmod.java"


# instance fields
.field private defaultSet:Lorg/apache/tools/ant/types/FileSet;

.field private defaultSetDefined:Z

.field private havePerm:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;-><init>()V

    .line 41
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    .line 42
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 43
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->havePerm:Z

    .line 49
    const-string/jumbo v0, "chmod"

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setExecutable(Ljava/lang/String;)V

    .line 50
    invoke-super {p0, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setParallel(Z)V

    .line 51
    invoke-super {p0, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setSkipEmptyFilesets(Z)V

    .line 52
    return-void
.end method


# virtual methods
.method protected checkConfiguration()V
    .locals 3

    .prologue
    .line 157
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->havePerm:Z

    if-nez v0, :cond_0

    .line 158
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Required attribute perm not set in chmod"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 162
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 163
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Chmod;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 165
    :cond_1
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->checkConfiguration()V

    .line 166
    return-void
.end method

.method public createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 107
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 98
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createPatternSet()Lorg/apache/tools/ant/types/PatternSet;
    .locals 1

    .prologue
    .line 115
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createPatternSet()Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 179
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v3

    if-nez v3, :cond_3

    .line 181
    :cond_0
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->execute()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 184
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->filesets:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v3, v4}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 203
    :cond_1
    :goto_0
    return-void

    .line 183
    :catchall_0
    move-exception v3

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 184
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->filesets:Ljava/util/Vector;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v4, v5}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    .line 183
    :cond_2
    throw v3

    .line 187
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->isValidOs()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 189
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->prepareExec()Lorg/apache/tools/ant/taskdefs/Execute;

    move-result-object v2

    .line 190
    .local v2, "execute":Lorg/apache/tools/ant/taskdefs/Execute;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->cmdl:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Commandline;

    .line 191
    .local v0, "cloned":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 194
    :try_start_1
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 195
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Chmod;->runExecute(Lorg/apache/tools/ant/taskdefs/Execute;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 200
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->logFlush()V

    goto :goto_0

    .line 196
    :catch_0
    move-exception v1

    .line 197
    .local v1, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Execute failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v1, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 200
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->logFlush()V

    throw v3
.end method

.method protected isValidOs()Z
    .locals 1

    .prologue
    .line 257
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getOs()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getOsFamily()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "unix"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->isValidOs()Z

    move-result v0

    goto :goto_0
.end method

.method public setAddsourcefile(Z)V
    .locals 3
    .param p1, "b"    # Z

    .prologue
    .line 247
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the addsourcefile attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 3
    .param p1, "cmdl"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 225
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the command attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setDefaultexcludes(Z)V
    .locals 1
    .param p1, "useDefaultExcludes"    # Z

    .prologue
    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setDefaultexcludes(Z)V

    .line 151
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 81
    return-void
.end method

.method public setExcludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "excludes"    # Ljava/lang/String;

    .prologue
    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setExcludes(Ljava/lang/String;)V

    .line 139
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/String;

    .prologue
    .line 213
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the executable attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 70
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 71
    .local v0, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setFile(Ljava/io/File;)V

    .line 72
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Chmod;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 73
    return-void
.end method

.method public setIncludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "includes"    # Ljava/lang/String;

    .prologue
    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSetDefined:Z

    .line 127
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setIncludes(Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method public setPerm(Ljava/lang/String;)V
    .locals 1
    .param p1, "perm"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->havePerm:Z

    .line 90
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 61
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 62
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Chmod;->defaultSet:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 63
    return-void
.end method

.method public setSkipEmptyFilesets(Z)V
    .locals 3
    .param p1, "skip"    # Z

    .prologue
    .line 236
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the skipemptyfileset attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Chmod;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method
