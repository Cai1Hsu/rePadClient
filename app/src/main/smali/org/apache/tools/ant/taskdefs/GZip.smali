.class public Lorg/apache/tools/ant/taskdefs/GZip;
.super Lorg/apache/tools/ant/taskdefs/Pack;
.source "GZip.java"


# static fields
.field static class$org$apache$tools$ant$taskdefs$GZip:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Pack;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 65
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
    .locals 6

    .prologue
    .line 41
    const/4 v2, 0x0

    .line 43
    .local v2, "zOut":Ljava/util/zip/GZIPOutputStream;
    :try_start_0
    new-instance v3, Ljava/util/zip/GZIPOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/GZip;->zipFile:Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .end local v2    # "zOut":Ljava/util/zip/GZIPOutputStream;
    .local v3, "zOut":Ljava/util/zip/GZIPOutputStream;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/GZip;->getSrcResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v4

    invoke-virtual {p0, v4, v3}, Lorg/apache/tools/ant/taskdefs/GZip;->zipResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 49
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 51
    return-void

    .line 45
    .end local v3    # "zOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v2    # "zOut":Ljava/util/zip/GZIPOutputStream;
    :catch_0
    move-exception v0

    .line 46
    .local v0, "ioe":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Problem creating gzip "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/GZip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v1, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    .end local v0    # "ioe":Ljava/io/IOException;
    .end local v1    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v4

    :goto_1
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v4

    .end local v2    # "zOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "zOut":Ljava/util/zip/GZIPOutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "zOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v2    # "zOut":Ljava/util/zip/GZIPOutputStream;
    goto :goto_1

    .line 45
    .end local v2    # "zOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v3    # "zOut":Ljava/util/zip/GZIPOutputStream;
    :catch_1
    move-exception v0

    move-object v2, v3

    .end local v3    # "zOut":Ljava/util/zip/GZIPOutputStream;
    .restart local v2    # "zOut":Ljava/util/zip/GZIPOutputStream;
    goto :goto_0
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/GZip;->class$org$apache$tools$ant$taskdefs$GZip:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.GZip"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/GZip;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/GZip;->class$org$apache$tools$ant$taskdefs$GZip:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/GZip;->class$org$apache$tools$ant$taskdefs$GZip:Ljava/lang/Class;

    goto :goto_0
.end method
