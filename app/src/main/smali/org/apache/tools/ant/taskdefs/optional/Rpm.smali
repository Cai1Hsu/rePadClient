.class public Lorg/apache/tools/ant/taskdefs/optional/Rpm;
.super Lorg/apache/tools/ant/Task;
.source "Rpm.java"


# static fields
.field private static final PATH1:Ljava/lang/String; = "PATH"

.field private static final PATH2:Ljava/lang/String; = "Path"

.field private static final PATH3:Ljava/lang/String; = "path"


# instance fields
.field private cleanBuildDir:Z

.field private command:Ljava/lang/String;

.field private error:Ljava/io/File;

.field private failOnError:Z

.field private output:Ljava/io/File;

.field private quiet:Z

.field private removeSource:Z

.field private removeSpec:Z

.field private rpmBuildCommand:Ljava/lang/String;

.field private specFile:Ljava/lang/String;

.field private topDir:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 65
    const-string/jumbo v0, "-bb"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->command:Ljava/lang/String;

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->rpmBuildCommand:Ljava/lang/String;

    .line 76
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->cleanBuildDir:Z

    .line 81
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->removeSpec:Z

    .line 86
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->removeSource:Z

    .line 101
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->failOnError:Z

    .line 107
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->quiet:Z

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v14, 0x2

    const/4 v13, 0x1

    const/4 v12, 0x4

    .line 116
    new-instance v8, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v8}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 118
    .local v8, "toExecute":Lorg/apache/tools/ant/types/Commandline;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->rpmBuildCommand:Ljava/lang/String;

    if-nez v9, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->guessRpmBuildCommand()Ljava/lang/String;

    move-result-object v9

    :goto_0
    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 121
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->topDir:Ljava/io/File;

    if-eqz v9, :cond_0

    .line 122
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    const-string/jumbo v10, "--define"

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "_topdir "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->topDir:Ljava/io/File;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 126
    :cond_0
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->command:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 128
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->cleanBuildDir:Z

    if-eqz v9, :cond_1

    .line 129
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    const-string/jumbo v10, "--clean"

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 131
    :cond_1
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->removeSpec:Z

    if-eqz v9, :cond_2

    .line 132
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    const-string/jumbo v10, "--rmspec"

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 134
    :cond_2
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->removeSource:Z

    if-eqz v9, :cond_3

    .line 135
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    const-string/jumbo v10, "--rmsource"

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 138
    :cond_3
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "SPECS/"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->specFile:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 140
    const/4 v7, 0x0

    .line 141
    .local v7, "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    const/4 v5, 0x0

    .line 142
    .local v5, "outputstream":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 143
    .local v2, "errorstream":Ljava/io/OutputStream;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->error:Ljava/io/File;

    if-nez v9, :cond_6

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->output:Ljava/io/File;

    if-nez v9, :cond_6

    .line 144
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->quiet:Z

    if-nez v9, :cond_5

    .line 145
    new-instance v7, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    .end local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    invoke-direct {v7, p0, v14, v13}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    .line 181
    .restart local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    :goto_1
    invoke-virtual {p0, v8, v7}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getExecute(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)Lorg/apache/tools/ant/taskdefs/Execute;

    move-result-object v3

    .line 183
    .local v3, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :try_start_0
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Building the RPM based on the "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->specFile:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " file"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->log(Ljava/lang/String;)V

    .line 184
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v6

    .line 185
    .local v6, "returncode":I
    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 186
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "\'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' failed with exit code "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 188
    .local v4, "msg":Ljava/lang/String;
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->failOnError:Z

    if-eqz v9, :cond_b

    .line 189
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 193
    .end local v4    # "msg":Ljava/lang/String;
    .end local v6    # "returncode":I
    :catch_0
    move-exception v1

    .line 194
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v9, v1, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 196
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 197
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v9

    .line 118
    .end local v2    # "errorstream":Ljava/io/OutputStream;
    .end local v3    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .end local v5    # "outputstream":Ljava/io/OutputStream;
    .end local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    :cond_4
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->rpmBuildCommand:Ljava/lang/String;

    goto/16 :goto_0

    .line 148
    .restart local v2    # "errorstream":Ljava/io/OutputStream;
    .restart local v5    # "outputstream":Ljava/io/OutputStream;
    .restart local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    :cond_5
    new-instance v7, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    .end local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    invoke-direct {v7, p0, v12, v12}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    .restart local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    goto :goto_1

    .line 152
    :cond_6
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->output:Ljava/io/File;

    if-eqz v9, :cond_7

    .line 154
    :try_start_2
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v9, Ljava/io/FileOutputStream;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->output:Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 156
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    new-instance v5, Ljava/io/PrintStream;

    .end local v5    # "outputstream":Ljava/io/OutputStream;
    invoke-direct {v5, v0}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 165
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v5    # "outputstream":Ljava/io/OutputStream;
    :goto_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->error:Ljava/io/File;

    if-eqz v9, :cond_9

    .line 167
    :try_start_3
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v9, Ljava/io/FileOutputStream;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->error:Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v9}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 169
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    new-instance v2, Ljava/io/PrintStream;

    .end local v2    # "errorstream":Ljava/io/OutputStream;
    invoke-direct {v2, v0}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 178
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v2    # "errorstream":Ljava/io/OutputStream;
    :goto_3
    new-instance v7, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    .end local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    invoke-direct {v7, v5, v2}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    .restart local v7    # "streamhandler":Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;
    goto/16 :goto_1

    .line 157
    .end local v5    # "outputstream":Ljava/io/OutputStream;
    :catch_1
    move-exception v1

    .line 158
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v9, v1, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 160
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v5    # "outputstream":Ljava/io/OutputStream;
    :cond_7
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->quiet:Z

    if-nez v9, :cond_8

    .line 161
    new-instance v5, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    .end local v5    # "outputstream":Ljava/io/OutputStream;
    invoke-direct {v5, p0, v14}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .restart local v5    # "outputstream":Ljava/io/OutputStream;
    goto :goto_2

    .line 163
    :cond_8
    new-instance v5, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    .end local v5    # "outputstream":Ljava/io/OutputStream;
    invoke-direct {v5, p0, v12}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .restart local v5    # "outputstream":Ljava/io/OutputStream;
    goto :goto_2

    .line 170
    .end local v2    # "errorstream":Ljava/io/OutputStream;
    :catch_2
    move-exception v1

    .line 171
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v9, v1, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 173
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "errorstream":Ljava/io/OutputStream;
    :cond_9
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->quiet:Z

    if-nez v9, :cond_a

    .line 174
    new-instance v2, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    .end local v2    # "errorstream":Ljava/io/OutputStream;
    invoke-direct {v2, p0, v13}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .restart local v2    # "errorstream":Ljava/io/OutputStream;
    goto :goto_3

    .line 176
    :cond_a
    new-instance v2, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    .end local v2    # "errorstream":Ljava/io/OutputStream;
    invoke-direct {v2, p0, v12}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .restart local v2    # "errorstream":Ljava/io/OutputStream;
    goto :goto_3

    .line 191
    .restart local v3    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .restart local v4    # "msg":Ljava/lang/String;
    .restart local v6    # "returncode":I
    :cond_b
    const/4 v9, 0x0

    :try_start_4
    invoke-virtual {p0, v4, v9}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->log(Ljava/lang/String;I)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 196
    .end local v4    # "msg":Ljava/lang/String;
    :cond_c
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 197
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 199
    return-void
