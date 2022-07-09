.class public abstract Lorg/apache/tools/ant/types/AbstractFileSet;
.super Lorg/apache/tools/ant/types/DataType;
.source "AbstractFileSet.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/tools/ant/types/selectors/SelectorContainer;


# instance fields
.field private additionalPatterns:Ljava/util/Vector;

.field private caseSensitive:Z

.field private defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

.field private dir:Ljava/io/File;

.field private directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

.field private errorOnMissingDir:Z

.field private followSymlinks:Z

.field private maxLevelsOfSymlinks:I

.field private selectors:Ljava/util/Vector;

.field private useDefaultExcludes:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 82
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 64
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 65
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    .line 66
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    .line 69
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z

    .line 70
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z

    .line 71
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z

    .line 72
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    .line 73
    const/4 v0, 0x5

    iput v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 83
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/AbstractFileSet;)V
    .locals 2
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/AbstractFileSet;

    .prologue
    const/4 v1, 0x1

    .line 90
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 64
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 65
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    .line 66
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    .line 69
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z

    .line 70
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z

    .line 71
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z

    .line 72
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    .line 73
    const/4 v0, 0x5

    iput v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 91
    iget-object v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    .line 92
    iget-object v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 93
    iget-object v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    .line 94
    iget-object v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    .line 95
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z

    .line 96
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z

    .line 97
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z

    .line 98
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    .line 99
    iget v0, p1, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    iput v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    .line 100
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 101
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 807
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 808
    return-void
.end method

.method public addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/AndSelector;

    .prologue
    .line 661
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 662
    return-void
.end method

.method public addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsSelector;

    .prologue
    .line 749
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 750
    return-void
.end method

.method public addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;

    .prologue
    .line 781
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 782
    return-void
.end method

.method public addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ExtendSelector;

    .prologue
    .line 741
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 742
    return-void
.end method

.method public addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DateSelector;

    .prologue
    .line 701
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 702
    return-void
.end method

.method public addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DependSelector;

    .prologue
    .line 773
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 774
    return-void
.end method

.method public addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DepthSelector;

    .prologue
    .line 765
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 766
    return-void
.end method

