.class public Lorg/apache/tools/ant/taskdefs/BZip2;
.super Lorg/apache/tools/ant/taskdefs/Pack;
.source "BZip2.java"


# static fields
.field static class$org$apache$tools$ant$taskdefs$BZip2:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Pack;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 71
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
.method protected pack()V
    .locals 7

    .prologue
    .line 43
    const/4 v3, 0x0

    .line 45
    .local v3, "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    :try_start_0
    new-instance v0, Ljava/io/BufferedOutputStream;

    new-instance v5, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/BZip2;->zipFile:Ljava/io/File;

    invoke-direct {v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 47
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    const/16 v5, 0x42

    invoke-virtual {v0, v5}, Ljava/io/BufferedOutputStream;->write(I)V

    .line 48
    const/16 v5, 0x5a

    invoke-virtual {v0, v5}, Ljava/io/BufferedOutputStream;->write(I)V

    .line 49
    new-instance v4, Lorg/apache/tools/bzip2/CBZip2OutputStream;

    invoke-direct {v4, v0}, Lorg/apache/tools/bzip2/CBZip2OutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .end local v3    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    .local v4, "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BZip2;->getSrcResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    invoke-virtual {p0, v5, v4}, Lorg/apache/tools/ant/taskdefs/BZip2;->zipResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 55
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 57
    return-void

    .line 51
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .end local v4    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    .restart local v3    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    :catch_0
    move-exception v1

    .line 52
    .local v1, "ioe":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Problem creating bzip2 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 53
    .local v2, "msg":Ljava/lang/String;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BZip2;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v5, v2, v1, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .end local v1    # "ioe":Ljava/io/IOException;
    .end local v2    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v5

    :goto_1
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v5

    .end local v3    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v4    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    .restart local v3    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    goto :goto_1

    .line 51
    .end local v3    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    .restart local v4    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    :catch_1
    move-exception v1

    move-object v3, v4

    .end local v4    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    .restart local v3    # "zOut":Lorg/apache/tools/bzip2/CBZip2OutputStream;
    goto :goto_0
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/BZip2;->class$org$apache$tools$ant$taskdefs$BZip2:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.BZip2"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/BZip2;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/BZip2;->class$org$apache$tools$ant$taskdefs$BZip2:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/BZip2;->class$org$apache$tools$ant$taskdefs$BZip2:Ljava/lang/Class;

    goto :goto_0
.end method
