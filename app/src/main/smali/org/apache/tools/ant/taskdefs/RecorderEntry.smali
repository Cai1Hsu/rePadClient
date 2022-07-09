.class public Lorg/apache/tools/ant/taskdefs/RecorderEntry;
.super Ljava/lang/Object;
.source "RecorderEntry.java"

# interfaces
.implements Lorg/apache/tools/ant/BuildLogger;
.implements Lorg/apache/tools/ant/SubBuildListener;


# instance fields
.field private emacsMode:Z

.field private filename:Ljava/lang/String;

.field private loglevel:I

.field private out:Ljava/io/PrintStream;

.field private project:Lorg/apache/tools/ant/Project;

.field private record:Z

.field private targetStartTime:J


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->filename:Ljava/lang/String;

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->record:Z

    .line 47
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->loglevel:I

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    .line 51
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->targetStartTime:J

    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->emacsMode:Z

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->targetStartTime:J

    .line 65
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->filename:Ljava/lang/String;

    .line 66
    return-void
.end method

.method private flush()V
    .locals 1

    .prologue
    .line 226
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->record:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->flush()V

    .line 229
    :cond_0
    return-void
.end method

.method private static formatTime(J)Ljava/lang/String;
    .locals 12
    .param p0, "millis"    # J

    .prologue
    const-wide/16 v10, 0x1

    const-wide/16 v8, 0x3c

    .line 271
    const-wide/16 v4, 0x3e8

    div-long v2, p0, v4

    .line 272
    .local v2, "seconds":J
    div-long v0, v2, v8

    .line 275
    .local v0, "minutes":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_2

    .line 276
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " minute"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    cmp-long v4, v0, v10

    if-nez v4, :cond_0

    const-string/jumbo v4, " "

    :goto_0
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    rem-long v6, v2, v8

    invoke-static {v6, v7}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " second"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    rem-long v6, v2, v8

    cmp-long v4, v6, v10

    if-nez v4, :cond_1

    const-string/jumbo v4, ""

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 281
    :goto_2
    return-object v4

    .line 276
    :cond_0
    const-string/jumbo v4, "s "

    goto :goto_0

    :cond_1
    const-string/jumbo v4, "s"

    goto :goto_1

    .line 281
    :cond_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " second"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    rem-long v6, v2, v8

    cmp-long v4, v6, v10

    if-nez v4, :cond_3

    const-string/jumbo v4, ""

    :goto_3
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_3
    const-string/jumbo v4, "s"

    goto :goto_3
.end method

.method private log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "mesg"    # Ljava/lang/String;
    .param p2, "level"    # I

    .prologue
    .line 220
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->record:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->loglevel:I

    if-gt p2, v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    if-eqz v0, :cond_0

    .line 221
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 223
    :cond_0
    return-void
.end method

.method private openFileImpl(Z)V
    .locals 4
    .param p1, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 356
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    if-nez v1, :cond_0

    .line 358
    :try_start_0
    new-instance v1, Ljava/io/PrintStream;

    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->filename:Ljava/lang/String;

    invoke-direct {v2, v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v1, v2}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 364
    :cond_0
    return-void

    .line 359
    :catch_0
    move-exception v0

    .line 360
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Problems opening file using a recorder entry"

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 103
    const-string/jumbo v1, "< BUILD FINISHED"

    const/4 v2, 0x4

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 105
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->record:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    if-eqz v1, :cond_0

    .line 106
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v0

    .line 108
    .local v0, "error":Ljava/lang/Throwable;
    if-nez v0, :cond_1

    .line 109
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "BUILD SUCCESSFUL"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 116
    .end local v0    # "error":Ljava/lang/Throwable;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->cleanup()V

    .line 117
    return-void

    .line 111
    .restart local v0    # "error":Ljava/lang/Throwable;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "BUILD FAILED"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 113
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_0
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 95
    const-string/jumbo v0, "> BUILD STARTED"

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 96
    return-void
.end method

.method public cleanup()V
    .locals 1

    .prologue
    .line 314
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->closeFile()V

    .line 315
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->project:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 316
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/Project;->removeBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 318
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->project:Lorg/apache/tools/ant/Project;

    .line 319
    return-void
.end method

.method closeFile()V
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    if-eqz v0, :cond_0

    .line 340
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->close()V

    .line 341
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    .line 343
    :cond_0
    return-void
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 307
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 7
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 190
    const-string/jumbo v5, "--- MESSAGE LOGGED"

    const/4 v6, 0x4

    invoke-direct {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 192
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 194
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 195
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v3

    .line 197
    .local v3, "name":Ljava/lang/String;
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->emacsMode:Z

    if-nez v5, :cond_1

    .line 198
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "] "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 199
    .local v2, "label":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    rsub-int/lit8 v4, v5, 0xc

    .line 201
    .local v4, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_0

    .line 202
    const-string/jumbo v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 201
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 204
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 207
    .end local v1    # "i":I
    .end local v2    # "label":Ljava/lang/String;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "size":I
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 209
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v6

    invoke-direct {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 210
    return-void
.end method

.method openFile(Z)V
    .locals 0
    .param p1, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 330
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->openFileImpl(Z)V

    .line 331
    return-void
.end method

.method reopenFile()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 352
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->openFileImpl(Z)V

    .line 353
    return-void
.end method

.method public setEmacsMode(Z)V
    .locals 0
    .param p1, "emacsMode"    # Z

    .prologue
    .line 256
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->emacsMode:Z

    .line 257
    return-void
.end method

.method public setErrorPrintStream(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "err"    # Ljava/io/PrintStream;

    .prologue
    .line 265
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->setOutputPrintStream(Ljava/io/PrintStream;)V

    .line 266
    return-void
.end method

.method public setMessageOutputLevel(I)V
    .locals 1
    .param p1, "level"    # I

    .prologue
    .line 236
    if-ltz p1, :cond_0

    const/4 v0, 0x4

    if-gt p1, v0, :cond_0

    .line 237
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->loglevel:I

    .line 239
    :cond_0
    return-void
.end method

.method public setOutputPrintStream(Ljava/io/PrintStream;)V
    .locals 0
    .param p1, "output"    # Ljava/io/PrintStream;

    .prologue
    .line 246
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->closeFile()V

    .line 247
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->out:Ljava/io/PrintStream;

    .line 248
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 295
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->project:Lorg/apache/tools/ant/Project;

    .line 296
    if-eqz p1, :cond_0

    .line 297
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 299
    :cond_0
    return-void
.end method

.method public setRecordState(Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "state"    # Ljava/lang/Boolean;

    .prologue
    .line 84
    if-eqz p1, :cond_0

    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->flush()V

    .line 86
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->record:Z

    .line 88
    :cond_0
    return-void
.end method

.method public subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 129
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->project:Lorg/apache/tools/ant/Project;

    if-ne v0, v1, :cond_0

    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->cleanup()V

    .line 132
    :cond_0
    return-void
.end method

.method public subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 142
    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 6
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 160
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "<< TARGET FINISHED -- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 162
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->targetStartTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->formatTime(J)Ljava/lang/String;

    move-result-object v0

    .line 164
    .local v0, "time":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ":  duration "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 165
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->flush()V

    .line 166
    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 149
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, ">> TARGET STARTED -- "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 150
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v1, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 152
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->targetStartTime:J

    .line 153
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 181
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "<<< TASK FINISHED -- "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 182
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->flush()V

    .line 183
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 173
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, ">>> TASK STARTED -- "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/RecorderEntry;->log(Ljava/lang/String;I)V

    .line 174
    return-void
.end method
