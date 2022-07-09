.class public Lorg/apache/tools/ant/types/Path;
.super Lorg/apache/tools/ant/types/DataType;
.source "Path.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Path$PathElement;
    }
.end annotation


# static fields
.field private static final EMPTY_ITERATOR:Ljava/util/Iterator;

.field static class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

.field public static systemBootClasspath:Lorg/apache/tools/ant/types/Path;

.field public static systemClasspath:Lorg/apache/tools/ant/types/Path;


# instance fields
.field private cache:Z

.field private preserveBC:Ljava/lang/Boolean;

.field private union:Lorg/apache/tools/ant/types/resources/Union;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 70
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v1, "java.class.path"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Path;->systemClasspath:Lorg/apache/tools/ant/types/Path;

    .line 79
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v1, "sun.boot.class.path"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Path;->systemBootClasspath:Lorg/apache/tools/ant/types/Path;

    .line 82
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/Path;->EMPTY_ITERATOR:Ljava/util/Iterator;

    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 166
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 148
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    .line 149
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/Path;->cache:Z

    .line 167
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Path;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 168
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 158
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 159
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Path$PathElement;->setPath(Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 752
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

.method private concatSpecialPath(Ljava/lang/String;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/types/Path;
    .locals 6
    .param p1, "defValue"    # Ljava/lang/String;
    .param p2, "p"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    const/4 v5, 0x1

    .line 553
    new-instance v2, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 555
    .local v2, "result":Lorg/apache/tools/ant/types/Path;
    move-object v1, p1

    .line 556
    .local v1, "order":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    const-string/jumbo v4, "build.sysclasspath"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 559
    .local v0, "o":Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    .line 560
    move-object v1, v0

    .line 562
    :cond_0
    const-string/jumbo v3, "only"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 564
    invoke-virtual {v2, p2, v5}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;Z)V

    .line 585
    :goto_1
    return-object v2

    .line 556
    .end local v0    # "o":Ljava/lang/String;
    :cond_1
    const-string/jumbo v3, "build.sysclasspath"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 566
    .restart local v0    # "o":Ljava/lang/String;
    :cond_2
    const-string/jumbo v3, "first"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 568
    invoke-virtual {v2, p2, v5}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;Z)V

    .line 569
    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_1

    .line 571
    :cond_3
    const-string/jumbo v3, "ignore"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 573
    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_1

    .line 577
    :cond_4
    const-string/jumbo v3, "last"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 578
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "invalid value for build.sysclasspath: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/types/Path;->log(Ljava/lang/String;I)V

    .line 582
    :cond_5
    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 583
    invoke-virtual {v2, p2, v5}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;Z)V

    goto :goto_1
.end method

