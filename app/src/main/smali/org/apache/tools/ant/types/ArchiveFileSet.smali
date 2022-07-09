.class public abstract Lorg/apache/tools/ant/types/ArchiveFileSet;
.super Lorg/apache/tools/ant/types/FileSet;
.source "ArchiveFileSet.java"


# static fields
.field private static final BASE_OCTAL:I = 0x8

.field public static final DEFAULT_DIR_MODE:I = 0x41ed

.field public static final DEFAULT_FILE_MODE:I = 0x81a4

.field private static final ERROR_DIR_AND_SRC_ATTRIBUTES:Ljava/lang/String; = "Cannot set both dir and src attributes"

.field private static final ERROR_PATH_AND_PREFIX:Ljava/lang/String; = "Cannot set both fullpath and prefix attributes"

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private dirMode:I

.field private dirModeHasBeenSet:Z

.field private errorOnMissingArchive:Z

.field private fileMode:I

.field private fileModeHasBeenSet:Z

.field private fullpath:Ljava/lang/String;

.field private hasDir:Z

.field private prefix:Ljava/lang/String;

.field private src:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    .line 61
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    .line 62
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    .line 63
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    .line 64
    const v0, 0x81a4

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    .line 65
    const/16 v0, 0x41ed

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    .line 67
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    .line 68
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    .line 77
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/ArchiveFileSet;)V
    .locals 2
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/ArchiveFileSet;

    .prologue
    const/4 v1, 0x0

    .line 92
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/FileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    .line 61
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    .line 62
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    .line 63
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    .line 64
    const v0, 0x81a4

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    .line 65
    const/16 v0, 0x41ed

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    .line 67
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    .line 68
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    .line 93
    iget-object v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    .line 94
    iget-object v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    .line 95
    iget-object v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    .line 96
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    .line 97
    iget v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    .line 98
    iget v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    .line 99
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    .line 100
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    .line 101
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    .line 102
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 2
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/FileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    .line 61
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    .line 62
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    .line 63
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    .line 64
    const v0, 0x81a4

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    .line 65
    const/16 v0, 0x41ed

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    .line 67
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    .line 68
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    .line 72
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    .line 85
    return-void
.end method

.method private checkArchiveAttributesAllowed()V
    .locals 2

    .prologue
    .line 539
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    if-eqz v0, :cond_1

    .line 544
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkAttributesAllowed()V

    .line 546
    :cond_1
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 191
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
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkChildrenAllowed()V

    .line 125
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 126
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported as archives"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 129
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 130
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 477
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 478
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 480
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/FileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected configureFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)V
    .locals 1
    .param p1, "zfs"    # Lorg/apache/tools/ant/types/ArchiveFileSet;

    .prologue
    .line 462
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setPrefix(Ljava/lang/String;)V

    .line 463
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setFullpath(Ljava/lang/String;)V

    .line 464
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    iput-boolean v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    .line 465
    iget v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    iput v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    .line 466
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    iput-boolean v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    .line 467
    iget v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    iput v0, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    .line 468
    return-void
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 550
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 563
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 555
    :cond_1
    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/FileSet;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 557
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-nez v0, :cond_0

    .line 558
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_2

    .line 559
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/ArchiveFileSet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 561
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 550
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 211
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    return-object v0
.end method

.method public getDirMode()I
    .locals 1

    .prologue
    .line 527
    iget v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    return v0
.end method

.method public getDirMode(Lorg/apache/tools/ant/Project;)I
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 436
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 437
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getDirMode(Lorg/apache/tools/ant/Project;)I

    move-result v0

    .line 440
    :goto_0
    return v0

    .line 439
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 440
    iget v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    goto :goto_0
.end method

.method public getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;
    .locals 4
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 282
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 283
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 303
    :goto_0
    return-object v0

    .line 285
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 286
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_1

    .line 287
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    goto :goto_0

    .line 289
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v1

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    if-eqz v1, :cond_2

    .line 290
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The archive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 293
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 294
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The archive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " can\'t be a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 297
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->newArchiveScanner()Lorg/apache/tools/ant/types/ArchiveScanner;

    move-result-object v0

    .line 298
    .local v0, "as":Lorg/apache/tools/ant/types/ArchiveScanner;
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ArchiveScanner;->setErrorOnMissingArchive(Z)V

    .line 299
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ArchiveScanner;->setSrc(Lorg/apache/tools/ant/types/Resource;)V

    .line 300
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    invoke-super {p0, v1}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 301
    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;Lorg/apache/tools/ant/Project;)V

    .line 302
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveScanner;->init()V

    goto/16 :goto_0
.end method

.method public getFileMode()I
    .locals 1

    .prologue
    .line 519
    iget v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    return v0
.end method

.method public getFileMode(Lorg/apache/tools/ant/Project;)I
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 386
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 387
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFileMode(Lorg/apache/tools/ant/Project;)I

    move-result v0

    .line 390
    :goto_0
    return v0

    .line 389
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 390
    iget v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    goto :goto_0
.end method

.method public getFullpath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 511
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    return-object v0
.end method

.method public getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 261
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 262
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v0

    .line 265
    :goto_0
    return-object v0

    .line 264
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 265
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 502
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    return-object v0
.end method

.method public getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 234
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v0

    .line 238
    :goto_0
    return-object v0

    .line 237
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 238
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    goto :goto_0
.end method

