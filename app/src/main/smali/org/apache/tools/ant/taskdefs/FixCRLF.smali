.class public Lorg/apache/tools/ant/taskdefs/FixCRLF;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "FixCRLF.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;,
        Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;,
        Lorg/apache/tools/ant/taskdefs/FixCRLF$OneLiner;
    }
.end annotation


# static fields
.field public static final ERROR_FILE_AND_SRCDIR:Ljava/lang/String; = "<fixcrlf> error: srcdir and file are mutually exclusive"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final FIXCRLF_ERROR:Ljava/lang/String; = "<fixcrlf> error: "


# instance fields
.field private destDir:Ljava/io/File;

.field private encoding:Ljava/lang/String;

.field private fcv:Ljava/util/Vector;

.field private file:Ljava/io/File;

.field private filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

.field private outputEncoding:Ljava/lang/String;

.field private preserveLastModified:Z

.field private srcDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 91
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->preserveLastModified:Z

    .line 95
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    .line 97
    new-instance v0, Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-direct {v0}, Lorg/apache/tools/ant/filters/FixCrLfFilter;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    .line 98
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->fcv:Ljava/util/Vector;

    .line 103
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    .line 108
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->outputEncoding:Ljava/lang/String;

    .line 683
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/FixCRLF;)Lorg/apache/tools/ant/filters/FixCrLfFilter;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/FixCRLF;

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/FixCRLF;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/FixCRLF;

    .prologue
    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method private processFile(Ljava/lang/String;)V
    .locals 20
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 345
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-direct {v0, v2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 346
    .local v17, "srcFile":Ljava/io/File;
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->lastModified()J

    move-result-wide v18

    .line 347
    .local v18, "lastModified":J
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    if-nez v2, :cond_4

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    .line 349
    .local v12, "destD":Ljava/io/File;
    :goto_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->fcv:Ljava/util/Vector;

    if-nez v2, :cond_0

    .line 350
    new-instance v16, Lorg/apache/tools/ant/types/FilterChain;

    invoke-direct/range {v16 .. v16}, Lorg/apache/tools/ant/types/FilterChain;-><init>()V

    .line 351
    .local v16, "fc":Lorg/apache/tools/ant/types/FilterChain;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/FilterChain;->add(Lorg/apache/tools/ant/filters/ChainableReader;)V

    .line 352
    new-instance v2, Ljava/util/Vector;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/Vector;-><init>(I)V

    move-object/from16 v0, p0

    iput-object v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->fcv:Ljava/util/Vector;

    .line 353
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->fcv:Ljava/util/Vector;

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 355
    .end local v16    # "fc":Lorg/apache/tools/ant/types/FilterChain;
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v3, "fixcrlf"

    const-string/jumbo v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v4

    .line 357
    .local v4, "tmpFile":Ljava/io/File;
    :try_start_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->fcv:Ljava/util/Vector;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->outputEncoding:Ljava/lang/String;

    if-nez v3, :cond_5

    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    move-object/from16 v3, v17

    invoke-virtual/range {v2 .. v11}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;Ljava/util/Vector;ZZLjava/lang/String;Ljava/lang/String;Lorg/apache/tools/ant/Project;)V

    .line 361
    new-instance v13, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v13, v12, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 363
    .local v13, "destFile":Ljava/io/File;
    const/4 v14, 0x1

    .line 364
    .local v14, "destIsWrong":Z
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 366
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "destFile "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " exists"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->log(Ljava/lang/String;I)V

    .line 367
    sget-object v2, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2, v13, v4}, Lorg/apache/tools/ant/util/FileUtils;->contentEquals(Ljava/io/File;Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_6

    const/4 v14, 0x1

    .line 368
    :goto_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    if-eqz v14, :cond_7

    const-string/jumbo v2, " is being written"

    :goto_3
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->log(Ljava/lang/String;I)V

    .line 372
    :cond_1
    if-eqz v14, :cond_2

    .line 373
    sget-object v2, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2, v4, v13}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 374
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->preserveLastModified:Z

    if-eqz v2, :cond_2

    .line 375
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "preserved lastModified for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->log(Ljava/lang/String;I)V

    .line 377
    sget-object v2, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-wide/from16 v0, v18

    invoke-virtual {v2, v13, v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 383
    :cond_2
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 384
    sget-object v2, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    .line 387
    :cond_3
    return-void

    .line 347
    .end local v4    # "tmpFile":Ljava/io/File;
    .end local v12    # "destD":Ljava/io/File;
    .end local v13    # "destFile":Ljava/io/File;
    .end local v14    # "destIsWrong":Z
    :cond_4
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    goto/16 :goto_0

    .line 357
    .restart local v4    # "tmpFile":Ljava/io/File;
    .restart local v12    # "destD":Ljava/io/File;
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    iget-object v10, v0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->outputEncoding:Ljava/lang/String;

    goto/16 :goto_1

    .line 367
    .restart local v13    # "destFile":Ljava/io/File;
    .restart local v14    # "destIsWrong":Z
    :cond_6
    const/4 v14, 0x0

    goto :goto_2

    .line 368
    :cond_7
    const-string/jumbo v2, " is not written, as the contents are identical"
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 380
    .end local v13    # "destFile":Ljava/io/File;
    .end local v14    # "destIsWrong":Z
    :catch_0
    move-exception v15

    .line 381
    .local v15, "e":Ljava/io/IOException;
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "error running fixcrlf on file "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 383
    .end local v15    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    if-eqz v4, :cond_8

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 384
    sget-object v3, Lorg/apache/tools/ant/taskdefs/FixCRLF;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    .line 383
    :cond_8
    throw v2
.end method

.method private validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 309
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->file:Ljava/io/File;

    if-eqz v0, :cond_1

    .line 310
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 311
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "<fixcrlf> error: srcdir and file are mutually exclusive"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->fileset:Lorg/apache/tools/ant/types/FileSet;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->file:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FileSet;->setFile(Ljava/io/File;)V

    .line 316
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    .line 318
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    if-nez v0, :cond_2

    .line 319
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "<fixcrlf> error: srcdir attribute must be set!"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    .line 323
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "<fixcrlf> error: srcdir does not exist: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_4

    .line 327
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "<fixcrlf> error: srcdir is not a directory: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 330
    :cond_4
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    if-eqz v0, :cond_6

    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_5

    .line 332
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "<fixcrlf> error: destdir does not exist: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 336
    :cond_5
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_6

    .line 337
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "<fixcrlf> error: destdir is not a directory: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 342
    :cond_6
    return-void
.end method


# virtual methods
.method public final chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 1
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->chain(Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 286
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->validate()V

    .line 289
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    if-nez v4, :cond_0

    const-string/jumbo v1, "default"

    .line 290
    .local v1, "enc":Ljava/lang/String;
    :goto_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "options: eol="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->getEol()Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " tab="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->getTab()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " eof="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->getEof()Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " tablength="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->getTablength()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " encoding="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " outputencoding="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->outputEncoding:Ljava/lang/String;

    if-nez v5, :cond_1

    .end local v1    # "enc":Ljava/lang/String;
    :goto_1
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->log(Ljava/lang/String;I)V

    .line 300
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    invoke-super {p0, v4}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 301
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v2

    .line 303
    .local v2, "files":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    array-length v4, v2

    if-ge v3, v4, :cond_2

    .line 304
    aget-object v4, v2, v3

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->processFile(Ljava/lang/String;)V

    .line 303
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 289
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v2    # "files":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    goto/16 :goto_0

    .line 290
    .restart local v1    # "enc":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->outputEncoding:Ljava/lang/String;

    goto :goto_1

    .line 306
    .end local v1    # "enc":Ljava/lang/String;
    .restart local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v2    # "files":[Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_2
    return-void
.end method

.method public setCr(Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;)V
    .locals 4
    .param p1, "attr"    # Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;

    .prologue
    const/4 v3, 0x1

    .line 184
    const-string/jumbo v2, "DEPRECATED: The cr attribute has been deprecated,"

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->log(Ljava/lang/String;I)V

    .line 186
    const-string/jumbo v2, "Please use the eol attribute instead"

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->log(Ljava/lang/String;I)V

    .line 187
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;->getValue()Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "option":Ljava/lang/String;
    new-instance v0, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;-><init>()V

    .line 189
    .local v0, "c":Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;
    const-string/jumbo v2, "remove"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 190
    const-string/jumbo v2, "lf"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;->setValue(Ljava/lang/String;)V

    .line 197
    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/FixCRLF;->setEol(Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;)V

    .line 198
    return-void

    .line 191
    :cond_0
    const-string/jumbo v2, "asis"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 192
    const-string/jumbo v2, "asis"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 195
    :cond_1
    const-string/jumbo v2, "crlf"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 135
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->destDir:Ljava/io/File;

    .line 136
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 250
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->encoding:Ljava/lang/String;

    .line 251
    return-void
.end method

.method public setEof(Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;)V
    .locals 2
    .param p1, "attr"    # Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;

    .prologue
    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->setEof(Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;)V

    .line 242
    return-void
.end method

.method public setEol(Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;)V
    .locals 2
    .param p1, "attr"    # Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;

    .prologue
    .line 167
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF$CrLf;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->setEol(Lorg/apache/tools/ant/filters/FixCrLfFilter$CrLf;)V

    .line 168
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->file:Ljava/io/File;

    .line 153
    return-void
.end method

.method public setFixlast(Z)V
    .locals 1
    .param p1, "fixlast"    # Z

    .prologue
    .line 268
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->setFixlast(Z)V

    .line 269
    return-void
.end method

.method public setJavafiles(Z)V
    .locals 1
    .param p1, "javafiles"    # Z

    .prologue
    .line 143
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->setJavafiles(Z)V

    .line 144
    return-void
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputEncoding"    # Ljava/lang/String;

    .prologue
    .line 259
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->outputEncoding:Ljava/lang/String;

    .line 260
    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0
    .param p1, "preserve"    # Z

    .prologue
    .line 277
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->preserveLastModified:Z

    .line 278
    return-void
.end method

.method public setSrcdir(Ljava/io/File;)V
    .locals 0
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 126
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->srcDir:Ljava/io/File;

    .line 127
    return-void
.end method

.method public setTab(Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;)V
    .locals 2
    .param p1, "attr"    # Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;->newInstance(Ljava/lang/String;)Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->setTab(Lorg/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove;)V

    .line 212
    return-void
.end method

.method public setTablength(I)V
    .locals 3
    .param p1, "tlength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 222
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/FixCRLF;->filter:Lorg/apache/tools/ant/filters/FixCrLfFilter;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/filters/FixCrLfFilter;->setTablength(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 228
    return-void

    .line 223
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
