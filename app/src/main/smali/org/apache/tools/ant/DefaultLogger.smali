.class public Lorg/apache/tools/ant/DefaultLogger;
.super Ljava/lang/Object;
.source "DefaultLogger.java"

# interfaces
.implements Lorg/apache/tools/ant/BuildLogger;


# static fields
.field public static final LEFT_COLUMN_SIZE:I = 0xc

.field protected static final lSep:Ljava/lang/String;


# instance fields
.field protected emacsMode:Z

.field protected err:Ljava/io/PrintStream;

.field protected msgOutputLevel:I

.field protected out:Ljava/io/PrintStream;

.field private startTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    sput-object v0, Lorg/apache/tools/ant/DefaultLogger;->lSep:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput v2, p0, Lorg/apache/tools/ant/DefaultLogger;->msgOutputLevel:I

    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/DefaultLogger;->startTime:J

    .line 64
    iput-boolean v2, p0, Lorg/apache/tools/ant/DefaultLogger;->emacsMode:Z

    .line 72
    return-void
.end method

.method protected static formatTime(J)Ljava/lang/String;
    .locals 2
    .param p0, "millis"    # J

    .prologue
    .line 330
    invoke-static {p0, p1}, Lorg/apache/tools/ant/util/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static throwableMessage(Ljava/lang/StringBuffer;Ljava/lang/Throwable;Z)V
    .locals 6
    .param p0, "m"    # Ljava/lang/StringBuffer;
    .param p1, "error"    # Ljava/lang/Throwable;
    .param p2, "verbose"    # Z

    .prologue
    .line 134
    :goto_0
    instance-of v3, p1, Lorg/apache/tools/ant/BuildException;

    if-eqz v3, :cond_0

    .line 135
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 136
    .local v0, "cause":Ljava/lang/Throwable;
    if-nez v0, :cond_2

    .line 148
    .end local v0    # "cause":Ljava/lang/Throwable;
    :cond_0
    if-nez p2, :cond_1

    instance-of v3, p1, Lorg/apache/tools/ant/BuildException;

    if-nez v3, :cond_3

    .line 149
    :cond_1
    invoke-static {p1}, Lorg/apache/tools/ant/util/StringUtils;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 153
    :goto_1
    return-void

    .line 139
    .restart local v0    # "cause":Ljava/lang/Throwable;
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "msg1":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 141
    .local v2, "msg2":Ljava/lang/String;
    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 142
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    move-object p1, v0

    .line 145
    goto :goto_0

    .line 151
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "msg1":Ljava/lang/String;
    .end local v2    # "msg2":Ljava/lang/String;
    :cond_3
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Lorg/apache/tools/ant/DefaultLogger;->lSep:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method


# virtual methods
.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 10
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 164
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v0

    .line 165
    .local v0, "error":Ljava/lang/Throwable;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 166
    .local v1, "message":Ljava/lang/StringBuffer;
    if-nez v0, :cond_0

    .line 167
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 168
    invoke-virtual {p0}, Lorg/apache/tools/ant/DefaultLogger;->getBuildSuccessfulMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 175
    :goto_0
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 176
    const-string/jumbo v3, "Total time: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 177
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-wide v8, p0, Lorg/apache/tools/ant/DefaultLogger;->startTime:J

    sub-long/2addr v6, v8

    invoke-static {v6, v7}, Lorg/apache/tools/ant/DefaultLogger;->formatTime(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 179
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 180
    .local v2, "msg":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 181
    iget-object v3, p0, Lorg/apache/tools/ant/DefaultLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v2, v3, v5}, Lorg/apache/tools/ant/DefaultLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 185
    :goto_1
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/DefaultLogger;->log(Ljava/lang/String;)V

    .line 186
    return-void

    .line 170
    .end local v2    # "msg":Ljava/lang/String;
    :cond_0
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 171
    invoke-virtual {p0}, Lorg/apache/tools/ant/DefaultLogger;->getBuildFailedMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 172
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 173
    iget v3, p0, Lorg/apache/tools/ant/DefaultLogger;->msgOutputLevel:I

    if-gt v5, v3, :cond_1

    const/4 v3, 0x1

    :goto_2
    invoke-static {v1, v0, v3}, Lorg/apache/tools/ant/DefaultLogger;->throwableMessage(Ljava/lang/StringBuffer;Ljava/lang/Throwable;Z)V

    goto :goto_0

    :cond_1
    move v3, v4

    goto :goto_2

    .line 183
    .restart local v2    # "msg":Ljava/lang/String;
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/DefaultLogger;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v2, v3, v4}, Lorg/apache/tools/ant/DefaultLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    goto :goto_1
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 130
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/DefaultLogger;->startTime:J

    .line 131
    return-void
