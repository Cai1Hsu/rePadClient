.class public Lorg/apache/tools/ant/taskdefs/Exec;
.super Lorg/apache/tools/ant/Task;
.source "Exec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    }
.end annotation


# instance fields
.field private command:Ljava/lang/String;

.field private dir:Ljava/io/File;

.field private failOnError:Z

.field protected fos:Ljava/io/PrintWriter;

.field private os:Ljava/lang/String;

.field private out:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 61
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->fos:Ljava/io/PrintWriter;

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->failOnError:Z

    .line 62
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "As of Ant 1.2 released in October 2000, the Exec class"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 64
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "is considered to be dead code by the Ant developers and is unmaintained."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 66
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "Don\'t use it!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 67
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->command:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Exec;->run(Ljava/lang/String;)I

    .line 75
    return-void
.end method

.method protected logFlush()V
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->fos:Ljava/io/PrintWriter;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->fos:Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/io/PrintWriter;->close()V

    .line 238
    :cond_0
    return-void
.end method

.method protected outputLog(Ljava/lang/String;I)V
    .locals 1
    .param p1, "line"    # Ljava/lang/String;
    .param p2, "messageLevel"    # I

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->fos:Ljava/io/PrintWriter;

    if-nez v0, :cond_0

    .line 225
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Exec;->log(Ljava/lang/String;I)V

    .line 229
    :goto_0
    return-void

    .line 227
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->fos:Ljava/io/PrintWriter;

    invoke-virtual {v0, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected run(Ljava/lang/String;)I
    .locals 12
    .param p1, "command"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v11, 0x3

    .line 85
    const/4 v2, -0x1

    .line 88
    .local v2, "err":I
    const-string/jumbo v9, "os.name"

    invoke-static {v9}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 89
    .local v6, "myos":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Myos = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v11}, Lorg/apache/tools/ant/taskdefs/Exec;->log(Ljava/lang/String;I)V

    .line 90
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Exec;->os:Ljava/lang/String;

    if-eqz v9, :cond_0

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Exec;->os:Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-gez v9, :cond_0

    .line 92
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Not found in "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Exec;->os:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v11}, Lorg/apache/tools/ant/taskdefs/Exec;->log(Ljava/lang/String;I)V

    .line 173
    :goto_0
    return v8

    .line 97
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    if-nez v8, :cond_1

    .line 98
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v8

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    .line 101
    :cond_1
    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "windows"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-ltz v8, :cond_6

    .line 102
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    const-string/jumbo v10, "."

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 103
    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "nt"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-ltz v8, :cond_4

    .line 104
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "cmd /c cd "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " && "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 129
    :cond_2
    :goto_1
    const/4 v8, 0x3

    :try_start_0
    invoke-virtual {p0, p1, v8}, Lorg/apache/tools/ant/taskdefs/Exec;->log(Ljava/lang/String;I)V

    .line 132
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v7

    .line 134
    .local v7, "proc":Ljava/lang/Process;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Exec;->out:Ljava/lang/String;

    if-eqz v8, :cond_3

    .line 135
    new-instance v8, Ljava/io/PrintWriter;

    new-instance v9, Ljava/io/FileWriter;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Exec;->out:Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v8, v9}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/Exec;->fos:Ljava/io/PrintWriter;

    .line 136
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Output redirected to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Exec;->out:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/Exec;->log(Ljava/lang/String;I)V

    .line 140
    :cond_3
    new-instance v4, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;

    invoke-virtual {v7}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    const/4 v9, 0x2

    invoke-direct {v4, p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;-><init>(Lorg/apache/tools/ant/taskdefs/Exec;Ljava/io/InputStream;I)V

    .line 142
    .local v4, "inputPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;

    invoke-virtual {v7}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v8

    const/4 v9, 0x1

    invoke-direct {v3, p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;-><init>(Lorg/apache/tools/ant/taskdefs/Exec;Ljava/io/InputStream;I)V

    .line 146
    .local v3, "errorPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->start()V

    .line 147
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->start()V

    .line 150
    invoke-virtual {v7}, Ljava/lang/Process;->waitFor()I

    .line 151
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->join()V

    .line 152
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;->join()V

    .line 153
    invoke-virtual {v7}, Ljava/lang/Process;->destroy()V

    .line 156
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->logFlush()V

    .line 159
    invoke-virtual {v7}, Ljava/lang/Process;->exitValue()I

    move-result v2

    .line 160
    if-eqz v2, :cond_9

    .line 161
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/Exec;->failOnError:Z

    if-eqz v8, :cond_8

    .line 162
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Exec returned: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v8
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    .line 167
    .end local v3    # "errorPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    .end local v4    # "inputPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    .end local v7    # "proc":Ljava/lang/Process;
    :catch_0
    move-exception v5

    .line 168
    .local v5, "ioe":Ljava/io/IOException;
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Error exec: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v5, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v8

    .line 106
    .end local v5    # "ioe":Ljava/io/IOException;
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    const-string/jumbo v9, "ant.home"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "ant":Ljava/lang/String;
    if-nez v0, :cond_5

    .line 108
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "Property \'ant.home\' not found"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v8

    .line 112
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "/bin/antRun.bat"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    .line 113
    .local v1, "antRun":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_1

    .line 117
    .end local v0    # "ant":Ljava/lang/String;
    .end local v1    # "antRun":Ljava/lang/String;
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    const-string/jumbo v9, "ant.home"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    .restart local v0    # "ant":Ljava/lang/String;
    if-nez v0, :cond_7

    .line 119
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "Property \'ant.home\' not found"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v8

    .line 122
    :cond_7
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "/bin/antRun"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    .restart local v1    # "antRun":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_1

    .line 164
    .end local v0    # "ant":Ljava/lang/String;
    .end local v1    # "antRun":Ljava/lang/String;
    .restart local v3    # "errorPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    .restart local v4    # "inputPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    .restart local v7    # "proc":Ljava/lang/Process;
    :cond_8
    :try_start_1
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Result: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/Exec;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v3    # "errorPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    .end local v4    # "inputPumper":Lorg/apache/tools/ant/taskdefs/Exec$StreamPumper;
    .end local v7    # "proc":Ljava/lang/Process;
    :cond_9
    :goto_2
    move v8, v2

    .line 173
    goto/16 :goto_0

    .line 169
    :catch_1
    move-exception v8

    goto :goto_2
.end method

.method public setCommand(Ljava/lang/String;)V
    .locals 0
    .param p1, "command"    # Ljava/lang/String;

    .prologue
    .line 197
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exec;->command:Ljava/lang/String;

    .line 198
    return-void
.end method

.method public setDir(Ljava/lang/String;)V
    .locals 1
    .param p1, "d"    # Ljava/lang/String;

    .prologue
    .line 181
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Exec;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Exec;->dir:Ljava/io/File;

    .line 182
    return-void
.end method

.method public setFailonerror(Z)V
    .locals 0
    .param p1, "fail"    # Z

    .prologue
    .line 214
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Exec;->failOnError:Z

    .line 215
    return-void
.end method

.method public setOs(Ljava/lang/String;)V
    .locals 0
    .param p1, "os"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exec;->os:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setOutput(Ljava/lang/String;)V
    .locals 0
    .param p1, "out"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Exec;->out:Ljava/lang/String;

    .line 206
    return-void
.end method