.method public getSrc()Ljava/io/File;
    .locals 3

    .prologue
    .line 186
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getSrc()Ljava/io/File;

    move-result-object v1

    .line 196
    :goto_0
    return-object v1

    .line 189
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 190
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-eqz v1, :cond_2

    .line 191
    iget-object v2, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    sget-object v1, Lorg/apache/tools/ant/types/ArchiveFileSet;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_1

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/types/ArchiveFileSet;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 192
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_2

    .line 193
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    goto :goto_0

    .line 191
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/types/ArchiveFileSet;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 196
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getSrc(Lorg/apache/tools/ant/Project;)Ljava/io/File;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 164
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getSrc(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v0

    .line 166
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getSrc()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public hasDirModeBeenSet()Z
    .locals 1

    .prologue
    .line 449
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 450
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDirModeBeenSet()Z

    move-result v0

    .line 453
    :goto_0
    return v0

    .line 452
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 453
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    goto :goto_0
.end method

.method public hasFileModeBeenSet()Z
    .locals 1

    .prologue
    .line 398
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 399
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasFileModeBeenSet()Z

    move-result v0

    .line 402
    :goto_0
    return v0

    .line 401
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 402
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    goto :goto_0
.end method

.method public integerSetDirMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 426
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirModeHasBeenSet:Z

    .line 427
    or-int/lit16 v0, p1, 0x4000

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->dirMode:I

    .line 428
    return-void
.end method

.method public integerSetFileMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 376
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileModeHasBeenSet:Z

    .line 377
    const v0, 0x8000

    or-int/2addr v0, p1

    iput v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fileMode:I

    .line 378
    return-void
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 347
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 348
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isFilesystemOnly()Z

    move-result v0

    .line 351
    :goto_0
    return v0

    .line 350
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->dieOnCircularReference()V

    .line 351
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 312
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 313
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 319
    :goto_0
    return-object v1

    .line 315
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_1

    .line 316
    invoke-super {p0}, Lorg/apache/tools/ant/types/FileSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    goto :goto_0

    .line 318
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveScanner;

    .line 319
    .local v0, "as":Lorg/apache/tools/ant/types/ArchiveScanner;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ArchiveScanner;->getResourceFiles(Lorg/apache/tools/ant/Project;)Ljava/util/Iterator;

    move-result-object v1

    goto :goto_0
.end method

.method protected abstract newArchiveScanner()Lorg/apache/tools/ant/types/ArchiveScanner;
.end method

.method public setDir(Ljava/io/File;)V
    .locals 2
    .param p1, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkAttributesAllowed()V

    .line 111
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 112
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot set both dir and src attributes"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 115
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    .line 116
    return-void
.end method

.method public setDirMode(Ljava/lang/String;)V
    .locals 1
    .param p1, "octalString"    # Ljava/lang/String;

    .prologue
    .line 412
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkArchiveAttributesAllowed()V

    .line 413
    const/16 v0, 0x8

    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->integerSetDirMode(I)V

    .line 414
    return-void
.end method

.method public setErrorOnMissingArchive(Z)V
    .locals 0
    .param p1, "errorOnMissingArchive"    # Z

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkAttributesAllowed()V

    .line 178
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->errorOnMissingArchive:Z

    .line 179
    return-void
.end method

.method public setFileMode(Ljava/lang/String;)V
    .locals 1
    .param p1, "octalString"    # Ljava/lang/String;

    .prologue
    .line 361
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkArchiveAttributesAllowed()V

    .line 362
    const/16 v0, 0x8

    invoke-static {p1, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->integerSetFileMode(I)V

    .line 363
    return-void
.end method

.method public setFullpath(Ljava/lang/String;)V
    .locals 2
    .param p1, "fullpath"    # Ljava/lang/String;

    .prologue
    .line 248
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkArchiveAttributesAllowed()V

    .line 249
    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot set both fullpath and prefix attributes"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 252
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    .line 253
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 2
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 221
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkArchiveAttributesAllowed()V

    .line 222
    const-string/jumbo v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->fullpath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 223
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot set both fullpath and prefix attributes"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 225
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->prefix:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "srcFile"    # Ljava/io/File;

    .prologue
    .line 139
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 140
    return-void
.end method

.method public setSrcResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 2
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 149
    invoke-direct {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->checkArchiveAttributesAllowed()V

    .line 150
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    if-eqz v0, :cond_0

    .line 151
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot set both dir and src attributes"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    .line 154
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->setChecked(Z)V

    .line 155
    return-void
.end method

.method public size()I
    .locals 2

    .prologue
    .line 328
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 329
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v1

    .line 335
    :goto_0
    return v1

    .line 331
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_1

    .line 332
    invoke-super {p0}, Lorg/apache/tools/ant/types/FileSet;->size()I

    move-result v1

    goto :goto_0

    .line 334
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveScanner;

    .line 335
    .local v0, "as":Lorg/apache/tools/ant/types/ArchiveScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveScanner;->getIncludedFilesCount()I

    move-result v1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 490
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDir:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 491
    invoke-super {p0}, Lorg/apache/tools/ant/types/FileSet;->toString()Ljava/lang/String;

    move-result-object v0

    .line 493
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/ArchiveFileSet;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
