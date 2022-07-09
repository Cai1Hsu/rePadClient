.class public Lorg/apache/tools/ant/taskdefs/BUnzip2;
.super Lorg/apache/tools/ant/taskdefs/Unpack;
.source "BUnzip2.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final DEFAULT_EXTENSION:Ljava/lang/String; = ".bz2"

.field static class$org$apache$tools$ant$taskdefs$BUnzip2:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 109
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method protected extract()V
    .locals 18

    .prologue
    .line 58
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->source:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->lastModified()J

    move-result-wide v14

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->dest:Ljava/io/File;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/io/File;->lastModified()J

    move-result-wide v16

    cmp-long v14, v14, v16

    if-lez v14, :cond_3

    .line 59
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Expanding "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->source:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, " to "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->dest:Ljava/io/File;

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/tools/ant/taskdefs/BUnzip2;->log(Ljava/lang/String;)V

    .line 62
    const/4 v10, 0x0

    .line 63
    .local v10, "out":Ljava/io/FileOutputStream;
    const/4 v12, 0x0

    .line 64
    .local v12, "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    const/4 v7, 0x0

    .line 65
    .local v7, "fis":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 67
    .local v3, "bis":Ljava/io/BufferedInputStream;
    :try_start_0
    new-instance v11, Ljava/io/FileOutputStream;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->dest:Ljava/io/File;

    invoke-direct {v11, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .local v11, "out":Ljava/io/FileOutputStream;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->srcResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 69
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-direct {v4, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 70
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .local v4, "bis":Ljava/io/BufferedInputStream;
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    .line 71
    .local v2, "b":I
    const/16 v14, 0x42

    if-eq v2, v14, :cond_0

    .line 72
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "Invalid bz2 file."

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/BUnzip2;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v16

    invoke-direct/range {v14 .. v16}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 85
    .end local v2    # "b":I
    :catch_0
    move-exception v8

    move-object v3, v4

    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    move-object v10, v11

    .line 86
    .end local v11    # "out":Ljava/io/FileOutputStream;
    .local v8, "ioe":Ljava/io/IOException;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    :goto_0
    :try_start_3
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Problem expanding bzip2 "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v8}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 87
    .local v9, "msg":Ljava/lang/String;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/BUnzip2;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v15

    invoke-direct {v14, v9, v8, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v14
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    .end local v8    # "ioe":Ljava/io/IOException;
    .end local v9    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v14

    :goto_1
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 90
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 91
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 92
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 89
    throw v14

    .line 74
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "b":I
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    :cond_0
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedInputStream;->read()I

    move-result v2

    .line 75
    const/16 v14, 0x5a

    if-eq v2, v14, :cond_1

    .line 76
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "Invalid bz2 file."

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/BUnzip2;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v16

    invoke-direct/range {v14 .. v16}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14

    .line 89
    .end local v2    # "b":I
    :catchall_1
    move-exception v14

    move-object v3, v4

    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    move-object v10, v11

    .end local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 78
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "b":I
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    :cond_1
    new-instance v13, Lorg/apache/tools/bzip2/CBZip2InputStream;

    invoke-direct {v13, v4}, Lorg/apache/tools/bzip2/CBZip2InputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 79
    .end local v12    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    .local v13, "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    const/16 v14, 0x2000

    :try_start_5
    new-array v5, v14, [B

    .line 80
    .local v5, "buffer":[B
    const/4 v6, 0x0

    .line 82
    .local v6, "count":I
    :cond_2
    const/4 v14, 0x0

    invoke-virtual {v11, v5, v14, v6}, Ljava/io/FileOutputStream;->write([BII)V

    .line 83
    const/4 v14, 0x0

    array-length v15, v5

    invoke-virtual {v13, v5, v14, v15}, Lorg/apache/tools/bzip2/CBZip2InputStream;->read([BII)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move-result v6

    .line 84
    const/4 v14, -0x1

    if-ne v6, v14, :cond_2

    .line 89
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 90
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 91
    invoke-static {v11}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 92
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 95
    .end local v2    # "b":I
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .end local v5    # "buffer":[B
    .end local v6    # "count":I
    .end local v7    # "fis":Ljava/io/InputStream;
    .end local v11    # "out":Ljava/io/FileOutputStream;
    .end local v13    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    :cond_3
    return-void

    .line 89
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v7    # "fis":Ljava/io/InputStream;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v12    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    :catchall_2
    move-exception v14

    move-object v10, v11

    .end local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .end local v12    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    .restart local v2    # "b":I
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v13    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    :catchall_3
    move-exception v14

    move-object v3, v4

    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    move-object v12, v13

    .end local v13    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    .restart local v12    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    move-object v10, v11

    .end local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 85
    .end local v2    # "b":I
    :catch_1
    move-exception v8

    goto :goto_0

    .end local v10    # "out":Ljava/io/FileOutputStream;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v8

    move-object v10, v11

    .end local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    goto :goto_0

    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "out":Ljava/io/FileOutputStream;
    .end local v12    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    .restart local v2    # "b":I
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v13    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    :catch_3
    move-exception v8

    move-object v3, v4

    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    move-object v12, v13

    .end local v13    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    .restart local v12    # "zIn":Lorg/apache/tools/bzip2/CBZip2InputStream;
    move-object v10, v11

    .end local v11    # "out":Ljava/io/FileOutputStream;
    .restart local v10    # "out":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method protected getDefaultExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    const-string/jumbo v0, ".bz2"

    return-object v0
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 109
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->class$org$apache$tools$ant$taskdefs$BUnzip2:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.BUnzip2"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/BUnzip2;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->class$org$apache$tools$ant$taskdefs$BUnzip2:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/BUnzip2;->class$org$apache$tools$ant$taskdefs$BUnzip2:Ljava/lang/Class;

    goto :goto_0
.end method
