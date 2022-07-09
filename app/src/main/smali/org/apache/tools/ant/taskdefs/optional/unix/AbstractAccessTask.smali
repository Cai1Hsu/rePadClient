.class public abstract Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;
.super Lorg/apache/tools/ant/taskdefs/ExecuteOn;
.source "AbstractAccessTask.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;-><init>()V

    .line 52
    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setParallel(Z)V

    .line 53
    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setSkipEmptyFilesets(Z)V

    .line 54
    return-void
.end method


# virtual methods
.method protected isValidOs()Z
    .locals 1

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getOs()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getOsFamily()Ljava/lang/String;

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
    .line 97
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the addsourcefile attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setCommand(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 3
    .param p1, "cmdl"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 73
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the command attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 61
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 62
    .local v0, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setFile(Ljava/io/File;)V

    .line 63
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 64
    return-void
.end method

.method public setSkipEmptyFilesets(Z)V
    .locals 3
    .param p1, "skip"    # Z

    .prologue
    .line 85
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "skipemptyfileset attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/AbstractAccessTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method
