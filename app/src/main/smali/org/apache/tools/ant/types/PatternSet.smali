.class public Lorg/apache/tools/ant/types/PatternSet;
.super Lorg/apache/tools/ant/types/DataType;
.source "PatternSet.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/PatternSet$1;,
        Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;,
        Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    }
.end annotation


# instance fields
.field private excludeList:Ljava/util/Vector;

.field private excludesFileList:Ljava/util/Vector;

.field private includeList:Ljava/util/Vector;

.field private includesFileList:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 195
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 40
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    .line 41
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    .line 42
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    .line 43
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    .line 196
    return-void
.end method

.method private addPatternToList(Ljava/util/Vector;)Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1
    .param p1, "list"    # Ljava/util/Vector;

    .prologue
    .line 322
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;-><init>(Lorg/apache/tools/ant/types/PatternSet;)V

    .line 323
    .local v0, "result":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    invoke-virtual {p1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 324
    return-object v0
.end method

.method private getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 455
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/PatternSet;

    return-object v0
.end method

.method private makeArray(Ljava/util/Vector;Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 6
    .param p1, "list"    # Ljava/util/Vector;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 462
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 463
    const/4 v3, 0x0

    .line 475
    :goto_0
    return-object v3

    .line 465
    :cond_0
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 466
    .local v4, "tmpNames":Ljava/util/Vector;
    invoke-virtual {p1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 467
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    .line 468
    .local v1, "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->evalName(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v2

    .line 469
    .local v2, "pattern":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1

    .line 470
    invoke-virtual {v4, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    .line 473
    .end local v1    # "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .end local v2    # "pattern":Ljava/lang/String;
    :cond_2
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v3, v5, [Ljava/lang/String;

    .line 474
    .local v3, "result":[Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private readFiles(Lorg/apache/tools/ant/Project;)V
    .locals 8
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 482
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-lez v5, :cond_3

    .line 483
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 484
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 485
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    .line 486
    .local v4, "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->evalName(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v2

    .line 487
    .local v2, "fileName":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 488
    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 489
    .local v3, "inclFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 490
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Includesfile "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " not found."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 493
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-direct {p0, v3, v5, p1}, Lorg/apache/tools/ant/types/PatternSet;->readPatterns(Ljava/io/File;Ljava/util/Vector;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 496
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "inclFile":Ljava/io/File;
    .end local v4    # "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->removeAllElements()V

    .line 498
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_3
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    if-lez v5, :cond_7

    .line 499
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 500
    .restart local v0    # "e":Ljava/util/Enumeration;
    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 501
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    .line 502
    .restart local v4    # "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->evalName(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v2

    .line 503
    .restart local v2    # "fileName":Ljava/lang/String;
    if-eqz v2, :cond_4

    .line 504
    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 505
    .local v1, "exclFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_5

    .line 506
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Excludesfile "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " not found."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 509
    :cond_5
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-direct {p0, v1, v5, p1}, Lorg/apache/tools/ant/types/PatternSet;->readPatterns(Ljava/io/File;Ljava/util/Vector;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 512
    .end local v1    # "exclFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v4    # "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :cond_6
    iget-object v5, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->removeAllElements()V

    .line 514
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_7
    return-void
.end method

.method private readPatterns(Ljava/io/File;Ljava/util/Vector;Lorg/apache/tools/ant/Project;)V
    .locals 7
    .param p1, "patternfile"    # Ljava/io/File;
    .param p2, "patternlist"    # Ljava/util/Vector;
    .param p3, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 360
    const/4 v2, 0x0

    .line 363
    .local v2, "patternReader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 367
    .end local v2    # "patternReader":Ljava/io/BufferedReader;
    .local v3, "patternReader":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 368
    .local v1, "line":Ljava/lang/String;
    :goto_0
    if-eqz v1, :cond_1

    .line 369
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 370
    invoke-virtual {p3, v1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 371
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/types/PatternSet;->addPatternToList(Ljava/util/Vector;)Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v4

    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 373
    :cond_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v1

    goto :goto_0

    .line 379
    :cond_1
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 381
    return-void

    .line 375
    .end local v1    # "line":Ljava/lang/String;
    .end local v3    # "patternReader":Ljava/io/BufferedReader;
    .restart local v2    # "patternReader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v0

    .line 376
    .local v0, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_2
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "An error occurred while reading from pattern file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 379
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v4

    .end local v2    # "patternReader":Ljava/io/BufferedReader;
    .restart local v3    # "patternReader":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "patternReader":Ljava/io/BufferedReader;
    .restart local v2    # "patternReader":Ljava/io/BufferedReader;
    goto :goto_2

    .line 375
    .end local v2    # "patternReader":Ljava/io/BufferedReader;
    .restart local v3    # "patternReader":Ljava/io/BufferedReader;
    :catch_1
    move-exception v0

    move-object v2, v3

    .end local v3    # "patternReader":Ljava/io/BufferedReader;
    .restart local v2    # "patternReader":Ljava/io/BufferedReader;
    goto :goto_1
.end method


# virtual methods
.method public addConfiguredInvert(Lorg/apache/tools/ant/types/PatternSet;)V
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/types/PatternSet;

    .prologue
    .line 545
    new-instance v0, Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/apache/tools/ant/types/PatternSet$InvertedPatternSet;-><init>(Lorg/apache/tools/ant/types/PatternSet;Lorg/apache/tools/ant/types/PatternSet$1;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/PatternSet;->addConfiguredPatternset(Lorg/apache/tools/ant/types/PatternSet;)V

    .line 546
    return-void
.end method

.method public addConfiguredPatternset(Lorg/apache/tools/ant/types/PatternSet;)V
    .locals 5
    .param p1, "p"    # Lorg/apache/tools/ant/types/PatternSet;

    .prologue
    .line 220
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 221
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v3

    throw v3

    .line 223
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v2

    .line 224
    .local v2, "nestedIncludes":[Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v1

    .line 226
    .local v1, "nestedExcludes":[Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 227
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v3

    aget-object v4, v2, v0

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 227
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 231
    .end local v0    # "i":I
    :cond_1
    if-eqz v1, :cond_2

    .line 232
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_1
    array-length v3, v1

    if-ge v0, v3, :cond_2

    .line 233
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v3

    aget-object v4, v1, v0

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 232
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 236
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method public append(Lorg/apache/tools/ant/types/PatternSet;Lorg/apache/tools/ant/Project;)V
    .locals 5
    .param p1, "other"    # Lorg/apache/tools/ant/types/PatternSet;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 389
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 390
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Cannot append to a reference"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 392
    :cond_0
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/PatternSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 393
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v2

    .line 394
    .local v2, "incl":[Ljava/lang/String;
    if-eqz v2, :cond_1

    .line 395
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 396
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v3

    aget-object v4, v2, v1

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 395
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 399
    .end local v1    # "i":I
    :cond_1
    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    .line 400
    .local v0, "excl":[Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 401
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_1
    array-length v3, v0

    if-ge v1, v3, :cond_2

    .line 402
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v3

    aget-object v4, v0, v1

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 401
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 405
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 529
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/PatternSet;

    .line 530
    .local v1, "ps":Lorg/apache/tools/ant/types/PatternSet;
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v1, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    .line 531
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v1, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    .line 532
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v1, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    .line 533
    iget-object v2, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    iput-object v2, v1, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 534
    return-object v1

    .line 535
    .end local v1    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :catch_0
    move-exception v0

    .line 536
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 265
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 268
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/PatternSet;->addPatternToList(Ljava/util/Vector;)Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 276
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 277
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 279
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/PatternSet;->addPatternToList(Ljava/util/Vector;)Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 246
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/PatternSet;->addPatternToList(Ljava/util/Vector;)Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    .locals 1

    .prologue
    .line 254
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 257
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/PatternSet;->addPatternToList(Ljava/util/Vector;)Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    return-object v0
.end method

.method public getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 427
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 428
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    .line 432
    :goto_0
    return-object v0

    .line 430
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 431
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->readFiles(Lorg/apache/tools/ant/Project;)V

    .line 432
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->makeArray(Ljava/util/Vector;Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 413
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 414
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    .line 418
    :goto_0
    return-object v0

    .line 416
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 417
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->readFiles(Lorg/apache/tools/ant/Project;)V

    .line 418
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->makeArray(Ljava/util/Vector;Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hasPatterns(Lorg/apache/tools/ant/Project;)Z
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 442
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 443
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/PatternSet;->hasPatterns(Lorg/apache/tools/ant/Project;)Z

    move-result v0

    .line 446
    :goto_0
    return v0

    .line 445
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/PatternSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 446
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includesFileList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludesFileList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setExcludes(Ljava/lang/String;)V
    .locals 3
    .param p1, "excludes"    # Ljava/lang/String;

    .prologue
    .line 307
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 308
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 310
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 311
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ", "

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 312
    .local v0, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 313
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 316
    .end local v0    # "tok":Ljava/util/StringTokenizer;
    :cond_1
    return-void
.end method

.method public setExcludesfile(Ljava/io/File;)V
    .locals 2
    .param p1, "excludesFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 347
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 348
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 350
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createExcludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 351
    return-void
.end method

.method public setIncludes(Ljava/lang/String;)V
    .locals 3
    .param p1, "includes"    # Ljava/lang/String;

    .prologue
    .line 289
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 290
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 292
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 293
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ", "

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 294
    .local v0, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 295
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 298
    .end local v0    # "tok":Ljava/util/StringTokenizer;
    :cond_1
    return-void
.end method

.method public setIncludesfile(Ljava/io/File;)V
    .locals 2
    .param p1, "includesFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 334
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 335
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 337
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->createIncludesFile()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 338
    return-void
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
    .line 208
    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 209
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/PatternSet;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 211
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 212
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 520
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "patternSet{ includes: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PatternSet;->includeList:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " excludes: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/PatternSet;->excludeList:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
