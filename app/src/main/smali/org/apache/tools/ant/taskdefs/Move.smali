.class public Lorg/apache/tools/ant/taskdefs/Move;
.super Lorg/apache/tools/ant/taskdefs/Copy;
.source "Move.java"


# instance fields
.field private performGc:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Copy;-><init>()V

    .line 55
    const-string/jumbo v0, "windows"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->performGc:Z

    .line 65
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Move;->setOverwrite(Z)V

    .line 66
    return-void
.end method

.method private copyFile(Ljava/io/File;Ljava/io/File;ZZ)V
    .locals 16
    .param p1, "fromFile"    # Ljava/io/File;
    .param p2, "toFile"    # Ljava/io/File;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z

    .prologue
    .line 239
    :try_start_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Copying "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/tools/ant/taskdefs/Move;->verbosity:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 241
    new-instance v4, Lorg/apache/tools/ant/types/FilterSetCollection;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/FilterSetCollection;-><init>()V

    .line 242
    .local v4, "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    if-eqz p3, :cond_0

    .line 243
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v1

    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V

    .line 245
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFilterSets()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "filterIter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 246
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FilterSet;

    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/types/FilterSetCollection;->addFilterSet(Lorg/apache/tools/ant/types/FilterSet;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 256
    .end local v4    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .end local v13    # "filterIter":Ljava/util/Iterator;
    :catch_0
    move-exception v14

    .line 257
    .local v14, "ioe":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Failed to copy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " due to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v14}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    .line 259
    .local v15, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v15, v14, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 248
    .end local v14    # "ioe":Ljava/io/IOException;
    .end local v15    # "msg":Ljava/lang/String;
    .restart local v4    # "executionFilters":Lorg/apache/tools/ant/types/FilterSetCollection;
    .restart local v13    # "filterIter":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFilterChains()Ljava/util/Vector;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v6, v0, Lorg/apache/tools/ant/taskdefs/Move;->forceOverwrite:Z

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getPreserveLastModified()Z

    move-result v7

    const/4 v8, 0x0

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getEncoding()Ljava/lang/String;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getOutputEncoding()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getForce()Z

    move-result v12

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-virtual/range {v1 .. v12}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 261
    return-void
.end method

.method private moveFile(Ljava/io/File;Ljava/io/File;ZZ)V
    .locals 6
    .param p1, "fromFile"    # Ljava/io/File;
    .param p2, "toFile"    # Ljava/io/File;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z

    .prologue
    .line 211
    const/4 v1, 0x0

    .line 213
    .local v1, "moved":Z
    :try_start_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Attempting to rename: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/Move;->verbosity:I

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 214
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Move;->forceOverwrite:Z

    invoke-virtual {p0, p1, p2, p3, v3}, Lorg/apache/tools/ant/taskdefs/Move;->renameFile(Ljava/io/File;Ljava/io/File;ZZ)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 221
    if-nez v1, :cond_0

    .line 222
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Move;->copyFile(Ljava/io/File;Ljava/io/File;ZZ)V

    .line 223
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v3

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Move;->performGc:Z

    invoke-virtual {v3, p1, v4}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;Z)Z

    move-result v3

    if-nez v3, :cond_0

    .line 224
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 215
    :catch_0
    move-exception v0

    .line 216
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed to rename "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " due to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 218
    .local v2, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v2, v0, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 228
    .end local v0    # "ioe":Ljava/io/IOException;
    .end local v2    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method protected deleteDir(Ljava/io/File;)V
    .locals 1
    .param p1, "d"    # Ljava/io/File;

    .prologue
    .line 293
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Move;->deleteDir(Ljava/io/File;Z)V

    .line 294
    return-void
.end method