.end method

.method protected getExecute(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)Lorg/apache/tools/ant/taskdefs/Execute;
    .locals 2
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "streamhandler"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .prologue
    .line 354
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Execute;

    const/4 v1, 0x0

    invoke-direct {v0, p2, v1}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;Lorg/apache/tools/ant/taskdefs/ExecuteWatchdog;)V

    .line 356
    .local v0, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 357
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->topDir:Ljava/io/File;

    if-nez v1, :cond_0

    .line 358
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->topDir:Ljava/io/File;

    .line 360
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->topDir:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 362
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 363
    return-object v0
.end method

.method protected guessRpmBuildCommand()Ljava/lang/String;
    .locals 9

    .prologue
    .line 320
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironmentVariables()Ljava/util/Map;

    move-result-object v0

    .line 321
    .local v0, "env":Ljava/util/Map;
    const-string/jumbo v6, "PATH"

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 322
    .local v5, "path":Ljava/lang/String;
    if-nez v5, :cond_0

    .line 323
    const-string/jumbo v6, "Path"

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "path":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 324
    .restart local v5    # "path":Ljava/lang/String;
    if-nez v5, :cond_0

    .line 325
    const-string/jumbo v6, "path"

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "path":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 329
    .restart local v5    # "path":Ljava/lang/String;
    :cond_0
    if-eqz v5, :cond_3

    .line 330
    new-instance v3, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-direct {v3, v6, v5}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 331
    .local v3, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v4

    .line 332
    .local v4, "pElements":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v4

    if-ge v2, v6, :cond_3

    .line 333
    new-instance v1, Ljava/io/File;

    aget-object v7, v4, v2

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "rpmbuild"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v6, "dos"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string/jumbo v6, ".exe"

    :goto_1
    invoke-virtual {v8, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v7, v6}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->canRead()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 337
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    .line 342
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "p":Lorg/apache/tools/ant/types/Path;
    .end local v4    # "pElements":[Ljava/lang/String;
    :goto_2
    return-object v6

    .line 333
    .restart local v2    # "i":I
    .restart local v3    # "p":Lorg/apache/tools/ant/types/Path;
    .restart local v4    # "pElements":[Ljava/lang/String;
    :cond_1
    const-string/jumbo v6, ""

    goto :goto_1

    .line 332
    .restart local v1    # "f":Ljava/io/File;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 342
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "i":I
    .end local v3    # "p":Lorg/apache/tools/ant/types/Path;
    .end local v4    # "pElements":[Ljava/lang/String;
    :cond_3
    const-string/jumbo v6, "rpm"

    goto :goto_2
