.class public Lorg/apache/tools/ant/types/ZipScanner;
.super Lorg/apache/tools/ant/types/ArchiveScanner;
.source "ZipScanner.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveScanner;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 62
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
.method protected fillMapsFromArchive(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 13
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "fileEntries"    # Ljava/util/Map;
    .param p4, "matchFileEntries"    # Ljava/util/Map;
    .param p5, "dirEntries"    # Ljava/util/Map;
    .param p6, "matchDirEntries"    # Ljava/util/Map;

    .prologue
    .line 58
    const/4 v2, 0x0

    .line 59
    .local v2, "entry":Lorg/apache/tools/zip/ZipEntry;
    const/4 v8, 0x0

    .line 61
    .local v8, "zf":Lorg/apache/tools/zip/ZipFile;
    const/4 v7, 0x0

    .line 62
    .local v7, "srcFile":Ljava/io/File;
    sget-object v10, Lorg/apache/tools/ant/types/ZipScanner;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v10, :cond_1

    const-string/jumbo v10, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v10}, Lorg/apache/tools/ant/types/ZipScanner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/types/ZipScanner;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v10}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 63
    .local v4, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v4, :cond_2

    .line 64
    invoke-interface {v4}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v7

    .line 71
    :try_start_0
    new-instance v9, Lorg/apache/tools/zip/ZipFile;

    invoke-direct {v9, v7, p2}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/util/zip/ZipException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 77
    .end local v8    # "zf":Lorg/apache/tools/zip/ZipFile;
    .local v9, "zf":Lorg/apache/tools/zip/ZipFile;
    :try_start_1
    invoke-virtual {v9}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v1

    .line 78
    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 79
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v10

    move-object v0, v10

    check-cast v0, Lorg/apache/tools/zip/ZipEntry;

    move-object v2, v0

    .line 80
    new-instance v6, Lorg/apache/tools/ant/types/resources/ZipResource;

    invoke-direct {v6, v7, p2, v2}, Lorg/apache/tools/ant/types/resources/ZipResource;-><init>(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipEntry;)V

    .line 81
    .local v6, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    .line 82
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 83
    invoke-static {v5}, Lorg/apache/tools/ant/types/ZipScanner;->trimSeparator(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 84
    move-object/from16 v0, p5

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/ZipScanner;->match(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 86
    move-object/from16 v0, p6

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 96
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "r":Lorg/apache/tools/ant/types/Resource;
    :catchall_0
    move-exception v10

    move-object v8, v9

    .end local v9    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v8    # "zf":Lorg/apache/tools/zip/ZipFile;
    :goto_2
    invoke-static {v8}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    throw v10

    .line 62
    .end local v4    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    sget-object v10, Lorg/apache/tools/ant/types/ZipScanner;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 66
    .restart local v4    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "Only file provider resources are supported"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 72
    :catch_0
    move-exception v3

    .line 73
    .local v3, "ex":Ljava/util/zip/ZipException;
    :try_start_2
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Problem reading "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 96
    .end local v3    # "ex":Ljava/util/zip/ZipException;
    :catchall_1
    move-exception v10

    goto :goto_2

    .line 74
    :catch_1
    move-exception v3

    .line 75
    .local v3, "ex":Ljava/io/IOException;
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Problem opening "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 89
    .end local v3    # "ex":Ljava/io/IOException;
    .end local v8    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v1    # "e":Ljava/util/Enumeration;
    .restart local v5    # "name":Ljava/lang/String;
    .restart local v6    # "r":Lorg/apache/tools/ant/types/Resource;
    .restart local v9    # "zf":Lorg/apache/tools/zip/ZipFile;
    :cond_3
    :try_start_3
    move-object/from16 v0, p3

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/ZipScanner;->match(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 91
    move-object/from16 v0, p4

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1

    .line 96
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_4
    invoke-static {v9}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    .line 98
    return-void
.end method
