.class public Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;
.super Lorg/apache/tools/ant/dispatch/DispatchTask;
.source "Symlink.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;


# instance fields
.field private executing:Z

.field private failonerror:Z

.field private fileSets:Ljava/util/Vector;

.field private link:Ljava/lang/String;

.field private linkFileName:Ljava/lang/String;

.field private overwrite:Z

.field private resource:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 117
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 118
    invoke-static {}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->getSymbolicLinkUtils()Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 116
    invoke-direct {p0}, Lorg/apache/tools/ant/dispatch/DispatchTask;-><init>()V

    .line 123
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->executing:Z

    return-void
.end method

.method public static deleteSymlink(Ljava/io/File;)V
    .locals 2
    .param p0, "linkfil"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 422
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->deleteSymbolicLink(Ljava/io/File;Lorg/apache/tools/ant/Task;)V

    .line 423
    return-void
.end method

.method public static deleteSymlink(Ljava/lang/String;)V
    .locals 3
    .param p0, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 389
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->deleteSymbolicLink(Ljava/io/File;Lorg/apache/tools/ant/Task;)V

    .line 390
    return-void
.end method

.method private doLink(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p1, "res"    # Ljava/lang/String;
    .param p2, "lnk"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    .line 471
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 472
    .local v4, "linkfil":Ljava/io/File;
    const-string/jumbo v5, "-s"

    .line 473
    .local v5, "options":Ljava/lang/String;
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->overwrite:Z

    if-eqz v6, :cond_0

    .line 474
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "f"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 475
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 477
    :try_start_0
    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    invoke-virtual {v6, v4, p0}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->deleteSymbolicLink(Ljava/io/File;Lorg/apache/tools/ant/Task;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 486
    :cond_0
    :goto_0
    const/4 v6, 0x4

    new-array v0, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string/jumbo v7, "ln"

    aput-object v7, v0, v6

    const/4 v6, 0x1

    aput-object v5, v0, v6

    aput-object p1, v0, v8

    const/4 v6, 0x3

    aput-object p2, v0, v6

    .line 488
    .local v0, "cmd":[Ljava/lang/String;
    :try_start_1
    invoke-static {p0, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->runCommand(Lorg/apache/tools/ant/Task;[Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_2

    .line 497
    :goto_1
    return-void

    .line 478
    .end local v0    # "cmd":[Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 479
    .local v2, "fnfe":Ljava/io/FileNotFoundException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Symlink disappeared before it was deleted: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 480
    .end local v2    # "fnfe":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v3

    .line 481
    .local v3, "ioe":Ljava/io/IOException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Unable to overwrite preexisting link or file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v3, v8}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    goto :goto_0

    .line 489
    .end local v3    # "ioe":Ljava/io/IOException;
    .restart local v0    # "cmd":[Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 490
    .local v1, "failedToExecute":Lorg/apache/tools/ant/BuildException;
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->failonerror:Z

    if-eqz v6, :cond_1

    .line 491
    throw v1

    .line 494
    :cond_1
    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v1, v8}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    goto :goto_1
.end method

.method private findLinks(Ljava/util/Vector;)Ljava/util/HashSet;
    .locals 16
    .param p1, "v"    # Ljava/util/Vector;

    .prologue
    .line 511
    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 512
    .local v12, "result":Ljava/util/HashSet;
    invoke-virtual/range {p1 .. p1}, Ljava/util/Vector;->size()I

    move-result v13

    .line 513
    .local v13, "size":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v13, :cond_3

    .line 514
    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/types/FileSet;

    .line 515
    .local v6, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v2

    .line 516
    .local v2, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    const/4 v14, 0x2

    new-array v5, v14, [[Ljava/lang/String;

    const/4 v14, 0x0

    invoke-virtual {v2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v15

    aput-object v15, v5, v14

    const/4 v14, 0x1

    invoke-virtual {v2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v15

    aput-object v15, v5, v14

    .line 518
    .local v5, "fnd":[[Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v1

    .line 519
    .local v1, "dir":Ljava/io/File;
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_1
    array-length v14, v5

    if-ge v8, v14, :cond_2

    .line 520
    const/4 v9, 0x0

    .local v9, "k":I
    :goto_2
    aget-object v14, v5, v8

    array-length v14, v14

    if-ge v9, v14, :cond_1

    .line 522
    :try_start_0
    new-instance v4, Ljava/io/File;

    aget-object v14, v5, v8

    aget-object v14, v14, v9

    invoke-direct {v4, v1, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 523
    .local v4, "f":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v11

    .line 524
    .local v11, "pf":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    .line 525
    .local v10, "name":Ljava/lang/String;
    sget-object v14, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    invoke-virtual {v14, v11, v10}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/io/File;Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 526
    new-instance v14, Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v15

    invoke-direct {v14, v15, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v12, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 520
    .end local v4    # "f":Ljava/io/File;
    .end local v10    # "name":Ljava/lang/String;
    .end local v11    # "pf":Ljava/io/File;
    :cond_0
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 528
    :catch_0
    move-exception v3

    .line 529
    .local v3, "e":Ljava/io/IOException;
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "IOException: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    aget-object v15, v5, v8

    aget-object v15, v15, v9

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, " omitted"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V

    goto :goto_3

    .line 519
    .end local v3    # "e":Ljava/io/IOException;
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 513
    .end local v9    # "k":I
    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 534
    .end local v1    # "dir":Ljava/io/File;
    .end local v2    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v5    # "fnd":[[Ljava/lang/String;
    .end local v6    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v8    # "j":I
    :cond_3
    return-object v12
.end method

.method private handleError(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 455
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->failonerror:Z

    if-eqz v0, :cond_0

    .line 456
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 458
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->log(Ljava/lang/String;)V

    .line 459
    return-void
.end method

.method private loadLinks(Ljava/util/Vector;)Ljava/util/Properties;
    .locals 23
    .param p1, "v"    # Ljava/util/Vector;

    .prologue
    .line 549
    new-instance v5, Ljava/util/Properties;

    invoke-direct {v5}, Ljava/util/Properties;-><init>()V

    .line 551
    .local v5, "finalList":Ljava/util/Properties;
    invoke-virtual/range {p1 .. p1}, Ljava/util/Vector;->size()I

    move-result v19

    .line 552
    .local v19, "size":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    move/from16 v0, v19

    if-ge v8, v0, :cond_1

    .line 553
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/FileSet;

    .line 554
    .local v7, "fs":Lorg/apache/tools/ant/types/FileSet;
    new-instance v4, Lorg/apache/tools/ant/DirectoryScanner;

    invoke-direct {v4}, Lorg/apache/tools/ant/DirectoryScanner;-><init>()V

    .line 555
    .local v4, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v4, v0}, Lorg/apache/tools/ant/types/FileSet;->setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;Lorg/apache/tools/ant/Project;)V

    .line 556
    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/DirectoryScanner;->setFollowSymlinks(Z)V

    .line 557
    invoke-virtual {v4}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    .line 558
    invoke-virtual {v4}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v10

    .line 559
    .local v10, "incs":[Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v7, v0}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v3

    .line 562
    .local v3, "dir":Ljava/io/File;
    const/4 v14, 0x0

    .local v14, "j":I
    :goto_1
    array-length v0, v10

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v14, v0, :cond_0

    .line 563
    new-instance v9, Ljava/io/File;

    aget-object v20, v10, v14

    move-object/from16 v0, v20

    invoke-direct {v9, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 564
    .local v9, "inc":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v18

    .line 565
    .local v18, "pf":Ljava/io/File;
    new-instance v17, Ljava/util/Properties;

    invoke-direct/range {v17 .. v17}, Ljava/util/Properties;-><init>()V

    .line 566
    .local v17, "lnks":Ljava/util/Properties;
    const/4 v12, 0x0

    .line 568
    .local v12, "is":Ljava/io/InputStream;
    :try_start_0
    new-instance v13, Ljava/io/BufferedInputStream;

    new-instance v20, Ljava/io/FileInputStream;

    move-object/from16 v0, v20

    invoke-direct {v0, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v20

    invoke-direct {v13, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 569
    .end local v12    # "is":Ljava/io/InputStream;
    .local v13, "is":Ljava/io/InputStream;
    :try_start_1
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 570
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v18

    .line 579
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 581
    new-instance v20, Ljava/io/PrintStream;

    new-instance v21, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/16 v22, 0x2

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move/from16 v2, v22

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    invoke-direct/range {v20 .. v21}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/Properties;->list(Ljava/io/PrintStream;)V

    .line 587
    invoke-virtual/range {v17 .. v17}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "kitr":Ljava/util/Iterator;
    :goto_2
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_2

    .line 588
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 589
    .local v15, "key":Ljava/lang/String;
    new-instance v20, Ljava/io/File;

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-direct {v0, v1, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 571
    .end local v13    # "is":Ljava/io/InputStream;
    .end local v15    # "key":Ljava/lang/String;
    .end local v16    # "kitr":Ljava/util/Iterator;
    .restart local v12    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v6

    .line 572
    .local v6, "fnfe":Ljava/io/FileNotFoundException;
    :goto_3
    :try_start_2
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Unable to find "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    aget-object v21, v10, v14

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, "; skipping it."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 579
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 562
    .end local v6    # "fnfe":Ljava/io/FileNotFoundException;
    :goto_4
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_1

    .line 574
    :catch_1
    move-exception v11

    .line 575
    .local v11, "ioe":Ljava/io/IOException;
    :goto_5
    :try_start_3
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Unable to open "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    aget-object v21, v10, v14

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " or its parent dir; skipping it."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 579
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_4

    .end local v11    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v20

    :goto_6
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v20

    .line 552
    .end local v9    # "inc":Ljava/io/File;
    .end local v12    # "is":Ljava/io/InputStream;
    .end local v17    # "lnks":Ljava/util/Properties;
    .end local v18    # "pf":Ljava/io/File;
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 594
    .end local v3    # "dir":Ljava/io/File;
    .end local v4    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v7    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v10    # "incs":[Ljava/lang/String;
    .end local v14    # "j":I
    :cond_1
    return-object v5

    .line 579
    .restart local v3    # "dir":Ljava/io/File;
    .restart local v4    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v7    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .restart local v9    # "inc":Ljava/io/File;
    .restart local v10    # "incs":[Ljava/lang/String;
    .restart local v13    # "is":Ljava/io/InputStream;
    .restart local v14    # "j":I
    .restart local v17    # "lnks":Ljava/util/Properties;
    .restart local v18    # "pf":Ljava/io/File;
    :catchall_1
    move-exception v20

    move-object v12, v13

    .end local v13    # "is":Ljava/io/InputStream;
    .restart local v12    # "is":Ljava/io/InputStream;
    goto :goto_6

    .line 574
    .end local v12    # "is":Ljava/io/InputStream;
    .restart local v13    # "is":Ljava/io/InputStream;
    :catch_2
    move-exception v11

    move-object v12, v13

    .end local v13    # "is":Ljava/io/InputStream;
    .restart local v12    # "is":Ljava/io/InputStream;
    goto :goto_5

    .line 571
    .end local v12    # "is":Ljava/io/InputStream;
    .restart local v13    # "is":Ljava/io/InputStream;
    :catch_3
    move-exception v6

    move-object v12, v13

    .end local v13    # "is":Ljava/io/InputStream;
    .restart local v12    # "is":Ljava/io/InputStream;
    goto :goto_3

    .end local v12    # "is":Ljava/io/InputStream;
    .restart local v13    # "is":Ljava/io/InputStream;
    .restart local v16    # "kitr":Ljava/util/Iterator;
    :cond_2
    move-object v12, v13

    .end local v13    # "is":Ljava/io/InputStream;
    .restart local v12    # "is":Ljava/io/InputStream;
    goto :goto_4
.end method

.method private setDefaults()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 293
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->resource:Ljava/lang/String;

    .line 294
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    .line 295
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->linkFileName:Ljava/lang/String;

    .line 296
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->failonerror:Z

    .line 297
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->overwrite:Z

    .line 298
    const-string/jumbo v0, "single"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setAction(Ljava/lang/String;)V

    .line 299
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clear()V

    .line 300
    return-void
.end method

.method private writePropertyFile(Ljava/util/Properties;Ljava/io/File;)V
    .locals 6
    .param p1, "properties"    # Ljava/util/Properties;
    .param p2, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 435
    const/4 v0, 0x0

    .line 437
    .local v0, "bos":Ljava/io/BufferedOutputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v4, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->linkFileName:Ljava/lang/String;

    invoke-direct {v4, p2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 439
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .local v1, "bos":Ljava/io/BufferedOutputStream;
    :try_start_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Symlinks from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 443
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 445
    return-void

    .line 440
    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    :catch_0
    move-exception v2

    .line 441
    .local v2, "ioe":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 443
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_1
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v3

    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :catchall_1
    move-exception v3

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_1

    .line 440
    .end local v0    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v1    # "bos":Ljava/io/BufferedOutputStream;
    :catch_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "bos":Ljava/io/BufferedOutputStream;
    .restart local v0    # "bos":Ljava/io/BufferedOutputStream;
    goto :goto_0
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 368
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 369
    return-void
.end method

.method public delete()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 183
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 184
    const-string/jumbo v2, "Must define the link name for symlink!"

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    .line 198
    :goto_0
    return-void

    .line 187
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Removing symlink: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->log(Ljava/lang/String;)V

    .line 188
    sget-object v2, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    new-instance v4, Ljava/io/File;

    const-string/jumbo v5, "."

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3, p0}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->deleteSymbolicLink(Ljava/io/File;Lorg/apache/tools/ant/Task;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 196
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "fnfe":Ljava/io/FileNotFoundException;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 196
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0

    .line 193
    .end local v0    # "fnfe":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 194
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 196
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0

    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    throw v2
.end method

.method public declared-synchronized execute()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 143
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->executing:Z

    if-eqz v0, :cond_0

    .line 144
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Infinite recursion detected in Symlink.execute()"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 148
    :cond_0
    const/4 v0, 0x1

    :try_start_1
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->executing:Z

    .line 149
    invoke-static {p0}, Lorg/apache/tools/ant/dispatch/DispatchUtils;->execute(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 151
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->executing:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 153
    monitor-exit p0

    return-void

    .line 151
    :catchall_1
    move-exception v0

    const/4 v1, 0x0

    :try_start_3
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->executing:Z

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public init()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-super {p0}, Lorg/apache/tools/ant/dispatch/DispatchTask;->init()V

    .line 135
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    .line 136
    return-void
.end method

.method public record()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 243
    :try_start_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    invoke-virtual {v12}, Ljava/util/Vector;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 244
    const-string/jumbo v12, "Fileset identifying links to record required"

    invoke-direct {p0, v12}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 284
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    .line 286
    :goto_0
    return-void

    .line 247
    :cond_0
    :try_start_1
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->linkFileName:Ljava/lang/String;

    if-nez v12, :cond_1

    .line 248
    const-string/jumbo v12, "Name of file to record links in required"

    invoke-direct {p0, v12}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 284
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0

    .line 252
    :cond_1
    :try_start_2
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 255
    .local v0, "byDir":Ljava/util/Hashtable;
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    invoke-direct {p0, v12}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->findLinks(Ljava/util/Vector;)Ljava/util/HashSet;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 256
    .local v7, "litr":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 257
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/io/File;

    .line 258
    .local v10, "thisLink":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    .line 259
    .local v9, "parent":Ljava/io/File;
    invoke-virtual {v0, v9}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Vector;

    .line 260
    .local v11, "v":Ljava/util/Vector;
    if-nez v11, :cond_2

    .line 261
    new-instance v11, Ljava/util/Vector;

    .end local v11    # "v":Ljava/util/Vector;
    invoke-direct {v11}, Ljava/util/Vector;-><init>()V

    .line 262
    .restart local v11    # "v":Ljava/util/Vector;
    invoke-virtual {v0, v9, v11}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    :cond_2
    invoke-virtual {v11, v10}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 284
    .end local v0    # "byDir":Ljava/util/Hashtable;
    .end local v7    # "litr":Ljava/util/Iterator;
    .end local v9    # "parent":Ljava/io/File;
    .end local v10    # "thisLink":Ljava/io/File;
    .end local v11    # "v":Ljava/util/Vector;
    :catchall_0
    move-exception v12

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    throw v12

    .line 267
    .restart local v0    # "byDir":Ljava/util/Hashtable;
    .restart local v7    # "litr":Ljava/util/Iterator;
    :cond_3
    :try_start_3
    invoke-virtual {v0}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "dirs":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    .line 268
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 269
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Vector;

    .line 270
    .local v5, "linksInDir":Ljava/util/Vector;
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 273
    .local v6, "linksToStore":Ljava/util/Properties;
    invoke-virtual {v5}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "dlnk":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 274
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/io/File;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 276
    .local v8, "lnk":Ljava/io/File;
    :try_start_4
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v12, v13}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3

    .line 277
    :catch_0
    move-exception v4

    .line 278
    .local v4, "ioe":Ljava/io/IOException;
    :try_start_5
    const-string/jumbo v12, "Couldn\'t get canonical name of parent link"

    invoke-direct {p0, v12}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V

    goto :goto_3

    .line 281
    .end local v4    # "ioe":Ljava/io/IOException;
    .end local v8    # "lnk":Ljava/io/File;
    :cond_4
    invoke-direct {p0, v6, v1}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->writePropertyFile(Ljava/util/Properties;Ljava/io/File;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 284
    .end local v1    # "dir":Ljava/io/File;
    .end local v3    # "dlnk":Ljava/util/Iterator;
    .end local v5    # "linksInDir":Ljava/util/Vector;
    .end local v6    # "linksToStore":Ljava/util/Properties;
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto/16 :goto_0
.end method

.method public recreate()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 207
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 208
    const-string/jumbo v6, "File set identifying link file(s) required for action recreate"

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 232
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    .line 234
    :goto_0
    return-void

    .line 212
    :cond_0
    :try_start_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->fileSets:Ljava/util/Vector;

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->loadLinks(Ljava/util/Vector;)Ljava/util/Properties;

    move-result-object v2

    .line 214
    .local v2, "links":Ljava/util/Properties;
    invoke-virtual {v2}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "kitr":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 215
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 216
    .local v3, "lnk":Ljava/lang/String;
    invoke-virtual {v2, v3}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    .line 219
    .local v4, "res":Ljava/lang/String;
    :try_start_2
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 220
    .local v5, "test":Ljava/io/File;
    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    invoke-virtual {v6, v3}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 221
    invoke-direct {p0, v4, v3}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->doLink(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 227
    .end local v5    # "test":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 228
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_3
    const-string/jumbo v6, "IO exception while creating link"

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 232
    .end local v0    # "ioe":Ljava/io/IOException;
    .end local v1    # "kitr":Ljava/util/Iterator;
    .end local v2    # "links":Ljava/util/Properties;
    .end local v3    # "lnk":Ljava/lang/String;
    .end local v4    # "res":Ljava/lang/String;
    :catchall_0
    move-exception v6

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    throw v6

    .line 222
    .restart local v1    # "kitr":Ljava/util/Iterator;
    .restart local v2    # "links":Ljava/util/Properties;
    .restart local v3    # "lnk":Ljava/lang/String;
    .restart local v4    # "res":Ljava/lang/String;
    .restart local v5    # "test":Ljava/io/File;
    :cond_2
    :try_start_4
    invoke-virtual {v5}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 224
    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    invoke-virtual {v6, v5, p0}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->deleteSymbolicLink(Ljava/io/File;Lorg/apache/tools/ant/Task;)V

    .line 225
    invoke-direct {p0, v4, v3}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->doLink(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 232
    .end local v3    # "lnk":Ljava/lang/String;
    .end local v4    # "res":Ljava/lang/String;
    .end local v5    # "test":Ljava/io/File;
    :cond_3
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    .line 330
    invoke-super {p0, p1}, Lorg/apache/tools/ant/dispatch/DispatchTask;->setAction(Ljava/lang/String;)V

    .line 331
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "foe"    # Z

    .prologue
    .line 320
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->failonerror:Z

    .line 321
    return-void
.end method

.method public setLink(Ljava/lang/String;)V
    .locals 0
    .param p1, "lnk"    # Ljava/lang/String;

    .prologue
    .line 339
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    .line 340
    return-void
.end method

.method public setLinkfilename(Ljava/lang/String;)V
    .locals 0
    .param p1, "lf"    # Ljava/lang/String;

    .prologue
    .line 359
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->linkFileName:Ljava/lang/String;

    .line 360
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 0
    .param p1, "owrite"    # Z

    .prologue
    .line 310
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->overwrite:Z

    .line 311
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 0
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 349
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->resource:Ljava/lang/String;

    .line 350
    return-void
.end method

.method public single()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 162
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->resource:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 163
    const-string/jumbo v0, "Must define the resource to symlink to!"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    .line 174
    :goto_0
    return-void

    .line 166
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 167
    const-string/jumbo v0, "Must define the link name for symlink!"

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->handleError(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0

    .line 170
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->resource:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->link:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->doLink(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 172
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/unix/Symlink;->setDefaults()V

    throw v0
.end method
