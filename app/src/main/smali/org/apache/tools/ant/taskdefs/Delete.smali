.class public Lorg/apache/tools/ant/taskdefs/Delete;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Delete.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;
    }
.end annotation


# static fields
.field private static final EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

.field private static FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final REVERSE_FILESYSTEM:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

.field private static SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private deleteOnExit:Z

.field protected dir:Ljava/io/File;

.field private failonerror:Z

.field protected file:Ljava/io/File;

.field protected filesets:Ljava/util/Vector;

.field protected includeEmpty:Z

.field private performGc:Z

.field private quiet:Z

.field private rcs:Lorg/apache/tools/ant/types/resources/Resources;

.field private removeNotFollowedSymlinks:Z

.field protected usedMatchingTask:Z

.field private verbosity:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 80
    new-instance v0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;

    new-instance v1, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;-><init>(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Delete;->REVERSE_FILESYSTEM:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .line 81
    new-instance v0, Lorg/apache/tools/ant/types/resources/selectors/Exists;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/selectors/Exists;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Delete;->EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .line 120
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Delete;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 121
    invoke-static {}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->getSymbolicLinkUtils()Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Delete;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 106
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    .line 107
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    .line 108
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    .line 109
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 111
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->includeEmpty:Z

    .line 114
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    .line 115
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    .line 116
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->failonerror:Z

    .line 117
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->deleteOnExit:Z

    .line 118
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->removeNotFollowedSymlinks:Z

    .line 119
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    .line 123
    const-string/jumbo v0, "windows"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->performGc:Z

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 690
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

.method private delete(Ljava/io/File;)Z
    .locals 4
    .param p1, "f"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x1

    .line 737
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Delete;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Delete;->performGc:Z

    invoke-virtual {v2, p1, v3}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 738
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Delete;->deleteOnExit:Z

    if-eqz v2, :cond_2

    .line 739
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v2, :cond_1

    const/4 v0, 0x3

    .line 740
    .local v0, "level":I
    :goto_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Failed to delete "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, ", calling deleteOnExit."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " This attempts to delete the file when the Ant jvm"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " has exited and might not succeed."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 743
    invoke-virtual {p1}, Ljava/io/File;->deleteOnExit()V

    .line 748
    .end local v0    # "level":I
    :cond_0
    :goto_1
    return v1

    .line 739
    :cond_1
    const/4 v0, 0x2

    goto :goto_0

    .line 746
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private handle(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 724
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->failonerror:Z

    if-eqz v0, :cond_1

    .line 725
    instance-of v0, p1, Lorg/apache/tools/ant/BuildException;

    if-eqz v0, :cond_0

    check-cast p1, Lorg/apache/tools/ant/BuildException;

    .end local p1    # "e":Ljava/lang/Exception;
    :goto_0
    throw p1

    .restart local p1    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    move-object p1, v0

    goto :goto_0

    .line 728
    :cond_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    :goto_1
    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/Throwable;I)V

    .line 729
    return-void

    .line 728
    :cond_2
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_1
.end method

.method private handle(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 720
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/Exception;)V

    .line 721
    return-void
.end method

.method private isDanglingSymlink(Ljava/io/File;)Z
    .locals 3
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 829
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Delete;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isDanglingSymbolicLink(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 834
    :goto_0
    return v1

    .line 830
    :catch_0
    move-exception v0

    .line 831
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Error while trying to detect "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " as broken symbolic link. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    :goto_1
    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 834
    const/4 v1, 0x0

    goto :goto_0

    .line 831
    :cond_0
    iget v1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_1
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 228
    if-nez p1, :cond_0

    .line 236
    :goto_0
    return-void

    .line 231
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    if-nez v0, :cond_1

    .line 232
    new-instance v0, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    .line 233
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->setCache(Z)V

    .line 235
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    goto :goto_0
.end method

.method public add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 521
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 522
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 523
    return-void
.end method

.method public addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/AndSelector;

    .prologue
    .line 384
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 385
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V

    .line 386
    return-void
.end method

.method public addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsSelector;

    .prologue
    .line 465
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 466
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V

    .line 467
    return-void
.end method

.method public addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;

    .prologue
    .line 501
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 502
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V

    .line 503
    return-void
.end method

.method public addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ExtendSelector;

    .prologue
    .line 456
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 457
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V

    .line 458
    return-void
.end method

.method public addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DateSelector;

    .prologue
    .line 429
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 430
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V

    .line 431
    return-void
.end method

.method public addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DependSelector;

    .prologue
    .line 492
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 493
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V

    .line 494
    return-void
.end method

.method public addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DepthSelector;

    .prologue
    .line 483
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 484
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V

    .line 485
    return-void
.end method

.method public addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FilenameSelector;

    .prologue
    .line 447
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 448
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V

    .line 449
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 220
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 221
    return-void
.end method

.method public addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/MajoritySelector;

    .prologue
    .line 420
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 421
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V

    .line 422
    return-void
.end method

.method public addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;

    .prologue
    .line 511
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 512
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V

    .line 513
    return-void
.end method

.method public addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NoneSelector;

    .prologue
    .line 411
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 412
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V

    .line 413
    return-void
.end method

.method public addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NotSelector;

    .prologue
    .line 402
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 403
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V

    .line 404
    return-void
.end method

.method public addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/OrSelector;

    .prologue
    .line 393
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 394
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V

    .line 395
    return-void
.end method

.method public addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/PresentSelector;

    .prologue
    .line 474
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 475
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V

    .line 476
    return-void
.end method

.method public addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SelectSelector;

    .prologue
    .line 375
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 376
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V

    .line 377
    return-void
.end method

.method public addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SizeSelector;

    .prologue
    .line 438
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 439
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V

    .line 440
    return-void
.end method

.method public createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 261
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 262
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 270
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 271
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 243
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 244
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 252
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 253
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createPatternSet()Lorg/apache/tools/ant/types/PatternSet;
    .locals 1

    .prologue
    .line 279
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 280
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createPatternSet()Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 27
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 530
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    move/from16 v24, v0

    if-eqz v24, :cond_0

    .line 531
    const-string/jumbo v25, "DEPRECATED - Use of the implicit FileSet is deprecated.  Use a nested fileset element instead."

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1

    const/16 v24, 0x3

    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 535
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    if-nez v24, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    if-nez v24, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->size()I

    move-result v24

    if-nez v24, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    move-object/from16 v24, v0

    if-nez v24, :cond_2

    .line 536
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v25, "At least one of the file or dir attributes, or a nested resource collection, must be set."

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 531
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v24, v0

    goto :goto_0

    .line 541
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    move/from16 v24, v0

    if-eqz v24, :cond_3

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->failonerror:Z

    move/from16 v24, v0

    if-eqz v24, :cond_3

    .line 542
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v25, "quiet and failonerror cannot both be set to true"

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v26

    invoke-direct/range {v24 .. v26}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v24

    .line 547
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    if-eqz v24, :cond_4

    .line 548
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->exists()Z

    move-result v24

    if-eqz v24, :cond_c

    .line 549
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_b

    .line 550
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Directory "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " cannot be removed using the file attribute.  "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, "Use dir instead."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    move/from16 v24, v0

    if-eqz v24, :cond_a

    const/16 v24, 0x3

    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 574
    :cond_4
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    if-eqz v24, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    move/from16 v24, v0

    if-nez v24, :cond_6

    .line 575
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->exists()Z

    move-result v24

    if-eqz v24, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_10

    .line 583
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v24, v0

    const/16 v25, 0x3

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_5

    .line 584
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Deleting directory "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;)V

    .line 586
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->removeDir(Ljava/io/File;)V

    .line 597
    :cond_6
    :goto_3
    new-instance v21, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct/range {v21 .. v21}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    .line 598
    .local v21, "resourcesToDelete":Lorg/apache/tools/ant/types/resources/Resources;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 599
    const/16 v24, 0x1

    move-object/from16 v0, v21

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->setCache(Z)V

    .line 600
    new-instance v11, Lorg/apache/tools/ant/types/resources/Resources;

    invoke-direct {v11}, Lorg/apache/tools/ant/types/resources/Resources;-><init>()V

    .line 601
    .local v11, "filesetDirs":Lorg/apache/tools/ant/types/resources/Resources;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/types/resources/Resources;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 602
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/types/resources/Resources;->setCache(Z)V

    .line 603
    const/4 v15, 0x0

    .line 604
    .local v15, "implicit":Lorg/apache/tools/ant/types/FileSet;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    move/from16 v24, v0

    if-eqz v24, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    if-eqz v24, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_7

    .line 606
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getImplicitFileSet()Lorg/apache/tools/ant/types/FileSet;

    move-result-object v15

    .line 607
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v15, v0}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 608
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 611
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->size()I

    move-result v23

    .line 612
    .local v23, "size":I
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_4
    move/from16 v0, v23

    if-ge v14, v0, :cond_16

    .line 613
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/apache/tools/ant/types/FileSet;

    .line 614
    .local v12, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v12}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    if-nez v24, :cond_8

    .line 615
    const-string/jumbo v24, "Deleting fileset with no project specified; assuming executing project"

    const/16 v25, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 617
    invoke-virtual {v12}, Lorg/apache/tools/ant/types/FileSet;->clone()Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    check-cast v12, Lorg/apache/tools/ant/types/FileSet;

    .line 618
    .restart local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v12, v0}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 620
    :cond_8
    invoke-virtual {v12}, Lorg/apache/tools/ant/types/FileSet;->getDir()Ljava/io/File;

    move-result-object v13

    .line 621
    .local v13, "fsDir":Ljava/io/File;
    invoke-virtual {v12}, Lorg/apache/tools/ant/types/FileSet;->getErrorOnMissingDir()Z

    move-result v24

    if-nez v24, :cond_12

    if-eqz v13, :cond_9

    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v24

    if-nez v24, :cond_12

    .line 612
    :cond_9
    :goto_5
    add-int/lit8 v14, v14, 0x1

    goto :goto_4

    .line 550
    .end local v11    # "filesetDirs":Lorg/apache/tools/ant/types/resources/Resources;
    .end local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v13    # "fsDir":Ljava/io/File;
    .end local v14    # "i":I
    .end local v15    # "implicit":Lorg/apache/tools/ant/types/FileSet;
    .end local v21    # "resourcesToDelete":Lorg/apache/tools/ant/types/resources/Resources;
    .end local v23    # "size":I
    :cond_a
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v24, v0

    goto/16 :goto_1

    .line 554
    :cond_b
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Deleting: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;)V

    .line 556
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v24

    if-nez v24, :cond_4

    .line 557
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Unable to delete file "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 560
    :cond_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->isDanglingSymlink(Ljava/io/File;)Z

    move-result v24

    if-eqz v24, :cond_e

    .line 561
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Trying to delete file "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " which looks like a broken symlink."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    move/from16 v24, v0

    if-eqz v24, :cond_d

    const/16 v24, 0x3

    :goto_6
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 564
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v24

    if-nez v24, :cond_4

    .line 565
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Unable to delete file "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 561
    :cond_d
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v24, v0

    goto :goto_6

    .line 568
    :cond_e
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Could not find file "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " to delete."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    move/from16 v24, v0

    if-eqz v24, :cond_f

    const/16 v24, 0x3

    :goto_7
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    goto/16 :goto_2

    :cond_f
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v24, v0

    goto :goto_7

    .line 587
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->isDanglingSymlink(Ljava/io/File;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 588
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Trying to delete directory "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " which looks like a broken symlink."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    move/from16 v24, v0

    if-eqz v24, :cond_11

    const/16 v24, 0x3

    :goto_8
    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 591
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v24

    if-nez v24, :cond_6

    .line 592
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Unable to delete directory "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 588
    :cond_11
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v24, v0

    goto :goto_8

    .line 625
    .restart local v11    # "filesetDirs":Lorg/apache/tools/ant/types/resources/Resources;
    .restart local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .restart local v13    # "fsDir":Ljava/io/File;
    .restart local v14    # "i":I
    .restart local v15    # "implicit":Lorg/apache/tools/ant/types/FileSet;
    .restart local v21    # "resourcesToDelete":Lorg/apache/tools/ant/types/resources/Resources;
    .restart local v23    # "size":I
    :cond_12
    if-nez v13, :cond_13

    .line 626
    new-instance v24, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v25, "File or Resource without directory or file specified"

    invoke-direct/range {v24 .. v25}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 628
    :cond_13
    invoke-virtual {v13}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-nez v24, :cond_14

    .line 629
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Directory does not exist: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 631
    :cond_14
    invoke-virtual {v12}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner()Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v5

    .line 635
    .local v5, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v10

    .line 636
    .local v10, "files":[Ljava/lang/String;
    new-instance v24, Lorg/apache/tools/ant/taskdefs/Delete$2;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v10, v13}, Lorg/apache/tools/ant/taskdefs/Delete$2;-><init>(Lorg/apache/tools/ant/taskdefs/Delete;[Ljava/lang/String;Ljava/io/File;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 648
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->includeEmpty:Z

    move/from16 v24, v0

    if-eqz v24, :cond_15

    .line 649
    new-instance v24, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v25

    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v13, v2}, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-virtual {v11, v0}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 654
    :cond_15
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->removeNotFollowedSymlinks:Z

    move/from16 v24, v0

    if-eqz v24, :cond_9

    .line 655
    invoke-virtual {v5}, Lorg/apache/tools/ant/DirectoryScanner;->getNotFollowedSymlinks()[Ljava/lang/String;

    move-result-object v19

    .line 656
    .local v19, "n":[Ljava/lang/String;
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v24, v0

    if-lez v24, :cond_9

    .line 657
    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v18, v0

    .line 658
    .local v18, "links":[Ljava/lang/String;
    const/16 v24, 0x0

    const/16 v25, 0x0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v26, v0

    move-object/from16 v0, v19

    move/from16 v1, v24

    move-object/from16 v2, v18

    move/from16 v3, v25

    move/from16 v4, v26

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 659
    sget-object v24, Lorg/apache/tools/ant/taskdefs/Delete$ReverseDirs;->REVERSE:Ljava/util/Comparator;

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 660
    const/16 v17, 0x0

    .local v17, "l":I
    :goto_9
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v17

    move/from16 v1, v24

    if-ge v0, v1, :cond_9

    .line 662
    :try_start_0
    sget-object v24, Lorg/apache/tools/ant/taskdefs/Delete;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    new-instance v25, Ljava/io/File;

    aget-object v26, v18, v17

    invoke-direct/range {v25 .. v26}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->deleteSymbolicLink(Ljava/io/File;Lorg/apache/tools/ant/Task;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 660
    :goto_a
    add-int/lit8 v17, v17, 0x1

    goto :goto_9

    .line 665
    :catch_0
    move-exception v7

    .line 666
    .local v7, "ex":Ljava/io/IOException;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/Exception;)V

    goto :goto_a

    .line 673
    .end local v5    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v7    # "ex":Ljava/io/IOException;
    .end local v10    # "files":[Ljava/lang/String;
    .end local v12    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v13    # "fsDir":Ljava/io/File;
    .end local v17    # "l":I
    .end local v18    # "links":[Ljava/lang/String;
    .end local v19    # "n":[Ljava/lang/String;
    :cond_16
    move-object/from16 v0, v21

    invoke-virtual {v0, v11}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 674
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    move-object/from16 v24, v0

    if-eqz v24, :cond_17

    .line 676
    new-instance v8, Lorg/apache/tools/ant/types/resources/Restrict;

    invoke-direct {v8}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 677
    .local v8, "exists":Lorg/apache/tools/ant/types/resources/Restrict;
    sget-object v24, Lorg/apache/tools/ant/taskdefs/Delete;->EXISTS:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    move-object/from16 v0, v24

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 678
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->rcs:Lorg/apache/tools/ant/types/resources/Resources;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 679
    new-instance v22, Lorg/apache/tools/ant/types/resources/Sort;

    invoke-direct/range {v22 .. v22}, Lorg/apache/tools/ant/types/resources/Sort;-><init>()V

    .line 680
    .local v22, "s":Lorg/apache/tools/ant/types/resources/Sort;
    sget-object v24, Lorg/apache/tools/ant/taskdefs/Delete;->REVERSE_FILESYSTEM:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Sort;->add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V

    .line 681
    move-object/from16 v0, v22

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/resources/Sort;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 682
    invoke-virtual/range {v21 .. v22}, Lorg/apache/tools/ant/types/resources/Resources;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 685
    .end local v8    # "exists":Lorg/apache/tools/ant/types/resources/Restrict;
    .end local v22    # "s":Lorg/apache/tools/ant/types/resources/Sort;
    :cond_17
    :try_start_1
    invoke-virtual/range {v21 .. v21}, Lorg/apache/tools/ant/types/resources/Resources;->isFilesystemOnly()Z

    move-result v24

    if-eqz v24, :cond_1d

    .line 686
    invoke-virtual/range {v21 .. v21}, Lorg/apache/tools/ant/types/resources/Resources;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "iter":Ljava/util/Iterator;
    :cond_18
    :goto_b
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_1e

    .line 689
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/apache/tools/ant/types/Resource;

    .line 690
    .local v20, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v24, Lorg/apache/tools/ant/taskdefs/Delete;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v24, :cond_1b

    const-string/jumbo v24, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static/range {v24 .. v24}, Lorg/apache/tools/ant/taskdefs/Delete;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v24

    sput-object v24, Lorg/apache/tools/ant/taskdefs/Delete;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_c
    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface/range {v24 .. v24}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v9

    .line 692
    .local v9, "f":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v24

    if-eqz v24, :cond_18

    .line 695
    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_19

    invoke-virtual {v9}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    if-nez v24, :cond_18

    .line 696
    :cond_19
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Deleting "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 697
    move-object/from16 v0, p0

    invoke-direct {v0, v9}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v24

    if-nez v24, :cond_18

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->failonerror:Z

    move/from16 v24, v0

    if-eqz v24, :cond_18

    .line 698
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Unable to delete "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v25

    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v24

    if-eqz v24, :cond_1c

    const-string/jumbo v24, "directory "

    :goto_d
    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_b

    .line 706
    .end local v9    # "f":Ljava/io/File;
    .end local v16    # "iter":Ljava/util/Iterator;
    .end local v20    # "r":Lorg/apache/tools/ant/types/Resource;
    :catch_1
    move-exception v6

    .line 707
    .local v6, "e":Ljava/lang/Exception;
    :try_start_2
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 709
    if-eqz v15, :cond_1a

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v24, v0

    .end local v6    # "e":Ljava/lang/Exception;
    :goto_e
    move-object/from16 v0, v24

    invoke-virtual {v0, v15}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 713
    :cond_1a
    return-void

    .line 690
    .restart local v16    # "iter":Ljava/util/Iterator;
    .restart local v20    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1b
    :try_start_3
    sget-object v24, Lorg/apache/tools/ant/taskdefs/Delete;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto/16 :goto_c

    .line 698
    .restart local v9    # "f":Ljava/io/File;
    :cond_1c
    const-string/jumbo v24, "file "

    goto :goto_d

    .line 704
    .end local v9    # "f":Ljava/io/File;
    .end local v16    # "iter":Ljava/util/Iterator;
    .end local v20    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1d
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getTaskName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " handles only filesystem resources"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 709
    :cond_1e
    if-eqz v15, :cond_1a

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v24, v0

    goto :goto_e

    .line 709
    :catchall_0
    move-exception v24

    if-eqz v15, :cond_1f

    .line 710
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Delete;->filesets:Ljava/util/Vector;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v0, v15}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 709
    :cond_1f
    throw v24
.end method

.method protected removeDir(Ljava/io/File;)V
    .locals 6
    .param p1, "d"    # Ljava/io/File;

    .prologue
    .line 757
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 758
    .local v2, "list":[Ljava/lang/String;
    if-nez v2, :cond_0

    .line 759
    const/4 v4, 0x0

    new-array v2, v4, [Ljava/lang/String;

    .line 761
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_4

    .line 762
    aget-object v3, v2, v1

    .line 763
    .local v3, "s":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 764
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 765
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Delete;->removeDir(Ljava/io/File;)V

    .line 761
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 767
    :cond_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Deleting "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v4, :cond_3

    const/4 v4, 0x3

    :goto_2
    invoke-virtual {p0, v5, v4}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 768
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 769
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    goto :goto_1

    .line 767
    :cond_3
    iget v4, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_2

    .line 773
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

    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 774
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 775
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to delete directory "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    .line 777
    :cond_5
    return-void
.end method

.method protected removeFiles(Ljava/io/File;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 8
    .param p1, "d"    # Ljava/io/File;
    .param p2, "files"    # [Ljava/lang/String;
    .param p3, "dirs"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x3

    .line 787
    array-length v5, p2

    if-lez v5, :cond_3

    .line 788
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Deleting "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    array-length v7, p2

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v7, " files from "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v5, :cond_1

    move v5, v6

    :goto_0
    invoke-virtual {p0, v7, v5}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 790
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    array-length v5, p2

    if-ge v4, v5, :cond_3

    .line 791
    new-instance v3, Ljava/io/File;

    aget-object v5, p2, v4

    invoke-direct {v3, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 792
    .local v3, "f":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Deleting "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v5, :cond_2

    move v5, v6

    :goto_2
    invoke-virtual {p0, v7, v5}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 794
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 795
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Unable to delete file "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    .line 790
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 788
    .end local v3    # "f":Ljava/io/File;
    .end local v4    # "j":I
    :cond_1
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_0

    .line 792
    .restart local v3    # "f":Ljava/io/File;
    .restart local v4    # "j":I
    :cond_2
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_2

    .line 800
    .end local v3    # "f":Ljava/io/File;
    .end local v4    # "j":I
    :cond_3
    array-length v5, p3

    if-lez v5, :cond_9

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->includeEmpty:Z

    if-eqz v5, :cond_9

    .line 801
    const/4 v1, 0x0

    .line 802
    .local v1, "dirCount":I
    array-length v5, p3

    add-int/lit8 v4, v5, -0x1

    .restart local v4    # "j":I
    :goto_3
    if-ltz v4, :cond_8

    .line 803
    new-instance v0, Ljava/io/File;

    aget-object v5, p3, v4

    invoke-direct {v0, p1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 804
    .local v0, "currDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 805
    .local v2, "dirFiles":[Ljava/lang/String;
    if-eqz v2, :cond_4

    array-length v5, v2

    if-nez v5, :cond_5

    .line 806
    :cond_4
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Deleting "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v5, :cond_6

    move v5, v6

    :goto_4
    invoke-virtual {p0, v7, v5}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 808
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Delete;->delete(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 809
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Unable to delete directory "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/Delete;->handle(Ljava/lang/String;)V

    .line 802
    :cond_5
    :goto_5
    add-int/lit8 v4, v4, -0x1

    goto :goto_3

    .line 806
    :cond_6
    iget v5, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_4

    .line 812
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 817
    .end local v0    # "currDir":Ljava/io/File;
    .end local v2    # "dirFiles":[Ljava/lang/String;
    :cond_8
    if-lez v1, :cond_9

    .line 818
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Deleted "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v7, " director"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const/4 v5, 0x1

    if-ne v1, v5, :cond_a

    const-string/jumbo v5, "y"

    :goto_6
    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v7, " form "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    if-eqz v7, :cond_b

    :goto_7
    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Delete;->log(Ljava/lang/String;I)V

    .line 825
    .end local v1    # "dirCount":I
    .end local v4    # "j":I
    :cond_9
    return-void

    .line 818
    .restart local v1    # "dirCount":I
    .restart local v4    # "j":I
    :cond_a
    const-string/jumbo v5, "ies"

    goto :goto_6

    :cond_b
    iget v6, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_7
.end method

.method public setCaseSensitive(Z)V
    .locals 1
    .param p1, "isCaseSensitive"    # Z

    .prologue
    .line 346
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 347
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setCaseSensitive(Z)V

    .line 348
    return-void
.end method

.method public setDefaultexcludes(Z)V
    .locals 1
    .param p1, "useDefaultExcludes"    # Z

    .prologue
    .line 313
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 314
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setDefaultexcludes(Z)V

    .line 315
    return-void
.end method

.method public setDeleteOnExit(Z)V
    .locals 0
    .param p1, "deleteOnExit"    # Z

    .prologue
    .line 189
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->deleteOnExit:Z

    .line 190
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 1
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->dir:Ljava/io/File;

    .line 141
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Delete;->getImplicitFileSet()Lorg/apache/tools/ant/types/FileSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 142
    return-void
.end method

.method public setExcludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "excludes"    # Ljava/lang/String;

    .prologue
    .line 301
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 302
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setExcludes(Ljava/lang/String;)V

    .line 303
    return-void
.end method

.method public setExcludesfile(Ljava/io/File;)V
    .locals 1
    .param p1, "excludesfile"    # Ljava/io/File;

    .prologue
    .line 335
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 336
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setExcludesfile(Ljava/io/File;)V

    .line 337
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "failonerror"    # Z

    .prologue
    .line 179
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->failonerror:Z

    .line 180
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->file:Ljava/io/File;

    .line 132
    return-void
.end method

.method public setFollowSymlinks(Z)V
    .locals 1
    .param p1, "followSymlinks"    # Z

    .prologue
    .line 356
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 357
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setFollowSymlinks(Z)V

    .line 358
    return-void
.end method

.method public setIncludeEmptyDirs(Z)V
    .locals 0
    .param p1, "includeEmpty"    # Z

    .prologue
    .line 199
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->includeEmpty:Z

    .line 200
    return-void
.end method

.method public setIncludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "includes"    # Ljava/lang/String;

    .prologue
    .line 290
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 291
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setIncludes(Ljava/lang/String;)V

    .line 292
    return-void
.end method

.method public setIncludesfile(Ljava/io/File;)V
    .locals 1
    .param p1, "includesfile"    # Ljava/io/File;

    .prologue
    .line 324
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->usedMatchingTask:Z

    .line 325
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->setIncludesfile(Ljava/io/File;)V

    .line 326
    return-void
.end method

.method public setPerformGcOnFailedDelete(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 212
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->performGc:Z

    .line 213
    return-void
.end method

.method public setQuiet(Z)V
    .locals 1
    .param p1, "quiet"    # Z

    .prologue
    .line 167
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->quiet:Z

    .line 168
    if-eqz p1, :cond_0

    .line 169
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->failonerror:Z

    .line 171
    :cond_0
    return-void
.end method

.method public setRemoveNotFollowedSymlinks(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 367
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Delete;->removeNotFollowedSymlinks:Z

    .line 368
    return-void
.end method

.method public setVerbose(Z)V
    .locals 1
    .param p1, "verbose"    # Z

    .prologue
    .line 150
    if-eqz p1, :cond_0

    .line 151
    const/4 v0, 0x2

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    .line 155
    :goto_0
    return-void

    .line 153
    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Delete;->verbosity:I

    goto :goto_0
.end method
