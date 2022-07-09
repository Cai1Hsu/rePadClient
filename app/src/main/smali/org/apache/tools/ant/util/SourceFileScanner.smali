.class public Lorg/apache/tools/ant/util/SourceFileScanner;
.super Ljava/lang/Object;
.source "SourceFileScanner.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceFactory;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private destDir:Ljava/io/File;

.field protected task:Lorg/apache/tools/ant/Task;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/SourceFileScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/tools/ant/util/SourceFileScanner;->task:Lorg/apache/tools/ant/Task;

    .line 52
    return-void
.end method


# virtual methods
.method public getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 168
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    iget-object v1, p0, Lorg/apache/tools/ant/util/SourceFileScanner;->destDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;
    .locals 8
    .param p1, "files"    # [Ljava/lang/String;
    .param p2, "srcDir"    # Ljava/io/File;
    .param p3, "destDir"    # Ljava/io/File;
    .param p4, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 68
    sget-object v0, Lorg/apache/tools/ant/util/SourceFileScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;J)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;J)[Ljava/lang/String;
    .locals 15
    .param p1, "files"    # [Ljava/lang/String;
    .param p2, "srcDir"    # Ljava/io/File;
    .param p3, "destDir"    # Ljava/io/File;
    .param p4, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p5, "granularity"    # J

    .prologue
    .line 91
    move-object/from16 v0, p3

    iput-object v0, p0, Lorg/apache/tools/ant/util/SourceFileScanner;->destDir:Ljava/io/File;

    .line 92
    new-instance v13, Ljava/util/Vector;

    invoke-direct {v13}, Ljava/util/Vector;-><init>()V

    .line 93
    .local v13, "v":Ljava/util/Vector;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v2, v0

    if-ge v9, v2, :cond_0

    .line 94
    aget-object v10, p1, v9

    .line 95
    .local v10, "name":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/util/SourceFileScanner$1;

    move-object/from16 v0, p2

    invoke-direct {v2, p0, v0, v10, v10}, Lorg/apache/tools/ant/util/SourceFileScanner$1;-><init>(Lorg/apache/tools/ant/util/SourceFileScanner;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v13, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 93
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 101
    .end local v10    # "name":Ljava/lang/String;
    :cond_0
    invoke-virtual {v13}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v3, v2, [Lorg/apache/tools/ant/types/Resource;

    .line 102
    .local v3, "sourceresources":[Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v13, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 106
    iget-object v2, p0, Lorg/apache/tools/ant/util/SourceFileScanner;->task:Lorg/apache/tools/ant/Task;

    move-object/from16 v4, p4

    move-object v5, p0

    move-wide/from16 v6, p5

    invoke-static/range {v2 .. v7}, Lorg/apache/tools/ant/util/ResourceUtils;->selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;J)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v11

    .line 109
    .local v11, "outofdate":[Lorg/apache/tools/ant/types/Resource;
    array-length v2, v11

    new-array v12, v2, [Ljava/lang/String;

    .line 110
    .local v12, "result":[Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, "counter":I
    :goto_1
    array-length v2, v11

    if-ge v8, v2, :cond_1

    .line 111
    aget-object v2, v11, v8

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v12, v8

    .line 110
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 113
    :cond_1
    return-object v12
.end method

.method public restrictAsFiles([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/io/File;
    .locals 8
    .param p1, "files"    # [Ljava/lang/String;
    .param p2, "srcDir"    # Ljava/io/File;
    .param p3, "destDir"    # Ljava/io/File;
    .param p4, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 130
    sget-object v0, Lorg/apache/tools/ant/util/SourceFileScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v7}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrictAsFiles([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;J)[Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public restrictAsFiles([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;J)[Ljava/io/File;
    .locals 5
    .param p1, "files"    # [Ljava/lang/String;
    .param p2, "srcDir"    # Ljava/io/File;
    .param p3, "destDir"    # Ljava/io/File;
    .param p4, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .param p5, "granularity"    # J

    .prologue
    .line 152
    invoke-virtual/range {p0 .. p6}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;J)[Ljava/lang/String;

    move-result-object v1

    .line 153
    .local v1, "res":[Ljava/lang/String;
    array-length v3, v1

    new-array v2, v3, [Ljava/io/File;

    .line 154
    .local v2, "result":[Ljava/io/File;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v1

    if-ge v0, v3, :cond_0

    .line 155
    new-instance v3, Ljava/io/File;

    aget-object v4, v1, v0

    invoke-direct {v3, p2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    aput-object v3, v2, v0

    .line 154
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 157
    :cond_0
    return-object v2
.end method
