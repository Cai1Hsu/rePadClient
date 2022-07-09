.class public Lorg/apache/tools/ant/taskdefs/GUnzip;
.super Lorg/apache/tools/ant/taskdefs/Unpack;
.source "GUnzip.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final DEFAULT_EXTENSION:Ljava/lang/String; = ".gz"

.field static class$org$apache$tools$ant$taskdefs$GUnzip:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 94
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
    .locals 14

    .prologue
    .line 54
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/GUnzip;->source:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/GUnzip;->dest:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-lez v9, :cond_1

    .line 55
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Expanding "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/GUnzip;->source:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/GUnzip;->dest:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/GUnzip;->log(Ljava/lang/String;)V

    .line 58
    const/4 v5, 0x0

    .line 59
    .local v5, "out":Ljava/io/FileOutputStream;
    const/4 v7, 0x0

    .line 60
    .local v7, "zIn":Ljava/util/zip/GZIPInputStream;
    const/4 v2, 0x0

    .line 62
    .local v2, "fis":Ljava/io/InputStream;
    :try_start_0
    new-instance v6, Ljava/io/FileOutputStream;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/GUnzip;->dest:Ljava/io/File;

    invoke-direct {v6, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .local v6, "out":Ljava/io/FileOutputStream;
    :try_start_1
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/GUnzip;->srcResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .line 64
    new-instance v8, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v8, v2}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 65
    .end local v7    # "zIn":Ljava/util/zip/GZIPInputStream;
    .local v8, "zIn":Ljava/util/zip/GZIPInputStream;
    const/16 v9, 0x2000

    :try_start_2
    new-array v0, v9, [B

    .line 66
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 68
    .local v1, "count":I
    :cond_0
    const/4 v9, 0x0

    invoke-virtual {v6, v0, v9, v1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 69
    const/4 v9, 0x0

    array-length v10, v0

    invoke-virtual {v8, v0, v9, v10}, Ljava/util/zip/GZIPInputStream;->read([BII)I
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v1

    .line 70
    const/4 v9, -0x1

    if-ne v1, v9, :cond_0

    .line 75
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 76
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 77
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 80
    .end local v0    # "buffer":[B
    .end local v1    # "count":I
    .end local v2    # "fis":Ljava/io/InputStream;
    .end local v6    # "out":Ljava/io/FileOutputStream;
    .end local v8    # "zIn":Ljava/util/zip/GZIPInputStream;
    :cond_1
    return-void

    .line 71
    .restart local v2    # "fis":Ljava/io/InputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v7    # "zIn":Ljava/util/zip/GZIPInputStream;
    :catch_0
    move-exception v3

    .line 72
    .local v3, "ioe":Ljava/io/IOException;
    :goto_0
    :try_start_3
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Problem expanding gzip "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "msg":Ljava/lang/String;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/GUnzip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v9, v4, v3, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 75
    .end local v3    # "ioe":Ljava/io/IOException;
    .end local v4    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v9

    :goto_1
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 76
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 77
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v9

    .line 75
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v9

    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .end local v5    # "out":Ljava/io/FileOutputStream;
    .end local v7    # "zIn":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v8    # "zIn":Ljava/util/zip/GZIPInputStream;
    :catchall_2
    move-exception v9

    move-object v7, v8

    .end local v8    # "zIn":Ljava/util/zip/GZIPInputStream;
    .restart local v7    # "zIn":Ljava/util/zip/GZIPInputStream;
    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 71
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    :catch_1
    move-exception v3

    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_0

    .end local v5    # "out":Ljava/io/FileOutputStream;
    .end local v7    # "zIn":Ljava/util/zip/GZIPInputStream;
    .restart local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v8    # "zIn":Ljava/util/zip/GZIPInputStream;
    :catch_2
    move-exception v3

    move-object v7, v8

    .end local v8    # "zIn":Ljava/util/zip/GZIPInputStream;
    .restart local v7    # "zIn":Ljava/util/zip/GZIPInputStream;
    move-object v5, v6

    .end local v6    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    goto :goto_0
.end method

.method protected getDefaultExtension()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string/jumbo v0, ".gz"

    return-object v0
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 94
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/GUnzip;->class$org$apache$tools$ant$taskdefs$GUnzip:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.GUnzip"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/GUnzip;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/GUnzip;->class$org$apache$tools$ant$taskdefs$GUnzip:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/GUnzip;->class$org$apache$tools$ant$taskdefs$GUnzip:Ljava/lang/Class;

    goto :goto_0
.end method
