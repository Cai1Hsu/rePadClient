.class public abstract Lorg/apache/tools/ant/taskdefs/MatchingTask;
.super Lorg/apache/tools/ant/Task;
.source "MatchingTask.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/SelectorContainer;


# instance fields
.field protected fileset:Lorg/apache/tools/ant/types/FileSet;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 60
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    return-void
.end method


# virtual methods
.method public XsetIgnore(Ljava/lang/String;)V
    .locals 4
    .param p1, "ignoreString"    # Ljava/lang/String;

    .prologue
    .line 161
    const-string/jumbo v1, "The ignore attribute is deprecated.Please use the excludes attribute."

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->log(Ljava/lang/String;I)V

    .line 163
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 164
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ", "

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 166
    .local v0, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 167
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "**/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "/**"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 170
    .end local v0    # "tok":Ljava/util/StringTokenizer;
    :cond_0
    return-void
.end method

.method public XsetItems(Ljava/lang/String;)V
    .locals 5
    .param p1, "itemString"    # Ljava/lang/String;

    .prologue
    .line 128
    const-string/jumbo v2, "The items attribute is deprecated. Please use the includes attribute."

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->log(Ljava/lang/String;I)V

    .line 130
    if-eqz p1, :cond_0

    const-string/jumbo v2, "*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "."

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 132
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v2

    const-string/jumbo v3, "**"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 142
    :cond_1
    return-void

    .line 134
    :cond_2
    new-instance v1, Ljava/util/StringTokenizer;

    const-string/jumbo v2, ", "

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .local v1, "tok":Ljava/util/StringTokenizer;
    :cond_3
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 136
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 137
    .local v0, "pattern":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3

    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "/**"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 434
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 435
    return-void
.end method

.method public addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/AndSelector;

    .prologue
    .line 294
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V

    .line 295
    return-void
.end method

.method public addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsSelector;

    .prologue
    .line 366
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V

    .line 367
    return-void
.end method

.method public addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;

    .prologue
    .line 398
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V

    .line 399
    return-void
.end method

.method public addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ExtendSelector;

    .prologue
    .line 358
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V

    .line 359
    return-void
.end method

.method public addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DateSelector;

    .prologue
    .line 334
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V

    .line 335
    return-void
.end method

.method public addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DependSelector;

    .prologue
    .line 390
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V

    .line 391
    return-void
.end method

.method public addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DepthSelector;

    .prologue
    .line 382
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V

    .line 383
    return-void
.end method

.method public addDifferent(Lorg/apache/tools/ant/types/selectors/DifferentSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DifferentSelector;

    .prologue
    .line 407
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addDifferent(Lorg/apache/tools/ant/types/selectors/DifferentSelector;)V

    .line 408
    return-void
.end method

.method public addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FilenameSelector;

    .prologue
    .line 350
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V

    .line 351
    return-void
.end method

.method public addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/MajoritySelector;

    .prologue
    .line 326
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V

    .line 327
    return-void
.end method

.method public addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;

    .prologue
    .line 425
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V

    .line 426
    return-void
.end method

.method public addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NoneSelector;

    .prologue
    .line 318
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V

    .line 319
    return-void
.end method

.method public addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NotSelector;

    .prologue
    .line 310
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V

    .line 311
    return-void
.end method

.method public addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/OrSelector;

    .prologue
    .line 302
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V

    .line 303
    return-void
.end method

.method public addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/PresentSelector;

    .prologue
    .line 374
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V

    .line 375
    return-void
.end method

.method public addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SelectSelector;

    .prologue
    .line 286
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V

    .line 287
    return-void
.end method

.method public addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SizeSelector;

    .prologue
    .line 342
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V

    .line 343
    return-void
.end method

.method public addType(Lorg/apache/tools/ant/types/selectors/TypeSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/TypeSelector;

    .prologue
    .line 416
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->addType(Lorg/apache/tools/ant/types/selectors/TypeSelector;)V

    .line 417
    return-void
.end method

.method public appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 276
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 277
    return-void
.end method

.method public createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createPatternSet()Lorg/apache/tools/ant/types/PatternSet;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->createPatternSet()Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    return-object v0
.end method

.method protected getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;
    .locals 2
    .param p1, "baseDir"    # Ljava/io/File;

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 192
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    return-object v0
.end method

.method protected final getImplicitFileSet()Lorg/apache/tools/ant/types/FileSet;
    .locals 1

    .prologue
    .line 443
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    return-object v0
.end method

.method public getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 258
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v0

    return-object v0
.end method

.method public hasSelectors()Z
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->hasSelectors()Z

    move-result v0

    return v0
.end method

.method public selectorCount()I
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->selectorCount()I

    move-result v0

    return v0
.end method

.method public selectorElements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public setCaseSensitive(Z)V
    .locals 1
    .param p1, "isCaseSensitive"    # Z

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setCaseSensitive(Z)V

    .line 223
    return-void
.end method

.method public setDefaultexcludes(Z)V
    .locals 1
    .param p1, "useDefaultExcludes"    # Z

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setDefaultexcludes(Z)V

    .line 183
    return-void
.end method

.method public setExcludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "excludes"    # Ljava/lang/String;

    .prologue
    .line 151
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setExcludes(Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method public setExcludesfile(Ljava/io/File;)V
    .locals 1
    .param p1, "excludesfile"    # Ljava/io/File;

    .prologue
    .line 212
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setExcludesfile(Ljava/io/File;)V

    .line 213
    return-void
.end method

.method public setFollowSymlinks(Z)V
    .locals 1
    .param p1, "followSymlinks"    # Z

    .prologue
    .line 231
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setFollowSymlinks(Z)V

    .line 232
    return-void
.end method

.method public setIncludes(Ljava/lang/String;)V
    .locals 1
    .param p1, "includes"    # Ljava/lang/String;

    .prologue
    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setIncludes(Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public setIncludesfile(Ljava/io/File;)V
    .locals 1
    .param p1, "includesfile"    # Ljava/io/File;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setIncludesfile(Ljava/io/File;)V

    .line 203
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 65
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 66
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MatchingTask;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 67
    return-void
.end method
