.class public Lorg/apache/tools/ant/taskdefs/Sync;
.super Lorg/apache/tools/ant/Task;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;,
        Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;
    }
.end annotation


# instance fields
.field private myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

.field private resources:Lorg/apache/tools/ant/types/resources/Resources;

.field private syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 68
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    .line 528
    return-void
.end method

.method static access$200(Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Z

    .prologue
    .line 60
    invoke-static {p0, p1}, Lorg/apache/tools/ant/taskdefs/Sync;->assertTrue(Ljava/lang/String;Z)V

    return-void
.end method

.method private static assertTrue(Ljava/lang/String;Z)V
    .locals 3
    .param p0, "message"    # Ljava/lang/String;
    .param p1, "condition"    # Z

    .prologue
    .line 596
    if-nez p1, :cond_0

    .line 597
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Assertion Error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 599
    :cond_0
    return-void
.end method

.method private configureTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "helper"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Task;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 90
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getTaskName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Task;->setTaskName(Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/Task;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 92
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->init()V

    .line 93
    return-void
.end method

.method private getExplicitPreserveEmptyDirs()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getPreserveEmptyDirs()Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method private logRemovedCount(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "count"    # I
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "singularSuffix"    # Ljava/lang/String;
    .param p4, "pluralSuffix"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x2

    .line 155
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->getToDir()Ljava/io/File;

    move-result-object v0

    .line 157
    .local v0, "toDir":Ljava/io/File;
    if-nez p2, :cond_0

    const-string/jumbo v1, ""

    .line 158
    .local v1, "what":Ljava/lang/String;
    :goto_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-ge p1, v4, :cond_1

    .end local p3    # "singularSuffix":Ljava/lang/String;
    :goto_1
    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 160
    if-lez p1, :cond_2

    .line 161
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Removed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 167
    :goto_2
    return-void

    .end local v1    # "what":Ljava/lang/String;
    .restart local p3    # "singularSuffix":Ljava/lang/String;
    :cond_0
    move-object v1, p2

    .line 157
    goto :goto_0

    .restart local v1    # "what":Ljava/lang/String;
    :cond_1
    move-object p3, p4

    .line 158
    goto :goto_1

    .line 164
    .end local p3    # "singularSuffix":Ljava/lang/String;
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "NO "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to remove from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    goto :goto_2
.end method

.method private removeEmptyDirectories(Ljava/io/File;ZLjava/util/Set;)I
    .locals 6
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "removeIfEmpty"    # Z
    .param p3, "preservedEmptyDirectories"    # Ljava/util/Set;

    .prologue
    const/4 v5, 0x1

    .line 285
    const/4 v3, 0x0

    .line 286
    .local v3, "removedCount":I
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 287
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 288
    .local v0, "children":[Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_1

    .line 289
    aget-object v1, v0, v2

    .line 291
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 292
    invoke-direct {p0, v1, v5, p3}, Lorg/apache/tools/ant/taskdefs/Sync;->removeEmptyDirectories(Ljava/io/File;ZLjava/util/Set;)I

    move-result v4

    add-int/2addr v3, v4

    .line 288
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 297
    .end local v1    # "file":Ljava/io/File;
    :cond_1
    array-length v4, v0

    if-lez v4, :cond_2

    .line 300
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 302
    :cond_2
    array-length v4, v0

    if-ge v4, v5, :cond_3

    if-eqz p2, :cond_3

    invoke-interface {p3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 304
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Removing empty directory: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 305
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 306
    add-int/lit8 v3, v3, 0x1

    .line 309
    .end local v0    # "children":[Ljava/io/File;
    .end local v2    # "i":I
    :cond_3
    return v3
.end method

.method private removeEmptyDirectories(Ljava/util/Set;)I
    .locals 6
    .param p1, "preservedEmptyDirectories"    # Ljava/util/Set;

    .prologue
    .line 326
    const/4 v2, 0x0

    .line 327
    .local v2, "removedCount":I
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 328
    .local v1, "iter":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 329
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 330
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 331
    .local v3, "s":[Ljava/lang/String;
    if-eqz v3, :cond_1

    array-length v4, v3

    if-nez v4, :cond_0

    .line 332
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Removing empty directory: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 333
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 334
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 337
    .end local v0    # "f":Ljava/io/File;
    .end local v3    # "s":[Ljava/lang/String;
    :cond_2
    return v2
.end method

.method private removeOrphanFiles(Ljava/util/Set;Ljava/io/File;Ljava/util/Set;)[I
    .locals 19
    .param p1, "nonOrphans"    # Ljava/util/Set;
    .param p2, "toDir"    # Ljava/io/File;
    .param p3, "preservedDirectories"    # Ljava/util/Set;

    .prologue
    .line 190
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v15, v0, [I

    fill-array-data v15, :array_0

    .line 191
    .local v15, "removedCount":[I
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v17

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    .line 194
    .local v6, "excls":[Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Ljava/util/Set;->size()I

    move-result v17

    const-string/jumbo v18, ""

    aput-object v18, v6, v17

    .line 196
    const/4 v5, 0x0

    .line 197
    .local v5, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    .line 198
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static/range {v17 .. v18}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->access$100(Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;Z)Lorg/apache/tools/ant/types/FileSet;

    move-result-object v9

    .line 199
    .local v9, "fs":Lorg/apache/tools/ant/types/FileSet;
    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v14

    .line 205
    .local v14, "ps":Lorg/apache/tools/ant/types/PatternSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->appendExcludes([Ljava/lang/String;)V

    .line 206
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->appendIncludes([Ljava/lang/String;)V

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getDefaultexcludes()Z

    move-result v17

    if-nez v17, :cond_0

    const/16 v17, 0x1

    :goto_0
    move/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->setDefaultexcludes(Z)V

    .line 212
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v16

    .line 213
    .local v16, "s":[Lorg/apache/tools/ant/types/selectors/FileSelector;
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    if-lez v17, :cond_2

    .line 214
    new-instance v11, Lorg/apache/tools/ant/types/selectors/NoneSelector;

    invoke-direct {v11}, Lorg/apache/tools/ant/types/selectors/NoneSelector;-><init>()V

    .line 215
    .local v11, "ns":Lorg/apache/tools/ant/types/selectors/NoneSelector;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_1

    .line 216
    aget-object v17, v16, v10

    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/types/selectors/NoneSelector;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 215
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 207
    .end local v10    # "i":I
    .end local v11    # "ns":Lorg/apache/tools/ant/types/selectors/NoneSelector;
    .end local v16    # "s":[Lorg/apache/tools/ant/types/selectors/FileSelector;
    :cond_0
    const/16 v17, 0x0

    goto :goto_0

    .line 218
    .restart local v10    # "i":I
    .restart local v11    # "ns":Lorg/apache/tools/ant/types/selectors/NoneSelector;
    .restart local v16    # "s":[Lorg/apache/tools/ant/types/selectors/FileSelector;
    :cond_1
    invoke-virtual {v9, v11}, Lorg/apache/tools/ant/types/FileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 220
    .end local v10    # "i":I
    .end local v11    # "ns":Lorg/apache/tools/ant/types/selectors/NoneSelector;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v5

    .line 225
    .end local v9    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v14    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    .end local v16    # "s":[Lorg/apache/tools/ant/types/selectors/FileSelector;
    :goto_2
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/DirectoryScanner;->addExcludes([Ljava/lang/String;)V

    .line 227
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    .line 228
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v8

    .line 229
    .local v8, "files":[Ljava/lang/String;
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_3
    array-length v0, v8

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_4

    .line 230
    new-instance v7, Ljava/io/File;

    aget-object v17, v8, v10

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-direct {v7, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 231
    .local v7, "f":Ljava/io/File;
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Removing orphan file: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 232
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 233
    const/16 v17, 0x1

    aget v18, v15, v17

    add-int/lit8 v18, v18, 0x1

    aput v18, v15, v17

    .line 229
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 222
    .end local v7    # "f":Ljava/io/File;
    .end local v8    # "files":[Ljava/lang/String;
    .end local v10    # "i":I
    :cond_3
    new-instance v5, Lorg/apache/tools/ant/DirectoryScanner;

    .end local v5    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-direct {v5}, Lorg/apache/tools/ant/DirectoryScanner;-><init>()V

    .line 223
    .restart local v5    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/DirectoryScanner;->setBasedir(Ljava/io/File;)V

    goto :goto_2

    .line 235
    .restart local v8    # "files":[Ljava/lang/String;
    .restart local v10    # "i":I
    :cond_4
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v4

    .line 241
    .local v4, "dirs":[Ljava/lang/String;
    array-length v0, v4

    move/from16 v17, v0

    add-int/lit8 v10, v17, -0x1

    :goto_4
    if-ltz v10, :cond_7

    .line 242
    new-instance v7, Ljava/io/File;

    aget-object v17, v4, v10

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-direct {v7, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 243
    .restart local v7    # "f":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 244
    .local v3, "children":[Ljava/lang/String;
    if-eqz v3, :cond_5

    array-length v0, v3

    move/from16 v17, v0

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_6

    .line 245
    :cond_5
    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v18, "Removing orphan directory: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    const/16 v18, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 246
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 247
    const/16 v17, 0x0

    aget v18, v15, v17

    add-int/lit8 v18, v18, 0x1

    aput v18, v15, v17

    .line 241
    :cond_6
    add-int/lit8 v10, v10, -0x1

    goto :goto_4

    .line 251
    .end local v3    # "children":[Ljava/lang/String;
    .end local v7    # "f":Ljava/io/File;
    :cond_7
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getExplicitPreserveEmptyDirs()Ljava/lang/Boolean;

    move-result-object v12

    .line 252
    .local v12, "ped":Ljava/lang/Boolean;
    if-eqz v12, :cond_8

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->getIncludeEmptyDirs()Z

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_8

    .line 253
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-static/range {v17 .. v18}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->access$100(Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;Z)Lorg/apache/tools/ant/types/FileSet;

    move-result-object v9

    .line 254
    .restart local v9    # "fs":Lorg/apache/tools/ant/types/FileSet;
    move-object/from16 v0, p2

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 255
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v13

    .line 257
    .local v13, "preservedDirs":[Ljava/lang/String;
    array-length v0, v13

    move/from16 v17, v0

    add-int/lit8 v10, v17, -0x1

    :goto_5
    if-ltz v10, :cond_8

    .line 258
    new-instance v17, Ljava/io/File;

    aget-object v18, v13, v10

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 257
    add-int/lit8 v10, v10, -0x1

    goto :goto_5

    .line 262
    .end local v9    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v13    # "preservedDirs":[Ljava/lang/String;
    :cond_8
    return-object v15

    .line 190
    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 398
    instance-of v1, p1, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 400
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 410
    :goto_0
    return-void

    .line 402
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v1, :cond_1

    .line 403
    new-instance v0, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 404
    .local v0, "r":Lorg/apache/tools/ant/types/resources/Restrict;
    new-instance v1, Lorg/apache/tools/ant/types/resources/selectors/Exists;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/selectors/Exists;-><init>()V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 405
    new-instance v1, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 406
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 408
    .end local v0    # "r":Lorg/apache/tools/ant/types/resources/Restrict;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Sync;->resources:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_0
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 389
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Sync;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 390
    return-void
.end method

.method public addPreserveInTarget(Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;)V
    .locals 2
    .param p1, "s"    # Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    .prologue
    .line 434
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    if-eqz v0, :cond_0

    .line 435
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "you must not specify multiple preserveintarget elements."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 438
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Sync;->syncTarget:Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;

    .line 439
    return-void
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v12, 0x4

    .line 104
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->getToDir()Ljava/io/File;

    move-result-object v5

    .line 107
    .local v5, "toDir":Ljava/io/File;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->access$000(Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;)Ljava/util/Set;

    move-result-object v0

    .line 111
    .local v0, "allFiles":Ljava/util/Set;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v5}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v8

    array-length v8, v8

    if-ge v8, v7, :cond_2

    :cond_0
    move v1, v7

    .line 114
    .local v1, "noRemovalNecessary":Z
    :goto_0
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "PASS#1: Copying files to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v12}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 115
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->execute()V

    .line 118
    if-eqz v1, :cond_3

    .line 119
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "NO removing necessary in "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v12}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 151
    :cond_1
    :goto_1
    return-void

    .end local v1    # "noRemovalNecessary":Z
    :cond_2
    move v1, v6

    .line 111
    goto :goto_0

    .line 126
    .restart local v1    # "noRemovalNecessary":Z
    :cond_3
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 129
    .local v2, "preservedDirectories":Ljava/util/Set;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "PASS#2: Removing orphan files from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v12}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 130
    invoke-direct {p0, v0, v5, v2}, Lorg/apache/tools/ant/taskdefs/Sync;->removeOrphanFiles(Ljava/util/Set;Ljava/io/File;Ljava/util/Set;)[I

    move-result-object v4

    .line 132
    .local v4, "removedFileCount":[I
    aget v8, v4, v6

    const-string/jumbo v9, "dangling director"

    const-string/jumbo v10, "y"

    const-string/jumbo v11, "ies"

    invoke-direct {p0, v8, v9, v10, v11}, Lorg/apache/tools/ant/taskdefs/Sync;->logRemovedCount(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    aget v7, v4, v7

    const-string/jumbo v8, "dangling file"

    const-string/jumbo v9, ""

    const-string/jumbo v10, "s"

    invoke-direct {p0, v7, v8, v9, v10}, Lorg/apache/tools/ant/taskdefs/Sync;->logRemovedCount(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->getIncludeEmptyDirs()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Sync;->getExplicitPreserveEmptyDirs()Ljava/lang/Boolean;

    move-result-object v7

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-ne v7, v8, :cond_1

    .line 138
    :cond_4
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "PASS#3: Removing empty directories from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v12}, Lorg/apache/tools/ant/taskdefs/Sync;->log(Ljava/lang/String;I)V

    .line 141
    const/4 v3, 0x0

    .line 142
    .local v3, "removedDirCount":I
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->getIncludeEmptyDirs()Z

    move-result v7

    if-nez v7, :cond_5

    .line 143
    invoke-direct {p0, v5, v6, v2}, Lorg/apache/tools/ant/taskdefs/Sync;->removeEmptyDirectories(Ljava/io/File;ZLjava/util/Set;)I

    move-result v3

    .line 149
    :goto_2
    const-string/jumbo v6, "empty director"

    const-string/jumbo v7, "y"

    const-string/jumbo v8, "ies"

    invoke-direct {p0, v3, v6, v7, v8}, Lorg/apache/tools/ant/taskdefs/Sync;->logRemovedCount(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 146
    :cond_5
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Sync;->removeEmptyDirectories(Ljava/util/Set;)I

    move-result v3

    goto :goto_2
.end method

.method public init()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 79
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Sync;->configureTask(Lorg/apache/tools/ant/Task;)V

    .line 83
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setFiltering(Z)V

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setIncludeEmptyDirs(Z)V

    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setPreserveLastModified(Z)V

    .line 86
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 1
    .param p1, "failonerror"    # Z

    .prologue
    .line 381
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setFailOnError(Z)V

    .line 382
    return-void
.end method

.method public setGranularity(J)V
    .locals 1
    .param p1, "granularity"    # J

    .prologue
    .line 421
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setGranularity(J)V

    .line 422
    return-void
.end method

.method public setIncludeEmptyDirs(Z)V
    .locals 1
    .param p1, "includeEmpty"    # Z

    .prologue
    .line 373
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setIncludeEmptyDirs(Z)V

    .line 374
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 1
    .param p1, "overwrite"    # Z

    .prologue
    .line 365
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setOverwrite(Z)V

    .line 366
    return-void
.end method

.method public setTodir(Ljava/io/File;)V
    .locals 1
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 349
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setTodir(Ljava/io/File;)V

    .line 350
    return-void
.end method

.method public setVerbose(Z)V
    .locals 1
    .param p1, "verbose"    # Z

    .prologue
    .line 357
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync;->myCopy:Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Sync$MyCopy;->setVerbose(Z)V

    .line 358
    return-void
.end method
