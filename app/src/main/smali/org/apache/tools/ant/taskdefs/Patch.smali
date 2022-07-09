.class public Lorg/apache/tools/ant/taskdefs/Patch;
.super Lorg/apache/tools/ant/Task;
.source "Patch.java"


# static fields
.field private static final PATCH:Ljava/lang/String; = "patch"


# instance fields
.field private cmd:Lorg/apache/tools/ant/types/Commandline;

.field private directory:Ljava/io/File;

.field private failOnError:Z

.field private havePatchfile:Z

.field private originalFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 40
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Patch;->havePatchfile:Z

    .line 41
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    .line 46
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Patch;->failOnError:Z

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 168
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->havePatchfile:Z

    if-nez v5, :cond_0

    .line 169
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "patchfile argument is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 172
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/Commandline;

    .line 173
    .local v4, "toExecute":Lorg/apache/tools/ant/types/Commandline;
    const-string/jumbo v5, "patch"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 175
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->originalFile:Ljava/io/File;

    if-eqz v5, :cond_1

    .line 176
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Patch;->originalFile:Ljava/io/File;

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 179
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v5, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v6, 0x2

    const/4 v7, 0x1

    invoke-direct {v5, p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    const/4 v6, 0x0

    invoke-direct {v1, v5, v6}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 182
    .local v1, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 184
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    if-eqz v5, :cond_4

    .line 185
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 186
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 198
    :goto_0
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Commandline;->describeCommand()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Patch;->log(Ljava/lang/String;I)V

    .line 200
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v3

    .line 201
    .local v3, "returncode":I
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 202
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "\'patch\' failed with exit code "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 204
    .local v2, "msg":Ljava/lang/String;
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->failOnError:Z

    if-eqz v5, :cond_5

    .line 205
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 210
    .end local v2    # "msg":Ljava/lang/String;
    .end local v3    # "returncode":I
    :catch_0
    move-exception v0

    .line 211
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v5, v0, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 187
    .end local v0    # "e":Ljava/io/IOException;
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_3

    .line 188
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " is not a directory."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 191
    :cond_3
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "directory "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " doesn\'t exist"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 195
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    goto/16 :goto_0

    .line 207
    .restart local v2    # "msg":Ljava/lang/String;
    .restart local v3    # "returncode":I
    :cond_5
    const/4 v5, 0x0

    :try_start_1
    invoke-virtual {p0, v2, v5}, Lorg/apache/tools/ant/taskdefs/Patch;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 213
    .end local v2    # "msg":Ljava/lang/String;
    :cond_6
    return-void
.end method

.method public setBackups(Z)V
    .locals 2
    .param p1, "backups"    # Z

    .prologue
    .line 89
    if-eqz p1, :cond_0

    .line 90
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-b"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 92
    :cond_0
    return-void
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 64
    if-eqz p1, :cond_0

    .line 65
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-o"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 68
    :cond_0
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "directory"    # Ljava/io/File;

    .prologue
    .line 147
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Patch;->directory:Ljava/io/File;

    .line 148
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 158
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Patch;->failOnError:Z

    .line 159
    return-void
.end method

.method public setIgnorewhitespace(Z)V
    .locals 2
    .param p1, "ignore"    # Z

    .prologue
    .line 99
    if-eqz p1, :cond_0

    .line 100
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-l"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 102
    :cond_0
    return-void
.end method

.method public setOriginalfile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Patch;->originalFile:Ljava/io/File;

    .line 55
    return-void
.end method

.method public setPatchfile(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 75
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 76
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "patchfile "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 79
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-i"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 81
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->havePatchfile:Z

    .line 82
    return-void
.end method

.method public setQuiet(Z)V
    .locals 2
    .param p1, "q"    # Z

    .prologue
    .line 124
    if-eqz p1, :cond_0

    .line 125
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-s"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 127
    :cond_0
    return-void
.end method

.method public setReverse(Z)V
    .locals 2
    .param p1, "r"    # Z

    .prologue
    .line 135
    if-eqz p1, :cond_0

    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-R"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 138
    :cond_0
    return-void
.end method

.method public setStrip(I)V
    .locals 3
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 113
    if-gez p1, :cond_0

    .line 114
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "strip has to be >= 0"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Patch;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 116
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Patch;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "-p"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 117
    return-void
.end method