.method public addDifferent(Lorg/apache/tools/ant/types/selectors/DifferentSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DifferentSelector;

    .prologue
    .line 717
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 718
    return-void
.end method

.method public addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FilenameSelector;

    .prologue
    .line 725
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 726
    return-void
.end method

.method public addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/MajoritySelector;

    .prologue
    .line 693
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 694
    return-void
.end method

.method public addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;

    .prologue
    .line 790
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 791
    return-void
.end method

.method public addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NoneSelector;

    .prologue
    .line 685
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 686
    return-void
.end method

.method public addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NotSelector;

    .prologue
    .line 677
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 678
    return-void
.end method

.method public addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/OrSelector;

    .prologue
    .line 669
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 670
    return-void
.end method

.method public addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/PresentSelector;

    .prologue
    .line 757
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 758
    return-void
.end method

.method public addReadable(Lorg/apache/tools/ant/types/selectors/ReadableSelector;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/selectors/ReadableSelector;

    .prologue
    .line 794
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 795
    return-void
.end method

.method public addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SelectSelector;

    .prologue
    .line 653
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 654
    return-void
.end method

.method public addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SizeSelector;

    .prologue
    .line 709
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 710
    return-void
.end method

.method public addType(Lorg/apache/tools/ant/types/selectors/TypeSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/TypeSelector;

    .prologue
    .line 733
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 734
    return-void
.end method

.method public addWritable(Lorg/apache/tools/ant/types/selectors/WritableSelector;)V
    .locals 0
    .param p1, "w"    # Lorg/apache/tools/ant/types/selectors/WritableSelector;

    .prologue
    .line 798
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 799
    return-void
.end method

.method public declared-synchronized appendExcludes([Ljava/lang/String;)V
    .locals 3
    .param p1, "excludes"    # [Ljava/lang/String;

    .prologue
    .line 293
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 294
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 296
    :cond_0
    if-eqz p1, :cond_2

    .line 297
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_1
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 298
    iget-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 297
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 300
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 302
    .end local v0    # "i":I
    :cond_2
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized appendIncludes([Ljava/lang/String;)V
    .locals 3
    .param p1, "includes"    # [Ljava/lang/String;

    .prologue
    .line 258
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 259
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 258
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 261
    :cond_0
    if-eqz p1, :cond_2

    .line 262
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_1
    array-length v1, p1

    if-ge v0, v1, :cond_1

    .line 263
    iget-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 262
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 265
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 267
    .end local v0    # "i":I
    :cond_2
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 638
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 639
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 638
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 641
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 642
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 643
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 644
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized clone()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 841
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 842
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/AbstractFileSet;->clone()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 854
    :goto_0
    monitor-exit p0

    return-object v1

    .line 845
    :cond_0
    :try_start_1
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/AbstractFileSet;

    .line 846
    .local v1, "fs":Lorg/apache/tools/ant/types/AbstractFileSet;
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/PatternSet;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/PatternSet;

    iput-object v2, v1, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 847
    new-instance v2, Ljava/util/Vector;

    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/Vector;-><init>(I)V

    iput-object v2, v1, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    .line 848
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 849
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 850
    iget-object v3, v1, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/PatternSet;->clone()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 855
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "fs":Lorg/apache/tools/ant/types/AbstractFileSet;
    :catch_0
    move-exception v0

    .line 856
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 841
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 853
    .local v0, "e":Ljava/util/Enumeration;
    .restart local v1    # "fs":Lorg/apache/tools/ant/types/AbstractFileSet;
    :cond_1
    :try_start_3
    new-instance v2, Ljava/util/Vector;

    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-direct {v2, v3}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    iput-object v2, v1, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 202
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 203
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 205
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 206
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 214
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 217
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 218
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/PatternSet;->createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 178
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 178
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 181
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 190
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 191
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 193
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 194
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/PatternSet;->createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized createPatternSet()Lorg/apache/tools/ant/types/PatternSet;
    .locals 2

    .prologue
    .line 164
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 167
    :cond_0
    :try_start_1
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    .line 168
    .local v0, "patterns":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 169
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    monitor-exit p0

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 4
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 909
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_0

    .line 927
    :goto_0
    monitor-exit p0

    return-void

    .line 912
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 913
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 909
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 915
    :cond_1
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 916
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 917
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v3, :cond_2

    .line 918
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 921
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 922
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/PatternSet;

    .line 923
    .local v2, "ps":Lorg/apache/tools/ant/types/PatternSet;
    invoke-static {v2, p1, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_2

    .line 925
    .end local v2    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :cond_4
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/AbstractFileSet;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized getDefaultexcludes()Z
    .locals 1

    .prologue
    .line 351
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 352
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDefaultexcludes()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 355
    :goto_0
    monitor-exit p0

    return v0

    .line 354
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 355
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 351
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 152
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 153
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 156
    :goto_0
    monitor-exit p0

    return-object v0

    .line 155
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 156
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 152
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDirectoryScanner()Lorg/apache/tools/ant/DirectoryScanner;
    .locals 1

    .prologue
    .line 460
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    return-object v0
.end method

.method public getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 469
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 470
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 500
    :goto_0
    return-object v0

    .line 472
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 473
    const/4 v0, 0x0

    .line 474
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    monitor-enter p0

    .line 475
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    if-eqz v2, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    if-ne p1, v2, :cond_1

    .line 476
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 498
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 499
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    goto :goto_0

    .line 478
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    if-nez v2, :cond_2

    .line 479
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "No directory specified for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDataTypeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 498
    :catchall_0
    move-exception v2

    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 482
    :cond_2
    :try_start_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_3

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    if-eqz v2, :cond_3

    .line 483
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " does not exist."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 487
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 488
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " is not a directory."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 491
    :cond_4
    new-instance v1, Lorg/apache/tools/ant/DirectoryScanner;

    invoke-direct {v1}, Lorg/apache/tools/ant/DirectoryScanner;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 492
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .local v1, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    :try_start_3
    invoke-virtual {p0, v1, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;Lorg/apache/tools/ant/Project;)V

    .line 493
    iget-boolean v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setFollowSymlinks(Z)V

    .line 494
    iget-boolean v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setErrorOnMissingDir(Z)V

    .line 495
    iget v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setMaxLevelsOfSymlinks(I)V

    .line 496
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    if-ne p1, v2, :cond_5

    move-object v2, v1

    :goto_3
    iput-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;

    move-object v0, v1

    .end local v1    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    goto/16 :goto_1

    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v1    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_5
    iget-object v2, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    .line 498
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    goto/16 :goto_2
.end method

.method public getErrorOnMissingDir()Z
    .locals 1

    .prologue
    .line 452
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    return v0
.end method

.method public getMaxLevelsOfSymlinks()I
    .locals 1

    .prologue
    .line 433
    iget v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    return v0
.end method

.method protected getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 551
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/AbstractFileSet;

    return-object v0
.end method

.method public declared-synchronized getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 611
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 612
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 615
    :goto_0
    monitor-exit p0

    return-object v0

    .line 614
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 615
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/tools/ant/types/selectors/FileSelector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/tools/ant/types/selectors/FileSelector;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 611
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized hasPatterns()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    .line 575
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 576
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/AbstractFileSet;->hasPatterns()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 589
    :cond_0
    :goto_0
    monitor-exit p0

    return v2

    .line 578
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 579
    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/PatternSet;->hasPatterns(Lorg/apache/tools/ant/Project;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 582
    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 583
    .local v0, "e":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 584
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/PatternSet;

    .line 585
    .local v1, "ps":Lorg/apache/tools/ant/types/PatternSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/types/PatternSet;->hasPatterns(Lorg/apache/tools/ant/Project;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 589
    .end local v1    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :cond_3
    const/4 v2, 0x0

    goto :goto_0

    .line 575
    .end local v0    # "e":Ljava/util/Enumeration;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized hasSelectors()Z
    .locals 1

    .prologue
    .line 562
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 563
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->hasSelectors()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 566
    :goto_0
    monitor-exit p0

    return v0

    .line 565
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 566
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 562
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isCaseSensitive()Z
    .locals 1

    .prologue
    .line 380
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isCaseSensitive()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 384
    :goto_0
    monitor-exit p0

    return v0

    .line 383
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 384
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 380
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isFollowSymlinks()Z
    .locals 1

    .prologue
    .line 409
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isCaseSensitive()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 413
    :goto_0
    monitor-exit p0

    return v0

    .line 412
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 413
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 409
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public mergeExcludes(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 882
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public mergeIncludes(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 870
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 894
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 895
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 904
    :cond_0
    monitor-exit p0

    return-object v3

    .line 897
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 898
    iget-object v4, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/PatternSet;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/PatternSet;

    .line 899
    .local v3, "ps":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v4, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v0

    .line 900
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 901
    iget-object v4, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 902
    .local v2, "o":Ljava/lang/Object;
    check-cast v2, Lorg/apache/tools/ant/types/PatternSet;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v3, v2, p1}, Lorg/apache/tools/ant/types/PatternSet;->append(Lorg/apache/tools/ant/types/PatternSet;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 900
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 894
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v3    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized selectorCount()I
    .locals 1

    .prologue
    .line 598
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 599
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->selectorCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 602
    :goto_0
    monitor-exit p0

    return v0

    .line 601
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 602
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 598
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized selectorElements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 625
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 626
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->selectorElements()Ljava/util/Enumeration;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 629
    :goto_0
    monitor-exit p0

    return-object v0

    .line 628
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 629
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 625
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setCaseSensitive(Z)V
    .locals 1
    .param p1, "caseSensitive"    # Z

    .prologue
    .line 364
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 365
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 364
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 367
    :cond_0
    :try_start_1
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z

    .line 368
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 369
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setDefaultexcludes(Z)V
    .locals 1
    .param p1, "useDefaultExcludes"    # Z

    .prologue
    .line 338
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 341
    :cond_0
    :try_start_1
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z

    .line 342
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 343
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setDir(Ljava/io/File;)V
    .locals 1
    .param p1, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 130
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 133
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    monitor-exit p0

    return-void
.end method

.method public setErrorOnMissingDir(Z)V
    .locals 0
    .param p1, "errorOnMissingDir"    # Z

    .prologue
    .line 443
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->errorOnMissingDir:Z

    .line 444
    return-void
.end method

.method public declared-synchronized setExcludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "excludes"    # Ljava/lang/String;

    .prologue
    .line 278
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 279
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 278
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 281
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setExcludes(Ljava/lang/String;)V

    .line 282
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 283
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setExcludesfile(Ljava/io/File;)V
    .locals 1
    .param p1, "excl"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 325
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 326
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 325
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 328
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setExcludesfile(Ljava/io/File;)V

    .line 329
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 330
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setFile(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 227
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 230
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->setDir(Ljava/io/File;)V

    .line 231
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 232
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setFollowSymlinks(Z)V
    .locals 1
    .param p1, "followSymlinks"    # Z

    .prologue
    .line 393
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 394
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 393
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 396
    :cond_0
    :try_start_1
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->followSymlinks:Z

    .line 397
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 398
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setIncludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "includes"    # Ljava/lang/String;

    .prologue
    .line 243
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 243
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 246
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setIncludes(Ljava/lang/String;)V

    .line 247
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setIncludesfile(Ljava/io/File;)V
    .locals 1
    .param p1, "incl"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 311
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 312
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 314
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setIncludesfile(Ljava/io/File;)V

    .line 315
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->directoryScanner:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 316
    monitor-exit p0

    return-void
.end method

.method public setMaxLevelsOfSymlinks(I)V
    .locals 0
    .param p1, "max"    # I

    .prologue
    .line 423
    iput p1, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->maxLevelsOfSymlinks:I

    .line 424
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet;->hasPatterns(Lorg/apache/tools/ant/Project;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 115
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 116
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 118
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->selectors:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 119
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 121
    :cond_3
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 122
    return-void
.end method

.method public setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;)V
    .locals 1
    .param p1, "ds"    # Lorg/apache/tools/ant/FileScanner;

    .prologue
    .line 509
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/types/AbstractFileSet;->setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;Lorg/apache/tools/ant/Project;)V

    .line 510
    return-void
.end method

.method public declared-synchronized setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;Lorg/apache/tools/ant/Project;)V
    .locals 5
    .param p1, "ds"    # Lorg/apache/tools/ant/FileScanner;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 518
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 519
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->setupDirectoryScanner(Lorg/apache/tools/ant/FileScanner;Lorg/apache/tools/ant/Project;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 542
    :goto_0
    monitor-exit p0

    return-void

    .line 522
    :cond_0
    :try_start_1
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 523
    if-nez p1, :cond_1

    .line 524
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v4, "ds cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 518
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 526
    :cond_1
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-interface {p1, v3}, Lorg/apache/tools/ant/FileScanner;->setBasedir(Ljava/io/File;)V

    .line 528
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v1

    .line 529
    .local v1, "ps":Lorg/apache/tools/ant/types/PatternSet;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDataTypeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ": Setup scanner in dir "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->dir:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p2, v3, v4}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 532
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lorg/apache/tools/ant/FileScanner;->setIncludes([Ljava/lang/String;)V

    .line 533
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3}, Lorg/apache/tools/ant/FileScanner;->setExcludes([Ljava/lang/String;)V

    .line 534
    instance-of v3, p1, Lorg/apache/tools/ant/types/selectors/SelectorScanner;

    if-eqz v3, :cond_2

    .line 535
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/types/selectors/SelectorScanner;

    move-object v2, v0

    .line 536
    .local v2, "ss":Lorg/apache/tools/ant/types/selectors/SelectorScanner;
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/AbstractFileSet;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/tools/ant/types/selectors/SelectorScanner;->setSelectors([Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 538
    .end local v2    # "ss":Lorg/apache/tools/ant/types/selectors/SelectorScanner;
    :cond_2
    iget-boolean v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->useDefaultExcludes:Z

    if-eqz v3, :cond_3

    .line 539
    invoke-interface {p1}, Lorg/apache/tools/ant/FileScanner;->addDefaultExcludes()V

    .line 541
    :cond_3
    iget-boolean v3, p0, Lorg/apache/tools/ant/types/AbstractFileSet;->caseSensitive:Z

    invoke-interface {p1, v3}, Lorg/apache/tools/ant/FileScanner;->setCaseSensitive(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 816
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->isReference()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 817
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/AbstractFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/AbstractFileSet;->toString()Ljava/lang/String;

    move-result-object v4

    .line 830
    :goto_0
    return-object v4

    .line 819
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->dieOnCircularReference()V

    .line 820
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 821
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 822
    .local v1, "files":[Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 824
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v4, v1

    if-ge v2, v4, :cond_2

    .line 825
    if-lez v2, :cond_1

    .line 826
    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 828
    :cond_1
    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 824
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 830
    :cond_2
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method
