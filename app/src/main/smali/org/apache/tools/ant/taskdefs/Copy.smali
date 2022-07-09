.class public Lorg/apache/tools/ant/taskdefs/Copy;
.super Lorg/apache/tools/ant/Task;
.source "Copy.java"


# static fields
.field static final LINE_SEPARATOR:Ljava/lang/String;

.field private static final MSG_WHEN_COPYING_EMPTY_RC_TO_FILE:Ljava/lang/String; = "Cannot perform operation from directory to file."

.field static final NULL_FILE_PLACEHOLDER:Ljava/io/File;

.field static class$java$io$IOException:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$Copy:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field protected completeDirMap:Ljava/util/Hashtable;

.field protected destDir:Ljava/io/File;

.field protected destFile:Ljava/io/File;

.field protected dirCopyMap:Ljava/util/Hashtable;

.field private enableMultipleMappings:Z

.field protected failonerror:Z

.field protected file:Ljava/io/File;

.field protected fileCopyMap:Ljava/util/Hashtable;

.field protected fileUtils:Lorg/apache/tools/ant/util/FileUtils;

.field protected filesets:Ljava/util/Vector;

.field private filterChains:Ljava/util/Vector;

.field private filterSets:Ljava/util/Vector;

.field protected filtering:Z

.field protected flatten:Z

.field private force:Z

.field protected forceOverwrite:Z

.field private granularity:J

.field protected includeEmpty:Z

.field private inputEncoding:Ljava/lang/String;

.field protected mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private outputEncoding:Ljava/lang/String;

.field protected preserveLastModified:Z

.field private quiet:Z

.field protected rcs:Ljava/util/Vector;

.field private singleResource:Lorg/apache/tools/ant/types/Resource;

.field protected verbosity:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 73
    new-instance v0, Ljava/io/File;

    const-string/jumbo v1, "/NULL_FILE"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    .line 74
    const-string/jumbo v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Copy;->LINE_SEPARATOR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 114
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 76
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    .line 77
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    .line 78
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    .line 79
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filesets:Ljava/util/Vector;

    .line 83
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->enableMultipleMappings:Z

    .line 84
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filtering:Z

    .line 85
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->preserveLastModified:Z

    .line 86
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    .line 87
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->flatten:Z

    .line 88
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->verbosity:I

    .line 89
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->includeEmpty:Z

    .line 90
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    .line 92
    new-instance v0, Lorg/apache/tools/ant/util/LinkedHashtable;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/LinkedHashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    .line 93
    new-instance v0, Lorg/apache/tools/ant/util/LinkedHashtable;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/LinkedHashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    .line 94
    new-instance v0, Lorg/apache/tools/ant/util/LinkedHashtable;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/LinkedHashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->completeDirMap:Ljava/util/Hashtable;

    .line 96
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 99
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filterChains:Ljava/util/Vector;

    .line 100
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filterSets:Ljava/util/Vector;

    .line 101
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    .line 102
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    .line 103
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->granularity:J

    .line 104
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->force:Z

    .line 105
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    .line 109
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    .line 115
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileUtils:Lorg/apache/tools/ant/util/FileUtils;

    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileUtils:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->granularity:J

    .line 117
    return-void
.end method

