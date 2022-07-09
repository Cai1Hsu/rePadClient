.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;
.super Lorg/apache/tools/ant/Task;
.source "BorlandGenerateClient.java"


# static fields
.field static final FORK_MODE:Ljava/lang/String; = "fork"

.field static final JAVA_MODE:Ljava/lang/String; = "java"


# instance fields
.field classpath:Lorg/apache/tools/ant/types/Path;

.field clientjarfile:Ljava/io/File;

.field debug:Z

.field ejbjarfile:Ljava/io/File;

.field mode:Ljava/lang/String;

.field version:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->debug:Z

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    .line 52
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    .line 58
    const-string/jumbo v0, "fork"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->mode:Ljava/lang/String;

    .line 61
    const/4 v0, 0x4

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    return-void
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 122
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 124
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 145
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "invalid ejb jar file."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 148
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 149
    :cond_2
    const-string/jumbo v2, "invalid or missing client jar file."

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;I)V

    .line 150
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "ejbjarname":Ljava/lang/String;
    const/4 v2, 0x0

    const-string/jumbo v3, "."

    invoke-virtual {v1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "clientname":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "client.jar"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 154
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    .line 157
    .end local v0    # "clientname":Ljava/lang/String;
    .end local v1    # "ejbjarname":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->mode:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 158
    const-string/jumbo v2, "mode is null default mode  is java"

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;)V

    .line 159
    const-string/jumbo v2, "java"

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->setMode(Ljava/lang/String;)V

    .line 162
    :cond_4
    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    const/4 v3, 0x5

    if-eq v2, v3, :cond_5

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    const/4 v3, 0x4

    if-eq v2, v3, :cond_5

    .line 164
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "version "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " is not supported"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 168
    :cond_5
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "client jar file is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;)V

    .line 170
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->mode:Ljava/lang/String;

    const-string/jumbo v3, "fork"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 171
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->executeFork()V

    .line 175
    :goto_0
    return-void

    .line 173
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->executeJava()V

    goto :goto_0
.end method

.method protected executeFork()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 230
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 231
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->executeForkV4()V

    .line 233
    :cond_0
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_1

    .line 234
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->executeForkV5()V

    .line 236
    :cond_1
    return-void
.end method

.method protected executeForkV4()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 245
    :try_start_0
    const-string/jumbo v3, "mode : fork 4"

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;I)V

    .line 247
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 249
    .local v1, "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v4, "."

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setDir(Ljava/io/File;)V

    .line 250
    const-string/jumbo v3, "iastool"

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 251
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "generateclient"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 252
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->debug:Z

    if-eqz v3, :cond_0

    .line 253
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-trace"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 256
    :cond_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-short"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-jarfile"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 261
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-single"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 262
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-clientjarfile"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 263
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 265
    const-string/jumbo v3, "Calling iastool"

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;I)V

    .line 266
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    return-void

    .line 267
    .end local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :catch_0
    move-exception v0

    .line 269
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Exception while calling generateclient Details: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 271
    .local v2, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected executeForkV5()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 282
    :try_start_0
    const-string/jumbo v3, "mode : fork 5"

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;I)V

    .line 283
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 285
    .local v1, "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v4, "."

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setDir(Ljava/io/File;)V

    .line 287
    const-string/jumbo v3, "iastool"

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 288
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->debug:Z

    if-eqz v3, :cond_0

    .line 289
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-debug"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 291
    :cond_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-genclient"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 292
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-jars"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 294
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 296
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-target"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 297
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 299
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-cp"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 300
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 301
    const-string/jumbo v3, "Calling iastool"

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;I)V

    .line 302
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    return-void

    .line 303
    .end local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/ExecTask;
    :catch_0
    move-exception v0

    .line 305
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Exception while calling generateclient Details: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 307
    .local v2, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected executeJava()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 183
    :try_start_0
    iget v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_0

    .line 184
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "java mode is supported only for previous version <=4"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 218
    :catch_0
    move-exception v0

    .line 220
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Exception while calling generateclient Details: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 221
    .local v2, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 188
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "msg":Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string/jumbo v3, "mode : java"

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;)V

    .line 190
    const/4 v1, 0x0

    .line 191
    .local v1, "execTask":Lorg/apache/tools/ant/taskdefs/Java;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Java;

    .end local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/Java;
    invoke-direct {v1, p0}, Lorg/apache/tools/ant/taskdefs/Java;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 193
    .restart local v1    # "execTask":Lorg/apache/tools/ant/taskdefs/Java;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v4, "."

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->setDir(Ljava/io/File;)V

    .line 194
    const-string/jumbo v3, "com.inprise.server.commandline.EJBUtilities"

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->setClassname(Ljava/lang/String;)V

    .line 198
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 200
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Java;->setFork(Z)V

    .line 201
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "generateclient"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 202
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->debug:Z

    if-eqz v3, :cond_1

    .line 203
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-trace"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 206
    :cond_1
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-short"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-jarfile"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 209
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 211
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-single"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 212
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-clientjarfile"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 215
    const-string/jumbo v3, "Calling EJBUtilities"

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->log(Ljava/lang/String;I)V

    .line 216
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Java;->execute()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 223
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 110
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 114
    :goto_0
    return-void

    .line 112
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 133
    return-void
.end method

.method public setClientjar(Ljava/io/File;)V
    .locals 0
    .param p1, "clientjar"    # Ljava/io/File;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->clientjarfile:Ljava/io/File;

    .line 102
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 85
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->debug:Z

    .line 86
    return-void
.end method

.method public setEjbjar(Ljava/io/File;)V
    .locals 0
    .param p1, "ejbfile"    # Ljava/io/File;

    .prologue
    .line 93
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->ejbjarfile:Ljava/io/File;

    .line 94
    return-void
.end method

.method public setMode(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->mode:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setVersion(I)V
    .locals 0
    .param p1, "version"    # I

    .prologue
    .line 69
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/BorlandGenerateClient;->version:I

    .line 70
    return-void
.end method
