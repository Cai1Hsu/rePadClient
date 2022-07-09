.class public Lorg/apache/tools/ant/types/TarScanner;
.super Lorg/apache/tools/ant/types/ArchiveScanner;
.source "TarScanner.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;-><init>()V

    return-void
.end method


# virtual methods
.method protected fillMapsFromArchive(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 9
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "fileEntries"    # Ljava/util/Map;
    .param p4, "matchFileEntries"    # Ljava/util/Map;
    .param p5, "dirEntries"    # Ljava/util/Map;
    .param p6, "matchDirEntries"    # Ljava/util/Map;

    .prologue
    .line 55
    const/4 v0, 0x0

    .line 56
    .local v0, "entry":Lorg/apache/tools/tar/TarEntry;
    const/4 v4, 0x0

    .line 60
    .local v4, "ti":Lorg/apache/tools/tar/TarInputStream;
    :try_start_0
    new-instance v5, Lorg/apache/tools/tar/TarInputStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/tar/TarInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .end local v4    # "ti":Lorg/apache/tools/tar/TarInputStream;
    .local v5, "ti":Lorg/apache/tools/tar/TarInputStream;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v5}, Lorg/apache/tools/tar/TarInputStream;->getNextEntry()Lorg/apache/tools/tar/TarEntry;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 65
    new-instance v3, Lorg/apache/tools/ant/types/resources/TarResource;

    invoke-direct {v3, p1, v0}, Lorg/apache/tools/ant/types/resources/TarResource;-><init>(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/tar/TarEntry;)V

    .line 66
    .local v3, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v0}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 67
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/apache/tools/tar/TarEntry;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 68
    invoke-static {v2}, Lorg/apache/tools/ant/types/TarScanner;->trimSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 69
    invoke-interface {p5, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/TarScanner;->match(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 71
    invoke-interface {p6, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 80
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "r":Lorg/apache/tools/ant/types/Resource;
    :catch_0
    move-exception v1

    move-object v4, v5

    .line 81
    .end local v5    # "ti":Lorg/apache/tools/tar/TarInputStream;
    .local v1, "ex":Ljava/io/IOException;
    .restart local v4    # "ti":Lorg/apache/tools/tar/TarInputStream;
    :goto_1
    :try_start_2
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "problem reading "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/types/TarScanner;->srcFile:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_2
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v6

    .line 61
    :catch_1
    move-exception v1

    .line 62
    .restart local v1    # "ex":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "problem opening "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/types/TarScanner;->srcFile:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 80
    :catch_2
    move-exception v1

    goto :goto_1

    .line 74
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v4    # "ti":Lorg/apache/tools/tar/TarInputStream;
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "r":Lorg/apache/tools/ant/types/Resource;
    .restart local v5    # "ti":Lorg/apache/tools/tar/TarInputStream;
    :cond_1
    :try_start_4
    invoke-interface {p3, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/TarScanner;->match(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 76
    invoke-interface {p4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 83
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "r":Lorg/apache/tools/ant/types/Resource;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "ti":Lorg/apache/tools/tar/TarInputStream;
    .restart local v4    # "ti":Lorg/apache/tools/tar/TarInputStream;
    goto :goto_2

    .end local v4    # "ti":Lorg/apache/tools/tar/TarInputStream;
    .restart local v5    # "ti":Lorg/apache/tools/tar/TarInputStream;
    :cond_2
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 85
    return-void
.end method