.method private static add(Ljava/io/File;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p0, "baseDir"    # Ljava/io/File;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "m"    # Ljava/util/Map;

    .prologue
    .line 1054
    if-eqz p1, :cond_0

    .line 1055
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/Copy;->add(Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)V

    .line 1057
    :cond_0
    return-void
.end method

.method private static add(Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .param p0, "baseDir"    # Ljava/io/File;
    .param p1, "names"    # [Ljava/lang/String;
    .param p2, "m"    # Ljava/util/Map;

    .prologue
    .line 1038
    if-eqz p1, :cond_1

    .line 1039
    invoke-static {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getKeyFile(Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    .line 1040
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1041
    .local v0, "l":Ljava/util/List;
    if-nez v0, :cond_0

    .line 1042
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "l":Ljava/util/List;
    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1043
    .restart local v0    # "l":Ljava/util/List;
    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1045
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1047
    .end local v0    # "l":Ljava/util/List;
    :cond_1
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 538
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

.method private copySingleFile()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 621
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    if-eqz v1, :cond_2

    .line 622
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 623
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    if-nez v1, :cond_0

    .line 624
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    .line 626
    :cond_0
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    iget-wide v4, p0, Lorg/apache/tools/ant/taskdefs/Copy;->granularity:J

    sub-long/2addr v2, v4

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-lez v1, :cond_3

    .line 629
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 647
    :cond_2
    :goto_0
    return-void

    .line 632
    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " omitted as "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is up to date."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 636
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Warning: Could not find file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to copy."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 638
    .local v0, "message":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    if-nez v1, :cond_5

    .line 639
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    if-nez v1, :cond_2

    .line 640
    invoke-virtual {p0, v0, v6}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 643
    :cond_5
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private getDueTo(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 4
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 1100
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    sget-object v2, Lorg/apache/tools/ant/taskdefs/Copy;->class$java$io$IOException:Ljava/lang/Class;

    if-nez v2, :cond_5

    const-string/jumbo v2, "java.io.IOException"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Copy;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/Copy;->class$java$io$IOException:Ljava/lang/Class;

    :goto_0
    if-ne v3, v2, :cond_6

    const/4 v0, 0x1

    .line 1101
    .local v0, "baseIOException":Z
    :goto_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 1102
    .local v1, "message":Ljava/lang/StringBuffer;
    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    .line 1103
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1105
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 1106
    if-nez v0, :cond_2

    .line 1107
    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1109
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1111
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "MalformedInput"

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_4

    .line 1112
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Copy;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1113
    const-string/jumbo v2, "This is normally due to the input file containing invalid"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1115
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Copy;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1116
    const-string/jumbo v2, "bytes for the character encoding used : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1117
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    if-nez v2, :cond_7

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileUtils:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2}, Lorg/apache/tools/ant/util/FileUtils;->getDefaultEncoding()Ljava/lang/String;

    move-result-object v2

    :goto_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1120
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Copy;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1122
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1100
    .end local v0    # "baseIOException":Z
    .end local v1    # "message":Ljava/lang/StringBuffer;
    :cond_5
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Copy;->class$java$io$IOException:Ljava/lang/Class;

    goto :goto_0

    :cond_6
    const/4 v0, 0x0

    goto :goto_1

    .line 1117
    .restart local v0    # "baseIOException":Z
    .restart local v1    # "message":Ljava/lang/StringBuffer;
    :cond_7
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    goto :goto_2
.end method

.method private static getKeyFile(Ljava/io/File;)Ljava/io/File;
    .locals 0
    .param p0, "f"    # Ljava/io/File;

    .prologue
    .line 1063
    if-nez p0, :cond_0

    sget-object p0, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    .end local p0    # "f":Ljava/io/File;
    :cond_0
    return-object p0
.end method

.method private getMapper()Lorg/apache/tools/ant/util/FileNameMapper;
    .locals 2

    .prologue
    .line 1071
    const/4 v0, 0x0

    .line 1072
    .local v0, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v1, :cond_0

    .line 1073
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    .line 1079
    :goto_0
    return-object v0

    .line 1074
    :cond_0
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->flatten:Z

    if-eqz v1, :cond_1

    .line 1075
    new-instance v0, Lorg/apache/tools/ant/util/FlatFileNameMapper;

    .end local v0    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-direct {v0}, Lorg/apache/tools/ant/util/FlatFileNameMapper;-><init>()V

    .restart local v0    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    goto :goto_0

    .line 1077
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/util/IdentityMapper;

    .end local v0    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-direct {v0}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    .restart local v0    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    goto :goto_0
.end method

.method private getMessage(Ljava/lang/Exception;)Ljava/lang/String;
    .locals 1
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 1089
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private iterateOverBaseDirs(Ljava/util/HashSet;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .locals 8
    .param p1, "baseDirs"    # Ljava/util/HashSet;
    .param p2, "dirsByBasedir"    # Ljava/util/HashMap;
    .param p3, "filesByBasedir"    # Ljava/util/HashMap;

    .prologue
    const/4 v7, 0x0

    .line 652
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 653
    .local v3, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 654
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 655
    .local v1, "f":Ljava/io/File;
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 656
    .local v2, "files":Ljava/util/List;
    invoke-virtual {p2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 658
    .local v0, "dirs":Ljava/util/List;
    new-array v5, v7, [Ljava/lang/String;

    .line 659
    .local v5, "srcFiles":[Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 660
    invoke-interface {v2, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "srcFiles":[Ljava/lang/String;
    check-cast v5, [Ljava/lang/String;

    .line 662
    .restart local v5    # "srcFiles":[Ljava/lang/String;
    :cond_0
    new-array v4, v7, [Ljava/lang/String;

    .line 663
    .local v4, "srcDirs":[Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 664
    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "srcDirs":[Ljava/lang/String;
    check-cast v4, [Ljava/lang/String;

    .line 666
    .restart local v4    # "srcDirs":[Ljava/lang/String;
    :cond_1
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    if-ne v1, v6, :cond_2

    const/4 v1, 0x0

    .end local v1    # "f":Ljava/io/File;
    :cond_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    invoke-virtual {p0, v1, v6, v5, v4}, Lorg/apache/tools/ant/taskdefs/Copy;->scan(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    .line 669
    .end local v0    # "dirs":Ljava/util/List;
    .end local v2    # "files":Ljava/util/List;
    .end local v4    # "srcDirs":[Ljava/lang/String;
    .end local v5    # "srcFiles":[Ljava/lang/String;
    :cond_3
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "res"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 346
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 347
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 369
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 370
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 337
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Copy;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 338
    return-void
.end method

.method protected buildMap([Lorg/apache/tools/ant/types/Resource;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)Ljava/util/Map;
    .locals 15
    .param p1, "fromResources"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "toDir"    # Ljava/io/File;
    .param p3, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 817
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 818
    .local v11, "map":Ljava/util/HashMap;
    const/4 v13, 0x0

    .line 819
    .local v13, "toCopy":[Lorg/apache/tools/ant/types/Resource;
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    if-eqz v2, :cond_2

    .line 820
    new-instance v14, Ljava/util/Vector;

    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    .line 821
    .local v14, "v":Ljava/util/Vector;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v8, v2, :cond_1

    .line 822
    aget-object v2, p1, v8

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 823
    aget-object v2, p1, v8

    invoke-virtual {v14, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 821
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 826
    :cond_1
    invoke-virtual {v14}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v13, v2, [Lorg/apache/tools/ant/types/Resource;

    .line 827
    invoke-virtual {v14, v13}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 839
    .end local v8    # "i":I
    .end local v14    # "v":Ljava/util/Vector;
    :goto_1
    const/4 v8, 0x0

    .restart local v8    # "i":I
    :goto_2
    array-length v2, v13

    if-ge v8, v2, :cond_7

    .line 840
    aget-object v2, v13, v8

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v12

    .line 841
    .local v12, "mappedFiles":[Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_3
    array-length v2, v12

    if-ge v9, v2, :cond_4

    .line 842
    aget-object v2, v12, v9

    if-nez v2, :cond_3

    .line 843
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Can\'t copy a resource without a name if the mapper doesn\'t provide one."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 829
    .end local v8    # "i":I
    .end local v9    # "j":I
    .end local v12    # "mappedFiles":[Ljava/lang/String;
    :cond_2
    new-instance v5, Lorg/apache/tools/ant/taskdefs/Copy$1;

    move-object/from16 v0, p2

    invoke-direct {v5, p0, v0}, Lorg/apache/tools/ant/taskdefs/Copy$1;-><init>(Lorg/apache/tools/ant/taskdefs/Copy;Ljava/io/File;)V

    iget-wide v6, p0, Lorg/apache/tools/ant/taskdefs/Copy;->granularity:J

    move-object v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p3

    invoke-static/range {v2 .. v7}, Lorg/apache/tools/ant/util/ResourceUtils;->selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;J)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v13

    goto :goto_1

    .line 841
    .restart local v8    # "i":I
    .restart local v9    # "j":I
    .restart local v12    # "mappedFiles":[Ljava/lang/String;
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 849
    :cond_4
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->enableMultipleMappings:Z

    if-nez v2, :cond_5

    .line 850
    aget-object v2, v13, v8

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    new-instance v5, Ljava/io/File;

    const/4 v6, 0x0

    aget-object v6, v12, v6

    move-object/from16 v0, p2

    invoke-direct {v5, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v11, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 839
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 854
    :cond_5
    const/4 v10, 0x0

    .local v10, "k":I
    :goto_5
    array-length v2, v12

    if-ge v10, v2, :cond_6

    .line 855
    new-instance v2, Ljava/io/File;

    aget-object v3, v12, v10

    move-object/from16 v0, p2

    invoke-direct {v2, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v12, v10

    .line 854
    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    .line 857
    :cond_6
    aget-object v2, v13, v8

    invoke-virtual {v11, v2, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 860
    .end local v9    # "j":I
    .end local v10    # "k":I
    .end local v12    # "mappedFiles":[Ljava/lang/String;
    :cond_7
    return-object v11
.end method

.method protected buildMap(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;Lorg/apache/tools/ant/util/FileNameMapper;Ljava/util/Hashtable;)V
    .locals 15
    .param p1, "fromDir"    # Ljava/io/File;
    .param p2, "toDir"    # Ljava/io/File;
    .param p3, "names"    # [Ljava/lang/String;
    .param p4, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p5, "map"    # Ljava/util/Hashtable;

    .prologue
    .line 775
    const/4 v13, 0x0

    .line 776
    .local v13, "toCopy":[Ljava/lang/String;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    if-eqz v4, :cond_2

    .line 777
    new-instance v14, Ljava/util/Vector;

    invoke-direct {v14}, Ljava/util/Vector;-><init>()V

    .line 778
    .local v14, "v":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    move-object/from16 v0, p3

    array-length v4, v0

    if-ge v2, v4, :cond_1

    .line 779
    aget-object v4, p3, v2

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 780
    aget-object v4, p3, v2

    invoke-virtual {v14, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 778
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 783
    :cond_1
    invoke-virtual {v14}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v13, v4, [Ljava/lang/String;

    .line 784
    invoke-virtual {v14, v13}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 789
    .end local v2    # "i":I
    .end local v14    # "v":Ljava/util/Vector;
    :goto_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    array-length v4, v13

    if-ge v2, v4, :cond_5

    .line 790
    new-instance v12, Ljava/io/File;

    aget-object v4, v13, v2

    move-object/from16 v0, p1

    invoke-direct {v12, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 791
    .local v12, "src":Ljava/io/File;
    aget-object v4, v13, v2

    move-object/from16 v0, p4

    invoke-interface {v0, v4}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 793
    .local v11, "mappedFiles":[Ljava/lang/String;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Copy;->enableMultipleMappings:Z

    if-nez v4, :cond_3

    .line 794
    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    new-instance v7, Ljava/io/File;

    const/4 v8, 0x0

    aget-object v8, v11, v8

    move-object/from16 v0, p2

    invoke-direct {v7, v0, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    move-object/from16 v0, p5

    invoke-virtual {v0, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 789
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 786
    .end local v2    # "i":I
    .end local v11    # "mappedFiles":[Ljava/lang/String;
    .end local v12    # "src":Ljava/io/File;
    :cond_2
    new-instance v3, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v3, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 787
    .local v3, "ds":Lorg/apache/tools/ant/util/SourceFileScanner;
    iget-wide v8, p0, Lorg/apache/tools/ant/taskdefs/Copy;->granularity:J

    move-object/from16 v4, p3

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p4

    invoke-virtual/range {v3 .. v9}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;J)[Ljava/lang/String;

    move-result-object v13

    goto :goto_1

    .line 798
    .end local v3    # "ds":Lorg/apache/tools/ant/util/SourceFileScanner;
    .restart local v2    # "i":I
    .restart local v11    # "mappedFiles":[Ljava/lang/String;
    .restart local v12    # "src":Ljava/io/File;
    :cond_3
    const/4 v10, 0x0

    .local v10, "k":I
    :goto_4
    array-length v4, v11

    if-ge v10, v4, :cond_4

    .line 799
    new-instance v4, Ljava/io/File;

    aget-object v5, v11, v10

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v11, v10

    .line 798
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 801
    :cond_4
    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p5

    invoke-virtual {v0, v4, v11}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 804
    .end local v10    # "k":I
    .end local v11    # "mappedFiles":[Ljava/lang/String;
    .end local v12    # "src":Ljava/io/File;
    :cond_5
    return-void
.end method

.method public createFilterChain()Lorg/apache/tools/ant/types/FilterChain;
    .locals 2

    .prologue
    .line 156
    new-instance v0, Lorg/apache/tools/ant/types/FilterChain;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FilterChain;-><init>()V

    .line 157
    .local v0, "filterChain":Lorg/apache/tools/ant/types/FilterChain;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filterChains:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 158
    return-object v0
.end method

.method public createFilterSet()Lorg/apache/tools/ant/types/FilterSet;
    .locals 2

    .prologue
    .line 166
    new-instance v0, Lorg/apache/tools/ant/types/FilterSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FilterSet;-><init>()V

    .line 167
    .local v0, "filterSet":Lorg/apache/tools/ant/types/FilterSet;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filterSets:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 168
    return-object v0
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 355
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 356
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 359
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 360
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method protected doFileOperations()V
    .locals 26

    .prologue
    .line 868
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->size()I

    move-result v2

    if-lez v2, :cond_7

    .line 869
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Copying "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " file"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->size()I

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_1

    const-string/jumbo v2, ""

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;)V

    .line 873
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v17

    .line 874
    .local v17, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 875
    invoke-interface/range {v17 .. v17}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 876
    .local v19, "fromFile":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, [Ljava/lang/String;

    .line 878
    .local v25, "toFiles":[Ljava/lang/String;
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_1
    move-object/from16 v0, v25

    array-length v2, v0

    move/from16 v0, v20

    if-ge v0, v2, :cond_0

    .line 879
    aget-object v24, v25, v20

    .line 881
    .local v24, "toFile":Ljava/lang/String;
    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 882
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Skipping self-copy of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->verbosity:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    .line 878
    :goto_2
    add-int/lit8 v20, v20, 0x1

    goto :goto_1

    .line 869
    .end local v17    # "e":Ljava/util/Enumeration;
    .end local v19    # "fromFile":Ljava/lang/String;
    .end local v20    # "i":I
    .end local v24    # "toFile":Ljava/lang/String;
    .end local v25    # "toFiles":[Ljava/lang/String;
    :cond_1
    const-string/jumbo v2, "s"

    goto :goto_0

    .line 886
    .restart local v17    # "e":Ljava/util/Enumeration;
    .restart local v19    # "fromFile":Ljava/lang/String;
    .restart local v20    # "i":I
    .restart local v24    # "toFile":Ljava/lang/String;
    .restart local v25    # "toFiles":[Ljava/lang/String;
    :cond_2
    :try_start_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Copying "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    iget v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->verbosity:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    .line 888
    new-instance v5, Lorg/apache/tools/ant/types/FilterSetCollection;

    invoke-direct {v5}, Lorg/apache/tools/ant/types/FilterSetCollection;-><init>()V

    .line 890
    .local v5, "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->filtering:Z

    if-eqz v2, :cond_3

    .line 891
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v2

    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V

    .line 894
    :cond_3
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->filterSets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v18

    .line 895
    .local v18, "filterEnum":Ljava/util/Enumeration;
    :goto_3
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 896
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/FilterSet;

    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 906
    .end local v5    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .end local v18    # "filterEnum":Ljava/util/Enumeration;
    :catch_0
    move-exception v21

    .line 907
    .local v21, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to copy "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " due to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Copy;->getDueTo(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    .line 909
    .local v22, "msg":Ljava/lang/String;
    new-instance v23, Ljava/io/File;

    invoke-direct/range {v23 .. v24}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 910
    .local v23, "targetFile":Ljava/io/File;
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_4

    .line 911
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " and I couldn\'t delete the corrupt "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, v24

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    .line 913
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    if-eqz v2, :cond_6

    .line 914
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-direct {v2, v0, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 899
    .end local v21    # "ioe":Ljava/io/IOException;
    .end local v22    # "msg":Ljava/lang/String;
    .end local v23    # "targetFile":Ljava/io/File;
    .restart local v5    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .restart local v18    # "filterEnum":Ljava/util/Enumeration;
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileUtils:Lorg/apache/tools/ant/util/FileUtils;

    new-instance v3, Ljava/io/File;

    move-object/from16 v0, v19

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v4, Ljava/io/File;

    move-object/from16 v0, v24

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/tools/ant/taskdefs/Copy;->filterChains:Ljava/util/Vector;

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    move-object/from16 v0, p0

    iget-boolean v8, v0, Lorg/apache/tools/ant/taskdefs/Copy;->preserveLastModified:Z

    const/4 v9, 0x0

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v11, v0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getForce()Z

    move-result v13

    invoke-virtual/range {v2 .. v13}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 916
    .end local v5    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .end local v18    # "filterEnum":Ljava/util/Enumeration;
    .restart local v21    # "ioe":Ljava/io/IOException;
    .restart local v22    # "msg":Ljava/lang/String;
    .restart local v23    # "targetFile":Ljava/io/File;
    :cond_6
    const/4 v2, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto/16 :goto_2

    .line 921
    .end local v17    # "e":Ljava/util/Enumeration;
    .end local v19    # "fromFile":Ljava/lang/String;
    .end local v20    # "i":I
    .end local v21    # "ioe":Ljava/io/IOException;
    .end local v22    # "msg":Ljava/lang/String;
    .end local v23    # "targetFile":Ljava/io/File;
    .end local v24    # "toFile":Ljava/lang/String;
    .end local v25    # "toFiles":[Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->includeEmpty:Z

    if-eqz v2, :cond_c

    .line 922
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v17

    .line 923
    .restart local v17    # "e":Ljava/util/Enumeration;
    const/4 v14, 0x0

    .line 924
    .local v14, "createCount":I
    :cond_8
    invoke-interface/range {v17 .. v17}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_b

    .line 925
    invoke-interface/range {v17 .. v17}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, [Ljava/lang/String;

    .line 926
    .local v16, "dirs":[Ljava/lang/String;
    const/16 v20, 0x0

    .restart local v20    # "i":I
    :goto_4
    move-object/from16 v0, v16

    array-length v2, v0

    move/from16 v0, v20

    if-ge v0, v2, :cond_8

    .line 927
    new-instance v15, Ljava/io/File;

    aget-object v2, v16, v20

    invoke-direct {v15, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 928
    .local v15, "d":Ljava/io/File;
    invoke-virtual {v15}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_9

    .line 929
    invoke-virtual {v15}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_a

    .line 930
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to create directory "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v15}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    .line 926
    :cond_9
    :goto_5
    add-int/lit8 v20, v20, 0x1

    goto :goto_4

    .line 933
    :cond_a
    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    .line 938
    .end local v15    # "d":Ljava/io/File;
    .end local v16    # "dirs":[Ljava/lang/String;
    .end local v20    # "i":I
    :cond_b
    if-lez v14, :cond_c

    .line 939
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Copied "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " empty director"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->size()I

    move-result v2

    const/4 v4, 0x1

    if-ne v2, v4, :cond_d

    const-string/jumbo v2, "y"

    :goto_6
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " empty director"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/4 v2, 0x1

    if-ne v14, v2, :cond_e

    const-string/jumbo v2, "y"

    :goto_7
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " under "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;)V

    .line 948
    .end local v14    # "createCount":I
    .end local v17    # "e":Ljava/util/Enumeration;
    :cond_c
    return-void

    .line 939
    .restart local v14    # "createCount":I
    .restart local v17    # "e":Ljava/util/Enumeration;
    :cond_d
    const-string/jumbo v2, "ies"

    goto :goto_6

    :cond_e
    const-string/jumbo v2, "ies"

    goto :goto_7
.end method

.method protected doResourceOperations(Ljava/util/Map;)V
    .locals 21
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 957
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->size()I

    move-result v3

    if-lez v3, :cond_6

    .line 958
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Copying "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->size()I

    move-result v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " resource"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->size()I

    move-result v3

    const/4 v6, 0x1

    if-ne v3, v6, :cond_3

    const-string/jumbo v3, ""

    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " to "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;)V

    .line 962
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .line 963
    .local v16, "iter":Ljava/util/Iterator;
    :cond_0
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 964
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 965
    .local v2, "fromResource":Lorg/apache/tools/ant/types/Resource;
    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, [Ljava/lang/String;

    .line 967
    .local v20, "toFiles":[Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1
    move-object/from16 v0, v20

    array-length v3, v0

    if-ge v14, v3, :cond_0

    .line 968
    aget-object v19, v20, v14

    .line 971
    .local v19, "toFile":Ljava/lang/String;
    :try_start_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Copying "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " to "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget v5, v0, Lorg/apache/tools/ant/taskdefs/Copy;->verbosity:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v5}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    .line 974
    new-instance v4, Lorg/apache/tools/ant/types/FilterSetCollection;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/FilterSetCollection;-><init>()V

    .line 976
    .local v4, "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->filtering:Z

    if-eqz v3, :cond_1

    .line 977
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v3

    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V

    .line 980
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->filterSets:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v13

    .line 981
    .local v13, "filterEnum":Ljava/util/Enumeration;
    :goto_2
    invoke-interface {v13}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 982
    invoke-interface {v13}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/FilterSet;

    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 997
    .end local v4    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .end local v13    # "filterEnum":Ljava/util/Enumeration;
    :catch_0
    move-exception v15

    .line 998
    .local v15, "ioe":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed to copy "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " to "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " due to "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/taskdefs/Copy;->getDueTo(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1001
    .local v17, "msg":Ljava/lang/String;
    new-instance v18, Ljava/io/File;

    invoke-direct/range {v18 .. v19}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1002
    .local v18, "targetFile":Ljava/io/File;
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1003
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, " and I couldn\'t delete the corrupt "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1005
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    if-eqz v3, :cond_5

    .line 1006
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    move-object/from16 v0, v17

    invoke-direct {v3, v0, v15, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 958
    .end local v2    # "fromResource":Lorg/apache/tools/ant/types/Resource;
    .end local v14    # "i":I
    .end local v15    # "ioe":Ljava/io/IOException;
    .end local v16    # "iter":Ljava/util/Iterator;
    .end local v17    # "msg":Ljava/lang/String;
    .end local v18    # "targetFile":Ljava/io/File;
    .end local v19    # "toFile":Ljava/lang/String;
    .end local v20    # "toFiles":[Ljava/lang/String;
    :cond_3
    const-string/jumbo v3, "s"

    goto/16 :goto_0

    .line 985
    .restart local v2    # "fromResource":Lorg/apache/tools/ant/types/Resource;
    .restart local v4    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .restart local v13    # "filterEnum":Ljava/util/Enumeration;
    .restart local v14    # "i":I
    .restart local v16    # "iter":Ljava/util/Iterator;
    .restart local v19    # "toFile":Ljava/lang/String;
    .restart local v20    # "toFiles":[Ljava/lang/String;
    :cond_4
    :try_start_1
    new-instance v3, Lorg/apache/tools/ant/types/resources/FileResource;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    move-object/from16 v0, v19

    invoke-direct {v3, v5, v0}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/Copy;->filterChains:Ljava/util/Vector;

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/apache/tools/ant/taskdefs/Copy;->preserveLastModified:Z

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getForce()Z

    move-result v12

    invoke-static/range {v2 .. v12}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 967
    .end local v4    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .end local v13    # "filterEnum":Ljava/util/Enumeration;
    :goto_3
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_1

    .line 1008
    .restart local v15    # "ioe":Ljava/io/IOException;
    .restart local v17    # "msg":Ljava/lang/String;
    .restart local v18    # "targetFile":Ljava/io/File;
    :cond_5
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 1013
    .end local v2    # "fromResource":Lorg/apache/tools/ant/types/Resource;
    .end local v14    # "i":I
    .end local v15    # "ioe":Ljava/io/IOException;
    .end local v16    # "iter":Ljava/util/Iterator;
    .end local v17    # "msg":Ljava/lang/String;
    .end local v18    # "targetFile":Ljava/io/File;
    .end local v19    # "toFile":Ljava/lang/String;
    .end local v20    # "toFiles":[Ljava/lang/String;
    :cond_6
    return-void
.end method

.method public execute()V
    .locals 33
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    move-object/from16 v24, v0

    .line 433
    .local v24, "savedFile":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    move-object/from16 v23, v0

    .line 434
    .local v23, "savedDestFile":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    move-object/from16 v22, v0

    .line 435
    .local v22, "savedDestDir":Ljava/io/File;
    const/16 v25, 0x0

    .line 436
    .local v25, "savedRc":Lorg/apache/tools/ant/types/ResourceCollection;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    move-object/from16 v29, v0

    if-nez v29, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    move-object/from16 v29, v0

    if-eqz v29, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/Vector;->size()I

    move-result v29

    const/16 v30, 0x1

    move/from16 v0, v29

    move/from16 v1, v30

    if-ne v0, v1, :cond_0

    .line 438
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    invoke-virtual/range {v29 .. v30}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v25

    .end local v25    # "savedRc":Lorg/apache/tools/ant/types/ResourceCollection;
    check-cast v25, Lorg/apache/tools/ant/types/ResourceCollection;

    .line 444
    .restart local v25    # "savedRc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_0
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->validateAttributes()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    :try_start_1
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->copySingleFile()V

    .line 476
    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    .line 477
    .local v8, "filesByBasedir":Ljava/util/HashMap;
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 478
    .local v5, "dirsByBasedir":Ljava/util/HashMap;
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 479
    .local v4, "baseDirs":Ljava/util/HashSet;
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 480
    .local v17, "nonFileResources":Ljava/util/ArrayList;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/Vector;->size()I

    move-result v26

    .line 481
    .local v26, "size":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_0
    move/from16 v0, v26

    if-ge v13, v0, :cond_13

    .line 482
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    invoke-virtual {v0, v13}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/apache/tools/ant/types/ResourceCollection;

    .line 485
    .local v20, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    move-object/from16 v0, v20

    instance-of v0, v0, Lorg/apache/tools/ant/types/FileSet;

    move/from16 v29, v0

    if-eqz v29, :cond_9

    invoke-interface/range {v20 .. v20}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v29

    if-eqz v29, :cond_9

    .line 486
    move-object/from16 v0, v20

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    move-object v12, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 487
    .local v12, "fs":Lorg/apache/tools/ant/types/FileSet;
    const/4 v6, 0x0

    .line 489
    .local v6, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    :try_start_2
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    .line 502
    :try_start_3
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v29

    move-object/from16 v0, v29

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v11

    .line 504
    .local v11, "fromDir":Ljava/io/File;
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v28

    .line 505
    .local v28, "srcFiles":[Ljava/lang/String;
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v27

    .line 506
    .local v27, "srcDirs":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->flatten:Z

    move/from16 v29, v0

    if-nez v29, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    move-object/from16 v29, v0

    if-nez v29, :cond_1

    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->isEverythingIncluded()Z

    move-result v29

    if-eqz v29, :cond_1

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/FileSet;->hasPatterns()Z

    move-result v29

    if-nez v29, :cond_1

    .line 508
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    move-object/from16 v30, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v11, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    :cond_1
    move-object/from16 v0, v28

    invoke-static {v11, v0, v8}, Lorg/apache/tools/ant/taskdefs/Copy;->add(Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)V

    .line 511
    move-object/from16 v0, v27

    invoke-static {v11, v0, v5}, Lorg/apache/tools/ant/taskdefs/Copy;->add(Ljava/io/File;[Ljava/lang/String;Ljava/util/Map;)V

    .line 512
    invoke-virtual {v4, v11}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 481
    .end local v6    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v11    # "fromDir":Ljava/io/File;
    .end local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v27    # "srcDirs":[Ljava/lang/String;
    .end local v28    # "srcFiles":[Ljava/lang/String;
    :cond_2
    :goto_1
    add-int/lit8 v13, v13, 0x1

    goto :goto_0

    .line 445
    .end local v4    # "baseDirs":Ljava/util/HashSet;
    .end local v5    # "dirsByBasedir":Ljava/util/HashMap;
    .end local v8    # "filesByBasedir":Ljava/util/HashMap;
    .end local v13    # "i":I
    .end local v17    # "nonFileResources":Ljava/util/ArrayList;
    .end local v20    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .end local v26    # "size":I
    :catch_0
    move-exception v7

    .line 446
    .local v7, "e":Lorg/apache/tools/ant/BuildException;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    move/from16 v29, v0

    if-nez v29, :cond_3

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Copy;->getMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v29

    const-string/jumbo v30, "Cannot perform operation from directory to file."

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-nez v29, :cond_5

    .line 449
    :cond_3
    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 602
    .end local v7    # "e":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v29

    const/16 v30, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    .line 603
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    .line 604
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    .line 605
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    .line 606
    if-eqz v25, :cond_4

    .line 607
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 609
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/Hashtable;->clear()V

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/Hashtable;->clear()V

    .line 611
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v30, v0

    invoke-virtual/range {v30 .. v30}, Ljava/util/Hashtable;->clear()V

    .line 602
    throw v29

    .line 451
    .restart local v7    # "e":Lorg/apache/tools/ant/BuildException;
    :cond_5
    :try_start_4
    new-instance v29, Ljava/lang/StringBuffer;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v30, "Warning: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Copy;->getMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 602
    const/16 v29, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    .line 603
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    .line 604
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    .line 605
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    .line 606
    if-eqz v25, :cond_6

    .line 607
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, v25

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 609
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->clear()V

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->clear()V

    .line 611
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    .end local v7    # "e":Lorg/apache/tools/ant/BuildException;
    :goto_2
    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->clear()V

    .line 613
    return-void

    .line 490
    .restart local v4    # "baseDirs":Ljava/util/HashSet;
    .restart local v5    # "dirsByBasedir":Ljava/util/HashMap;
    .restart local v6    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v8    # "filesByBasedir":Ljava/util/HashMap;
    .restart local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .restart local v13    # "i":I
    .restart local v17    # "nonFileResources":Ljava/util/ArrayList;
    .restart local v20    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .restart local v26    # "size":I
    :catch_1
    move-exception v7

    .line 491
    .restart local v7    # "e":Lorg/apache/tools/ant/BuildException;
    :try_start_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    move/from16 v29, v0

    if-nez v29, :cond_7

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Copy;->getMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v29

    const-string/jumbo v30, " does not exist."

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v29

    if-nez v29, :cond_8

    .line 494
    :cond_7
    throw v7

    .line 496
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    move/from16 v29, v0

    if-nez v29, :cond_2

    .line 497
    new-instance v29, Ljava/lang/StringBuffer;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v30, "Warning: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Copy;->getMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 515
    .end local v6    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v7    # "e":Lorg/apache/tools/ant/BuildException;
    .end local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    :cond_9
    invoke-interface/range {v20 .. v20}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v29

    if-nez v29, :cond_a

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->supportsNonFileResources()Z

    move-result v29

    if-nez v29, :cond_a

    .line 516
    new-instance v29, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v30, "Only FileSystem resources are supported."

    invoke-direct/range {v29 .. v30}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v29

    .line 520
    :cond_a
    invoke-interface/range {v20 .. v20}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v21

    .line 521
    .local v21, "resources":Ljava/util/Iterator;
    :cond_b
    :goto_3
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v29

    if-eqz v29, :cond_2

    .line 522
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/tools/ant/types/Resource;

    .line 523
    .local v19, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v29

    if-nez v29, :cond_d

    .line 524
    new-instance v29, Ljava/lang/StringBuffer;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v30, "Warning: Could not find resource "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    const-string/jumbo v30, " to copy."

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 526
    .local v15, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    move/from16 v29, v0

    if-nez v29, :cond_c

    .line 527
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    move/from16 v29, v0

    if-nez v29, :cond_b

    .line 528
    const/16 v29, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v29

    invoke-virtual {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 531
    :cond_c
    new-instance v29, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v29

    invoke-direct {v0, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v29

    .line 536
    .end local v15    # "message":Ljava/lang/String;
    :cond_d
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    .line 537
    .local v3, "baseDir":Ljava/io/File;
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v16

    .line 538
    .local v16, "name":Ljava/lang/String;
    sget-object v29, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v29, :cond_10

    const-string/jumbo v29, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v29 .. v29}, Lorg/apache/tools/ant/taskdefs/Copy;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v29

    sput-object v29, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_4
    move-object/from16 v0, v19

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 539
    .local v9, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v9, :cond_e

    .line 540
    invoke-static {v9}, Lorg/apache/tools/ant/util/ResourceUtils;->asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v10

    .line 541
    .local v10, "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lorg/apache/tools/ant/taskdefs/Copy;->getKeyFile(Ljava/io/File;)Ljava/io/File;

    move-result-object v3

    .line 542
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v29

    if-nez v29, :cond_e

    .line 543
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v16

    .line 550
    .end local v10    # "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_e
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v29

    if-nez v29, :cond_f

    if-eqz v9, :cond_12

    .line 551
    :cond_f
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v29

    if-eqz v29, :cond_11

    move-object/from16 v29, v5

    :goto_5
    move-object/from16 v0, v16

    move-object/from16 v1, v29

    invoke-static {v3, v0, v1}, Lorg/apache/tools/ant/taskdefs/Copy;->add(Ljava/io/File;Ljava/lang/String;Ljava/util/Map;)V

    .line 554
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 538
    .end local v9    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_10
    sget-object v29, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_4

    .restart local v9    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_11
    move-object/from16 v29, v8

    .line 551
    goto :goto_5

    .line 557
    :cond_12
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_3

    .line 563
    .end local v3    # "baseDir":Ljava/io/File;
    .end local v9    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v16    # "name":Ljava/lang/String;
    .end local v19    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v20    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .end local v21    # "resources":Ljava/util/Iterator;
    :cond_13
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5, v8}, Lorg/apache/tools/ant/taskdefs/Copy;->iterateOverBaseDirs(Ljava/util/HashSet;Ljava/util/HashMap;Ljava/util/HashMap;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 567
    :try_start_6
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Copy;->doFileOperations()V
    :try_end_6
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 578
    :cond_14
    :goto_6
    :try_start_7
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v29

    if-gtz v29, :cond_15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v29, v0

    if-eqz v29, :cond_17

    .line 579
    :cond_15
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v29

    move/from16 v0, v29

    new-array v0, v0, [Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v29, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v18

    check-cast v18, [Lorg/apache/tools/ant/types/Resource;

    .line 582
    .local v18, "nonFiles":[Lorg/apache/tools/ant/types/Resource;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    move-object/from16 v29, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v29

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->scan([Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)Ljava/util/Map;

    move-result-object v14

    .line 583
    .local v14, "map":Ljava/util/Map;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v29, v0

    if-eqz v29, :cond_16

    .line 584
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v29, v0

    const/16 v30, 0x1

    move/from16 v0, v30

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v30, v0

    const/16 v31, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v32

    aput-object v32, v30, v31

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-interface {v14, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 588
    :cond_16
    :try_start_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/apache/tools/ant/taskdefs/Copy;->doResourceOperations(Ljava/util/Map;)V
    :try_end_8
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 602
    .end local v14    # "map":Ljava/util/Map;
    .end local v18    # "nonFiles":[Lorg/apache/tools/ant/types/Resource;
    :cond_17
    :goto_7
    const/16 v29, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    .line 603
    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    .line 604
    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    .line 605
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    .line 606
    if-eqz v25, :cond_18

    .line 607
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    move-object/from16 v29, v0

    const/16 v30, 0x0

    move-object/from16 v0, v29

    move-object/from16 v1, v25

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 609
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->clear()V

    .line 610
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    invoke-virtual/range {v29 .. v29}, Ljava/util/Hashtable;->clear()V

    .line 611
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v29, v0

    goto/16 :goto_2

    .line 568
    :catch_2
    move-exception v7

    .line 569
    .restart local v7    # "e":Lorg/apache/tools/ant/BuildException;
    :try_start_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    move/from16 v29, v0

    if-nez v29, :cond_19

    .line 570
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    move/from16 v29, v0

    if-nez v29, :cond_14

    .line 571
    new-instance v29, Ljava/lang/StringBuffer;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v30, "Warning: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Copy;->getMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto/16 :goto_6

    .line 574
    :cond_19
    throw v7

    .line 589
    .end local v7    # "e":Lorg/apache/tools/ant/BuildException;
    .restart local v14    # "map":Ljava/util/Map;
    .restart local v18    # "nonFiles":[Lorg/apache/tools/ant/types/Resource;
    :catch_3
    move-exception v7

    .line 590
    .restart local v7    # "e":Lorg/apache/tools/ant/BuildException;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    move/from16 v29, v0

    if-nez v29, :cond_1a

    .line 591
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    move/from16 v29, v0

    if-nez v29, :cond_17

    .line 592
    new-instance v29, Ljava/lang/StringBuffer;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v30, "Warning: "

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Copy;->getMessage(Ljava/lang/Exception;)Ljava/lang/String;

    move-result-object v30

    invoke-virtual/range {v29 .. v30}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v29

    const/16 v30, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v30

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Copy;->log(Ljava/lang/String;I)V

    goto/16 :goto_7

    .line 595
    :cond_1a
    throw v7
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 391
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    return-object v0
.end method

.method protected getFileUtils()Lorg/apache/tools/ant/util/FileUtils;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileUtils:Lorg/apache/tools/ant/util/FileUtils;

    return-object v0
.end method

.method protected getFilterChains()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filterChains:Ljava/util/Vector;

    return-object v0
.end method

.method protected getFilterSets()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filterSets:Ljava/util/Vector;

    return-object v0
.end method

.method public getForce()Z
    .locals 1

    .prologue
    .line 255
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->force:Z

    return v0
.end method

.method public getOutputEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getPreserveLastModified()Z
    .locals 1

    .prologue
    .line 199
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->preserveLastModified:Z

    return v0
.end method

.method public isEnableMultipleMapping()Z
    .locals 1

    .prologue
    .line 320
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->enableMultipleMappings:Z

    return v0
.end method

.method protected scan([Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)Ljava/util/Map;
    .locals 1
    .param p1, "fromResources"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "toDir"    # Ljava/io/File;

    .prologue
    .line 761
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/Copy;->buildMap([Lorg/apache/tools/ant/types/Resource;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected scan(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .param p1, "fromDir"    # Ljava/io/File;
    .param p2, "toDir"    # Ljava/io/File;
    .param p3, "files"    # [Ljava/lang/String;
    .param p4, "dirs"    # [Ljava/lang/String;

    .prologue
    .line 740
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v4

    .line 741
    .local v4, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Copy;->fileCopyMap:Ljava/util/Hashtable;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Copy;->buildMap(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;Lorg/apache/tools/ant/util/FileNameMapper;Ljava/util/Hashtable;)V

    .line 743
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->includeEmpty:Z

    if-eqz v0, :cond_0

    .line 744
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Copy;->dirCopyMap:Ljava/util/Hashtable;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Copy;->buildMap(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;Lorg/apache/tools/ant/util/FileNameMapper;Ljava/util/Hashtable;)V

    .line 746
    :cond_0
    return-void
.end method

.method public setEnableMultipleMappings(Z)V
    .locals 0
    .param p1, "enableMultipleMappings"    # Z

    .prologue
    .line 312
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->enableMultipleMappings:Z

    .line 313
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 378
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->inputEncoding:Ljava/lang/String;

    .line 379
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 380
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    .line 382
    :cond_0
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failonerror"    # Z

    .prologue
    .line 329
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->failonerror:Z

    .line 330
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 132
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    .line 133
    return-void
.end method

.method public setFiltering(Z)V
    .locals 0
    .param p1, "filtering"    # Z

    .prologue
    .line 225
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->filtering:Z

    .line 226
    return-void
.end method

.method public setFlatten(Z)V
    .locals 0
    .param p1, "flatten"    # Z

    .prologue
    .line 268
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->flatten:Z

    .line 269
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "f"    # Z

    .prologue
    .line 246
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->force:Z

    .line 247
    return-void
.end method

.method public setGranularity(J)V
    .locals 1
    .param p1, "granularity"    # J

    .prologue
    .line 424
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->granularity:J

    .line 425
    return-void
.end method

.method public setIncludeEmptyDirs(Z)V
    .locals 0
    .param p1, "includeEmpty"    # Z

    .prologue
    .line 285
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->includeEmpty:Z

    .line 286
    return-void
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 400
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->outputEncoding:Ljava/lang/String;

    .line 401
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 0
    .param p1, "overwrite"    # Z

    .prologue
    .line 235
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->forceOverwrite:Z

    .line 236
    return-void
.end method

.method public setPreserveLastModified(Ljava/lang/String;)V
    .locals 1
    .param p1, "preserve"    # Ljava/lang/String;

    .prologue
    .line 180
    invoke-static {p1}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Copy;->setPreserveLastModified(Z)V

    .line 181
    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0
    .param p1, "preserve"    # Z

    .prologue
    .line 188
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->preserveLastModified:Z

    .line 189
    return-void
.end method

.method public setQuiet(Z)V
    .locals 0
    .param p1, "quiet"    # Z

    .prologue
    .line 297
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->quiet:Z

    .line 298
    return-void
.end method

.method public setTodir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 148
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    .line 149
    return-void
.end method

.method public setTofile(Ljava/io/File;)V
    .locals 0
    .param p1, "destFile"    # Ljava/io/File;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    .line 141
    return-void
.end method

.method public setVerbose(Z)V
    .locals 1
    .param p1, "verbose"    # Z

    .prologue
    .line 277
    if-eqz p1, :cond_0

    const/4 v0, 0x2

    :goto_0
    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Copy;->verbosity:I

    .line 278
    return-void

    .line 277
    :cond_0
    const/4 v0, 0x3

    goto :goto_0
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 1030
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$taskdefs$Copy:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.Copy"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Copy;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$taskdefs$Copy:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$taskdefs$Copy:Ljava/lang/Class;

    goto :goto_0
.end method

.method protected validateAttributes()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 678
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    if-nez v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-nez v3, :cond_0

    .line 679
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Specify at least one source--a file or a resource collection."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 682
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    if-eqz v3, :cond_1

    .line 683
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Only one of tofile and todir may be set."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 686
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    if-nez v3, :cond_2

    .line 687
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "One of tofile or todir must be set."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 689
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 690
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Use a resource collection to copy directories."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 692
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-lez v3, :cond_7

    .line 693
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-le v3, v5, :cond_4

    .line 694
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Cannot concatenate multiple files into a single file."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 697
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    invoke-virtual {v3, v4}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ResourceCollection;

    .line 698
    .local v1, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->supportsNonFileResources()Z

    move-result v3

    if-nez v3, :cond_5

    .line 699
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Only FileSystem resources are supported."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 702
    :cond_5
    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v3

    if-nez v3, :cond_6

    .line 703
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Cannot perform operation from directory to file."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 704
    :cond_6
    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v3

    if-ne v3, v5, :cond_c

    .line 705
    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 706
    .local v2, "res":Lorg/apache/tools/ant/types/Resource;
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_9

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Copy;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 707
    .local v0, "r":Lorg/apache/tools/ant/types/resources/FileProvider;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    if-nez v3, :cond_b

    .line 708
    if-eqz v0, :cond_a

    .line 709
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->file:Ljava/io/File;

    .line 713
    :goto_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->rcs:Ljava/util/Vector;

    invoke-virtual {v3, v4}, Ljava/util/Vector;->removeElementAt(I)V

    .line 724
    .end local v0    # "r":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v1    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .end local v2    # "res":Lorg/apache/tools/ant/types/Resource;
    :cond_7
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    if-eqz v3, :cond_8

    .line 725
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copy;->destDir:Ljava/io/File;

    .line 727
    :cond_8
    return-void

    .line 706
    .restart local v1    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    .restart local v2    # "res":Lorg/apache/tools/ant/types/Resource;
    :cond_9
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Copy;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 711
    .restart local v0    # "r":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_a
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copy;->singleResource:Lorg/apache/tools/ant/types/Resource;

    goto :goto_1

    .line 715
    :cond_b
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Cannot concatenate multiple files into a single file."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 719
    .end local v0    # "r":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v2    # "res":Lorg/apache/tools/ant/types/Resource;
    :cond_c
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Cannot concatenate multiple files into a single file."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