.method private static containsWildcards(Ljava/lang/String;)Z
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    const/4 v1, -0x1

    .line 776
    if-eqz p0, :cond_1

    const-string/jumbo v0, "*"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gt v0, v1, :cond_0

    const-string/jumbo v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private declared-synchronized getPreserveBC()Z
    .locals 1

    .prologue
    .line 765
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->preserveBC:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 766
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->delegateIteratorToList()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/Path;->preserveBC:Ljava/lang/Boolean;

    .line 768
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->preserveBC:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    .line 766
    :cond_1
    :try_start_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 765
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static resolveFile(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "relativeName"    # Ljava/lang/String;

    .prologue
    .line 511
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public static translateFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "source"    # Ljava/lang/String;

    .prologue
    .line 433
    if-nez p0, :cond_0

    .line 434
    const-string/jumbo v2, ""

    .line 440
    :goto_0
    return-object v2

    .line 436
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, p0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 437
    .local v1, "result":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 438
    invoke-static {v1, v0}, Lorg/apache/tools/ant/types/Path;->translateFileSep(Ljava/lang/StringBuffer;I)Z

    .line 437
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 440
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method protected static translateFileSep(Ljava/lang/StringBuffer;I)Z
    .locals 2
    .param p0, "buffer"    # Ljava/lang/StringBuffer;
    .param p1, "pos"    # I

    .prologue
    .line 452
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v0

    const/16 v1, 0x5c

    if-ne v0, v1, :cond_1

    .line 453
    :cond_0
    sget-char v0, Ljava/io/File;->separatorChar:C

    invoke-virtual {p0, p1, v0}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 454
    const/4 v0, 0x1

    .line 456
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static translatePath(Lorg/apache/tools/ant/Project;Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 400
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 401
    .local v5, "result":Ljava/util/Vector;
    if-nez p1, :cond_0

    .line 402
    const/4 v7, 0x0

    new-array v4, v7, [Ljava/lang/String;

    .line 423
    :goto_0
    return-object v4

    .line 404
    :cond_0
    new-instance v6, Lorg/apache/tools/ant/PathTokenizer;

    invoke-direct {v6, p1}, Lorg/apache/tools/ant/PathTokenizer;-><init>(Ljava/lang/String;)V

    .line 405
    .local v6, "tok":Lorg/apache/tools/ant/PathTokenizer;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 406
    .local v1, "element":Ljava/lang/StringBuffer;
    :goto_1
    invoke-virtual {v6}, Lorg/apache/tools/ant/PathTokenizer;->hasMoreTokens()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 407
    invoke-virtual {v6}, Lorg/apache/tools/ant/PathTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 409
    .local v3, "pathElement":Ljava/lang/String;
    :try_start_0
    invoke-static {p0, v3}, Lorg/apache/tools/ant/types/Path;->resolveFile(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    :goto_2
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->length()I

    move-result v7

    if-ge v2, v7, :cond_1

    .line 416
    invoke-static {v1, v2}, Lorg/apache/tools/ant/types/Path;->translateFileSep(Ljava/lang/StringBuffer;I)Z

    .line 415
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 410
    .end local v2    # "i":I
    :catch_0
    move-exception v0

    .line 411
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Dropping path element "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " as it is not valid relative to the project"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 418
    .end local v0    # "e":Lorg/apache/tools/ant/BuildException;
    .restart local v2    # "i":I
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 419
    new-instance v1, Ljava/lang/StringBuffer;

    .end local v1    # "element":Ljava/lang/StringBuffer;
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .restart local v1    # "element":Ljava/lang/StringBuffer;
    goto :goto_1

    .line 421
    .end local v2    # "i":I
    .end local v3    # "pathElement":Ljava/lang/String;
    :cond_2
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v7

    new-array v4, v7, [Ljava/lang/String;

    .line 422
    .local v4, "res":[Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 263
    if-ne p1, p0, :cond_0

    .line 264
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->circularReference()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 266
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-nez v0, :cond_1

    .line 267
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/Path;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 269
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 270
    return-void
.end method

.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "c"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 278
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->checkChildrenAllowed()V

    .line 279
    if-nez p1, :cond_0

    .line 289
    :goto_0
    return-void

    .line 282
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    .line 283
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    .line 284
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Union;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 285
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    iget-boolean v1, p0, Lorg/apache/tools/ant/types/Path;->cache:Z

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Union;->setCache(Z)V

    .line 287
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 288
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->setChecked(Z)V

    goto :goto_0
.end method

.method public addDirset(Lorg/apache/tools/ant/types/DirSet;)V
    .locals 1
    .param p1, "dset"    # Lorg/apache/tools/ant/types/DirSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 250
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-nez v0, :cond_0

    .line 251
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/DirSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 253
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 254
    return-void
.end method

.method public addExisting(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "source"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 320
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;Z)V

    .line 321
    return-void
.end method

.method public addExisting(Lorg/apache/tools/ant/types/Path;Z)V
    .locals 7
    .param p1, "source"    # Lorg/apache/tools/ant/types/Path;
    .param p2, "tryUserDir"    # Z

    .prologue
    const/4 v6, 0x3

    .line 332
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    .line 333
    .local v2, "list":[Ljava/lang/String;
    if-eqz p2, :cond_1

    new-instance v3, Ljava/io/File;

    const-string/jumbo v4, "user.dir"

    invoke-static {v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 336
    .local v3, "userDir":Ljava/io/File;
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v4, v2

    if-ge v1, v4, :cond_4

    .line 337
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    aget-object v5, v2, v1

    invoke-static {v4, v5}, Lorg/apache/tools/ant/types/Path;->resolveFile(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 341
    .local v0, "f":Ljava/io/File;
    if-eqz p2, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 342
    new-instance v0, Ljava/io/File;

    .end local v0    # "f":Ljava/io/File;
    aget-object v4, v2, v1

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 344
    .restart local v0    # "f":Ljava/io/File;
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 345
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    .line 336
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 333
    .end local v0    # "f":Ljava/io/File;
    .end local v1    # "i":I
    .end local v3    # "userDir":Ljava/io/File;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 346
    .restart local v0    # "f":Ljava/io/File;
    .restart local v1    # "i":I
    .restart local v3    # "userDir":Ljava/io/File;
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/types/Path;->containsWildcards(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 348
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    .line 349
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "adding "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " which contains wildcards and may not"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " do what you intend it to do depending on your OS or"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " version of Java"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/types/Path;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 353
    :cond_3
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "dropping "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " from path as it doesn\'t exist"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/types/Path;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 357
    .end local v0    # "f":Ljava/io/File;
    :cond_4
    return-void
.end method

.method public addExtdirs(Lorg/apache/tools/ant/types/Path;)V
    .locals 7
    .param p1, "extdirs"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 677
    if-nez p1, :cond_0

    .line 678
    const-string/jumbo v5, "java.ext.dirs"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 679
    .local v2, "extProp":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 680
    new-instance p1, Lorg/apache/tools/ant/types/Path;

    .end local p1    # "extdirs":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-direct {p1, v5, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    .line 686
    .end local v2    # "extProp":Ljava/lang/String;
    .restart local p1    # "extdirs":Lorg/apache/tools/ant/types/Path;
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v1

    .line 687
    .local v1, "dirs":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v1

    if-ge v4, v5, :cond_2

    .line 688
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    aget-object v6, v1, v4

    invoke-static {v5, v6}, Lorg/apache/tools/ant/types/Path;->resolveFile(Lorg/apache/tools/ant/Project;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 689
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 690
    new-instance v3, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 691
    .local v3, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 692
    const-string/jumbo v5, "*"

    invoke-virtual {v3, v5}, Lorg/apache/tools/ant/types/FileSet;->setIncludes(Ljava/lang/String;)V

    .line 693
    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/Path;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 687
    .end local v3    # "fs":Lorg/apache/tools/ant/types/FileSet;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 696
    .end local v0    # "dir":Ljava/io/File;
    .end local v1    # "dirs":[Ljava/lang/String;
    .end local v4    # "i":I
    :cond_2
    return-void
.end method

.method public addFilelist(Lorg/apache/tools/ant/types/FileList;)V
    .locals 1
    .param p1, "fl"    # Lorg/apache/tools/ant/types/FileList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FileList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-nez v0, :cond_0

    .line 239
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/FileList;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 241
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 242
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 226
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-nez v0, :cond_0

    .line 227
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/FileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 229
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 230
    return-void
.end method

.method public addJavaRuntime()V
    .locals 13

    .prologue
    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 592
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isKaffe()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 595
    new-instance v3, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "java.home"

    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "share"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    sget-object v7, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "kaffe"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 598
    .local v3, "kaffeShare":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 599
    new-instance v2, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 600
    .local v2, "kaffeJarFiles":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 601
    const-string/jumbo v6, "*.jar"

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/types/FileSet;->setIncludes(Ljava/lang/String;)V

    .line 602
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/Path;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 608
    .end local v2    # "kaffeJarFiles":Lorg/apache/tools/ant/types/FileSet;
    .end local v3    # "kaffeShare":Ljava/io/File;
    :cond_0
    :goto_0
    const-string/jumbo v6, "java.vendor"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    sget-object v7, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v6, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "microsoft"

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_2

    .line 611
    new-instance v4, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 612
    .local v4, "msZipFiles":Lorg/apache/tools/ant/types/FileSet;
    new-instance v6, Ljava/io/File;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "Packages"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 614
    const-string/jumbo v6, "*.ZIP"

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/types/FileSet;->setIncludes(Ljava/lang/String;)V

    .line 615
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/Path;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 667
    .end local v4    # "msZipFiles":Lorg/apache/tools/ant/types/FileSet;
    :goto_1
    return-void

    .line 604
    :cond_1
    const-string/jumbo v6, "GNU libgcj"

    const-string/jumbo v7, "java.vm.name"

    invoke-static {v7}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 605
    sget-object v6, Lorg/apache/tools/ant/types/Path;->systemBootClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0

    .line 618
    :cond_2
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "lib"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "rt.jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 624
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "jre"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "lib"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "rt.jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 631
    new-array v5, v12, [Ljava/lang/String;

    const-string/jumbo v6, "jce"

    aput-object v6, v5, v10

    const-string/jumbo v6, "jsse"

    aput-object v6, v5, v11

    .line 632
    .local v5, "secJars":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    array-length v6, v5

    if-ge v0, v6, :cond_3

    .line 633
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "lib"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    aget-object v8, v5, v0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 637
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "Classes"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    aget-object v8, v5, v0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 632
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_2

    .line 646
    :cond_3
    const/4 v6, 0x5

    new-array v1, v6, [Ljava/lang/String;

    const-string/jumbo v6, "core"

    aput-object v6, v1, v10

    const-string/jumbo v6, "graphics"

    aput-object v6, v1, v11

    const-string/jumbo v6, "security"

    aput-object v6, v1, v12

    const/4 v6, 0x3

    const-string/jumbo v7, "server"

    aput-object v7, v1, v6

    const/4 v6, 0x4

    const-string/jumbo v7, "xml"

    aput-object v7, v1, v6

    .line 648
    .local v1, "ibmJars":[Ljava/lang/String;
    const/4 v0, 0x0

    :goto_3
    array-length v6, v1

    if-ge v0, v6, :cond_4

    .line 649
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "lib"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    aget-object v8, v1, v0

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 648
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 656
    :cond_4
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "Classes"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "classes.jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 661
    new-instance v6, Lorg/apache/tools/ant/types/Path;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "java.home"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "Classes"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "ui.jar"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v9, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    goto/16 :goto_1
.end method

.method public append(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "other"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 307
    if-nez p1, :cond_0

    .line 311
    :goto_0
    return-void

    .line 310
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method protected assertFilesystemOnly(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 3
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 736
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v0

    if-nez v0, :cond_0

    .line 737
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " allows only filesystem resources."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 740
    :cond_0
    return-object p1
.end method

.method public clone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 477
    :try_start_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Path;

    .line 478
    .local v1, "result":Lorg/apache/tools/ant/types/Path;
    iget-object v2, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    :goto_0
    iput-object v2, v1, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    .line 479
    return-object v1

    .line 478
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/Union;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/Union;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 480
    .end local v1    # "result":Lorg/apache/tools/ant/types/Path;
    :catch_0
    move-exception v0

    .line 481
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public concatSystemBootClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;
    .locals 1
    .param p1, "defValue"    # Ljava/lang/String;

    .prologue
    .line 544
    sget-object v0, Lorg/apache/tools/ant/types/Path;->systemBootClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/Path;->concatSpecialPath(Ljava/lang/String;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public concatSystemClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 522
    const-string/jumbo v0, "last"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;
    .locals 1
    .param p1, "defValue"    # Ljava/lang/String;

    .prologue
    .line 533
    sget-object v0, Lorg/apache/tools/ant/types/Path;->systemClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/types/Path;->concatSpecialPath(Ljava/lang/String;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createPath()Lorg/apache/tools/ant/types/Path;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 297
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 298
    .local v0, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/Path;)V

    .line 299
    return-object v0
.end method

.method public createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 212
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 213
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1

    .line 215
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Path$PathElement;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/types/Path$PathElement;-><init>(Lorg/apache/tools/ant/types/Path;)V

    .line 216
    .local v0, "pe":Lorg/apache/tools/ant/types/Path$PathElement;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 217
    return-object v0
.end method

.method protected delegateIteratorToList()Z
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 752
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    sget-object v2, Lorg/apache/tools/ant/types/Path;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "org.apache.tools.ant.types.Path"

    invoke-static {v2}, Lorg/apache/tools/ant/types/Path;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/types/Path;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 760
    :goto_1
    return v3

    .line 752
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/types/Path;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    goto :goto_0

    .line 756
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string/jumbo v5, "list"

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 757
    .local v1, "listMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    sget-object v2, Lorg/apache/tools/ant/types/Path;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    if-nez v2, :cond_2

    const-string/jumbo v2, "org.apache.tools.ant.types.Path"

    invoke-static {v2}, Lorg/apache/tools/ant/types/Path;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/types/Path;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v2, 0x1

    :goto_3
    move v3, v2

    goto :goto_1

    :cond_2
    sget-object v2, Lorg/apache/tools/ant/types/Path;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :cond_3
    move v2, v3

    goto :goto_3

    .line 758
    .end local v1    # "listMethod":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 760
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_1
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
    .line 494
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 505
    :goto_0
    monitor-exit p0

    return-void

    .line 497
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 498
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 494
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 500
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v0, :cond_2

    .line 501
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/Path;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 503
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 721
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 722
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->isFilesystemOnly()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 726
    :goto_0
    monitor-exit p0

    return v0

    .line 724
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->dieOnCircularReference()V

    .line 725
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->assertFilesystemOnly(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/ResourceCollection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 726
    const/4 v0, 0x1

    goto :goto_0

    .line 721
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 705
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 706
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 712
    :goto_0
    monitor-exit p0

    return-object v0

    .line 708
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->dieOnCircularReference()V

    .line 709
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Path;->getPreserveBC()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 710
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 705
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 712
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_2

    sget-object v0, Lorg/apache/tools/ant/types/Path;->EMPTY_ITERATOR:Ljava/util/Iterator;

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->assertFilesystemOnly(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    goto :goto_0
.end method

.method public list()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 376
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 377
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v0

    .line 379
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->assertFilesystemOnly(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Union;->list()[Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public setCache(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 364
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->checkAttributesAllowed()V

    .line 365
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/Path;->cache:Z

    .line 366
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->setCache(Z)V

    .line 369
    :cond_0
    return-void
.end method

.method public setLocation(Ljava/io/File;)V
    .locals 1
    .param p1, "location"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->checkAttributesAllowed()V

    .line 178
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path$PathElement;->setLocation(Ljava/io/File;)V

    .line 179
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->checkAttributesAllowed()V

    .line 188
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path$PathElement;->setPath(Ljava/lang/String;)V

    .line 189
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
    .line 200
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v0, :cond_0

    .line 201
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 203
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 204
    return-void
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 464
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 465
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 468
    :goto_0
    monitor-exit p0

    return v0

    .line 467
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->dieOnCircularReference()V

    .line 468
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/Path;->assertFilesystemOnly(Lorg/apache/tools/ant/types/ResourceCollection;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 464
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 389
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Path;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    const-string/jumbo v0, ""

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/Path;->union:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/Union;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