.end method

.method protected extractProjectName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 377
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 378
    .local v0, "project":Lorg/apache/tools/ant/Project;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getBuildFailedMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    const-string/jumbo v0, "BUILD FAILED"

    return-object v0
.end method

.method protected getBuildSuccessfulMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    const-string/jumbo v0, "BUILD SUCCESSFUL"

    return-object v0
.end method

.method protected getTimestamp()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v3, 0x3

    .line 364
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v0, v4, v5}, Ljava/util/Date;-><init>(J)V

    .line 365
    .local v0, "date":Ljava/util/Date;
    invoke-static {v3, v3}, Ljava/text/DateFormat;->getDateTimeInstance(II)Ljava/text/DateFormat;

    move-result-object v2

    .line 366
    .local v2, "formatter":Ljava/text/DateFormat;
    invoke-virtual {v2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 367
    .local v1, "finishTime":Ljava/lang/String;
    return-object v1
.end method

.method protected log(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 356
    return-void
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 17
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 256
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v10

    .line 258
    .local v10, "priority":I
    move-object/from16 v0, p0

    iget v15, v0, Lorg/apache/tools/ant/DefaultLogger;->msgOutputLevel:I

    if-gt v10, v15, :cond_4

    .line 260
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 261
    .local v7, "message":Ljava/lang/StringBuffer;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v15

    if-eqz v15, :cond_8

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/DefaultLogger;->emacsMode:Z

    if-nez v15, :cond_8

    .line 263
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v15

    invoke-virtual {v15}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v9

    .line 264
    .local v9, "name":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "["

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, "] "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 265
    .local v5, "label":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v15

    rsub-int/lit8 v13, v15, 0xc

    .line 266
    .local v13, "size":I
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    .line 267
    .local v14, "tmp":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v13, :cond_0

    .line 268
    const-string/jumbo v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 267
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 270
    :cond_0
    invoke-virtual {v14, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 271
    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 273
    const/4 v11, 0x0

    .line 275
    .local v11, "r":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v12, Ljava/io/BufferedReader;

    new-instance v15, Ljava/io/StringReader;

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v12, v15}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    .end local v11    # "r":Ljava/io/BufferedReader;
    .local v12, "r":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v12}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 278
    .local v6, "line":Ljava/lang/String;
    const/4 v3, 0x1

    .line 280
    .local v3, "first":Z
    :cond_1
    if-eqz v3, :cond_5

    .line 281
    if-nez v6, :cond_6

    .line 282
    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 296
    :goto_1
    if-eqz v12, :cond_a

    .line 297
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    move-object v11, v12

    .line 305
    .end local v3    # "first":Z
    .end local v4    # "i":I
    .end local v5    # "label":Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    .end local v9    # "name":Ljava/lang/String;
    .end local v12    # "r":Ljava/io/BufferedReader;
    .end local v13    # "size":I
    .end local v14    # "tmp":Ljava/lang/StringBuffer;
    :cond_2
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getException()Ljava/lang/Throwable;

    move-result-object v2

    .line 306
    .local v2, "ex":Ljava/lang/Throwable;
    const/4 v15, 0x4

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/DefaultLogger;->msgOutputLevel:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-gt v15, v0, :cond_3

    if-eqz v2, :cond_3

    .line 307
    invoke-static {v2}, Lorg/apache/tools/ant/util/StringUtils;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v7, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 310
    :cond_3
    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 311
    .local v8, "msg":Ljava/lang/String;
    if-eqz v10, :cond_9

    .line 312
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/DefaultLogger;->out:Ljava/io/PrintStream;

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v15, v10}, Lorg/apache/tools/ant/DefaultLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 316
    :goto_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/DefaultLogger;->log(Ljava/lang/String;)V

    .line 318
    .end local v2    # "ex":Ljava/lang/Throwable;
    .end local v7    # "message":Ljava/lang/StringBuffer;
    .end local v8    # "msg":Ljava/lang/String;
    :cond_4
    return-void

    .line 286
    .restart local v3    # "first":Z
    .restart local v4    # "i":I
    .restart local v5    # "label":Ljava/lang/String;
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v7    # "message":Ljava/lang/StringBuffer;
    .restart local v9    # "name":Ljava/lang/String;
    .restart local v12    # "r":Ljava/io/BufferedReader;
    .restart local v13    # "size":I
    .restart local v14    # "tmp":Ljava/lang/StringBuffer;
    :cond_5
    :try_start_2
    sget-object v15, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v7, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 288
    :cond_6
    const/4 v3, 0x0

    .line 289
    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 290
    invoke-virtual {v12}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v6

    .line 291
    if-nez v6, :cond_1

    goto :goto_1

    .line 292
    .end local v3    # "first":Z
    .end local v6    # "line":Ljava/lang/String;
    .end local v12    # "r":Ljava/io/BufferedReader;
    .restart local v11    # "r":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 294
    .local v1, "e":Ljava/io/IOException;
    :goto_4
    :try_start_3
    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 296
    if-eqz v11, :cond_2

    .line 297
    invoke-static {v11}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    goto :goto_2

    .line 296
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v15

    :goto_5
    if-eqz v11, :cond_7

    .line 297
    invoke-static {v11}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    :cond_7
    throw v15

    .line 303
    .end local v4    # "i":I
    .end local v5    # "label":Ljava/lang/String;
    .end local v9    # "name":Ljava/lang/String;
    .end local v11    # "r":Ljava/io/BufferedReader;
    .end local v13    # "size":I
    .end local v14    # "tmp":Ljava/lang/StringBuffer;
    :cond_8
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/BuildEvent;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v7, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 314
    .restart local v2    # "ex":Ljava/lang/Throwable;
    .restart local v8    # "msg":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/DefaultLogger;->err:Ljava/io/PrintStream;

    move-object/from16 v0, p0

    invoke-virtual {v0, v8, v15, v10}, Lorg/apache/tools/ant/DefaultLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    goto :goto_3

    .line 296
    .end local v2    # "ex":Ljava/lang/Throwable;
    .end local v8    # "msg":Ljava/lang/String;
    .restart local v4    # "i":I
    .restart local v5    # "label":Ljava/lang/String;
    .restart local v9    # "name":Ljava/lang/String;
    .restart local v12    # "r":Ljava/io/BufferedReader;
    .restart local v13    # "size":I
    .restart local v14    # "tmp":Ljava/lang/StringBuffer;
    :catchall_1
    move-exception v15

    move-object v11, v12

    .end local v12    # "r":Ljava/io/BufferedReader;
    .restart local v11    # "r":Ljava/io/BufferedReader;
    goto :goto_5

    .line 292
    .end local v11    # "r":Ljava/io/BufferedReader;
    .restart local v12    # "r":Ljava/io/BufferedReader;
    :catch_1
    move-exception v1

    move-object v11, v12

    .end local v12    # "r":Ljava/io/BufferedReader;
    .restart local v11    # "r":Ljava/io/BufferedReader;
    goto :goto_4

    .end local v11    # "r":Ljava/io/BufferedReader;
    .restart local v3    # "first":Z
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v12    # "r":Ljava/io/BufferedReader;
    :cond_a
    move-object v11, v12

    .end local v12    # "r":Ljava/io/BufferedReader;
    .restart local v11    # "r":Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method protected printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/PrintStream;
    .param p3, "priority"    # I

    .prologue
    .line 346
    invoke-virtual {p2, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 347
    return-void
.end method

.method public setEmacsMode(Z)V
    .locals 0
    .param p1, "emacsMode"    # Z

    .prologue
    .line 121
    iput-boolean p1, p0, Lorg/apache/tools/ant/DefaultLogger;->emacsMode:Z

    .line 122
    return-void
.end method

.method public setErrorPrintStream(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "err"    # Ljava/io/PrintStream;

    .prologue
    .line 111
    new-instance v0, Ljava/io/PrintStream;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v0, p0, Lorg/apache/tools/ant/DefaultLogger;->err:Ljava/io/PrintStream;

    .line 112
    return-void
.end method

.method public setMessageOutputLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 91
    iput p1, p0, Lorg/apache/tools/ant/DefaultLogger;->msgOutputLevel:I

    .line 92
    return-void
.end method

.method public setOutputPrintStream(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "output"    # Ljava/io/PrintStream;

    .prologue
    .line 101
    new-instance v0, Ljava/io/PrintStream;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    iput-object v0, p0, Lorg/apache/tools/ant/DefaultLogger;->out:Ljava/io/PrintStream;

    .line 102
    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 229
    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 3
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 214
    const/4 v1, 0x2

    iget v2, p0, Lorg/apache/tools/ant/DefaultLogger;->msgOutputLevel:I

    if-gt v1, v2, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 216
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v2, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 218
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DefaultLogger;->out:Ljava/io/PrintStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getPriority()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/tools/ant/DefaultLogger;->printMessage(Ljava/lang/String;Ljava/io/PrintStream;I)V

    .line 219
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/DefaultLogger;->log(Ljava/lang/String;)V

    .line 221
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 245
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 237
    return-void
.end method
