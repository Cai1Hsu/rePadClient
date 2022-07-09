.class public Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;
.super Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;
.source "CvsTagDiff.java"


# static fields
.field private static final DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

.field static final FILE_HAS_CHANGED:Ljava/lang/String; = " changed from revision "

.field static final FILE_IS_NEW:Ljava/lang/String; = " is new;"

.field static final FILE_STRING:Ljava/lang/String; = "File "

.field static final FILE_STRING_LENGTH:I

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static final FILE_WAS_REMOVED:Ljava/lang/String; = " is removed"

.field static final REVISION:Ljava/lang/String; = "revision "

.field static final TO_STRING:Ljava/lang/String; = " to "


# instance fields
.field private ignoreRemoved:Z

.field private mydestfile:Ljava/io/File;

.field private myendDate:Ljava/lang/String;

.field private myendTag:Ljava/lang/String;

.field private mypackage:Ljava/lang/String;

.field private mystartDate:Ljava/lang/String;

.field private mystartTag:Ljava/lang/String;

.field private packageNamePrefixLengths:[I

.field private packageNamePrefixes:[Ljava/lang/String;

.field private packageNames:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 81
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 84
    new-instance v0, Lorg/apache/tools/ant/util/DOMElementWriter;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/DOMElementWriter;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    .line 93
    const-string/jumbo v0, "File "

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->FILE_STRING_LENGTH:I

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 76
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;-><init>()V

    .line 150
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->ignoreRemoved:Z

    .line 155
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    .line 160
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    .line 165
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixLengths:[I

    return-void
.end method

.method private doFileHasChanged(Ljava/util/Vector;Ljava/lang/String;)Z
    .locals 8
    .param p1, "entries"    # Ljava/util/Vector;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 371
    const-string/jumbo v7, " changed from revision "

    invoke-virtual {p2, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 372
    .local v2, "index":I
    const/4 v7, -0x1

    if-ne v2, v7, :cond_0

    .line 388
    :goto_0
    return v6

    .line 377
    :cond_0
    invoke-virtual {p2, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 378
    .local v1, "filename":Ljava/lang/String;
    const-string/jumbo v6, " to "

    invoke-virtual {p2, v6, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v4

    .line 379
    .local v4, "revSeparator":I
    const-string/jumbo v6, " changed from revision "

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v2

    invoke-virtual {p2, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 382
    .local v3, "prevRevision":Ljava/lang/String;
    const-string/jumbo v6, " to "

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v4

    invoke-virtual {p2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 383
    .local v5, "revision":Ljava/lang/String;
    new-instance v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;

    invoke-direct {v0, v1, v5, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    invoke-virtual {p1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 387
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    .line 388
    const/4 v6, 0x1

    goto :goto_0
.end method

.method private doFileIsNew(Ljava/util/Vector;Ljava/lang/String;)Z
    .locals 8
    .param p1, "entries"    # Ljava/util/Vector;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v7, -0x1

    .line 352
    const-string/jumbo v6, " is new;"

    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 353
    .local v2, "index":I
    if-ne v2, v7, :cond_0

    .line 367
    :goto_0
    return v5

    .line 358
    :cond_0
    invoke-virtual {p2, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 359
    .local v1, "filename":Ljava/lang/String;
    const/4 v4, 0x0

    .line 360
    .local v4, "rev":Ljava/lang/String;
    const-string/jumbo v5, "revision "

    invoke-virtual {p2, v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 361
    .local v3, "indexrev":I
    if-eq v3, v7, :cond_1

    .line 362
    const-string/jumbo v5, "revision "

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {p2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 364
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;

    invoke-direct {v0, v1, v4}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 365
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    invoke-virtual {p1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 366
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    .line 367
    const/4 v5, 0x1

    goto :goto_0
.end method

.method private doFileWasRemoved(Ljava/util/Vector;Ljava/lang/String;)Z
    .locals 8
    .param p1, "entries"    # Ljava/util/Vector;
    .param p2, "line"    # Ljava/lang/String;

    .prologue
    const/4 v7, -0x1

    const/4 v5, 0x0

    .line 392
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->ignoreRemoved:Z

    if-eqz v6, :cond_1

    .line 409
    :cond_0
    :goto_0
    return v5

    .line 395
    :cond_1
    const-string/jumbo v6, " is removed"

    invoke-virtual {p2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 396
    .local v2, "index":I
    if-eq v2, v7, :cond_0

    .line 400
    invoke-virtual {p2, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 401
    .local v1, "filename":Ljava/lang/String;
    const/4 v4, 0x0

    .line 402
    .local v4, "rev":Ljava/lang/String;
    const-string/jumbo v5, "revision "

    invoke-virtual {p2, v5, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 403
    .local v3, "indexrev":I
    if-eq v3, v7, :cond_2

    .line 404
    const-string/jumbo v5, "revision "

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {p2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 406
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;

    const/4 v5, 0x0

    invoke-direct {v0, v1, v5, v4}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 407
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    invoke-virtual {p1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 408
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    .line 409
    const/4 v5, 0x1

    goto :goto_0
.end method

.method private handlePackageNames()V
    .locals 8

    .prologue
    .line 528
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mypackage:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 530
    new-instance v3, Ljava/util/StringTokenizer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mypackage:Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 531
    .local v3, "myTokenizer":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 532
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 533
    .local v4, "pack":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    goto :goto_0

    .line 537
    .end local v3    # "myTokenizer":Ljava/util/StringTokenizer;
    .end local v4    # "pack":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->getModules()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 538
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;

    .line 539
    .local v2, "m":Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 542
    .end local v2    # "m":Lorg/apache/tools/ant/taskdefs/AbstractCvsTask$Module;
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    .line 543
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [I

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixLengths:[I

    .line 544
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    array-length v5, v5

    if-ge v0, v5, :cond_2

    .line 545
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "File "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-interface {v7, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    .line 546
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixLengths:[I

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    aget-object v6, v6, v0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    aput v6, v5, v0

    .line 544
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 548
    :cond_2
    return-void
.end method

.method private parseRDiff(Ljava/io/File;)[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .locals 9
    .param p1, "tmpFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 298
    const/4 v4, 0x0

    .line 301
    .local v4, "reader":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 317
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .local v5, "reader":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 319
    .local v2, "entries":Ljava/util/Vector;
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .line 321
    .local v3, "line":Ljava/lang/String;
    :goto_0
    if-eqz v3, :cond_1

    .line 322
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixLengths:[I

    invoke-static {v3, v6, v7}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->removePackageName(Ljava/lang/String;[Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v3

    .line 324
    if-eqz v3, :cond_0

    .line 326
    invoke-direct {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->doFileIsNew(Ljava/util/Vector;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-direct {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->doFileHasChanged(Ljava/util/Vector;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-direct {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->doFileWasRemoved(Ljava/util/Vector;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 331
    :cond_0
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 334
    :cond_1
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v6

    new-array v0, v6, [Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;

    .line 335
    .local v0, "array":[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    invoke-virtual {v2, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 341
    if-eqz v5, :cond_2

    .line 343
    :try_start_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 337
    :cond_2
    :goto_1
    return-object v0

    .line 338
    .end local v0    # "array":[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .end local v2    # "entries":Ljava/util/Vector;
    .end local v3    # "line":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :catch_0
    move-exception v1

    .line 339
    .local v1, "e":Ljava/io/IOException;
    :goto_2
    :try_start_3
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Error in parsing"

    invoke-direct {v6, v7, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 341
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_3
    if-eqz v4, :cond_3

    .line 343
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 341
    :cond_3
    :goto_4
    throw v6

    .line 344
    :catch_1
    move-exception v1

    .line 345
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    goto :goto_4

    .line 344
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v0    # "array":[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .restart local v2    # "entries":Ljava/util/Vector;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :catch_2
    move-exception v1

    .line 345
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 341
    .end local v0    # "array":[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "entries":Ljava/util/Vector;
    .end local v3    # "line":Ljava/lang/String;
    :catchall_1
    move-exception v6

    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_3

    .line 338
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :catch_3
    move-exception v1

    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private static removePackageName(Ljava/lang/String;[Ljava/lang/String;[I)Ljava/lang/String;
    .locals 4
    .param p0, "line"    # Ljava/lang/String;
    .param p1, "packagePrefixes"    # [Ljava/lang/String;
    .param p2, "prefixLengths"    # [I

    .prologue
    .line 559
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    sget v3, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->FILE_STRING_LENGTH:I

    if-ge v2, v3, :cond_1

    .line 560
    const/4 p0, 0x0

    .line 573
    .end local p0    # "line":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 562
    .restart local p0    # "line":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 563
    .local v1, "matched":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, p1

    if-ge v0, v2, :cond_2

    .line 564
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 565
    const/4 v1, 0x1

    .line 566
    aget v2, p2, v0

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 570
    :cond_2
    if-nez v1, :cond_0

    .line 571
    sget v2, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->FILE_STRING_LENGTH:I

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 563
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private validate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 496
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mypackage:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->getModules()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 497
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Package/module must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 500
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mydestfile:Ljava/io/File;

    if-nez v0, :cond_1

    .line 501
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Destfile must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 504
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartDate:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 505
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Start tag or start date must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 508
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartDate:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 509
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one of start tag and start date must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 513
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    if-nez v0, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendDate:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 514
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "End tag or end date must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 517
    :cond_4
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendDate:Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 518
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one of end tag and end date must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 521
    :cond_5
    return-void
.end method

.method private writeTagDiff([Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;)V
    .locals 14
    .param p1, "entries"    # [Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    .line 419
    const/4 v10, 0x0

    .line 421
    .local v10, "output":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v11, Ljava/io/FileOutputStream;

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mydestfile:Ljava/io/File;

    invoke-direct {v11, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 422
    .end local v10    # "output":Ljava/io/FileOutputStream;
    .local v11, "output":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v2, Ljava/io/PrintWriter;

    new-instance v0, Ljava/io/OutputStreamWriter;

    const-string/jumbo v3, "UTF-8"

    invoke-direct {v0, v11, v3}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v2, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 424
    .local v2, "writer":Ljava/io/PrintWriter;
    const-string/jumbo v0, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"

    invoke-virtual {v2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 425
    invoke-static {}, Lorg/apache/tools/ant/util/DOMUtils;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v7

    .line 426
    .local v7, "doc":Lorg/w3c/dom/Document;
    const-string/jumbo v0, "tagdiff"

    invoke-interface {v7, v0}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 427
    .local v1, "root":Lorg/w3c/dom/Element;
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 428
    const-string/jumbo v0, "startTag"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    invoke-interface {v1, v0, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 433
    const-string/jumbo v0, "endTag"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    invoke-interface {v1, v0, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 438
    :goto_1
    const-string/jumbo v0, "cvsroot"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->getCvsRoot()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    const-string/jumbo v0, "package"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-static {v3}, Lorg/apache/tools/ant/util/CollectionUtils;->flattenToString(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 441
    sget-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    const/4 v3, 0x0

    const-string/jumbo v4, "\t"

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/apache/tools/ant/util/DOMElementWriter;->openElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 442
    invoke-virtual {v2}, Ljava/io/PrintWriter;->println()V

    .line 443
    const/4 v8, 0x0

    .local v8, "i":I
    array-length v6, p1

    .local v6, "c":I
    :goto_2
    if-ge v8, v6, :cond_4

    .line 444
    aget-object v0, p1, v8

    invoke-direct {p0, v7, v2, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->writeTagEntry(Lorg/w3c/dom/Document;Ljava/io/PrintWriter;Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;)V

    .line 443
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 430
    .end local v6    # "c":I
    .end local v8    # "i":I
    :cond_0
    const-string/jumbo v0, "startDate"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartDate:Ljava/lang/String;

    invoke-interface {v1, v0, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 452
    .end local v1    # "root":Lorg/w3c/dom/Element;
    .end local v2    # "writer":Ljava/io/PrintWriter;
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    :catch_0
    move-exception v12

    move-object v10, v11

    .line 453
    .end local v11    # "output":Ljava/io/FileOutputStream;
    .restart local v10    # "output":Ljava/io/FileOutputStream;
    .local v12, "uee":Ljava/io/UnsupportedEncodingException;
    :goto_3
    :try_start_2
    invoke-virtual {v12}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 457
    if-eqz v10, :cond_1

    .line 459
    :try_start_3
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 465
    .end local v12    # "uee":Ljava/io/UnsupportedEncodingException;
    :cond_1
    :goto_4
    return-void

    .line 435
    .end local v10    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "root":Lorg/w3c/dom/Element;
    .restart local v2    # "writer":Ljava/io/PrintWriter;
    .restart local v7    # "doc":Lorg/w3c/dom/Document;
    .restart local v11    # "output":Ljava/io/FileOutputStream;
    :cond_2
    :try_start_4
    const-string/jumbo v0, "endDate"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendDate:Ljava/lang/String;

    invoke-interface {v1, v0, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    .line 454
    .end local v1    # "root":Lorg/w3c/dom/Element;
    .end local v2    # "writer":Ljava/io/PrintWriter;
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    :catch_1
    move-exception v9

    move-object v10, v11

    .line 455
    .end local v11    # "output":Ljava/io/FileOutputStream;
    .local v9, "ioe":Ljava/io/IOException;
    .restart local v10    # "output":Ljava/io/FileOutputStream;
    :goto_5
    :try_start_5
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v9}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 457
    .end local v9    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v0

    :goto_6
    if-eqz v10, :cond_3

    .line 459
    :try_start_6
    invoke-virtual {v10}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 457
    :cond_3
    :goto_7
    throw v0

    .line 446
    .end local v10    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "root":Lorg/w3c/dom/Element;
    .restart local v2    # "writer":Ljava/io/PrintWriter;
    .restart local v6    # "c":I
    .restart local v7    # "doc":Lorg/w3c/dom/Document;
    .restart local v8    # "i":I
    .restart local v11    # "output":Ljava/io/FileOutputStream;
    :cond_4
    :try_start_7
    sget-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    const/4 v3, 0x0

    const-string/jumbo v4, "\t"

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/DOMElementWriter;->closeElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V

    .line 447
    invoke-virtual {v2}, Ljava/io/PrintWriter;->flush()V

    .line 448
    invoke-virtual {v2}, Ljava/io/PrintWriter;->checkError()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 449
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v3, "Encountered an error writing tagdiff"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 457
    .end local v1    # "root":Lorg/w3c/dom/Element;
    .end local v2    # "writer":Ljava/io/PrintWriter;
    .end local v6    # "c":I
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v8    # "i":I
    :catchall_1
    move-exception v0

    move-object v10, v11

    .end local v11    # "output":Ljava/io/FileOutputStream;
    .restart local v10    # "output":Ljava/io/FileOutputStream;
    goto :goto_6

    .line 451
    .end local v10    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "root":Lorg/w3c/dom/Element;
    .restart local v2    # "writer":Ljava/io/PrintWriter;
    .restart local v6    # "c":I
    .restart local v7    # "doc":Lorg/w3c/dom/Document;
    .restart local v8    # "i":I
    .restart local v11    # "output":Ljava/io/FileOutputStream;
    :cond_5
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7 .. :try_end_7} :catch_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 457
    if-eqz v11, :cond_6

    .line 459
    :try_start_8
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_4

    :cond_6
    :goto_8
    move-object v10, v11

    .line 464
    .end local v11    # "output":Ljava/io/FileOutputStream;
    .restart local v10    # "output":Ljava/io/FileOutputStream;
    goto :goto_4

    .line 460
    .end local v1    # "root":Lorg/w3c/dom/Element;
    .end local v2    # "writer":Ljava/io/PrintWriter;
    .end local v6    # "c":I
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v8    # "i":I
    :catch_2
    move-exception v9

    .line 461
    .restart local v9    # "ioe":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v13}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    goto :goto_7

    .line 460
    .end local v9    # "ioe":Ljava/io/IOException;
    .restart local v12    # "uee":Ljava/io/UnsupportedEncodingException;
    :catch_3
    move-exception v9

    .line 461
    .restart local v9    # "ioe":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v13}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    goto :goto_4

    .line 460
    .end local v9    # "ioe":Ljava/io/IOException;
    .end local v10    # "output":Ljava/io/FileOutputStream;
    .end local v12    # "uee":Ljava/io/UnsupportedEncodingException;
    .restart local v1    # "root":Lorg/w3c/dom/Element;
    .restart local v2    # "writer":Ljava/io/PrintWriter;
    .restart local v6    # "c":I
    .restart local v7    # "doc":Lorg/w3c/dom/Document;
    .restart local v8    # "i":I
    .restart local v11    # "output":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v9

    .line 461
    .restart local v9    # "ioe":Ljava/io/IOException;
    invoke-virtual {v9}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v13}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->log(Ljava/lang/String;I)V

    goto :goto_8

    .line 454
    .end local v1    # "root":Lorg/w3c/dom/Element;
    .end local v2    # "writer":Ljava/io/PrintWriter;
    .end local v6    # "c":I
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v8    # "i":I
    .end local v9    # "ioe":Ljava/io/IOException;
    .end local v11    # "output":Ljava/io/FileOutputStream;
    .restart local v10    # "output":Ljava/io/FileOutputStream;
    :catch_5
    move-exception v9

    goto :goto_5

    .line 452
    :catch_6
    move-exception v12

    goto :goto_3
.end method

.method private writeTagEntry(Lorg/w3c/dom/Document;Ljava/io/PrintWriter;Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;)V
    .locals 5
    .param p1, "doc"    # Lorg/w3c/dom/Document;
    .param p2, "writer"    # Ljava/io/PrintWriter;
    .param p3, "entry"    # Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 477
    const-string/jumbo v2, "entry"

    invoke-interface {p1, v2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 478
    .local v0, "ent":Lorg/w3c/dom/Element;
    const-string/jumbo v2, "file"

    invoke-static {v0, v2}, Lorg/apache/tools/ant/util/DOMUtils;->createChildElement(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 479
    .local v1, "f":Lorg/w3c/dom/Element;
    const-string/jumbo v2, "name"

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->getFile()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/apache/tools/ant/util/DOMUtils;->appendCDATAElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->getRevision()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 481
    const-string/jumbo v2, "revision"

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->getRevision()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/apache/tools/ant/util/DOMUtils;->appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    :cond_0
    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->getPreviousRevision()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 484
    const-string/jumbo v2, "prevrevision"

    invoke-virtual {p3}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->getPreviousRevision()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lorg/apache/tools/ant/util/DOMUtils;->appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->DOM_WRITER:Lorg/apache/tools/ant/util/DOMElementWriter;

    const/4 v3, 0x1

    const-string/jumbo v4, "\t"

    invoke-virtual {v2, v0, p2, v3, v4}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 488
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 239
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->validate()V

    .line 242
    const-string/jumbo v0, "rdiff"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 243
    const-string/jumbo v0, "-s"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 244
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 245
    const-string/jumbo v0, "-r"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 246
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 251
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 252
    const-string/jumbo v0, "-r"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 253
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 260
    :goto_1
    const-string/jumbo v0, ""

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->setCommand(Ljava/lang/String;)V

    .line 261
    const/4 v7, 0x0

    .line 263
    .local v7, "tmpFile":Ljava/io/File;
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->handlePackageNames()V

    .line 265
    sget-object v0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v1, "cvstagdiff"

    const-string/jumbo v2, ".log"

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v7

    .line 267
    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->setOutput(Ljava/io/File;)V

    .line 270
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->execute()V

    .line 273
    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->parseRDiff(Ljava/io/File;)[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;

    move-result-object v6

    .line 276
    .local v6, "entries":[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->writeTagDiff([Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 279
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    .line 280
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixLengths:[I

    .line 281
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 282
    if-eqz v7, :cond_0

    .line 283
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 286
    :cond_0
    return-void

    .line 248
    .end local v6    # "entries":[Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
    .end local v7    # "tmpFile":Ljava/io/File;
    :cond_1
    const-string/jumbo v0, "-D"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 249
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartDate:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    goto :goto_0

    .line 255
    :cond_2
    const-string/jumbo v0, "-D"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    .line 256
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendDate:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->addCommandArgument(Ljava/lang/String;)V

    goto :goto_1

    .line 279
    .restart local v7    # "tmpFile":Ljava/io/File;
    :catchall_0
    move-exception v0

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixes:[Ljava/lang/String;

    .line 280
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNamePrefixLengths:[I

    .line 281
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->packageNames:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 282
    if-eqz v7, :cond_3

    .line 283
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 279
    :cond_3
    throw v0
.end method

.method public setDestFile(Ljava/io/File;)V
    .locals 0
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 217
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mydestfile:Ljava/io/File;

    .line 218
    return-void
.end method

.method public setEndDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 208
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendDate:Ljava/lang/String;

    .line 209
    return-void
.end method

.method public setEndTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 199
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->myendTag:Ljava/lang/String;

    .line 200
    return-void
.end method

.method public setIgnoreRemoved(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 228
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->ignoreRemoved:Z

    .line 229
    return-void
.end method

.method public setPackage(Ljava/lang/String;)V
    .locals 0
    .param p1, "p"    # Ljava/lang/String;

    .prologue
    .line 172
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mypackage:Ljava/lang/String;

    .line 173
    return-void
.end method

.method public setStartDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartDate:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public setStartTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 181
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagDiff;->mystartTag:Ljava/lang/String;

    .line 182
    return-void
.end method
