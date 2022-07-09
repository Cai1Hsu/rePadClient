.class public Lorg/apache/tools/ant/taskdefs/Jikes;
.super Ljava/lang/Object;
.source "Jikes.java"


# static fields
.field private static final MAX_FILES_ON_COMMAND_LINE:I = 0xfa


# instance fields
.field protected command:Ljava/lang/String;

.field protected jop:Lorg/apache/tools/ant/taskdefs/JikesOutputParser;

.field protected project:Lorg/apache/tools/ant/Project;


# direct methods
.method protected constructor <init>(Lorg/apache/tools/ant/taskdefs/JikesOutputParser;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "jop"    # Lorg/apache/tools/ant/taskdefs/JikesOutputParser;
    .param p2, "command"    # Ljava/lang/String;
    .param p3, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "As of Ant 1.2 released in October 2000, the Jikes class"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "is considered to be dead code by the Ant developers and is unmaintained."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 64
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v1, "Don\'t use it!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 66
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Jikes;->jop:Lorg/apache/tools/ant/taskdefs/JikesOutputParser;

    .line 67
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Jikes;->command:Ljava/lang/String;

    .line 68
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/Jikes;->project:Lorg/apache/tools/ant/Project;

    .line 69
    return-void
.end method


# virtual methods
.method protected compile([Ljava/lang/String;)V
    .locals 16
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 76
    const/4 v7, 0x0

    .line 77
    .local v7, "commandArray":[Ljava/lang/String;
    const/4 v15, 0x0

    .line 80
    .local v15, "tmpFile":Ljava/io/File;
    :try_start_0
    const-string/jumbo v1, "os.name"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 85
    .local v12, "myos":Ljava/lang/String;
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v12, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "windows"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_3

    move-object/from16 v0, p1

    array-length v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v2, 0xfa

    if-le v1, v2, :cond_3

    .line 87
    const/4 v13, 0x0

    .line 89
    .local v13, "out":Ljava/io/BufferedWriter;
    :try_start_1
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    const-string/jumbo v2, "jikes"

    const-string/jumbo v3, "tmp"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v15

    .line 91
    new-instance v14, Ljava/io/BufferedWriter;

    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, v15}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v14, v1}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    .end local v13    # "out":Ljava/io/BufferedWriter;
    .local v14, "out":Ljava/io/BufferedWriter;
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    :try_start_2
    move-object/from16 v0, p1

    array-length v1, v0

    if-ge v11, v1, :cond_0

    .line 93
    aget-object v1, p1, v11

    invoke-virtual {v14, v1}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 94
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->newLine()V

    .line 92
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {v14}, Ljava/io/BufferedWriter;->flush()V

    .line 97
    const/4 v1, 0x2

    new-array v8, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Jikes;->command:Ljava/lang/String;

    aput-object v2, v8, v1

    const/4 v1, 0x1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v8, v1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 103
    .end local v7    # "commandArray":[Ljava/lang/String;
    .local v8, "commandArray":[Ljava/lang/String;
    :try_start_3
    invoke-static {v14}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    move-object v7, v8

    .line 116
    .end local v8    # "commandArray":[Ljava/lang/String;
    .end local v11    # "i":I
    .end local v14    # "out":Ljava/io/BufferedWriter;
    .restart local v7    # "commandArray":[Ljava/lang/String;
    :goto_1
    :try_start_4
    new-instance v10, Lorg/apache/tools/ant/taskdefs/Execute;

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/Jikes;->jop:Lorg/apache/tools/ant/taskdefs/JikesOutputParser;

    invoke-direct {v10, v1}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 117
    .local v10, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/Jikes;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v10, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 118
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/Jikes;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v10, v1}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 119
    invoke-virtual {v10, v7}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 120
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 125
    if-eqz v15, :cond_1

    .line 126
    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_1

    .line 127
    invoke-virtual {v15}, Ljava/io/File;->deleteOnExit()V

    .line 131
    :cond_1
    return-void

    .line 99
    .end local v10    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .restart local v13    # "out":Ljava/io/BufferedWriter;
    :catch_0
    move-exception v9

    .line 100
    .local v9, "e":Ljava/io/IOException;
    :goto_2
    :try_start_5
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Error creating temporary file"

    invoke-direct {v1, v2, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 103
    .end local v9    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    :goto_3
    :try_start_6
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 125
    .end local v12    # "myos":Ljava/lang/String;
    .end local v13    # "out":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v1

    :goto_4
    if-eqz v15, :cond_2

    .line 126
    invoke-virtual {v15}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_2

    .line 127
    invoke-virtual {v15}, Ljava/io/File;->deleteOnExit()V

    .line 125
    :cond_2
    throw v1

    .line 106
    .restart local v12    # "myos":Ljava/lang/String;
    :cond_3
    :try_start_7
    move-object/from16 v0, p1

    array-length v1, v0

    add-int/lit8 v1, v1, 0x1

    new-array v7, v1, [Ljava/lang/String;

    .line 107
    const/4 v1, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Jikes;->command:Ljava/lang/String;

    aput-object v2, v7, v1

    .line 108
    const/4 v1, 0x0

    const/4 v2, 0x1

    move-object/from16 v0, p1

    array-length v3, v0

    move-object/from16 v0, p1

    invoke-static {v0, v1, v7, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1

    .line 121
    :catch_1
    move-exception v9

    .line 122
    .restart local v9    # "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Error running Jikes compiler"

    invoke-direct {v1, v2, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 125
    .end local v7    # "commandArray":[Ljava/lang/String;
    .end local v9    # "e":Ljava/io/IOException;
    .restart local v8    # "commandArray":[Ljava/lang/String;
    .restart local v11    # "i":I
    .restart local v14    # "out":Ljava/io/BufferedWriter;
    :catchall_2
    move-exception v1

    move-object v7, v8

    .end local v8    # "commandArray":[Ljava/lang/String;
    .restart local v7    # "commandArray":[Ljava/lang/String;
    goto :goto_4

    .line 103
    :catchall_3
    move-exception v1

    move-object v13, v14

    .end local v14    # "out":Ljava/io/BufferedWriter;
    .restart local v13    # "out":Ljava/io/BufferedWriter;
    goto :goto_3

    .line 99
    .end local v13    # "out":Ljava/io/BufferedWriter;
    .restart local v14    # "out":Ljava/io/BufferedWriter;
    :catch_2
    move-exception v9

    move-object v13, v14

    .end local v14    # "out":Ljava/io/BufferedWriter;
    .restart local v13    # "out":Ljava/io/BufferedWriter;
    goto :goto_2
.end method
