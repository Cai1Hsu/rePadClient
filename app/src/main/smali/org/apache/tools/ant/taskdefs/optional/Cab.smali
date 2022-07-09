.class public Lorg/apache/tools/ant/taskdefs/optional/Cab;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Cab.java"


# static fields
.field private static final DEFAULT_RESULT:I = -0x63

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field protected archiveType:Ljava/lang/String;

.field private baseDir:Ljava/io/File;

.field private cabFile:Ljava/io/File;

.field private cmdOptions:Ljava/lang/String;

.field private doCompress:Z

.field private doVerbose:Z

.field private filesets:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 50
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->filesets:Ljava/util/Vector;

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->doCompress:Z

    .line 52
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->doVerbose:Z

    .line 56
    const-string/jumbo v0, "cab"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->archiveType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 2
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->filesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 107
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one nested fileset allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 110
    return-void
.end method

.method protected appendFiles(Ljava/util/Vector;Lorg/apache/tools/ant/DirectoryScanner;)V
    .locals 3
    .param p1, "files"    # Ljava/util/Vector;
    .param p2, "ds"    # Lorg/apache/tools/ant/DirectoryScanner;

    .prologue
    .line 205
    invoke-virtual {p2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v0

    .line 207
    .local v0, "dsfiles":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 208
    aget-object v2, v0, v1

    invoke-virtual {p1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 207
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 210
    :cond_0
    return-void
.end method

.method protected checkConfiguration()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->filesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 123
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "basedir attribute or one nested fileset is required!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 127
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 128
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "basedir does not exist!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 130
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->filesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 131
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Both basedir attribute and a nested fileset is not allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    if-nez v0, :cond_3

    .line 135
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "cabfile attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 138
    :cond_3
    return-void
.end method

.method protected createExec()Lorg/apache/tools/ant/taskdefs/ExecTask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 147
    new-instance v0, Lorg/apache/tools/ant/taskdefs/ExecTask;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/ExecTask;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 148
    .local v0, "exec":Lorg/apache/tools/ant/taskdefs/ExecTask;
    return-object v0
.end method

.method protected createListFile(Ljava/util/Vector;)Ljava/io/File;
    .locals 11
    .param p1, "files"    # Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 181
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v1, "ant"

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v7

    .line 183
    .local v7, "listFile":Ljava/io/File;
    const/4 v9, 0x0

    .line 185
    .local v9, "writer":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v10, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    invoke-direct {v0, v7}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v10, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 187
    .end local v9    # "writer":Ljava/io/BufferedWriter;
    .local v10, "writer":Ljava/io/BufferedWriter;
    :try_start_1
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v8

    .line 188
    .local v8, "size":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v8, :cond_0

    .line 189
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p1, v6}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/16 v1, 0x22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 190
    invoke-virtual {v10}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 188
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 193
    :cond_0
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 196
    return-object v7

    .line 193
    .end local v6    # "i":I
    .end local v8    # "size":I
    .end local v10    # "writer":Ljava/io/BufferedWriter;
    .restart local v9    # "writer":Ljava/io/BufferedWriter;
    :catchall_0
    move-exception v0

    :goto_1
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v0

    .end local v9    # "writer":Ljava/io/BufferedWriter;
    .restart local v10    # "writer":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v0

    move-object v9, v10

    .end local v10    # "writer":Ljava/io/BufferedWriter;
    .restart local v9    # "writer":Ljava/io/BufferedWriter;
    goto :goto_1
.end method

.method public execute()V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 240
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->checkConfiguration()V

    .line 242
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getFileList()Ljava/util/Vector;

    move-result-object v13

    .line 245
    .local v13, "files":Ljava/util/Vector;
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->isUpToDate(Ljava/util/Vector;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 355
    :cond_0
    :goto_0
    return-void

    .line 249
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Building "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->archiveType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->log(Ljava/lang/String;)V

    .line 251
    const-string/jumbo v2, "windows"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 252
    const-string/jumbo v2, "Using listcab/libcabinet"

    const/4 v3, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->log(Ljava/lang/String;I)V

    .line 254
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    .line 256
    .local v24, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {v13}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v12

    .line 258
    .local v12, "fileEnum":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v12}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 259
    invoke-interface {v12}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 261
    :cond_2
    const-string/jumbo v2, "\n"

    move-object/from16 v0, v24

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 264
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v5, "listcab"

    aput-object v5, v4, v2

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    :goto_2
    const/4 v6, 0x1

    invoke-static {v3, v4, v5, v2, v6}, Lorg/apache/tools/ant/taskdefs/Execute;->launch(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;Z)Ljava/lang/Process;

    move-result-object v22

    .line 269
    .local v22, "p":Ljava/lang/Process;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v18

    .line 274
    .local v18, "out":Ljava/io/OutputStream;
    new-instance v20, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/4 v2, 0x3

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .line 275
    .local v20, "outLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    new-instance v8, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-direct {v8, v0, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .line 276
    .local v8, "errLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    new-instance v21, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 277
    .local v21, "outPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    new-instance v9, Lorg/apache/tools/ant/taskdefs/StreamPumper;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v9, v2, v8}, Lorg/apache/tools/ant/taskdefs/StreamPumper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 280
    .local v9, "errPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    new-instance v2, Ljava/lang/Thread;

    move-object/from16 v0, v21

    invoke-direct {v2, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 281
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2, v9}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 283
    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 284
    invoke-virtual/range {v18 .. v18}, Ljava/io/OutputStream;->flush()V

    .line 285
    invoke-virtual/range {v18 .. v18}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 288
    const/16 v23, -0x63

    .line 292
    .local v23, "result":I
    :try_start_1
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Process;->waitFor()I

    move-result v23

    .line 295
    invoke-virtual/range {v21 .. v21}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->waitFor()V

    .line 296
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->close()V

    .line 297
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/StreamPumper;->waitFor()V

    .line 298
    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 304
    :goto_3
    :try_start_2
    invoke-static/range {v23 .. v23}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 305
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Error executing listcab; error code: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->log(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 307
    .end local v8    # "errLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    .end local v9    # "errPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .end local v18    # "out":Ljava/io/OutputStream;
    .end local v20    # "outLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    .end local v21    # "outPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .end local v22    # "p":Ljava/lang/Process;
    .end local v23    # "result":I
    :catch_0
    move-exception v10

    .line 308
    .local v10, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Problem creating "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 309
    .local v17, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 264
    .end local v10    # "ex":Ljava/io/IOException;
    .end local v17    # "msg":Ljava/lang/String;
    :cond_3
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v2

    goto/16 :goto_2

    .line 299
    .restart local v8    # "errLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    .restart local v9    # "errPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .restart local v18    # "out":Ljava/io/OutputStream;
    .restart local v20    # "outLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    .restart local v21    # "outPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .restart local v22    # "p":Ljava/lang/Process;
    .restart local v23    # "result":I
    :catch_1
    move-exception v14

    .line 300
    .local v14, "ie":Ljava/lang/InterruptedException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Thread interrupted: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->log(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_3

    .line 313
    .end local v8    # "errLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    .end local v9    # "errPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .end local v12    # "fileEnum":Ljava/util/Enumeration;
    .end local v14    # "ie":Ljava/lang/InterruptedException;
    .end local v18    # "out":Ljava/io/OutputStream;
    .end local v20    # "outLog":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    .end local v21    # "outPump":Lorg/apache/tools/ant/taskdefs/StreamPumper;
    .end local v22    # "p":Ljava/lang/Process;
    .end local v23    # "result":I
    .end local v24    # "sb":Ljava/lang/StringBuffer;
    :cond_4
    :try_start_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->createListFile(Ljava/util/Vector;)Ljava/io/File;

    move-result-object v16

    .line 314
    .local v16, "listFile":Ljava/io/File;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->createExec()Lorg/apache/tools/ant/taskdefs/ExecTask;

    move-result-object v11

    .line 315
    .local v11, "exec":Lorg/apache/tools/ant/taskdefs/ExecTask;
    const/16 v19, 0x0

    .line 318
    .local v19, "outFile":Ljava/io/File;
    const/4 v2, 0x1

    invoke-virtual {v11, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setFailonerror(Z)V

    .line 319
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    invoke-virtual {v11, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setDir(Ljava/io/File;)V

    .line 321
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->doVerbose:Z

    if-nez v2, :cond_5

    .line 322
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/Cab;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v3, "ant"

    const-string/jumbo v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-virtual/range {v2 .. v7}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v19

    .line 323
    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setOutput(Ljava/io/File;)V

    .line 326
    :cond_5
    const-string/jumbo v2, "cabarc"

    invoke-virtual {v11, v2}, Lorg/apache/tools/ant/taskdefs/ExecTask;->setExecutable(Ljava/lang/String;)V

    .line 327
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-r"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 328
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-p"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 330
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->doCompress:Z

    if-nez v2, :cond_6

    .line 331
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-m"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 332
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "none"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 335
    :cond_6
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cmdOptions:Ljava/lang/String;

    if-eqz v2, :cond_7

    .line 336
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cmdOptions:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 339
    :cond_7
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "n"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 340
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 341
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 343
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V

    .line 345
    if-eqz v19, :cond_8

    .line 346
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->delete()Z

    .line 349
    :cond_8
    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_0

    .line 350
    .end local v11    # "exec":Lorg/apache/tools/ant/taskdefs/ExecTask;
    .end local v16    # "listFile":Ljava/io/File;
    .end local v19    # "outFile":Ljava/io/File;
    :catch_2
    move-exception v15

    .line 351
    .local v15, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Problem creating "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v15}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 352
    .restart local v17    # "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2
.end method

.method protected getFileList()Ljava/util/Vector;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 220
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 222
    .local v0, "files":Ljava/util/Vector;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    if-eqz v2, :cond_0

    .line 224
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    invoke-super {p0, v2}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->appendFiles(Ljava/util/Vector;Lorg/apache/tools/ant/DirectoryScanner;)V

    .line 231
    :goto_0
    return-object v0

    .line 226
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->filesets:Ljava/util/Vector;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    .line 227
    .local v1, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FileSet;->getDir()Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/optional/Cab;->appendFiles(Ljava/util/Vector;Lorg/apache/tools/ant/DirectoryScanner;)V

    goto :goto_0
.end method

.method protected isUpToDate(Ljava/util/Vector;)Z
    .locals 8
    .param p1, "files"    # Ljava/util/Vector;

    .prologue
    .line 157
    const/4 v3, 0x1

    .line 158
    .local v3, "upToDate":Z
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v2

    .line 159
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    if-eqz v3, :cond_1

    .line 160
    invoke-virtual {p1, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "file":Ljava/lang/String;
    sget-object v4, Lorg/apache/tools/ant/taskdefs/optional/Cab;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    invoke-virtual {v4, v5, v0}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    .line 163
    const/4 v3, 0x0

    .line 159
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 166
    .end local v0    # "file":Ljava/lang/String;
    :cond_1
    return v3
.end method

.method public setBasedir(Ljava/io/File;)V
    .locals 0
    .param p1, "baseDir"    # Ljava/io/File;

    .prologue
    .line 74
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->baseDir:Ljava/io/File;

    .line 75
    return-void
.end method

.method public setCabfile(Ljava/io/File;)V
    .locals 0
    .param p1, "cabFile"    # Ljava/io/File;

    .prologue
    .line 66
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cabFile:Ljava/io/File;

    .line 67
    return-void
.end method

.method public setCompress(Z)V
    .locals 0
    .param p1, "compress"    # Z

    .prologue
    .line 82
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->doCompress:Z

    .line 83
    return-void
.end method

.method public setOptions(Ljava/lang/String;)V
    .locals 0
    .param p1, "options"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->cmdOptions:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Cab;->doVerbose:Z

    .line 91
    return-void
.end method
