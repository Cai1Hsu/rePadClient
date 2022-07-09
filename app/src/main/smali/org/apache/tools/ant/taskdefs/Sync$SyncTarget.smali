.class public Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;
.super Lorg/apache/tools/ant/types/AbstractFileSet;
.source "Sync.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Sync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SyncTarget"
.end annotation


# instance fields
.field private preserveEmptyDirs:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 538
    invoke-direct {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;-><init>()V

    .line 539
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;Z)Lorg/apache/tools/ant/types/FileSet;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;
    .param p1, "x1"    # Z

    .prologue
    .line 528
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->toFileSet(Z)Lorg/apache/tools/ant/types/FileSet;

    move-result-object v0

    return-object v0
.end method

.method private toFileSet(Z)Lorg/apache/tools/ant/types/FileSet;
    .locals 4
    .param p1, "withPatterns"    # Z

    .prologue
    .line 573
    new-instance v1, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 574
    .local v1, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->isCaseSensitive()Z

    move-result v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->setCaseSensitive(Z)V

    .line 575
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->isFollowSymlinks()Z

    move-result v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->setFollowSymlinks(Z)V

    .line 576
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getMaxLevelsOfSymlinks()I

    move-result v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->setMaxLevelsOfSymlinks(I)V

    .line 577
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 579
    if-eqz p1, :cond_1

    .line 580
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v2

    .line 581
    .local v2, "ps":Lorg/apache/tools/ant/types/PatternSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->appendIncludes([Ljava/lang/String;)V

    .line 582
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->appendExcludes([Ljava/lang/String;)V

    .line 583
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 584
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/selectors/FileSelector;

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    goto :goto_0

    .line 586
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->getDefaultexcludes()Z

    move-result v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/FileSet;->setDefaultexcludes(Z)V

    .line 588
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v2    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :cond_1
    return-object v1
.end method


# virtual methods
.method public getPreserveEmptyDirs()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 569
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->preserveEmptyDirs:Ljava/lang/Boolean;

    return-object v0
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
    .line 548
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "preserveintarget doesn\'t support the dir attribute"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setPreserveEmptyDirs(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 559
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Sync$SyncTarget;->preserveEmptyDirs:Ljava/lang/Boolean;

    .line 560
    return-void
.end method