.end method

.method public setCleanBuildDir(Z)V
    .locals 0
    .param p1, "cbd"    # Z

    .prologue
    .line 239
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->cleanBuildDir:Z

    .line 240
    return-void
.end method

.method public setCommand(Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 219
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->command:Ljava/lang/String;

    .line 220
    return-void
.end method

.method public setError(Ljava/io/File;)V
    .locals 0
    .param p1, "error"    # Ljava/io/File;

    .prologue
    .line 273
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->error:Ljava/io/File;

    .line 274
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 296
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->failOnError:Z

    .line 297
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 0
    .param p1, "output"    # Ljava/io/File;

    .prologue
    .line 265
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->output:Ljava/io/File;

    .line 266
    return-void
.end method

.method public setQuiet(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 307
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->quiet:Z

    .line 308
    return-void
.end method

.method public setRemoveSource(Z)V
    .locals 0
    .param p1, "rs"    # Z

    .prologue
    .line 257
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->removeSource:Z

    .line 258
    return-void
.end method

.method public setRemoveSpec(Z)V
    .locals 0
    .param p1, "rs"    # Z

    .prologue
    .line 247
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->removeSpec:Z

    .line 248
    return-void
.end method

.method public setRpmBuildCommand(Ljava/lang/String;)V
    .locals 0
    .param p1, "c"    # Ljava/lang/String;

    .prologue
    .line 284
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->rpmBuildCommand:Ljava/lang/String;

    .line 285
    return-void
.end method

.method public setSpecFile(Ljava/lang/String;)V
    .locals 3
    .param p1, "sf"    # Ljava/lang/String;

    .prologue
    .line 227
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 228
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must specify a spec file"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 230
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->specFile:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public setTopDir(Ljava/io/File;)V
    .locals 0
    .param p1, "td"    # Ljava/io/File;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Rpm;->topDir:Ljava/io/File;

    .line 211
    return-void
.end method
