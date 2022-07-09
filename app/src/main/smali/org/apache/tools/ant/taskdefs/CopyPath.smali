.class public Lorg/apache/tools/ant/taskdefs/CopyPath;
.super Lorg/apache/tools/ant/Task;
.source "CopyPath.java"


# static fields
.field public static final ERROR_NO_DESTDIR:Ljava/lang/String; = "No destDir specified"

.field public static final ERROR_NO_MAPPER:Ljava/lang/String; = "No mapper specified"

.field public static final ERROR_NO_PATH:Ljava/lang/String; = "No path specified"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private destDir:Ljava/io/File;

.field private granularity:J

.field private mapper:Lorg/apache/tools/ant/util/FileNameMapper;

.field private path:Lorg/apache/tools/ant/types/Path;

.field private preserveLastModified:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/CopyPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 66
    sget-object v0, Lorg/apache/tools/ant/taskdefs/CopyPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->granularity:J

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->preserveLastModified:Z

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 2
    .param p1, "newmapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v0, :cond_0

    .line 85
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one mapper allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 88
    return-void
.end method

.method public createPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 117
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CopyPath;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->path:Lorg/apache/tools/ant/types/Path;

    .line 119
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->path:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public execute()V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 168
    const-string/jumbo v1, "This task should have never been released and was obsoleted by ResourceCollection support in <copy> available since Ant 1.7.0.  Don\'t use it."

    const/4 v4, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v4}, Lorg/apache/tools/ant/taskdefs/CopyPath;->log(Ljava/lang/String;I)V

    .line 173
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/CopyPath;->validateAttributes()V

    .line 174
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/CopyPath;->path:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v16

    .line 175
    .local v16, "sourceFiles":[Ljava/lang/String;
    move-object/from16 v0, v16

    array-length v1, v0

    if-nez v1, :cond_1

    .line 176
    const-string/jumbo v1, "Path is empty"

    const/4 v4, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v4}, Lorg/apache/tools/ant/taskdefs/CopyPath;->log(Ljava/lang/String;I)V

    .line 213
    :cond_0
    return-void

    .line 180
    :cond_1
    const/16 v17, 0x0

    .local v17, "sources":I
    :goto_0
    move-object/from16 v0, v16

    array-length v1, v0

    move/from16 v0, v17

    if-ge v0, v1, :cond_0

    .line 182
    aget-object v15, v16, v17

    .line 183
    .local v15, "sourceFileName":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 184
    .local v2, "sourceFile":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/CopyPath;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-interface {v1, v15}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v18

    check-cast v18, [Ljava/lang/String;

    .line 186
    .local v18, "toFiles":[Ljava/lang/String;
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_1
    move-object/from16 v0, v18

    array-length v1, v0

    if-ge v12, v1, :cond_5

    .line 187
    aget-object v11, v18, v12

    .line 188
    .local v11, "destFileName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v1, v0, Lorg/apache/tools/ant/taskdefs/CopyPath;->destDir:Ljava/io/File;

    invoke-direct {v3, v1, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 190
    .local v3, "destFile":Ljava/io/File;
    invoke-virtual {v2, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 191
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Skipping self-copy of "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v4}, Lorg/apache/tools/ant/taskdefs/CopyPath;->log(Ljava/lang/String;I)V

    .line 186
    :goto_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_1

    .line 194
    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 195
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Skipping directory "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/CopyPath;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 199
    :cond_3
    :try_start_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Copying "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " to "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v4}, Lorg/apache/tools/ant/taskdefs/CopyPath;->log(Ljava/lang/String;I)V

    .line 201
    sget-object v1, Lorg/apache/tools/ant/taskdefs/CopyPath;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-boolean v7, v0, Lorg/apache/tools/ant/taskdefs/CopyPath;->preserveLastModified:Z

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/CopyPath;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual/range {v1 .. v10}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 203
    :catch_0
    move-exception v13

    .line 204
    .local v13, "ioe":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed to copy "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " to "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " due to "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v13}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    .line 206
    .local v14, "msg":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_4

    .line 207
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " and I couldn\'t delete the corrupt "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    .line 209
    :cond_4
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/CopyPath;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v1, v14, v13, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 180
    .end local v3    # "destFile":Ljava/io/File;
    .end local v11    # "destFileName":Ljava/lang/String;
    .end local v13    # "ioe":Ljava/io/IOException;
    .end local v14    # "msg":Ljava/lang/String;
    :cond_5
    add-int/lit8 v17, v17, 0x1

    goto/16 :goto_0
.end method

.method public setDestDir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->destDir:Ljava/io/File;

    .line 76
    return-void
.end method

.method public setGranularity(J)V
    .locals 1
    .param p1, "granularity"    # J

    .prologue
    .line 130
    iput-wide p1, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->granularity:J

    .line 131
    return-void
.end method

.method public setPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 97
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CopyPath;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 98
    return-void
.end method

.method public setPathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/CopyPath;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 108
    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0
    .param p1, "preserveLastModified"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->preserveLastModified:Z

    .line 140
    return-void
.end method

.method protected validateAttributes()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->destDir:Ljava/io/File;

    if-nez v0, :cond_0

    .line 151
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No destDir specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_1

    .line 154
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No mapper specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/CopyPath;->path:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_2

    .line 157
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No path specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_2
    return-void
.end method
