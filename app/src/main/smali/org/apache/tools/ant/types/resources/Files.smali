.class public Lorg/apache/tools/ant/types/resources/Files;
.super Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;
.source "Files.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# static fields
.field private static final EMPTY_ITERATOR:Ljava/util/Iterator;


# instance fields
.field private additionalPatterns:Ljava/util/Vector;

.field private caseSensitive:Z

.field private defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

.field private ds:Lorg/apache/tools/ant/DirectoryScanner;

.field private followSymlinks:Z

.field private useDefaultExcludes:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/Files;->EMPTY_ITERATOR:Ljava/util/Iterator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 58
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 45
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    .line 47
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z

    .line 48
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z

    .line 49
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 59
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/resources/Files;)V
    .locals 2
    .param p1, "f"    # Lorg/apache/tools/ant/types/resources/Files;

    .prologue
    const/4 v1, 0x1

    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 45
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    .line 47
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z

    .line 48
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z

    .line 49
    iput-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 67
    iget-object v0, p1, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 68
    iget-object v0, p1, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    .line 69
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z

    .line 70
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z

    .line 71
    iget-boolean v0, p1, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z

    .line 72
    iget-object v0, p1, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 73
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/Files;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 74
    return-void
.end method

.method private declared-synchronized ensureDirectoryScannerSetup()V
    .locals 3

    .prologue
    .line 481
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->dieOnCircularReference()V

    .line 482
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    if-nez v1, :cond_1

    .line 483
    new-instance v1, Lorg/apache/tools/ant/DirectoryScanner;

    invoke-direct {v1}, Lorg/apache/tools/ant/DirectoryScanner;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 484
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/Files;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    .line 485
    .local v0, "ps":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setIncludes([Ljava/lang/String;)V

    .line 486
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setExcludes([Ljava/lang/String;)V

    .line 487
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/Files;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setSelectors([Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 488
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z

    if-eqz v1, :cond_0

    .line 489
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->addDefaultExcludes()V

    .line 491
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setCaseSensitive(Z)V

    .line 492
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->setFollowSymlinks(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 494
    .end local v0    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :cond_1
    monitor-exit p0

    return-void

    .line 481
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private hasPatterns(Lorg/apache/tools/ant/types/PatternSet;)Z
    .locals 3
    .param p1, "ps"    # Lorg/apache/tools/ant/types/PatternSet;

    .prologue
    .line 497
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v1

    .line 498
    .local v1, "includePatterns":[Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    .line 499
    .local v0, "excludePatterns":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v2, v1

    if-gtz v2, :cond_1

    :cond_0
    if-eqz v1, :cond_2

    array-length v2, v0

    if-lez v2, :cond_2

    :cond_1
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized appendExcludes([Ljava/lang/String;)V
    .locals 3
    .param p1, "excludes"    # [Ljava/lang/String;

    .prologue
    .line 211
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 212
    if-eqz p1, :cond_1

    .line 213
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 214
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 213
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 216
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    .end local v0    # "i":I
    :cond_1
    monitor-exit p0

    return-void

    .line 211
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized appendIncludes([Ljava/lang/String;)V
    .locals 3
    .param p1, "includes"    # [Ljava/lang/String;

    .prologue
    .line 181
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 182
    if-eqz p1, :cond_1

    .line 183
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 184
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 183
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 186
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    .end local v0    # "i":I
    :cond_1
    monitor-exit p0

    return-void

    .line 181
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 373
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 374
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 373
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 376
    :cond_0
    :try_start_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 377
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 378
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized clone()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 408
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 409
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/Files;->clone()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 418
    :cond_0
    monitor-exit p0

    return-object v0

    .line 411
    :cond_1
    :try_start_1
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Files;

    .line 412
    .local v0, "f":Lorg/apache/tools/ant/types/resources/Files;
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/PatternSet;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/PatternSet;

    iput-object v3, v0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    .line 413
    new-instance v3, Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/Vector;-><init>(I)V

    iput-object v3, v0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    .line 414
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 415
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/PatternSet;

    .line 416
    .local v2, "ps":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v3, v0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/PatternSet;->clone()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 408
    .end local v0    # "f":Lorg/apache/tools/ant/types/resources/Files;
    .end local v1    # "iter":Ljava/util/Iterator;
    .end local v2    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 141
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 144
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 145
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

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
    .line 153
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 156
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 157
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

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
    .line 117
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 117
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 120
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

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
    .line 129
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 132
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 133
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

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
    .line 102
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 103
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 105
    :cond_0
    :try_start_1
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    .line 106
    .local v0, "patterns":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 107
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    .line 108
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/Files;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized getDefaultexcludes()Z
    .locals 1

    .prologue
    .line 260
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Files;->getDefaultexcludes()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getRef()Lorg/apache/tools/ant/types/resources/Files;
    .locals 1

    .prologue
    .line 477
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/Files;

    return-object v0
.end method

.method public declared-synchronized hasPatterns()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 352
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 353
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/Files;->hasPatterns()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 364
    :goto_0
    monitor-exit p0

    return v1

    .line 355
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->dieOnCircularReference()V

    .line 356
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/types/resources/Files;->hasPatterns(Lorg/apache/tools/ant/types/PatternSet;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    .line 357
    goto :goto_0

    .line 359
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 360
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/types/resources/Files;->hasPatterns(Lorg/apache/tools/ant/types/PatternSet;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    if-eqz v1, :cond_2

    move v1, v2

    .line 361
    goto :goto_0

    .line 364
    :cond_3
    const/4 v1, 0x0

    goto :goto_0

    .line 352
    .end local v0    # "i":Ljava/util/Iterator;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized isCaseSensitive()Z
    .locals 1

    .prologue
    .line 282
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Files;->isCaseSensitive()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 468
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized isFollowSymlinks()Z
    .locals 1

    .prologue
    .line 304
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Files;->isFollowSymlinks()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 313
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 314
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/Files;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 330
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v2

    .line 316
    :cond_1
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Files;->ensureDirectoryScannerSetup()V

    .line 317
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    .line 318
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFilesCount()I

    move-result v1

    .line 319
    .local v1, "fct":I
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirsCount()I

    move-result v0

    .line 320
    .local v0, "dct":I
    add-int v3, v1, v0

    if-nez v3, :cond_2

    .line 321
    sget-object v2, Lorg/apache/tools/ant/types/resources/Files;->EMPTY_ITERATOR:Ljava/util/Iterator;

    goto :goto_0

    .line 323
    :cond_2
    new-instance v2, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 324
    .local v2, "result":Lorg/apache/tools/ant/types/resources/FileResourceIterator;
    if-lez v1, :cond_3

    .line 325
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->addFiles([Ljava/lang/String;)V

    .line 327
    :cond_3
    if-lez v0, :cond_0

    .line 328
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->addFiles([Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 313
    .end local v0    # "dct":I
    .end local v1    # "fct":I
    .end local v2    # "result":Lorg/apache/tools/ant/types/resources/FileResourceIterator;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public mergeExcludes(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 438
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/Files;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public mergeIncludes(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 428
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/Files;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 448
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 449
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v4

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/resources/Files;->mergePatterns(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 459
    :cond_0
    monitor-exit p0

    return-object v3

    .line 451
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->dieOnCircularReference()V

    .line 452
    new-instance v3, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    .line 453
    .local v3, "ps":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v3, v4, p1}, Lorg/apache/tools/ant/types/PatternSet;->append(Lorg/apache/tools/ant/types/PatternSet;Lorg/apache/tools/ant/Project;)V

    .line 454
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v0

    .line 455
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 456
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    .line 457
    .local v2, "o":Ljava/lang/Object;
    check-cast v2, Lorg/apache/tools/ant/types/PatternSet;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v3, v2, p1}, Lorg/apache/tools/ant/types/PatternSet;->append(Lorg/apache/tools/ant/types/PatternSet;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 455
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 448
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v3    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized setCaseSensitive(Z)V
    .locals 1
    .param p1, "caseSensitive"    # Z

    .prologue
    .line 270
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 271
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/Files;->caseSensitive:Z

    .line 272
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    monitor-exit p0

    return-void

    .line 270
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDefaultexcludes(Z)V
    .locals 1
    .param p1, "useDefaultExcludes"    # Z

    .prologue
    .line 250
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 251
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/Files;->useDefaultExcludes:Z

    .line 252
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    monitor-exit p0

    return-void

    .line 250
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setExcludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "excludes"    # Ljava/lang/String;

    .prologue
    .line 199
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 200
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setExcludes(Ljava/lang/String;)V

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    monitor-exit p0

    return-void

    .line 199
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 239
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 240
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setExcludesfile(Ljava/io/File;)V

    .line 241
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 242
    monitor-exit p0

    return-void

    .line 239
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setFollowSymlinks(Z)V
    .locals 1
    .param p1, "followSymlinks"    # Z

    .prologue
    .line 292
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 293
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/resources/Files;->followSymlinks:Z

    .line 294
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 295
    monitor-exit p0

    return-void

    .line 292
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setIncludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "includes"    # Ljava/lang/String;

    .prologue
    .line 169
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 170
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setIncludes(Ljava/lang/String;)V

    .line 171
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 172
    monitor-exit p0

    return-void

    .line 169
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
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
    .line 227
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->checkAttributesAllowed()V

    .line 228
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->setIncludesfile(Ljava/io/File;)V

    .line 229
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    monitor-exit p0

    return-void

    .line 227
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->defaultPatterns:Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/resources/Files;->hasPatterns(Lorg/apache/tools/ant/types/PatternSet;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 88
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->additionalPatterns:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 89
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 91
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->hasSelectors()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 92
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 94
    :cond_2
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 95
    return-void
.end method

.method public declared-synchronized size()I
    .locals 2

    .prologue
    .line 338
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Files;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 343
    :goto_0
    monitor-exit p0

    return v0

    .line 341
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Files;->ensureDirectoryScannerSetup()V

    .line 342
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    .line 343
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFilesCount()I

    move-result v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/resources/Files;->ds:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirsCount()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 385
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 386
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->getRef()Lorg/apache/tools/ant/types/resources/Files;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Files;->toString()Ljava/lang/String;

    move-result-object v2

    .line 399
    :goto_0
    return-object v2

    .line 388
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/Files;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 389
    .local v0, "i":Ljava/util/Iterator;
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 390
    const-string/jumbo v2, ""

    goto :goto_0

    .line 392
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 393
    .local v1, "sb":Ljava/lang/StringBuffer;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 394
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-lez v2, :cond_2

    .line 395
    sget-char v2, Ljava/io/File;->pathSeparatorChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 397
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 399
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method