.method protected deleteDir(Ljava/io/File;Z)V
    .locals 7
    .param p1, "d"    # Ljava/io/File;
    .param p2, "deleteFiles"    # Z

    .prologue
    .line 302
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 303
    .local v2, "list":[Ljava/lang/String;
    if-nez v2, :cond_1

    .line 324
    :cond_0
    return-void

    .line 307
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_4

    .line 308
    aget-object v3, v2, v1

    .line 309
    .local v3, "s":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 310
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 311
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Move;->deleteDir(Ljava/io/File;)V

    .line 307
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 312
    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Move;->performGc:Z

    invoke-virtual {v4, v0, v5}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;Z)Z

    move-result v4

    if-nez v4, :cond_3

    .line 314
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to delete file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 316
    :cond_3
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "UNEXPECTED ERROR - The file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " should not exist!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 320
    .end local v0    # "f":Ljava/io/File;
    .end local v3    # "s":Ljava/lang/String;
    :cond_4
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Deleting directory "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Move;->verbosity:I

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 321
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v4

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Move;->performGc:Z

    invoke-virtual {v4, p1, v5}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;Z)Z

    move-result v4

    if-nez v4, :cond_0

    .line 322
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to delete directory "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method protected doFileOperations()V
    .locals 30

    .prologue
    .line 107
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Hashtable;->size()I

    move-result v27

    if-lez v27, :cond_1

    .line 108
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "fromDirs":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_1

    .line 109
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/io/File;

    .line 110
    .local v10, "fromDir":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->completeDirMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/io/File;

    .line 111
    .local v23, "toDir":Ljava/io/File;
    const/16 v21, 0x0

    .line 113
    .local v21, "renamed":Z
    :try_start_0
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Attempting to rename dir: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " to "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->verbosity:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 114
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->filtering:Z

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->forceOverwrite:Z

    move/from16 v28, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v27

    move/from16 v3, v28

    invoke-virtual {v0, v10, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Move;->renameFile(Ljava/io/File;Ljava/io/File;ZZ)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v21

    .line 120
    if-nez v21, :cond_0

    .line 121
    new-instance v16, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct/range {v16 .. v16}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 122
    .local v16, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v27

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 123
    move-object/from16 v0, v16

    invoke-virtual {v0, v10}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 124
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Move;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 125
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v27

    move-object/from16 v0, v16

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v7

    .line 126
    .local v7, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v7}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v9

    .line 127
    .local v9, "files":[Ljava/lang/String;
    invoke-virtual {v7}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v6

    .line 128
    .local v6, "dirs":[Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v10, v1, v9, v6}, Lorg/apache/tools/ant/taskdefs/Move;->scan(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;[Ljava/lang/String;)V

    goto/16 :goto_0

    .line 115
    .end local v6    # "dirs":[Ljava/lang/String;
    .end local v7    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v9    # "files":[Ljava/lang/String;
    .end local v16    # "fs":Lorg/apache/tools/ant/types/FileSet;
    :catch_0
    move-exception v18

    .line 116
    .local v18, "ioe":Ljava/io/IOException;
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Failed to rename dir "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " to "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " due to "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v18 .. v18}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 118
    .local v20, "msg":Ljava/lang/String;
    new-instance v27, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Move;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v28

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    move-object/from16 v3, v28

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v27

    .line 132
    .end local v10    # "fromDir":Ljava/io/File;
    .end local v13    # "fromDirs":Ljava/util/Iterator;
    .end local v18    # "ioe":Ljava/io/IOException;
    .end local v20    # "msg":Ljava/lang/String;
    .end local v21    # "renamed":Z
    .end local v23    # "toDir":Ljava/io/File;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Hashtable;->size()I

    move-result v19

    .line 133
    .local v19, "moveCount":I
    if-lez v19, :cond_6

    .line 134
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Moving "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " file"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    const/16 v27, 0x1

    move/from16 v0, v19

    move/from16 v1, v27

    if-ne v0, v1, :cond_3

    const-string/jumbo v27, ""

    :goto_1
    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " to "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;)V

    .line 137
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .local v15, "fromFiles":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_6

    .line 138
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 139
    .local v14, "fromFile":Ljava/lang/String;
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 140
    .local v8, "f":Ljava/io/File;
    const/16 v22, 0x0

    .line 141
    .local v22, "selfMove":Z
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v27

    if-eqz v27, :cond_2

    .line 142
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->fileCopyMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v14}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, [Ljava/lang/String;

    .line 143
    .local v26, "toFiles":[Ljava/lang/String;
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_2
    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v17

    move/from16 v1, v27

    if-ge v0, v1, :cond_2

    .line 144
    aget-object v25, v26, v17

    .line 146
    .local v25, "toFile":Ljava/lang/String;
    move-object/from16 v0, v25

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_4

    .line 147
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Skipping self-move of "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->verbosity:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 148
    const/16 v22, 0x1

    .line 143
    :goto_3
    add-int/lit8 v17, v17, 0x1

    goto :goto_2

    .line 134
    .end local v8    # "f":Ljava/io/File;
    .end local v14    # "fromFile":Ljava/lang/String;
    .end local v15    # "fromFiles":Ljava/util/Iterator;
    .end local v17    # "i":I
    .end local v22    # "selfMove":Z
    .end local v25    # "toFile":Ljava/lang/String;
    .end local v26    # "toFiles":[Ljava/lang/String;
    :cond_3
    const-string/jumbo v27, "s"

    goto/16 :goto_1

    .line 154
    .restart local v8    # "f":Ljava/io/File;
    .restart local v14    # "fromFile":Ljava/lang/String;
    .restart local v15    # "fromFiles":Ljava/util/Iterator;
    .restart local v17    # "i":I
    .restart local v22    # "selfMove":Z
    .restart local v25    # "toFile":Ljava/lang/String;
    .restart local v26    # "toFiles":[Ljava/lang/String;
    :cond_4
    new-instance v5, Ljava/io/File;

    move-object/from16 v0, v25

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 155
    .local v5, "d":Ljava/io/File;
    add-int/lit8 v27, v17, 0x1

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v28, v0

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_5

    if-nez v22, :cond_5

    .line 158
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->filtering:Z

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->forceOverwrite:Z

    move/from16 v28, v0

    move-object/from16 v0, p0

    move/from16 v1, v27

    move/from16 v2, v28

    invoke-direct {v0, v8, v5, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->moveFile(Ljava/io/File;Ljava/io/File;ZZ)V

    goto :goto_3

    .line 160
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->filtering:Z

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->forceOverwrite:Z

    move/from16 v28, v0

    move-object/from16 v0, p0

    move/from16 v1, v27

    move/from16 v2, v28

    invoke-direct {v0, v8, v5, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->copyFile(Ljava/io/File;Ljava/io/File;ZZ)V

    goto :goto_3

    .line 167
    .end local v5    # "d":Ljava/io/File;
    .end local v8    # "f":Ljava/io/File;
    .end local v14    # "fromFile":Ljava/lang/String;
    .end local v15    # "fromFiles":Ljava/util/Iterator;
    .end local v17    # "i":I
    .end local v22    # "selfMove":Z
    .end local v25    # "toFile":Ljava/lang/String;
    .end local v26    # "toFiles":[Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->includeEmpty:Z

    move/from16 v27, v0

    if-eqz v27, :cond_d

    .line 168
    const/4 v4, 0x0

    .line 169
    .local v4, "createCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "fromDirNames":Ljava/util/Iterator;
    :cond_7
    :goto_4
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_c

    .line 170
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 171
    .local v11, "fromDirName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, [Ljava/lang/String;

    .line 172
    .local v24, "toDirNames":[Ljava/lang/String;
    const/16 v22, 0x0

    .line 173
    .restart local v22    # "selfMove":Z
    const/16 v17, 0x0

    .restart local v17    # "i":I
    :goto_5
    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v27, v0

    move/from16 v0, v17

    move/from16 v1, v27

    if-ge v0, v1, :cond_b

    .line 174
    aget-object v27, v24, v17

    move-object/from16 v0, v27

    invoke-virtual {v11, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-eqz v27, :cond_9

    .line 175
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Skipping self-move of "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->verbosity:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 176
    const/16 v22, 0x1

    .line 173
    :cond_8
    :goto_6
    add-int/lit8 v17, v17, 0x1

    goto :goto_5

    .line 179
    :cond_9
    new-instance v5, Ljava/io/File;

    aget-object v27, v24, v17

    move-object/from16 v0, v27

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 180
    .restart local v5    # "d":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v27

    if-nez v27, :cond_8

    .line 181
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v27

    if-nez v27, :cond_a

    .line 182
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Unable to create directory "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    const/16 v28, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move/from16 v2, v28

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    goto :goto_6

    .line 185
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 189
    .end local v5    # "d":Ljava/io/File;
    :cond_b
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 190
    .restart local v10    # "fromDir":Ljava/io/File;
    if-nez v22, :cond_7

    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/tools/ant/taskdefs/Move;->okToDelete(Ljava/io/File;)Z

    move-result v27

    if-eqz v27, :cond_7

    .line 191
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lorg/apache/tools/ant/taskdefs/Move;->deleteDir(Ljava/io/File;)V

    goto/16 :goto_4

    .line 194
    .end local v10    # "fromDir":Ljava/io/File;
    .end local v11    # "fromDirName":Ljava/lang/String;
    .end local v17    # "i":I
    .end local v22    # "selfMove":Z
    .end local v24    # "toDirNames":[Ljava/lang/String;
    :cond_c
    if-lez v4, :cond_d

    .line 195
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v28, "Moved "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/util/Hashtable;->size()I

    move-result v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " empty director"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->dirCopyMap:Ljava/util/Hashtable;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/Hashtable;->size()I

    move-result v27

    const/16 v29, 0x1

    move/from16 v0, v27

    move/from16 v1, v29

    if-ne v0, v1, :cond_e

    const-string/jumbo v27, "y"

    :goto_7
    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " to "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " empty director"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    const/16 v27, 0x1

    move/from16 v0, v27

    if-ne v4, v0, :cond_f

    const-string/jumbo v27, "y"

    :goto_8
    move-object/from16 v0, v28

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string/jumbo v28, " under "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    move-object/from16 v28, v0

    invoke-virtual/range {v28 .. v28}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;)V

    .line 204
    .end local v4    # "createCount":I
    .end local v12    # "fromDirNames":Ljava/util/Iterator;
    :cond_d
    return-void

    .line 195
    .restart local v4    # "createCount":I
    .restart local v12    # "fromDirNames":Ljava/util/Iterator;
    :cond_e
    const-string/jumbo v27, "ies"

    goto :goto_7

    :cond_f
    const-string/jumbo v27, "ies"

    goto :goto_8
.end method

.method protected okToDelete(Ljava/io/File;)Z
    .locals 6
    .param p1, "d"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x0

    .line 269
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 270
    .local v2, "list":[Ljava/lang/String;
    if-nez v2, :cond_1

    .line 285
    :cond_0
    :goto_0
    return v4

    .line 274
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v5, v2

    if-ge v1, v5, :cond_2

    .line 275
    aget-object v3, v2, v1

    .line 276
    .local v3, "s":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 277
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 278
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Move;->okToDelete(Ljava/io/File;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 274
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 285
    .end local v0    # "f":Ljava/io/File;
    .end local v3    # "s":Ljava/lang/String;
    :cond_2
    const/4 v4, 0x1

    goto :goto_0
.end method

.method protected renameFile(Ljava/io/File;Ljava/io/File;ZZ)Z
    .locals 4
    .param p1, "sourceFile"    # Ljava/io/File;
    .param p2, "destFile"    # Ljava/io/File;
    .param p3, "filtering"    # Z
    .param p4, "overwrite"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 346
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    if-nez p3, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFilterSets()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-gtz v1, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFilterChains()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 348
    :cond_0
    const/4 v1, 0x0

    .line 380
    :goto_0
    return v1

    .line 352
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p2}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_3

    .line 353
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getForce()Z

    move-result v1

    if-nez v1, :cond_2

    .line 354
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "can\'t replace read-only destination file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 356
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 357
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "failed to delete read-only destination file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 363
    :cond_3
    invoke-virtual {p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 364
    .local v0, "parent":Ljava/io/File;
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_5

    .line 365
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 380
    :cond_4
    invoke-virtual {p1, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    goto :goto_0

    .line 366
    :cond_5
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 367
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object p1

    .line 368
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object p2

    .line 369
    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 371
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Rename of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is a no-op."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->log(Ljava/lang/String;I)V

    .line 373
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 375
    :cond_6
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->areSame(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Move;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Move;->performGc:Z

    invoke-virtual {v1, p2, v2}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;Z)Z

    move-result v1

    if-nez v1, :cond_4

    .line 377
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to remove existing file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setPerformGcOnFailedDelete(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 78
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Move;->performGc:Z

    .line 79
    return-void
.end method

.method protected validateAttributes()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 83
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->file:Ljava/io/File;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    if-nez v0, :cond_2

    .line 86
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "One and only one of tofile and todir must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    if-nez v0, :cond_3

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Move;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->completeDirMap:Ljava/util/Hashtable;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Move;->file:Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->file:Ljava/io/File;

    .line 96
    :goto_2
    return-void

    .line 88
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destFile:Ljava/io/File;

    goto :goto_0

    .line 89
    :cond_4
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Move;->destDir:Ljava/io/File;

    goto :goto_1

    .line 94
    :cond_5
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Copy;->validateAttributes()V

    goto :goto_2
.end method
