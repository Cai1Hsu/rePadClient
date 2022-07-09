.class public Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Depend.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$1;,
        Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    }
.end annotation


# static fields
.field private static final CACHE_FILE_NAME:Ljava/lang/String; = "dependencies.txt"

.field private static final CLASSNAME_PREPEND:Ljava/lang/String; = "||:"

.field private static final ONE_SECOND:I = 0x3e8


# instance fields
.field private affectedClassMap:Ljava/util/Hashtable;

.field private cache:Ljava/io/File;

.field private classFileInfoMap:Ljava/util/Hashtable;

.field private classpathDependencies:Ljava/util/Hashtable;

.field private closure:Z

.field private dependClasspath:Lorg/apache/tools/ant/types/Path;

.field private destPath:Lorg/apache/tools/ant/types/Path;

.field private dump:Z

.field private outOfDateClasses:Ljava/util/Hashtable;

.field private srcPath:Lorg/apache/tools/ant/types/Path;

.field private srcPathList:[Ljava/lang/String;

.field private warnOnRmiStubs:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 102
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->closure:Z

    .line 107
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->warnOnRmiStubs:Z

    .line 113
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dump:Z

    return-void
.end method

.method private addClassFiles(Ljava/util/Vector;Ljava/io/File;Ljava/io/File;)V
    .locals 12
    .param p1, "classFileList"    # Ljava/util/Vector;
    .param p2, "dir"    # Ljava/io/File;
    .param p3, "root"    # Ljava/io/File;

    .prologue
    .line 838
    invoke-virtual {p2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 840
    .local v1, "filesInDir":[Ljava/lang/String;
    if-nez v1, :cond_1

    .line 864
    :cond_0
    return-void

    .line 843
    :cond_1
    array-length v4, v1

    .line 845
    .local v4, "length":I
    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v6

    .line 846
    .local v6, "rootLength":I
    const/4 v7, 0x0

    .line 847
    .local v7, "sourceFileKnownToExist":Ljava/io/File;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 848
    new-instance v0, Ljava/io/File;

    aget-object v8, v1, v2

    invoke-direct {v0, p2, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 849
    .local v0, "file":Ljava/io/File;
    aget-object v8, v1, v2

    const-string/jumbo v9, ".class"

    invoke-virtual {v8, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 850
    new-instance v3, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    const/4 v8, 0x0

    invoke-direct {v3, v8}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;-><init>(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$1;)V

    .line 851
    .local v3, "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    invoke-static {v3, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$102(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/io/File;)Ljava/io/File;

    .line 852
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    add-int/lit8 v9, v6, 0x1

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    const-string/jumbo v11, ".class"

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    sub-int/2addr v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 855
    .local v5, "relativeName":Ljava/lang/String;
    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFileUtils;->convertSlashName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$002(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 857
    invoke-direct {p0, v5, v7}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->findSourceFile(Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v7

    invoke-static {v3, v7}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$202(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/io/File;)Ljava/io/File;

    .line 859
    invoke-virtual {p1, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 847
    .end local v3    # "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .end local v5    # "relativeName":Ljava/lang/String;
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 861
    :cond_2
    invoke-direct {p0, p1, v0, p3}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->addClassFiles(Ljava/util/Vector;Ljava/io/File;Ljava/io/File;)V

    goto :goto_1
.end method

.method private deleteAffectedFiles(Ljava/lang/String;)I
    .locals 11
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x3

    .line 493
    const/4 v3, 0x0

    .line 495
    .local v3, "count":I
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    invoke-virtual {v8, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Hashtable;

    .line 496
    .local v2, "affectedClasses":Ljava/util/Hashtable;
    if-nez v2, :cond_0

    move v4, v3

    .line 548
    .end local v3    # "count":I
    .local v4, "count":I
    :goto_0
    return v4

    .line 499
    .end local v4    # "count":I
    .restart local v3    # "count":I
    :cond_0
    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v5

    .local v5, "e":Ljava/util/Enumeration;
    :cond_1
    :goto_1
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 500
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 501
    .local v0, "affectedClass":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 504
    .local v1, "affectedClassInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 508
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$200(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v8

    if-nez v8, :cond_2

    .line 509
    invoke-direct {p0, v1, v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->warnOutOfDateButNotDeleted(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 513
    :cond_2
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Deleting file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " since "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " out of date"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 516
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 517
    add-int/lit8 v3, v3, 0x1

    .line 518
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->closure:Z

    if-eqz v8, :cond_3

    .line 519
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->deleteAffectedFiles(Ljava/lang/String;)I

    move-result v8

    add-int/2addr v3, v8

    goto :goto_1

    .line 524
    :cond_3
    const-string/jumbo v8, "$"

    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_1

    .line 528
    const/4 v8, 0x0

    const-string/jumbo v9, "$"

    invoke-virtual {v0, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 530
    .local v7, "topLevelClassName":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Top level class = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 532
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classFileInfoMap:Ljava/util/Hashtable;

    invoke-virtual {v8, v7}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 534
    .local v6, "topLevelClassInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    if-eqz v6, :cond_1

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 536
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Deleting file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v9

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " since one of its inner classes was removed"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 540
    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 541
    add-int/lit8 v3, v3, 0x1

    .line 542
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->closure:Z

    if-eqz v8, :cond_1

    .line 543
    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->deleteAffectedFiles(Ljava/lang/String;)I

    move-result v8

    add-int/2addr v3, v8

    goto/16 :goto_1

    .end local v0    # "affectedClass":Ljava/lang/String;
    .end local v1    # "affectedClassInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .end local v6    # "topLevelClassInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .end local v7    # "topLevelClassName":Ljava/lang/String;
    :cond_4
    move v4, v3

    .line 548
    .end local v3    # "count":I
    .restart local v4    # "count":I
    goto/16 :goto_0
.end method

.method private deleteAllAffectedFiles()I
    .locals 5

    .prologue
    .line 467
    const/4 v2, 0x0

    .line 468
    .local v2, "count":I
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->outOfDateClasses:Ljava/util/Hashtable;

    invoke-virtual {v4}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .local v3, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 469
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 470
    .local v1, "className":Ljava/lang/String;
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->deleteAffectedFiles(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v2, v4

    .line 471
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classFileInfoMap:Ljava/util/Hashtable;

    invoke-virtual {v4, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 473
    .local v0, "classInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 474
    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$200(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v4

    if-nez v4, :cond_1

    .line 475
    invoke-direct {p0, v0, v1, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->warnOutOfDateButNotDeleted(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 477
    :cond_1
    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 478
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 482
    .end local v0    # "classInfo":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .end local v1    # "className":Ljava/lang/String;
    :cond_2
    return v2
.end method

.method private determineDependencies()V
    .locals 35
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 302
    new-instance v32, Ljava/util/Hashtable;

    invoke-direct/range {v32 .. v32}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    .line 303
    new-instance v32, Ljava/util/Hashtable;

    invoke-direct/range {v32 .. v32}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classFileInfoMap:Ljava/util/Hashtable;

    .line 304
    const/4 v6, 0x0

    .line 306
    .local v6, "cacheDirty":Z
    new-instance v22, Ljava/util/Hashtable;

    invoke-direct/range {v22 .. v22}, Ljava/util/Hashtable;-><init>()V

    .line 307
    .local v22, "dependencyMap":Ljava/util/Hashtable;
    const/4 v7, 0x0

    .line 308
    .local v7, "cacheFile":Ljava/io/File;
    const/4 v8, 0x1

    .line 309
    .local v8, "cacheFileExists":Z
    const-wide v10, 0x7fffffffffffffffL

    .line 312
    .local v10, "cacheLastModified":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    move-object/from16 v32, v0

    if-eqz v32, :cond_0

    .line 313
    new-instance v7, Ljava/io/File;

    .end local v7    # "cacheFile":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    move-object/from16 v32, v0

    const-string/jumbo v33, "dependencies.txt"

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    invoke-direct {v7, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 314
    .restart local v7    # "cacheFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v8

    .line 315
    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    .line 316
    if-eqz v8, :cond_0

    .line 317
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->readCachedDependencies(Ljava/io/File;)Ljava/util/Hashtable;

    move-result-object v22

    .line 320
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->destPath:Lorg/apache/tools/ant/types/Path;

    move-object/from16 v32, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getClassFiles(Lorg/apache/tools/ant/types/Path;)Ljava/util/Vector;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v15

    .line 321
    .local v15, "classfileEnum":Ljava/util/Enumeration;
    :cond_1
    invoke-interface {v15}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v32

    if-eqz v32, :cond_6

    .line 322
    invoke-interface {v15}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 323
    .local v26, "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Adding class info for "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 324
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classFileInfoMap:Ljava/util/Hashtable;

    move-object/from16 v32, v0

    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    const/16 v21, 0x0

    .line 328
    .local v21, "dependencyList":Ljava/util/Vector;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    move-object/from16 v32, v0

    if-eqz v32, :cond_2

    .line 331
    if-eqz v8, :cond_2

    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/io/File;->lastModified()J

    move-result-wide v32

    cmp-long v32, v10, v32

    if-lez v32, :cond_2

    .line 335
    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    .end local v21    # "dependencyList":Ljava/util/Vector;
    check-cast v21, Ljava/util/Vector;

    .line 339
    .restart local v21    # "dependencyList":Ljava/util/Vector;
    :cond_2
    if-nez v21, :cond_4

    .line 341
    new-instance v5, Lorg/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer;

    invoke-direct {v5}, Lorg/apache/tools/ant/taskdefs/optional/depend/AntAnalyzer;-><init>()V

    .line 342
    .local v5, "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-interface {v5, v0}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addRootClass(Ljava/lang/String;)V

    .line 343
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->destPath:Lorg/apache/tools/ant/types/Path;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    invoke-interface {v5, v0}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addClassPath(Lorg/apache/tools/ant/types/Path;)V

    .line 344
    const/16 v32, 0x0

    move/from16 v0, v32

    invoke-interface {v5, v0}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->setClosure(Z)V

    .line 345
    new-instance v21, Ljava/util/Vector;

    .end local v21    # "dependencyList":Ljava/util/Vector;
    invoke-direct/range {v21 .. v21}, Ljava/util/Vector;-><init>()V

    .line 346
    .restart local v21    # "dependencyList":Ljava/util/Vector;
    invoke-interface {v5}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->getClassDependencies()Ljava/util/Enumeration;

    move-result-object v18

    .line 347
    .local v18, "depEnum":Ljava/util/Enumeration;
    :goto_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v32

    if-eqz v32, :cond_3

    .line 348
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v31

    .line 349
    .local v31, "o":Ljava/lang/Object;
    move-object/from16 v0, v21

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 350
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Class "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    const-string/jumbo v33, " depends on "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 353
    .end local v31    # "o":Ljava/lang/Object;
    :cond_3
    const/4 v6, 0x1

    .line 354
    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v22

    move-object/from16 v1, v32

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .end local v5    # "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    .end local v18    # "depEnum":Ljava/util/Enumeration;
    :cond_4
    invoke-virtual/range {v21 .. v21}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v18

    .line 360
    .restart local v18    # "depEnum":Ljava/util/Enumeration;
    :goto_1
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v32

    if-eqz v32, :cond_1

    .line 361
    invoke-interface/range {v18 .. v18}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/String;

    .line 363
    .local v23, "dependentClass":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Hashtable;

    .line 365
    .local v4, "affectedClasses":Ljava/util/Hashtable;
    if-nez v4, :cond_5

    .line 366
    new-instance v4, Ljava/util/Hashtable;

    .end local v4    # "affectedClasses":Ljava/util/Hashtable;
    invoke-direct {v4}, Ljava/util/Hashtable;-><init>()V

    .line 367
    .restart local v4    # "affectedClasses":Ljava/util/Hashtable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-virtual {v0, v1, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 370
    :cond_5
    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v26

    invoke-virtual {v4, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    const-string/jumbo v33, " affects "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$000(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 376
    .end local v4    # "affectedClasses":Ljava/util/Hashtable;
    .end local v18    # "depEnum":Ljava/util/Enumeration;
    .end local v21    # "dependencyList":Ljava/util/Vector;
    .end local v23    # "dependentClass":Ljava/lang/String;
    .end local v26    # "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    :cond_6
    const/16 v32, 0x0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    .line 377
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getCheckClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v9

    .line 378
    .local v9, "checkPath":Lorg/apache/tools/ant/types/Path;
    if-eqz v9, :cond_12

    .line 380
    new-instance v32, Ljava/util/Hashtable;

    invoke-direct/range {v32 .. v32}, Ljava/util/Hashtable;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    .line 381
    const/16 v29, 0x0

    .line 383
    .local v29, "loader":Lorg/apache/tools/ant/AntClassLoader;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v29

    .line 385
    new-instance v16, Ljava/util/Hashtable;

    invoke-direct/range {v16 .. v16}, Ljava/util/Hashtable;-><init>()V

    .line 386
    .local v16, "classpathFileCache":Ljava/util/Hashtable;
    new-instance v30, Ljava/lang/Object;

    invoke-direct/range {v30 .. v30}, Ljava/lang/Object;-><init>()V

    .line 387
    .local v30, "nullFileMarker":Ljava/lang/Object;
    invoke-virtual/range {v22 .. v22}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v24

    .local v24, "e":Ljava/util/Enumeration;
    :cond_7
    invoke-interface/range {v24 .. v24}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v32

    if-eqz v32, :cond_f

    .line 388
    invoke-interface/range {v24 .. v24}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 389
    .local v13, "className":Ljava/lang/String;
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Determining classpath dependencies for "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 391
    move-object/from16 v0, v22

    invoke-virtual {v0, v13}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/util/Vector;

    .line 392
    .restart local v21    # "dependencyList":Ljava/util/Vector;
    new-instance v19, Ljava/util/Hashtable;

    invoke-direct/range {v19 .. v19}, Ljava/util/Hashtable;-><init>()V

    .line 393
    .local v19, "dependencies":Ljava/util/Hashtable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    move-object/from16 v1, v19

    invoke-virtual {v0, v13, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    invoke-virtual/range {v21 .. v21}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v25

    .line 395
    .local v25, "e2":Ljava/util/Enumeration;
    :cond_8
    :goto_2
    invoke-interface/range {v25 .. v25}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v32

    if-eqz v32, :cond_7

    .line 396
    invoke-interface/range {v25 .. v25}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 397
    .local v20, "dependency":Ljava/lang/String;
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Looking for "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 398
    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    .line 400
    .local v17, "classpathFileObject":Ljava/lang/Object;
    if-nez v17, :cond_13

    .line 401
    move-object/from16 v17, v30

    .line 403
    const-string/jumbo v32, "java."

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v32

    if-nez v32, :cond_e

    const-string/jumbo v32, "javax."

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v32

    if-nez v32, :cond_e

    .line 405
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v33, 0x2e

    const/16 v34, 0x2f

    move-object/from16 v0, v20

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    const-string/jumbo v33, ".class"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v29

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v14

    .line 407
    .local v14, "classURL":Ljava/net/URL;
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "URL is "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 408
    if-eqz v14, :cond_a

    .line 409
    invoke-virtual {v14}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v32

    const-string/jumbo v33, "jar"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_d

    .line 410
    invoke-virtual {v14}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v28

    .line 411
    .local v28, "jarFilePath":Ljava/lang/String;
    const/16 v32, 0x21

    move-object/from16 v0, v28

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    .line 412
    .local v12, "classMarker":I
    const/16 v32, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v32

    invoke-virtual {v0, v1, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v28

    .line 413
    const-string/jumbo v32, "file:"

    move-object/from16 v0, v28

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v32

    if-eqz v32, :cond_c

    .line 414
    new-instance v17, Ljava/io/File;

    .end local v17    # "classpathFileObject":Ljava/lang/Object;
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 426
    .end local v12    # "classMarker":I
    .end local v28    # "jarFilePath":Ljava/lang/String;
    :cond_9
    :goto_3
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Class "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    const-string/jumbo v33, " depends on "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v32

    const-string/jumbo v33, " due to "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    :cond_a
    move-object/from16 v27, v17

    .line 434
    .end local v14    # "classURL":Ljava/net/URL;
    :goto_4
    move-object/from16 v0, v16

    move-object/from16 v1, v20

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    :goto_5
    move-object/from16 v0, v27

    move-object/from16 v1, v30

    if-eq v0, v1, :cond_8

    .line 438
    check-cast v27, Ljava/io/File;

    .line 439
    .local v27, "jarFile":Ljava/io/File;
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Adding a classpath dependency on "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 441
    move-object/from16 v0, v19

    move-object/from16 v1, v27

    move-object/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_2

    .line 446
    .end local v13    # "className":Ljava/lang/String;
    .end local v16    # "classpathFileCache":Ljava/util/Hashtable;
    .end local v19    # "dependencies":Ljava/util/Hashtable;
    .end local v20    # "dependency":Ljava/lang/String;
    .end local v21    # "dependencyList":Ljava/util/Vector;
    .end local v24    # "e":Ljava/util/Enumeration;
    .end local v25    # "e2":Ljava/util/Enumeration;
    .end local v27    # "jarFile":Ljava/io/File;
    .end local v30    # "nullFileMarker":Ljava/lang/Object;
    :catchall_0
    move-exception v32

    if-eqz v29, :cond_b

    .line 447
    invoke-virtual/range {v29 .. v29}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_b
    throw v32

    .line 417
    .restart local v12    # "classMarker":I
    .restart local v13    # "className":Ljava/lang/String;
    .restart local v14    # "classURL":Ljava/net/URL;
    .restart local v16    # "classpathFileCache":Ljava/util/Hashtable;
    .restart local v17    # "classpathFileObject":Ljava/lang/Object;
    .restart local v19    # "dependencies":Ljava/util/Hashtable;
    .restart local v20    # "dependency":Ljava/lang/String;
    .restart local v21    # "dependencyList":Ljava/util/Vector;
    .restart local v24    # "e":Ljava/util/Enumeration;
    .restart local v25    # "e2":Ljava/util/Enumeration;
    .restart local v28    # "jarFilePath":Ljava/lang/String;
    .restart local v30    # "nullFileMarker":Ljava/lang/Object;
    :cond_c
    :try_start_1
    new-instance v32, Ljava/io/IOException;

    new-instance v33, Ljava/lang/StringBuffer;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v34, "Bizarre nested path in jar: protocol: "

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    move-object/from16 v0, v33

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v33

    invoke-direct/range {v32 .. v33}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v32

    .line 421
    .end local v12    # "classMarker":I
    .end local v28    # "jarFilePath":Ljava/lang/String;
    :cond_d
    invoke-virtual {v14}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v32

    const-string/jumbo v33, "file"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_9

    .line 422
    new-instance v17, Ljava/io/File;

    .end local v17    # "classpathFileObject":Ljava/lang/Object;
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v32

    invoke-virtual {v14}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Lorg/apache/tools/ant/util/FileUtils;->fromURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v17

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v17, "classpathFileObject":Ljava/io/File;
    goto/16 :goto_3

    .line 431
    .end local v14    # "classURL":Ljava/net/URL;
    .local v17, "classpathFileObject":Ljava/lang/Object;
    :cond_e
    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Ignoring base classlib dependency "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object/from16 v27, v17

    goto/16 :goto_4

    .line 446
    .end local v13    # "className":Ljava/lang/String;
    .end local v17    # "classpathFileObject":Ljava/lang/Object;
    .end local v19    # "dependencies":Ljava/util/Hashtable;
    .end local v20    # "dependency":Ljava/lang/String;
    .end local v21    # "dependencyList":Ljava/util/Vector;
    .end local v25    # "e2":Ljava/util/Enumeration;
    :cond_f
    if-eqz v29, :cond_10

    .line 447
    invoke-virtual/range {v29 .. v29}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 455
    .end local v16    # "classpathFileCache":Ljava/util/Hashtable;
    .end local v24    # "e":Ljava/util/Enumeration;
    .end local v29    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    .end local v30    # "nullFileMarker":Ljava/lang/Object;
    :cond_10
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    move-object/from16 v32, v0

    if-eqz v32, :cond_11

    if-eqz v6, :cond_11

    .line 456
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->writeCachedDependencies(Ljava/util/Hashtable;)V

    .line 458
    :cond_11
    return-void

    .line 451
    :cond_12
    const-string/jumbo v32, "No classpath to check"

    const/16 v33, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    goto :goto_6

    .restart local v13    # "className":Ljava/lang/String;
    .restart local v16    # "classpathFileCache":Ljava/util/Hashtable;
    .restart local v17    # "classpathFileObject":Ljava/lang/Object;
    .restart local v19    # "dependencies":Ljava/util/Hashtable;
    .restart local v20    # "dependency":Ljava/lang/String;
    .restart local v21    # "dependencyList":Ljava/util/Vector;
    .restart local v24    # "e":Ljava/util/Enumeration;
    .restart local v25    # "e2":Ljava/util/Enumeration;
    .restart local v29    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    .restart local v30    # "nullFileMarker":Ljava/lang/Object;
    :cond_13
    move-object/from16 v27, v17

    goto/16 :goto_5
.end method

.method private determineOutOfDateClasses()V
    .locals 14

    .prologue
    .line 642
    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->outOfDateClasses:Ljava/util/Hashtable;

    .line 643
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPathList:[Ljava/lang/String;

    array-length v10, v10

    if-ge v7, v10, :cond_1

    .line 644
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPathList:[Ljava/lang/String;

    aget-object v11, v11, v7

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    .line 645
    .local v9, "srcDir":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 646
    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v4

    .line 647
    .local v4, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v4}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v6

    .line 648
    .local v6, "files":[Ljava/lang/String;
    invoke-virtual {p0, v9, v6}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->scanDir(Ljava/io/File;[Ljava/lang/String;)V

    .line 643
    .end local v4    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v6    # "files":[Ljava/lang/String;
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 653
    .end local v9    # "srcDir":Ljava/io/File;
    :cond_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    if-nez v10, :cond_3

    .line 684
    :cond_2
    return-void

    .line 657
    :cond_3
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    invoke-virtual {v10}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 658
    .local v1, "classpathDepsEnum":Ljava/util/Enumeration;
    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 659
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 660
    .local v0, "className":Ljava/lang/String;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->outOfDateClasses:Ljava/util/Hashtable;

    invoke-virtual {v10, v0}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_4

    .line 663
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classFileInfoMap:Ljava/util/Hashtable;

    invoke-virtual {v10, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 668
    .local v8, "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    if-eqz v8, :cond_4

    .line 669
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    invoke-virtual {v10, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Hashtable;

    .line 671
    .local v3, "dependencies":Ljava/util/Hashtable;
    invoke-virtual {v3}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v5

    .local v5, "e2":Ljava/util/Enumeration;
    :cond_5
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 672
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    .line 673
    .local v2, "classpathFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    cmp-long v10, v10, v12

    if-lez v10, :cond_5

    .line 675
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " is out of date with respect to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x4

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 678
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->outOfDateClasses:Ljava/util/Hashtable;

    invoke-virtual {v10, v0, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private dumpDependencies()V
    .locals 13

    .prologue
    const/4 v12, 0x4

    .line 603
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Reverse Dependency Dump for "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    invoke-virtual {v11}, Ljava/util/Hashtable;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " classes:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 606
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    invoke-virtual {v10}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    .line 607
    .local v3, "classEnum":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 608
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 609
    .local v4, "className":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, " Class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " affects:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 610
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->affectedClassMap:Ljava/util/Hashtable;

    invoke-virtual {v10, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Hashtable;

    .line 612
    .local v2, "affectedClasses":Ljava/util/Hashtable;
    invoke-virtual {v2}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 613
    .local v1, "affectedClassEnum":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 614
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 615
    .local v0, "affectedClass":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 617
    .local v9, "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "    "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " in "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v11

    invoke-virtual {v11}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 622
    .end local v0    # "affectedClass":Ljava/lang/String;
    .end local v1    # "affectedClassEnum":Ljava/util/Enumeration;
    .end local v2    # "affectedClasses":Ljava/util/Hashtable;
    .end local v4    # "className":Ljava/lang/String;
    .end local v9    # "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    :cond_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    if-eqz v10, :cond_3

    .line 623
    const-string/jumbo v10, "Classpath file dependencies (Forward):"

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 625
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    invoke-virtual {v10}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v5

    .line 626
    .local v5, "classpathEnum":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 627
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 628
    .restart local v4    # "className":Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, " Class "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " depends on:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 629
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classpathDependencies:Ljava/util/Hashtable;

    invoke-virtual {v10, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Hashtable;

    .line 632
    .local v8, "dependencies":Ljava/util/Hashtable;
    invoke-virtual {v8}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v7

    .line 633
    .local v7, "classpathFileEnum":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v7}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_2

    .line 634
    invoke-interface {v7}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    .line 635
    .local v6, "classpathFile":Ljava/io/File;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "    "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 639
    .end local v4    # "className":Ljava/lang/String;
    .end local v5    # "classpathEnum":Ljava/util/Enumeration;
    .end local v6    # "classpathFile":Ljava/io/File;
    .end local v7    # "classpathFileEnum":Ljava/util/Enumeration;
    .end local v8    # "dependencies":Ljava/util/Hashtable;
    :cond_3
    return-void
.end method

.method private findSourceFile(Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 6
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "sourceFileKnownToExist"    # Ljava/io/File;

    .prologue
    .line 808
    const-string/jumbo v4, "$"

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 809
    .local v1, "innerIndex":I
    const/4 v4, -0x1

    if-eq v1, v4, :cond_1

    .line 810
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".java"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 816
    .local v3, "sourceFilename":Ljava/lang/String;
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPathList:[Ljava/lang/String;

    array-length v4, v4

    if-ge v0, v4, :cond_3

    .line 817
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPathList:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-direct {v2, v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 818
    .local v2, "sourceFile":Ljava/io/File;
    invoke-virtual {v2, p2}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 822
    .end local v2    # "sourceFile":Ljava/io/File;
    :cond_0
    :goto_2
    return-object v2

    .line 812
    .end local v0    # "i":I
    .end local v3    # "sourceFilename":Ljava/lang/String;
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ".java"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "sourceFilename":Ljava/lang/String;
    goto :goto_0

    .line 816
    .restart local v0    # "i":I
    .restart local v2    # "sourceFile":Ljava/io/File;
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 822
    .end local v2    # "sourceFile":Ljava/io/File;
    :cond_3
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private getCheckClassPath()Lorg/apache/tools/ant/types/Path;
    .locals 10

    .prologue
    .line 252
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v8, :cond_0

    .line 253
    const/4 v7, 0x0

    .line 280
    :goto_0
    return-object v7

    .line 256
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->destPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    .line 257
    .local v2, "destPathElements":[Ljava/lang/String;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v1

    .line 258
    .local v1, "classpathElements":[Ljava/lang/String;
    const-string/jumbo v0, ""

    .line 259
    .local v0, "checkPath":Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v8, v1

    if-ge v4, v8, :cond_4

    .line 260
    aget-object v3, v1, v4

    .line 261
    .local v3, "element":Ljava/lang/String;
    const/4 v5, 0x0

    .line 262
    .local v5, "inDestPath":Z
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_2
    array-length v8, v2

    if-ge v6, v8, :cond_1

    if-nez v5, :cond_1

    .line 263
    aget-object v8, v2, v6

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 262
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 265
    :cond_1
    if-nez v5, :cond_2

    .line 266
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_3

    .line 267
    move-object v0, v3

    .line 259
    :cond_2
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 269
    :cond_3
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 274
    .end local v3    # "element":Ljava/lang/String;
    .end local v5    # "inDestPath":Z
    .end local v6    # "j":I
    :cond_4
    const/4 v7, 0x0

    .line 275
    .local v7, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_5

    .line 276
    new-instance v7, Lorg/apache/tools/ant/types/Path;

    .end local v7    # "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-direct {v7, v8, v0}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 279
    .restart local v7    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_5
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Classpath without dest dir is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x4

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private getClassFiles(Lorg/apache/tools/ant/types/Path;)Ljava/util/Vector;
    .locals 5
    .param p1, "classLocations"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 785
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v1

    .line 787
    .local v1, "classLocationsList":[Ljava/lang/String;
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 789
    .local v0, "classFileList":Ljava/util/Vector;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v4, v1

    if-ge v3, v4, :cond_1

    .line 790
    new-instance v2, Ljava/io/File;

    aget-object v4, v1, v3

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 791
    .local v2, "dir":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 792
    invoke-direct {p0, v0, v2, v2}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->addClassFiles(Ljava/util/Vector;Ljava/io/File;Ljava/io/File;)V

    .line 789
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 796
    .end local v2    # "dir":Ljava/io/File;
    :cond_1
    return-object v0
.end method

.method private isRmiStub(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "affectedClass"    # Ljava/lang/String;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 589
    const-string/jumbo v0, "_Stub"

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->isStub(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "_Skel"

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->isStub(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "_Stub"

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->isStub(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "_Skel"

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->isStub(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isStub(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "affectedClass"    # Ljava/lang/String;
    .param p2, "baseClass"    # Ljava/lang/String;
    .param p3, "suffix"    # Ljava/lang/String;

    .prologue
    .line 596
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private readCachedDependencies(Ljava/io/File;)Ljava/util/Hashtable;
    .locals 8
    .param p1, "depFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 187
    .local v2, "dependencyMap":Ljava/util/Hashtable;
    const/4 v3, 0x0

    .line 189
    .local v3, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/FileReader;

    invoke-direct {v7, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 190
    .end local v3    # "in":Ljava/io/BufferedReader;
    .local v4, "in":Ljava/io/BufferedReader;
    const/4 v5, 0x0

    .line 191
    .local v5, "line":Ljava/lang/String;
    const/4 v1, 0x0

    .line 192
    .local v1, "dependencyList":Ljava/util/Vector;
    const/4 v0, 0x0

    .line 193
    .local v0, "className":Ljava/lang/String;
    :try_start_1
    const-string/jumbo v7, "||:"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v6

    .line 194
    .local v6, "prependLength":I
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 195
    const-string/jumbo v7, "||:"

    invoke-virtual {v5, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 196
    new-instance v1, Ljava/util/Vector;

    .end local v1    # "dependencyList":Ljava/util/Vector;
    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 197
    .restart local v1    # "dependencyList":Ljava/util/Vector;
    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 198
    invoke-virtual {v2, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 204
    .end local v1    # "dependencyList":Ljava/util/Vector;
    .end local v6    # "prependLength":I
    :catchall_0
    move-exception v7

    move-object v3, v4

    .end local v0    # "className":Ljava/lang/String;
    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :goto_1
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v7

    .line 200
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "className":Ljava/lang/String;
    .restart local v1    # "dependencyList":Ljava/util/Vector;
    .restart local v4    # "in":Ljava/io/BufferedReader;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "prependLength":I
    :cond_0
    :try_start_2
    invoke-virtual {v1, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 204
    :cond_1
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 207
    return-object v2

    .line 204
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "dependencyList":Ljava/util/Vector;
    .end local v4    # "in":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "prependLength":I
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v7

    goto :goto_1
.end method

.method private warnOutOfDateButNotDeleted(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "affectedClassInfo"    # Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .param p2, "affectedClass"    # Ljava/lang/String;
    .param p3, "className"    # Ljava/lang/String;

    .prologue
    .line 562
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$300(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 580
    :goto_0
    return-void

    .line 565
    :cond_0
    const/4 v0, 0x1

    .line 566
    .local v0, "level":I
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->warnOnRmiStubs:Z

    if-nez v1, :cond_1

    .line 570
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->isRmiStub(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 571
    const/4 v0, 0x3

    .line 574
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " in file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is out of date due to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " but has not been deleted because its source file"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " could not be determined"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V

    .line 579
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$302(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;Z)Z

    goto :goto_0
.end method

.method private writeCachedDependencies(Ljava/util/Hashtable;)V
    .locals 10
    .param p1, "dependencyMap"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    if-eqz v8, :cond_2

    .line 219
    const/4 v4, 0x0

    .line 221
    .local v4, "pw":Ljava/io/BufferedWriter;
    :try_start_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->mkdirs()Z

    .line 222
    new-instance v1, Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    const-string/jumbo v9, "dependencies.txt"

    invoke-direct {v1, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 224
    .local v1, "depFile":Ljava/io/File;
    new-instance v5, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/FileWriter;

    invoke-direct {v8, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 225
    .end local v4    # "pw":Ljava/io/BufferedWriter;
    .local v5, "pw":Ljava/io/BufferedWriter;
    :try_start_1
    invoke-virtual {p1}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v3

    .line 226
    .local v3, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 227
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 229
    .local v0, "className":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "||:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 230
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->newLine()V

    .line 232
    invoke-virtual {p1, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    .line 234
    .local v2, "dependencyList":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v6

    .line 235
    .local v6, "size":I
    const/4 v7, 0x0

    .local v7, "x":I
    :goto_0
    if-ge v7, v6, :cond_0

    .line 236
    invoke-virtual {v2, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 237
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 235
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 241
    .end local v0    # "className":Ljava/lang/String;
    .end local v2    # "dependencyList":Ljava/util/Vector;
    .end local v6    # "size":I
    .end local v7    # "x":I
    :cond_1
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 244
    .end local v1    # "depFile":Ljava/io/File;
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v5    # "pw":Ljava/io/BufferedWriter;
    :cond_2
    return-void

    .line 241
    .restart local v4    # "pw":Ljava/io/BufferedWriter;
    :catchall_0
    move-exception v8

    :goto_1
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v8

    .end local v4    # "pw":Ljava/io/BufferedWriter;
    .restart local v1    # "depFile":Ljava/io/File;
    .restart local v5    # "pw":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v8

    move-object v4, v5

    .end local v5    # "pw":Ljava/io/BufferedWriter;
    .restart local v4    # "pw":Ljava/io/BufferedWriter;
    goto :goto_1
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 153
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    .line 155
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 693
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 694
    .local v4, "start":J
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPath:Lorg/apache/tools/ant/types/Path;

    if-nez v7, :cond_0

    .line 695
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "srcdir attribute must be set"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 736
    .end local v4    # "start":J
    :catch_0
    move-exception v1

    .line 737
    .local v1, "e":Ljava/lang/Exception;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 699
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v4    # "start":J
    :cond_0
    :try_start_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPathList:[Ljava/lang/String;

    .line 700
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPathList:[Ljava/lang/String;

    array-length v7, v7

    if-nez v7, :cond_1

    .line 701
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "srcdir attribute must be non-empty"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 705
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->destPath:Lorg/apache/tools/ant/types/Path;

    if-nez v7, :cond_2

    .line 706
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPath:Lorg/apache/tools/ant/types/Path;

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->destPath:Lorg/apache/tools/ant/types/Path;

    .line 709
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    if-eqz v7, :cond_3

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_3

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_3

    .line 710
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "The cache, if specified, must point to a directory"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 714
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    if-eqz v7, :cond_4

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_4

    .line 715
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->mkdirs()Z

    .line 718
    :cond_4
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->determineDependencies()V

    .line 719
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dump:Z

    if-eqz v7, :cond_5

    .line 720
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dumpDependencies()V

    .line 722
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->determineOutOfDateClasses()V

    .line 723
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->deleteAllAffectedFiles()I

    move-result v0

    .line 725
    .local v0, "count":I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    const-wide/16 v10, 0x3e8

    div-long v2, v8, v10

    .line 728
    .local v2, "duration":J
    if-lez v0, :cond_6

    .line 729
    const/4 v6, 0x2

    .line 734
    .local v6, "summaryLogLevel":I
    :goto_0
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Deleted "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " out of date files in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " seconds"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v6}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 739
    return-void

    .line 731
    .end local v6    # "summaryLogLevel":I
    :cond_6
    const/4 v6, 0x4

    .restart local v6    # "summaryLogLevel":I
    goto :goto_0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 143
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method protected scanDir(Ljava/io/File;[Ljava/lang/String;)V
    .locals 10
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "files"    # [Ljava/lang/String;

    .prologue
    .line 752
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, p2

    if-ge v2, v5, :cond_2

    .line 753
    new-instance v4, Ljava/io/File;

    aget-object v5, p2, v2

    invoke-direct {v4, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 754
    .local v4, "srcFile":Ljava/io/File;
    aget-object v5, p2, v2

    const-string/jumbo v6, ".java"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 755
    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 756
    .local v1, "filePath":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    const-string/jumbo v7, ".java"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 759
    .local v0, "className":Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/depend/ClassFileUtils;->convertSlashName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 760
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->classFileInfoMap:Ljava/util/Hashtable;

    invoke-virtual {v5, v0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;

    .line 762
    .local v3, "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    if-nez v3, :cond_1

    .line 764
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->outOfDateClasses:Ljava/util/Hashtable;

    invoke-virtual {v5, v0, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 752
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v3    # "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 766
    .restart local v0    # "className":Ljava/lang/String;
    .restart local v1    # "filePath":Ljava/lang/String;
    .restart local v3    # "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    :cond_1
    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;->access$100(Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v5, v6, v8

    if-lez v5, :cond_0

    .line 768
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->outOfDateClasses:Ljava/util/Hashtable;

    invoke-virtual {v5, v0, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 773
    .end local v0    # "className":Ljava/lang/String;
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v3    # "info":Lorg/apache/tools/ant/taskdefs/optional/depend/Depend$ClassFileInfo;
    .end local v4    # "srcFile":Ljava/io/File;
    :cond_2
    return-void
.end method

.method public setCache(Ljava/io/File;)V
    .locals 0
    .param p1, "cache"    # Ljava/io/File;

    .prologue
    .line 891
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->cache:Ljava/io/File;

    .line 892
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    .line 135
    :goto_0
    return-void

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dependClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 166
    return-void
.end method

.method public setClosure(Z)V
    .locals 0
    .param p1, "closure"    # Z

    .prologue
    .line 903
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->closure:Z

    .line 904
    return-void
.end method

.method public setDestDir(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "destPath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 882
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->destPath:Lorg/apache/tools/ant/types/Path;

    .line 883
    return-void
.end method

.method public setDump(Z)V
    .locals 0
    .param p1, "dump"    # Z

    .prologue
    .line 913
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->dump:Z

    .line 914
    return-void
.end method

.method public setSrcdir(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "srcPath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 873
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->srcPath:Lorg/apache/tools/ant/types/Path;

    .line 874
    return-void
.end method

.method public setWarnOnRmiStubs(Z)V
    .locals 0
    .param p1, "warnOnRmiStubs"    # Z

    .prologue
    .line 175
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/depend/Depend;->warnOnRmiStubs:Z

    .line 176
    return-void
.end method
