.class public Lorg/apache/tools/ant/taskdefs/Javadoc;
.super Lorg/apache/tools/ant/Task;
.source "Javadoc.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$AccessType;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$Html;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;,
        Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final JAVADOC_5:Z

.field static final SCOPE_ELEMENTS:[Ljava/lang/String;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private author:Z

.field private bootclasspath:Lorg/apache/tools/ant/types/Path;

.field private bottom:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

.field private breakiterator:Z

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private cmd:Lorg/apache/tools/ant/types/Commandline;

.field private destDir:Ljava/io/File;

.field private docFilesSubDirs:Z

.field private doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

.field private doctitle:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

.field private excludeDocFilesSubDir:Ljava/lang/String;

.field private excludePackageNames:Ljava/util/Vector;

.field private executable:Ljava/lang/String;

.field private failOnError:Z

.field private footer:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

.field private group:Ljava/lang/String;

.field private groups:Ljava/util/Vector;

.field private header:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

.field private includeNoSourcePackages:Z

.field private links:Ljava/util/Vector;

.field private linksource:Z

.field private nestedSourceFiles:Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

.field private noqualifier:Ljava/lang/String;

.field private packageList:Ljava/lang/String;

.field private packageNames:Ljava/util/Vector;

.field private packageSets:Ljava/util/Vector;

.field private source:Ljava/lang/String;

.field private sourceFiles:Ljava/util/Vector;

.field private sourcePath:Lorg/apache/tools/ant/types/Path;

.field private tags:Ljava/util/Vector;

.field private useDefaultExcludes:Z

.field private useExternalFile:Z

.field private version:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 81
    const-string/jumbo v0, "1.4"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    sput-boolean v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->JAVADOC_5:Z

    .line 387
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 1294
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v3, "overview"

    aput-object v3, v0, v2

    const-string/jumbo v2, "packages"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "types"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "constructors"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "methods"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "fields"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->SCOPE_ELEMENTS:[Ljava/lang/String;

    return-void

    :cond_0
    move v0, v2

    .line 81
    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 390
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    .line 425
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->failOnError:Z

    .line 426
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    .line 427
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->destDir:Ljava/io/File;

    .line 428
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourceFiles:Ljava/util/Vector;

    .line 429
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageNames:Ljava/util/Vector;

    .line 430
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0, v3}, Ljava/util/Vector;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludePackageNames:Ljava/util/Vector;

    .line 431
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->author:Z

    .line 432
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->version:Z

    .line 433
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    .line 434
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 435
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 436
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->group:Ljava/lang/String;

    .line 437
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageList:Ljava/lang/String;

    .line 438
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->links:Ljava/util/Vector;

    .line 439
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->groups:Ljava/util/Vector;

    .line 440
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->tags:Ljava/util/Vector;

    .line 441
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useDefaultExcludes:Z

    .line 442
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doctitle:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 443
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->header:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 444
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->footer:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 445
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bottom:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 446
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useExternalFile:Z

    .line 447
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->source:Ljava/lang/String;

    .line 448
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->linksource:Z

    .line 449
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->breakiterator:Z

    .line 451
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->includeNoSourcePackages:Z

    .line 452
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->executable:Ljava/lang/String;

    .line 453
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->docFilesSubDirs:Z

    .line 454
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludeDocFilesSubDir:Ljava/lang/String;

    .line 456
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->nestedSourceFiles:Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

    .line 458
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageSets:Ljava/util/Vector;

    .line 2425
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Javadoc;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Javadoc;

    .prologue
    .line 78
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->includeNoSourcePackages:Z

    return v0
.end method

.method private addArgIf(ZLjava/lang/String;)V
    .locals 1
    .param p1, "b"    # Z
    .param p2, "arg"    # Ljava/lang/String;

    .prologue
    .line 400
    if-eqz p1, :cond_0

    .line 401
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 403
    :cond_0
    return-void
.end method

.method private addArgIfNotEmpty(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 412
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 413
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 414
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 419
    :goto_0
    return-void

    .line 416
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Warning: Leaving out empty argument \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private addSourceFiles(Ljava/util/Vector;)V
    .locals 8
    .param p1, "sf"    # Ljava/util/Vector;

    .prologue
    .line 2289
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->nestedSourceFiles:Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->access$000(Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;)Ljava/util/Iterator;

    move-result-object v0

    .line 2290
    .local v0, "e":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 2291
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/ResourceCollection;

    .line 2292
    .local v5, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v5}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v6

    if-nez v6, :cond_1

    .line 2293
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "only file system based resources are supported by javadoc"

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 2296
    :cond_1
    instance-of v6, v5, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v6, :cond_3

    move-object v1, v5

    .line 2297
    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    .line 2298
    .local v1, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FileSet;->hasPatterns()Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FileSet;->hasSelectors()Z

    move-result v6

    if-nez v6, :cond_3

    .line 2299
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FileSet;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/FileSet;

    .line 2300
    .local v2, "fs2":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/FileSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v6

    const-string/jumbo v7, "**/*.java"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 2301
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->includeNoSourcePackages:Z

    if-eqz v6, :cond_2

    .line 2302
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/FileSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v6

    const-string/jumbo v7, "**/package.html"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 2304
    :cond_2
    move-object v5, v2

    .line 2307
    .end local v1    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v2    # "fs2":Lorg/apache/tools/ant/types/FileSet;
    :cond_3
    invoke-interface {v5}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 2308
    .local v3, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2309
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/Resource;

    .line 2310
    .local v4, "r":Lorg/apache/tools/ant/types/Resource;
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;

    sget-object v6, Lorg/apache/tools/ant/taskdefs/Javadoc;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v6, :cond_4

    const-string/jumbo v6, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/Javadoc;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/taskdefs/Javadoc;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface {v6}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-direct {v7, v6}, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;-><init>(Ljava/io/File;)V

    invoke-virtual {p1, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    :cond_4
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Javadoc;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 2314
    .end local v3    # "iter":Ljava/util/Iterator;
    .end local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v5    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_5
    return-void
.end method

.method private checkPackageAndSourcePath()V
    .locals 2

    .prologue
    .line 1792
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageList:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    if-nez v1, :cond_0

    .line 1793
    const-string/jumbo v0, "sourcePath attribute must be set when specifying packagelist."

    .line 1795
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1797
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private checkPackages(Ljava/util/Vector;Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "packagesToDoc"    # Ljava/util/Vector;
    .param p2, "sourceDirs"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 1800
    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 1801
    const-string/jumbo v0, "sourcePath attribute must be set when specifying package names."

    .line 1803
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1805
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private checkPackagesToDoc(Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 2
    .param p1, "packagesToDoc"    # Ljava/util/Vector;
    .param p2, "sourceFilesToDoc"    # Ljava/util/Vector;

    .prologue
    .line 1809
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageList:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 1811
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No source files and no packages have been specified."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1814
    :cond_0
    return-void
.end method

.method private checkTaskName()V
    .locals 2

    .prologue
    .line 1784
    const-string/jumbo v0, "javadoc2"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getTaskType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1785
    const-string/jumbo v0, "Warning: the task name <javadoc2> is deprecated. Use <javadoc> instead."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 1789
    :cond_0
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 2310
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

.method private containsWhitespace(Ljava/lang/String;)Z
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 2230
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2231
    .local v1, "len":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 2232
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2233
    const/4 v2, 0x1

    .line 2236
    :goto_1
    return v2

    .line 2231
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2236
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private doBootPath(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 3
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 1939
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 1940
    .local v0, "bcp":Lorg/apache/tools/ant/types/Path;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-eqz v1, :cond_0

    .line 1941
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 1943
    :cond_0
    const-string/jumbo v1, "ignore"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemBootClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 1944
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 1945
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    const-string/jumbo v2, "-bootclasspath"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1946
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 1948
    :cond_1
    return-void
.end method

.method private doDocFilesSubDirs(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 2158
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->docFilesSubDirs:Z

    if-eqz v0, :cond_0

    .line 2159
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-docfilessubdirs"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2160
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludeDocFilesSubDir:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludeDocFilesSubDir:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 2162
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-excludedocfilessubdir"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2163
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludeDocFilesSubDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2166
    :cond_0
    return-void
.end method

.method private doDoclet(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 6
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 1865
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-eqz v3, :cond_4

    .line 1866
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->getName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1867
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "The doclet name must be specified."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 1870
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-doclet"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1871
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1872
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->getPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1873
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->getPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    const-string/jumbo v4, "ignore"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 1875
    .local v0, "docletPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v3

    if-eqz v3, :cond_1

    .line 1876
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    const-string/jumbo v4, "-docletpath"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1877
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 1880
    .end local v0    # "docletPath":Lorg/apache/tools/ant/types/Path;
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->getParams()Ljava/util/Enumeration;

    move-result-object v1

    .line 1881
    .local v1, "e":Ljava/util/Enumeration;
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1882
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;

    .line 1883
    .local v2, "param":Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;->getName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    .line 1884
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Doclet parameters must have a name"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1888
    :cond_3
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1889
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;->getValue()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 1890
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 1896
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "param":Lorg/apache/tools/ant/taskdefs/Javadoc$DocletParam;
    :cond_4
    return-void
.end method

.method private doGroup(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 8
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v7, 0x0

    .line 2046
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->group:Ljava/lang/String;

    if-eqz v5, :cond_1

    .line 2047
    new-instance v4, Ljava/util/StringTokenizer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->group:Ljava/lang/String;

    const-string/jumbo v6, ","

    invoke-direct {v4, v5, v6, v7}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2048
    .local v4, "tok":Ljava/util/StringTokenizer;
    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2049
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 2050
    .local v0, "grp":Ljava/lang/String;
    const-string/jumbo v5, " "

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 2051
    .local v3, "space":I
    if-lez v3, :cond_0

    .line 2052
    invoke-virtual {v0, v7, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 2053
    .local v1, "name":Ljava/lang/String;
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 2054
    .local v2, "pkgList":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-group"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2055
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2056
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 2060
    .end local v0    # "grp":Ljava/lang/String;
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "pkgList":Ljava/lang/String;
    .end local v3    # "space":I
    .end local v4    # "tok":Ljava/util/StringTokenizer;
    :cond_1
    return-void
.end method

.method private doGroups(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 6
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 2064
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->groups:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    if-eqz v4, :cond_2

    .line 2065
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->groups:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2066
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;

    .line 2067
    .local v1, "ga":Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->getTitle()Ljava/lang/String;

    move-result-object v3

    .line 2068
    .local v3, "title":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;->getPackages()Ljava/lang/String;

    move-result-object v2

    .line 2069
    .local v2, "packages":Ljava/lang/String;
    if-eqz v3, :cond_0

    if-nez v2, :cond_1

    .line 2070
    :cond_0
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "The title and packages must be specified for group elements."

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 2074
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-group"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2075
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2076
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 2079
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "ga":Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;
    .end local v2    # "packages":Ljava/lang/String;
    .end local v3    # "title":Ljava/lang/String;
    :cond_2
    return-void
.end method

.method private doJava14(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 18
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 2083
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->tags:Ljava/util/Vector;

    invoke-virtual {v15}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v15

    if-eqz v15, :cond_4

    .line 2084
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 2085
    .local v2, "element":Ljava/lang/Object;
    instance-of v15, v2, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;

    if-eqz v15, :cond_3

    move-object v9, v2

    .line 2086
    check-cast v9, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;

    .line 2087
    .local v9, "ta":Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    invoke-virtual {v9, v15}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v12

    .line 2088
    .local v12, "tagDir":Ljava/io/File;
    if-nez v12, :cond_1

    .line 2091
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-tag"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2092
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getParameter()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 2098
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    invoke-virtual {v9, v15}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v11

    .line 2100
    .local v11, "tagDefScanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v11}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    .line 2101
    .local v3, "files":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v15, v3

    if-ge v4, v15, :cond_0

    .line 2102
    new-instance v10, Ljava/io/File;

    aget-object v15, v3, v4

    invoke-direct {v10, v12, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2104
    .local v10, "tagDefFile":Ljava/io/File;
    :try_start_0
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v15, Ljava/io/FileReader;

    invoke-direct {v15, v10}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v15}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 2108
    .local v5, "in":Ljava/io/BufferedReader;
    const/4 v7, 0x0

    .line 2109
    .local v7, "line":Ljava/lang/String;
    :goto_2
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 2110
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-tag"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2112
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    invoke-virtual {v15, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 2116
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v7    # "line":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 2117
    .local v6, "ioe":Ljava/io/IOException;
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    new-instance v16, Ljava/lang/StringBuffer;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v17, "Couldn\'t read  tag file from "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v15

    .line 2115
    .end local v6    # "ioe":Ljava/io/IOException;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v7    # "line":Ljava/lang/String;
    :cond_2
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 2101
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v7    # "line":Ljava/lang/String;
    .end local v9    # "ta":Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;
    .end local v10    # "tagDefFile":Ljava/io/File;
    .end local v11    # "tagDefScanner":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v12    # "tagDir":Ljava/io/File;
    :cond_3
    move-object v13, v2

    .line 2125
    check-cast v13, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;

    .line 2126
    .local v13, "tagletInfo":Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-taglet"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2127
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2129
    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->getPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v15

    if-eqz v15, :cond_0

    .line 2130
    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;->getPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v15

    const-string/jumbo v16, "ignore"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v14

    .line 2132
    .local v14, "tagletPath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v14}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v15

    if-eqz v15, :cond_0

    .line 2133
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-tagletpath"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2135
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    invoke-virtual {v15, v14}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    goto/16 :goto_0

    .line 2141
    .end local v2    # "element":Ljava/lang/Object;
    .end local v13    # "tagletInfo":Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;
    .end local v14    # "tagletPath":Lorg/apache/tools/ant/types/Path;
    :cond_4
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->source:Ljava/lang/String;

    if-eqz v15, :cond_8

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->source:Ljava/lang/String;

    .line 2143
    .local v8, "sourceArg":Ljava/lang/String;
    :goto_3
    if-eqz v8, :cond_5

    .line 2144
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-source"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2145
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    invoke-virtual {v15, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2148
    :cond_5
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->linksource:Z

    if-eqz v15, :cond_6

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v15, :cond_6

    .line 2149
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-linksource"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2151
    :cond_6
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->noqualifier:Ljava/lang/String;

    if-eqz v15, :cond_7

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v15, :cond_7

    .line 2152
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    const-string/jumbo v16, "-noqualifier"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2153
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->noqualifier:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2155
    :cond_7
    return-void

    .line 2141
    .end local v8    # "sourceArg":Ljava/lang/String;
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    const-string/jumbo v16, "ant.build.javac.source"

    invoke-virtual/range {v15 .. v16}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    goto :goto_3
.end method

.method private doLinks(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 14
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x1

    .line 1951
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->links:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-eqz v10, :cond_9

    .line 1952
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->links:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 1953
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;

    .line 1955
    .local v4, "la":Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_1

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    if-nez v10, :cond_2

    .line 1956
    :cond_1
    const-string/jumbo v10, "No href was given for the link - skipping"

    invoke-virtual {p0, v10, v13}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 1960
    :cond_2
    const/4 v5, 0x0

    .line 1961
    .local v5, "link":Ljava/lang/String;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->shouldResolveLink()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1962
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 1964
    .local v3, "hrefAsFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1966
    :try_start_0
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Javadoc;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v10, v3}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v10

    invoke-virtual {v10}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 1975
    .end local v3    # "hrefAsFile":Ljava/io/File;
    :cond_3
    :goto_1
    if-nez v5, :cond_4

    .line 1978
    :try_start_1
    new-instance v0, Ljava/net/URL;

    const-string/jumbo v10, "file://."

    invoke-direct {v0, v10}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1979
    .local v0, "base":Ljava/net/URL;
    new-instance v10, Ljava/net/URL;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v0, v11}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 1980
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v5

    .line 1990
    .end local v0    # "base":Ljava/net/URL;
    :cond_4
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->isLinkOffline()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 1991
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getPackagelistLoc()Ljava/io/File;

    move-result-object v8

    .line 1992
    .local v8, "packageListLocation":Ljava/io/File;
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getPackagelistURL()Ljava/net/URL;

    move-result-object v9

    .line 1993
    .local v9, "packageListURL":Ljava/net/URL;
    if-nez v8, :cond_5

    if-nez v9, :cond_5

    .line 1995
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "The package list location for link "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " must be provided "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "because the link is "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "offline"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1968
    .end local v8    # "packageListLocation":Ljava/io/File;
    .end local v9    # "packageListURL":Ljava/net/URL;
    .restart local v3    # "hrefAsFile":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 1970
    .local v2, "ex":Ljava/net/MalformedURLException;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Warning: link location was invalid "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 1981
    .end local v2    # "ex":Ljava/net/MalformedURLException;
    .end local v3    # "hrefAsFile":Ljava/io/File;
    :catch_1
    move-exception v6

    .line 1983
    .local v6, "mue":Ljava/net/MalformedURLException;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Link href \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->getHref()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\" is not a valid url - skipping link"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 2002
    .end local v6    # "mue":Ljava/net/MalformedURLException;
    .restart local v8    # "packageListLocation":Ljava/io/File;
    .restart local v9    # "packageListURL":Ljava/net/URL;
    :cond_5
    if-eqz v8, :cond_6

    .line 2003
    new-instance v7, Ljava/io/File;

    const-string/jumbo v10, "package-list"

    invoke-direct {v7, v8, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2005
    .local v7, "packageListFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 2007
    :try_start_2
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Javadoc;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v10, v8}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v9

    .line 2019
    .end local v7    # "packageListFile":Ljava/io/File;
    :cond_6
    :goto_2
    if-eqz v9, :cond_0

    .line 2020
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-linkoffline"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2021
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2022
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v9}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2009
    .restart local v7    # "packageListFile":Ljava/io/File;
    :catch_2
    move-exception v2

    .line 2010
    .restart local v2    # "ex":Ljava/net/MalformedURLException;
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Warning: Package list location was invalid "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v12}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 2015
    .end local v2    # "ex":Ljava/net/MalformedURLException;
    :cond_7
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Warning: No package list was found at "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v13}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 2026
    .end local v7    # "packageListFile":Ljava/io/File;
    .end local v8    # "packageListLocation":Ljava/io/File;
    .end local v9    # "packageListURL":Ljava/net/URL;
    :cond_8
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-link"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 2027
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v10, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2031
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v4    # "la":Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;
    .end local v5    # "link":Ljava/lang/String;
    :cond_9
    return-void
.end method

.method private doSourceAndPackageNames(Lorg/apache/tools/ant/types/Commandline;Ljava/util/Vector;Ljava/util/Vector;ZLjava/io/File;Ljava/io/BufferedWriter;)V
    .locals 7
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "packagesToDoc"    # Ljava/util/Vector;
    .param p3, "sourceFilesToDoc"    # Ljava/util/Vector;
    .param p4, "useExternalFile"    # Z
    .param p5, "tmpList"    # Ljava/io/File;
    .param p6, "srcListWriter"    # Ljava/io/BufferedWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2176
    invoke-virtual {p2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 2177
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 2178
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 2179
    .local v2, "packageName":Ljava/lang/String;
    if-eqz p4, :cond_0

    .line 2180
    invoke-virtual {p6, v2}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 2181
    invoke-virtual {p6}, Ljava/io/BufferedWriter;->newLine()V

    goto :goto_0

    .line 2183
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 2187
    .end local v2    # "packageName":Ljava/lang/String;
    :cond_1
    invoke-virtual {p3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 2188
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 2189
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;

    .line 2190
    .local v3, "sf":Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 2191
    .local v4, "sourceFileName":Ljava/lang/String;
    if-eqz p4, :cond_4

    .line 2194
    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-le v5, v6, :cond_3

    .line 2195
    move-object v1, v4

    .line 2196
    .local v1, "name":Ljava/lang/String;
    sget-char v5, Ljava/io/File;->separatorChar:C

    const/16 v6, 0x5c

    if-ne v5, v6, :cond_2

    .line 2197
    sget-char v5, Ljava/io/File;->separatorChar:C

    const/16 v6, 0x2f

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 2199
    :cond_2
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p6, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 2203
    .end local v1    # "name":Ljava/lang/String;
    :goto_2
    invoke-virtual {p6}, Ljava/io/BufferedWriter;->newLine()V

    goto :goto_1

    .line 2201
    :cond_3
    invoke-virtual {p6, v4}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto :goto_2

    .line 2205
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 2208
    .end local v3    # "sf":Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;
    .end local v4    # "sourceFileName":Ljava/lang/String;
    :cond_5
    return-void
.end method

.method private doSourcePath(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "sourceDirs"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 1817
    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1818
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-sourcepath"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1819
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 1821
    :cond_0
    return-void
.end method

.method private generalJavadocArguments(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 1824
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doctitle:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    if-eqz v0, :cond_0

    .line 1825
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-doctitle"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1826
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doctitle:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1828
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->header:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    if-eqz v0, :cond_1

    .line 1829
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-header"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1830
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->header:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1832
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->footer:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    if-eqz v0, :cond_2

    .line 1833
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-footer"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1834
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->footer:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1836
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bottom:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    if-eqz v0, :cond_3

    .line 1837
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-bottom"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1838
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bottom:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1841
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_7

    .line 1842
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    const-string/jumbo v1, "last"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 1847
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 1848
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-classpath"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1849
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 1852
    :cond_4
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->version:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_5

    .line 1853
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-version"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1855
    :cond_5
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->author:Z

    if-eqz v0, :cond_6

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_6

    .line 1856
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-author"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1859
    :cond_6
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_8

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->destDir:Ljava/io/File;

    if-nez v0, :cond_8

    .line 1860
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "destdir attribute must be set!"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1844
    :cond_7
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v1, "ignore"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    goto :goto_0

    .line 1862
    :cond_8
    return-void
.end method

.method private parsePackages(Ljava/util/Vector;Lorg/apache/tools/ant/types/Path;)V
    .locals 23
    .param p1, "pn"    # Ljava/util/Vector;
    .param p2, "sp"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 2325
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 2326
    .local v3, "addedPackages":Ljava/util/HashSet;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageSets:Ljava/util/Vector;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Vector;

    .line 2332
    .local v7, "dirSets":Ljava/util/Vector;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    move-object/from16 v20, v0

    if-eqz v20, :cond_6

    .line 2333
    new-instance v19, Lorg/apache/tools/ant/types/PatternSet;

    invoke-direct/range {v19 .. v19}, Lorg/apache/tools/ant/types/PatternSet;-><init>()V

    .line 2334
    .local v19, "ps":Lorg/apache/tools/ant/types/PatternSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lorg/apache/tools/ant/types/PatternSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 2335
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageNames:Ljava/util/Vector;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->size()I

    move-result v20

    if-lez v20, :cond_1

    .line 2336
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageNames:Ljava/util/Vector;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v11

    .line 2337
    .local v11, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v20

    if-eqz v20, :cond_2

    .line 2338
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    .line 2339
    .local v14, "p":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    invoke-virtual {v14}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->getName()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x2e

    const/16 v22, 0x2f

    invoke-virtual/range {v20 .. v22}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v18

    .line 2340
    .local v18, "pkg":Ljava/lang/String;
    const-string/jumbo v20, "*"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_0

    .line 2341
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, "*"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2343
    :cond_0
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 2346
    .end local v11    # "e":Ljava/util/Enumeration;
    .end local v14    # "p":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    .end local v18    # "pkg":Ljava/lang/String;
    :cond_1
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/PatternSet;->createInclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v20

    const-string/jumbo v21, "**"

    invoke-virtual/range {v20 .. v21}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 2349
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludePackageNames:Ljava/util/Vector;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v11

    .line 2350
    .restart local v11    # "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v20

    if-eqz v20, :cond_4

    .line 2351
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    .line 2352
    .restart local v14    # "p":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    invoke-virtual {v14}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->getName()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x2e

    const/16 v22, 0x2f

    invoke-virtual/range {v20 .. v22}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v18

    .line 2353
    .restart local v18    # "pkg":Ljava/lang/String;
    const-string/jumbo v20, "*"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_3

    .line 2354
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, "*"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 2356
    :cond_3
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/PatternSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    goto :goto_1

    .line 2360
    .end local v14    # "p":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    .end local v18    # "pkg":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v16

    .line 2361
    .local v16, "pathElements":[Ljava/lang/String;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_2
    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_6

    .line 2362
    new-instance v6, Ljava/io/File;

    aget-object v20, v16, v13

    move-object/from16 v0, v20

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2363
    .local v6, "dir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v20

    if-eqz v20, :cond_5

    .line 2364
    new-instance v9, Lorg/apache/tools/ant/types/DirSet;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/DirSet;-><init>()V

    .line 2365
    .local v9, "ds":Lorg/apache/tools/ant/types/DirSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/DirSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 2366
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useDefaultExcludes:Z

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/DirSet;->setDefaultexcludes(Z)V

    .line 2367
    invoke-virtual {v9, v6}, Lorg/apache/tools/ant/types/DirSet;->setDir(Ljava/io/File;)V

    .line 2368
    invoke-virtual {v9}, Lorg/apache/tools/ant/types/DirSet;->createPatternSet()Lorg/apache/tools/ant/types/PatternSet;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet;->addConfiguredPatternset(Lorg/apache/tools/ant/types/PatternSet;)V

    .line 2369
    invoke-virtual {v7, v9}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 2361
    .end local v9    # "ds":Lorg/apache/tools/ant/types/DirSet;
    :goto_3
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 2371
    :cond_5
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "Skipping "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    aget-object v21, v16, v13

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " since it is no directory."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 2377
    .end local v6    # "dir":Ljava/io/File;
    .end local v11    # "e":Ljava/util/Enumeration;
    .end local v13    # "i":I
    .end local v16    # "pathElements":[Ljava/lang/String;
    .end local v19    # "ps":Lorg/apache/tools/ant/types/PatternSet;
    :cond_6
    invoke-virtual {v7}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v11

    .line 2378
    .restart local v11    # "e":Ljava/util/Enumeration;
    :goto_4
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v20

    if-eqz v20, :cond_b

    .line 2379
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/DirSet;

    .line 2380
    .restart local v9    # "ds":Lorg/apache/tools/ant/types/DirSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/DirSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v4

    .line 2381
    .local v4, "baseDir":Ljava/io/File;
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v21, "scanning "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " for packages."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 2382
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Lorg/apache/tools/ant/types/DirSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v10

    .line 2383
    .local v10, "dsc":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v10}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v8

    .line 2384
    .local v8, "dirs":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 2385
    .local v5, "containsPackages":Z
    const/4 v13, 0x0

    .restart local v13    # "i":I
    :goto_5
    array-length v0, v8

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v13, v0, :cond_9

    .line 2387
    new-instance v17, Ljava/io/File;

    aget-object v20, v8, v13

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-direct {v0, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 2388
    .local v17, "pd":Ljava/io/File;
    new-instance v20, Lorg/apache/tools/ant/taskdefs/Javadoc$1;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$1;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v12

    .line 2396
    .local v12, "files":[Ljava/lang/String;
    array-length v0, v12

    move/from16 v20, v0

    if-lez v20, :cond_7

    .line 2397
    const-string/jumbo v20, ""

    aget-object v21, v8, v13

    invoke-virtual/range {v20 .. v21}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v20

    if-eqz v20, :cond_8

    .line 2398
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " contains source files in the default package,"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " you must specify them as source files"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " not packages."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 2385
    :cond_7
    :goto_6
    add-int/lit8 v13, v13, 0x1

    goto :goto_5

    .line 2404
    :cond_8
    const/4 v5, 0x1

    .line 2405
    aget-object v20, v8, v13

    sget-char v21, Ljava/io/File;->separatorChar:C

    const/16 v22, 0x2e

    invoke-virtual/range {v20 .. v22}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v15

    .line 2407
    .local v15, "packageName":Ljava/lang/String;
    invoke-virtual {v3, v15}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v20

    if-nez v20, :cond_7

    .line 2408
    invoke-virtual {v3, v15}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 2409
    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_6

    .line 2414
    .end local v12    # "files":[Ljava/lang/String;
    .end local v15    # "packageName":Ljava/lang/String;
    .end local v17    # "pd":Ljava/io/File;
    :cond_9
    if-eqz v5, :cond_a

    .line 2417
    invoke-virtual/range {p2 .. p2}, Lorg/apache/tools/ant/types/Path;->createPathElement()Lorg/apache/tools/ant/types/Path$PathElement;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/Path$PathElement;->setLocation(Ljava/io/File;)V

    goto/16 :goto_4

    .line 2419
    :cond_a
    new-instance v20, Ljava/lang/StringBuffer;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v20

    const-string/jumbo v21, " doesn\'t contain any packages, dropping it."

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    goto/16 :goto_4

    .line 2423
    .end local v4    # "baseDir":Ljava/io/File;
    .end local v5    # "containsPackages":Z
    .end local v8    # "dirs":[Ljava/lang/String;
    .end local v9    # "ds":Lorg/apache/tools/ant/types/DirSet;
    .end local v10    # "dsc":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v13    # "i":I
    :cond_b
    return-void
.end method

.method private quoteString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/16 v3, 0x22

    const/16 v2, 0x27

    const/4 v1, -0x1

    .line 2217
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->containsWhitespace(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_0

    .line 2225
    .end local p1    # "str":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 2222
    .restart local p1    # "str":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v1, :cond_1

    .line 2223
    invoke-direct {p0, p1, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc;->quoteString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 2225
    :cond_1
    invoke-direct {p0, p1, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc;->quoteString(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private quoteString(Ljava/lang/String;C)Ljava/lang/String;
    .locals 6
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "delim"    # C

    .prologue
    .line 2240
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 2241
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2242
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 2243
    .local v4, "len":I
    const/4 v3, 0x0

    .line 2244
    .local v3, "lastCharWasCR":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_2

    .line 2245
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 2246
    .local v1, "c":C
    if-ne v1, p2, :cond_0

    .line 2247
    const/16 v5, 0x5c

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2248
    const/4 v3, 0x0

    .line 2244
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 2250
    :cond_0
    sparse-switch v1, :sswitch_data_0

    .line 2272
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2273
    const/4 v3, 0x0

    goto :goto_1

    .line 2252
    :sswitch_0
    const-string/jumbo v5, "\\\\"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2253
    const/4 v3, 0x0

    .line 2254
    goto :goto_1

    .line 2257
    :sswitch_1
    const-string/jumbo v5, "\\\r"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2258
    const/4 v3, 0x1

    .line 2259
    goto :goto_1

    .line 2264
    :sswitch_2
    if-nez v3, :cond_1

    .line 2265
    const-string/jumbo v5, "\\\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 2269
    :goto_2
    const/4 v3, 0x0

    .line 2270
    goto :goto_1

    .line 2267
    :cond_1
    const-string/jumbo v5, "\n"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 2278
    .end local v1    # "c":C
    :cond_2
    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 2279
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 2250
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_2
        0xd -> :sswitch_1
        0x5c -> :sswitch_0
    .end sparse-switch
.end method

.method private writeExternalArgs(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 13
    .param p1, "toExecute"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 1900
    const/4 v11, 0x0

    .line 1901
    .local v11, "optionsTmpFile":Ljava/io/File;
    const/4 v9, 0x0

    .line 1903
    .local v9, "optionsListWriter":Ljava/io/BufferedWriter;
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v1, "javadocOptions"

    const-string/jumbo v2, ""

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v11

    .line 1905
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v8

    .line 1906
    .local v8, "listOpt":[Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->clearArgs()V

    .line 1907
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1909
    new-instance v10, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v10, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1911
    .end local v9    # "optionsListWriter":Ljava/io/BufferedWriter;
    .local v10, "optionsListWriter":Ljava/io/BufferedWriter;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    :try_start_1
    array-length v0, v8

    if-ge v7, v0, :cond_3

    .line 1912
    aget-object v12, v8, v7

    .line 1913
    .local v12, "string":Ljava/lang/String;
    const-string/jumbo v0, "-J-"

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1914
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, v12}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1911
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1916
    :cond_0
    const-string/jumbo v0, "-"

    invoke-virtual {v12, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1917
    invoke-virtual {v10, v12}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1918
    const-string/jumbo v0, " "

    invoke-virtual {v10, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 1926
    .end local v12    # "string":Ljava/lang/String;
    :catch_0
    move-exception v6

    move-object v9, v10

    .line 1927
    .end local v7    # "i":I
    .end local v8    # "listOpt":[Ljava/lang/String;
    .end local v10    # "optionsListWriter":Ljava/io/BufferedWriter;
    .local v6, "ex":Ljava/io/IOException;
    .restart local v9    # "optionsListWriter":Ljava/io/BufferedWriter;
    :goto_2
    if-eqz v11, :cond_1

    .line 1928
    :try_start_2
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 1930
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Error creating or writing temporary file for javadoc options"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1934
    .end local v6    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v0

    :goto_3
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v0

    .line 1920
    .end local v9    # "optionsListWriter":Ljava/io/BufferedWriter;
    .restart local v7    # "i":I
    .restart local v8    # "listOpt":[Ljava/lang/String;
    .restart local v10    # "optionsListWriter":Ljava/io/BufferedWriter;
    .restart local v12    # "string":Ljava/lang/String;
    :cond_2
    :try_start_3
    invoke-direct {p0, v12}, Lorg/apache/tools/ant/taskdefs/Javadoc;->quoteString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1921
    invoke-virtual {v10}, Ljava/io/BufferedWriter;->newLine()V

    goto :goto_1

    .line 1934
    .end local v12    # "string":Ljava/lang/String;
    :catchall_1
    move-exception v0

    move-object v9, v10

    .end local v10    # "optionsListWriter":Ljava/io/BufferedWriter;
    .restart local v9    # "optionsListWriter":Ljava/io/BufferedWriter;
    goto :goto_3

    .line 1925
    .end local v9    # "optionsListWriter":Ljava/io/BufferedWriter;
    .restart local v10    # "optionsListWriter":Ljava/io/BufferedWriter;
    :cond_3
    invoke-virtual {v10}, Ljava/io/BufferedWriter;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1934
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 1936
    return-void

    .line 1926
    .end local v7    # "i":I
    .end local v8    # "listOpt":[Ljava/lang/String;
    .end local v10    # "optionsListWriter":Ljava/io/BufferedWriter;
    .restart local v9    # "optionsListWriter":Ljava/io/BufferedWriter;
    :catch_1
    move-exception v6

    goto :goto_2
.end method


# virtual methods
.method public addBottom(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V
    .locals 0
    .param p1, "text"    # Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .prologue
    .line 1017
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bottom:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 1018
    return-void
.end method

.method public addDoctitle(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V
    .locals 0
    .param p1, "text"    # Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .prologue
    .line 957
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doctitle:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 958
    return-void
.end method

.method public addExcludePackage(Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;)V
    .locals 1
    .param p1, "pn"    # Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    .prologue
    .line 631
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludePackageNames:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 632
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 1585
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->createSourceFiles()Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 1586
    return-void
.end method

.method public addFooter(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V
    .locals 0
    .param p1, "text"    # Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .prologue
    .line 997
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->footer:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 998
    return-void
.end method

.method public addHeader(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V
    .locals 0
    .param p1, "text"    # Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .prologue
    .line 977
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->header:Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    .line 978
    return-void
.end method

.method public addPackage(Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;)V
    .locals 1
    .param p1, "pn"    # Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    .prologue
    .line 606
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageNames:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 607
    return-void
.end method

.method public addPackageset(Lorg/apache/tools/ant/types/DirSet;)V
    .locals 1
    .param p1, "packageSet"    # Lorg/apache/tools/ant/types/DirSet;

    .prologue
    .line 1571
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1572
    return-void
.end method

.method public addSource(Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;)V
    .locals 1
    .param p1, "sf"    # Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;

    .prologue
    .line 576
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourceFiles:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 577
    return-void
.end method

.method public addTaglet(Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;)V
    .locals 1
    .param p1, "tagletInfo"    # Lorg/apache/tools/ant/taskdefs/Javadoc$ExtensionInfo;

    .prologue
    .line 755
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->tags:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 756
    return-void
.end method

.method public createArg()Lorg/apache/tools/ant/types/Commandline$Argument;
    .locals 1

    .prologue
    .line 506
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    return-object v0
.end method

.method public createBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 825
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 826
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 828
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 791
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 792
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 794
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createDoclet()Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;
    .locals 1

    .prologue
    .line 743
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_0

    .line 744
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    .line 746
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    return-object v0
.end method

.method public createGroup()Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;
    .locals 2

    .prologue
    .line 1442
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    .line 1443
    .local v0, "ga":Lorg/apache/tools/ant/taskdefs/Javadoc$GroupArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->groups:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1444
    return-object v0
.end method

.method public createLink()Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;
    .locals 2

    .prologue
    .line 1171
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    .line 1172
    .local v0, "la":Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->links:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1173
    return-object v0
.end method

.method public createSourceFiles()Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;
    .locals 1

    .prologue
    .line 1596
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->nestedSourceFiles:Lorg/apache/tools/ant/taskdefs/Javadoc$ResourceCollectionContainer;

    return-object v0
.end method

.method public createSourcepath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 529
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 530
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    .line 532
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createTag()Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;
    .locals 2

    .prologue
    .line 1284
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    .line 1285
    .local v0, "ta":Lorg/apache/tools/ant/taskdefs/Javadoc$TagArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->tags:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1286
    return-object v0
.end method

.method public execute()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1663
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->checkTaskName()V

    .line 1665
    new-instance v13, Ljava/util/Vector;

    invoke-direct {v13}, Ljava/util/Vector;-><init>()V

    .line 1666
    .local v13, "packagesToDoc":Ljava/util/Vector;
    new-instance v15, Lorg/apache/tools/ant/types/Path;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v15, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 1668
    .local v15, "sourceDirs":Lorg/apache/tools/ant/types/Path;
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->checkPackageAndSourcePath()V

    .line 1670
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    if-eqz v2, :cond_0

    .line 1671
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v15, v2}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 1674
    :cond_0
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v15}, Lorg/apache/tools/ant/taskdefs/Javadoc;->parsePackages(Ljava/util/Vector;Lorg/apache/tools/ant/types/Path;)V

    .line 1675
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v15}, Lorg/apache/tools/ant/taskdefs/Javadoc;->checkPackages(Ljava/util/Vector;Lorg/apache/tools/ant/types/Path;)V

    .line 1677
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourceFiles:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/Vector;

    .line 1678
    .local v16, "sourceFilesToDoc":Ljava/util/Vector;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addSourceFiles(Ljava/util/Vector;)V

    .line 1680
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v13, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->checkPackagesToDoc(Ljava/util/Vector;Ljava/util/Vector;)V

    .line 1682
    const-string/jumbo v2, "Generating Javadoc"

    const/4 v3, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 1684
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->clone()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/tools/ant/types/Commandline;

    .line 1685
    .local v19, "toExecute":Lorg/apache/tools/ant/types/Commandline;
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->executable:Ljava/lang/String;

    if-eqz v2, :cond_6

    .line 1686
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->executable:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 1692
    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->generalJavadocArguments(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1693
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1, v15}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doSourcePath(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/types/Path;)V

    .line 1694
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doDoclet(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1695
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doBootPath(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1696
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doLinks(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1697
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doGroup(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1698
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doGroups(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1699
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doDocFilesSubDirs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1701
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doJava14(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1702
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->breakiterator:Z

    if-eqz v2, :cond_2

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-eqz v2, :cond_1

    sget-boolean v2, Lorg/apache/tools/ant/taskdefs/Javadoc;->JAVADOC_5:Z

    if-eqz v2, :cond_2

    .line 1703
    :cond_1
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-breakiterator"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1706
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useExternalFile:Z

    if-eqz v2, :cond_3

    .line 1707
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->writeExternalArgs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 1710
    :cond_3
    const/16 v18, 0x0

    .line 1711
    .local v18, "tmpList":Ljava/io/File;
    const/4 v8, 0x0

    .line 1718
    .local v8, "srcListWriter":Ljava/io/BufferedWriter;
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useExternalFile:Z

    if-eqz v2, :cond_9

    .line 1719
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Javadoc;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v3, "javadoc"

    const-string/jumbo v4, ""

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-virtual/range {v2 .. v7}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-result-object v7

    .line 1720
    .end local v18    # "tmpList":Ljava/io/File;
    .local v7, "tmpList":Ljava/io/File;
    :try_start_1
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1722
    new-instance v17, Ljava/io/BufferedWriter;

    new-instance v2, Ljava/io/FileWriter;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    move-object/from16 v0, v17

    invoke-direct {v0, v2}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .end local v8    # "srcListWriter":Ljava/io/BufferedWriter;
    .local v17, "srcListWriter":Ljava/io/BufferedWriter;
    move-object/from16 v8, v17

    .line 1727
    .end local v17    # "srcListWriter":Ljava/io/BufferedWriter;
    .restart local v8    # "srcListWriter":Ljava/io/BufferedWriter;
    :goto_1
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useExternalFile:Z

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    move-object v4, v13

    move-object/from16 v5, v16

    invoke-direct/range {v2 .. v8}, Lorg/apache/tools/ant/taskdefs/Javadoc;->doSourceAndPackageNames(Lorg/apache/tools/ant/types/Commandline;Ljava/util/Vector;Ljava/util/Vector;ZLjava/io/File;Ljava/io/BufferedWriter;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1735
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 1738
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageList:Ljava/lang/String;

    if-eqz v2, :cond_4

    .line 1739
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageList:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1741
    :cond_4
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Commandline;->describeCommand()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 1743
    const-string/jumbo v2, "Javadoc execution"

    const/4 v3, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 1745
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;

    const/4 v2, 0x2

    move-object/from16 v0, p0

    invoke-direct {v12, v0, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;I)V

    .line 1746
    .local v12, "out":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    new-instance v10, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;

    const/4 v2, 0x1

    move-object/from16 v0, p0

    invoke-direct {v10, v0, v2}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;I)V

    .line 1747
    .local v10, "err":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    new-instance v11, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    invoke-direct {v2, v12, v10}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    invoke-direct {v11, v2}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 1748
    .local v11, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v11, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 1756
    const/4 v2, 0x0

    invoke-virtual {v11, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 1758
    :try_start_2
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 1759
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    move-result v14

    .line 1760
    .local v14, "ret":I
    if-eqz v14, :cond_7

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Javadoc;->failOnError:Z

    if-eqz v2, :cond_7

    .line 1761
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Javadoc returned "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1764
    .end local v14    # "ret":I
    :catch_0
    move-exception v9

    .line 1765
    .local v9, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Javadoc failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v9, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1767
    .end local v9    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    if-eqz v7, :cond_5

    .line 1768
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1769
    const/4 v7, 0x0

    .line 1772
    :cond_5
    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->logFlush()V

    .line 1773
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->logFlush()V

    .line 1775
    :try_start_4
    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->close()V

    .line 1776
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 1767
    :goto_2
    throw v2

    .line 1688
    .end local v7    # "tmpList":Ljava/io/File;
    .end local v8    # "srcListWriter":Ljava/io/BufferedWriter;
    .end local v10    # "err":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    .end local v11    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .end local v12    # "out":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    :cond_6
    const-string/jumbo v2, "javadoc"

    invoke-static {v2}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1730
    .restart local v8    # "srcListWriter":Ljava/io/BufferedWriter;
    .restart local v18    # "tmpList":Ljava/io/File;
    :catch_1
    move-exception v9

    move-object/from16 v7, v18

    .line 1731
    .end local v18    # "tmpList":Ljava/io/File;
    .restart local v7    # "tmpList":Ljava/io/File;
    .restart local v9    # "e":Ljava/io/IOException;
    :goto_3
    :try_start_5
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1732
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Error creating temporary file"

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v9, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 1735
    .end local v9    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v2

    :goto_4
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v2

    .line 1767
    .restart local v10    # "err":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    .restart local v11    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .restart local v12    # "out":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    .restart local v14    # "ret":I
    :cond_7
    if-eqz v7, :cond_8

    .line 1768
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 1769
    const/4 v7, 0x0

    .line 1772
    :cond_8
    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->logFlush()V

    .line 1773
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->logFlush()V

    .line 1775
    :try_start_6
    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->close()V

    .line 1776
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 1781
    :goto_5
    return-void

    .line 1777
    :catch_2
    move-exception v2

    goto :goto_5

    .end local v14    # "ret":I
    :catch_3
    move-exception v3

    goto :goto_2

    .line 1735
    .end local v7    # "tmpList":Ljava/io/File;
    .end local v10    # "err":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    .end local v11    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    .end local v12    # "out":Lorg/apache/tools/ant/taskdefs/Javadoc$JavadocOutputStream;
    .restart local v18    # "tmpList":Ljava/io/File;
    :catchall_2
    move-exception v2

    move-object/from16 v7, v18

    .end local v18    # "tmpList":Ljava/io/File;
    .restart local v7    # "tmpList":Ljava/io/File;
    goto :goto_4

    .line 1730
    :catch_4
    move-exception v9

    goto :goto_3

    .end local v7    # "tmpList":Ljava/io/File;
    .restart local v18    # "tmpList":Ljava/io/File;
    :cond_9
    move-object/from16 v7, v18

    .end local v18    # "tmpList":Ljava/io/File;
    .restart local v7    # "tmpList":Ljava/io/File;
    goto/16 :goto_1
.end method

.method protected expand(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 2471
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAccess(Lorg/apache/tools/ant/taskdefs/Javadoc$AccessType;)V
    .locals 3
    .param p1, "at"    # Lorg/apache/tools/ant/taskdefs/Javadoc$AccessType;

    .prologue
    .line 693
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$AccessType;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 694
    return-void
.end method

.method public setAdditionalparam(Ljava/lang/String;)V
    .locals 1
    .param p1, "add"    # Ljava/lang/String;

    .prologue
    .line 497
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setLine(Ljava/lang/String;)V

    .line 498
    return-void
.end method

.method public setAuthor(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 918
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->author:Z

    .line 919
    return-void
.end method

.method public setBootClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 837
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->createBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 838
    return-void
.end method

.method public setBootclasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 812
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 813
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 817
    :goto_0
    return-void

    .line 815
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setBottom(Ljava/lang/String;)V
    .locals 1
    .param p1, "bottom"    # Ljava/lang/String;

    .prologue
    .line 1006
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;-><init>()V

    .line 1007
    .local v0, "h":Lorg/apache/tools/ant/taskdefs/Javadoc$Html;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->addText(Ljava/lang/String;)V

    .line 1008
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addBottom(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V

    .line 1009
    return-void
.end method

.method public setBreakiterator(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1616
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->breakiterator:Z

    .line 1617
    return-void
.end method

.method public setCharset(Ljava/lang/String;)V
    .locals 1
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1528
    const-string/jumbo v0, "-charset"

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIfNotEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1529
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 778
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 779
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 783
    :goto_0
    return-void

    .line 781
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 803
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 804
    return-void
.end method

.method public setDefaultexcludes(Z)V
    .locals 0
    .param p1, "useDefaultExcludes"    # Z

    .prologue
    .line 478
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useDefaultExcludes:Z

    .line 479
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 2
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 550
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->destDir:Ljava/io/File;

    .line 551
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-d"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 552
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->destDir:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 553
    return-void
.end method

.method public setDocFilesSubDirs(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1645
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->docFilesSubDirs:Z

    .line 1646
    return-void
.end method

.method public setDocencoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "enc"    # Ljava/lang/String;

    .prologue
    .line 1152
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-docencoding"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1153
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1154
    return-void
.end method

.method public setDoclet(Ljava/lang/String;)V
    .locals 2
    .param p1, "docletName"    # Ljava/lang/String;

    .prologue
    .line 703
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_0

    .line 704
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    .line 705
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 707
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->setName(Ljava/lang/String;)V

    .line 708
    return-void
.end method

.method public setDocletPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "docletPath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 716
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_0

    .line 717
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    .line 718
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 720
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 721
    return-void
.end method

.method public setDocletPathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 730
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    if-nez v0, :cond_0

    .line 731
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;-><init>(Lorg/apache/tools/ant/taskdefs/Javadoc;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    .line 732
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 734
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->doclet:Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$DocletInfo;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 735
    return-void
.end method

.method public setDoctitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "doctitle"    # Ljava/lang/String;

    .prologue
    .line 946
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;-><init>()V

    .line 947
    .local v0, "h":Lorg/apache/tools/ant/taskdefs/Javadoc$Html;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->addText(Ljava/lang/String;)V

    .line 948
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addDoctitle(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V

    .line 949
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 2
    .param p1, "enc"    # Ljava/lang/String;

    .prologue
    .line 889
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-encoding"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 890
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 891
    return-void
.end method

.method public setExcludeDocFilesSubDir(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1655
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->excludeDocFilesSubDir:Ljava/lang/String;

    .line 1656
    return-void
.end method

.method public setExcludePackageNames(Ljava/lang/String;)V
    .locals 4
    .param p1, "packages"    # Ljava/lang/String;

    .prologue
    .line 616
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ","

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 617
    .local v2, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 618
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 619
    .local v0, "p":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;-><init>()V

    .line 620
    .local v1, "pn":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->setName(Ljava/lang/String;)V

    .line 621
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addExcludePackage(Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;)V

    goto :goto_0

    .line 623
    .end local v0    # "p":Ljava/lang/String;
    .end local v1    # "pn":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    :cond_0
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 0
    .param p1, "executable"    # Ljava/lang/String;

    .prologue
    .line 1559
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->executable:Ljava/lang/String;

    .line 1560
    return-void
.end method

.method public setExtdirs(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 848
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-extdirs"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 849
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 850
    return-void
.end method

.method public setExtdirs(Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 858
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-extdirs"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 859
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 860
    return-void
.end method

.method public setFailonerror(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1539
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->failOnError:Z

    .line 1540
    return-void
.end method

.method public setFooter(Ljava/lang/String;)V
    .locals 1
    .param p1, "footer"    # Ljava/lang/String;

    .prologue
    .line 986
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;-><init>()V

    .line 987
    .local v0, "h":Lorg/apache/tools/ant/taskdefs/Javadoc$Html;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->addText(Ljava/lang/String;)V

    .line 988
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addFooter(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V

    .line 989
    return-void
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 0
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1052
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->group:Ljava/lang/String;

    .line 1053
    return-void
.end method

.method public setHeader(Ljava/lang/String;)V
    .locals 1
    .param p1, "header"    # Ljava/lang/String;

    .prologue
    .line 966
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;-><init>()V

    .line 967
    .local v0, "h":Lorg/apache/tools/ant/taskdefs/Javadoc$Html;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$Html;->addText(Ljava/lang/String;)V

    .line 968
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addHeader(Lorg/apache/tools/ant/taskdefs/Javadoc$Html;)V

    .line 969
    return-void
.end method

.method public setHelpfile(Ljava/io/File;)V
    .locals 2
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 1142
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-helpfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1143
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 1144
    return-void
.end method

.method public setIncludeNoSourcePackages(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1636
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->includeNoSourcePackages:Z

    .line 1637
    return-void
.end method

.method public setLink(Ljava/lang/String;)V
    .locals 1
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1060
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->createLink()Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->setHref(Ljava/lang/String;)V

    .line 1061
    return-void
.end method

.method public setLinkoffline(Ljava/lang/String;)V
    .locals 5
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1027
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->createLink()Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;

    move-result-object v0

    .line 1028
    .local v0, "le":Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->setOffline(Z)V

    .line 1029
    const-string/jumbo v1, "The linkoffline attribute must include a URL and a package-list file location separated by a space"

    .line 1032
    .local v1, "linkOfflineError":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    .line 1033
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1035
    :cond_0
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, " "

    const/4 v4, 0x0

    invoke-direct {v2, p1, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1036
    .local v2, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->setHref(Ljava/lang/String;)V

    .line 1038
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1039
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1041
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$LinkArgument;->setPackagelistLoc(Ljava/io/File;)V

    .line 1042
    return-void
.end method

.method public setLinksource(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 1606
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->linksource:Z

    .line 1607
    return-void
.end method

.method public setLocale(Ljava/lang/String;)V
    .locals 2
    .param p1, "locale"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 879
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 880
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument(Z)Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-locale"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 881
    return-void
.end method

.method public setMaxmemory(Ljava/lang/String;)V
    .locals 3
    .param p1, "max"    # Ljava/lang/String;

    .prologue
    .line 488
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "-J-Xmx"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 489
    return-void
.end method

.method public setNodeprecated(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1069
    const-string/jumbo v0, "-nodeprecated"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1070
    return-void
.end method

.method public setNodeprecatedlist(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1078
    const-string/jumbo v0, "-nodeprecatedlist"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1079
    return-void
.end method

.method public setNohelp(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1105
    const-string/jumbo v0, "-nohelp"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1106
    return-void
.end method

.method public setNoindex(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1096
    const-string/jumbo v0, "-noindex"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1097
    return-void
.end method

.method public setNonavbar(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1114
    const-string/jumbo v0, "-nonavbar"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1115
    return-void
.end method

.method public setNoqualifier(Ljava/lang/String;)V
    .locals 0
    .param p1, "noqualifier"    # Ljava/lang/String;

    .prologue
    .line 1626
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->noqualifier:Ljava/lang/String;

    .line 1627
    return-void
.end method

.method public setNotree(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1087
    const-string/jumbo v0, "-notree"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1088
    return-void
.end method

.method public setOld(Z)V
    .locals 2
    .param p1, "b"    # Z

    .prologue
    .line 767
    const-string/jumbo v0, "Javadoc 1.4 doesn\'t support the -1.1 switch anymore"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->log(Ljava/lang/String;I)V

    .line 769
    return-void
.end method

.method public setOverview(Ljava/io/File;)V
    .locals 2
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 641
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-overview"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 642
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 643
    return-void
.end method

.method public setPackage(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 672
    const-string/jumbo v0, "-package"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 673
    return-void
.end method

.method public setPackageList(Ljava/lang/String;)V
    .locals 0
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 1162
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->packageList:Ljava/lang/String;

    .line 1163
    return-void
.end method

.method public setPackagenames(Ljava/lang/String;)V
    .locals 4
    .param p1, "packages"    # Ljava/lang/String;

    .prologue
    .line 588
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ","

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    .local v2, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 590
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 591
    .local v0, "p":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;-><init>()V

    .line 592
    .local v1, "pn":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;->setName(Ljava/lang/String;)V

    .line 593
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addPackage(Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;)V

    goto :goto_0

    .line 595
    .end local v0    # "p":Ljava/lang/String;
    .end local v1    # "pn":Lorg/apache/tools/ant/taskdefs/Javadoc$PackageName;
    :cond_0
    return-void
.end method

.method public setPrivate(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 682
    const-string/jumbo v0, "-private"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 683
    return-void
.end method

.method public setProtected(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 662
    const-string/jumbo v0, "-protected"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 663
    return-void
.end method

.method public setPublic(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 652
    const-string/jumbo v0, "-public"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 653
    return-void
.end method

.method public setSerialwarn(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 1123
    const-string/jumbo v0, "-serialwarn"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 1124
    return-void
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 1549
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->source:Ljava/lang/String;

    .line 1550
    return-void
.end method

.method public setSourcefiles(Ljava/lang/String;)V
    .locals 5
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 561
    new-instance v2, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ","

    invoke-direct {v2, p1, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    .local v2, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 563
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 564
    .local v0, "f":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;-><init>()V

    .line 565
    .local v1, "sf":Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;->setFile(Ljava/io/File;)V

    .line 566
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addSource(Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;)V

    goto :goto_0

    .line 568
    .end local v0    # "f":Ljava/lang/String;
    .end local v1    # "sf":Lorg/apache/tools/ant/taskdefs/Javadoc$SourceFile;
    :cond_0
    return-void
.end method

.method public setSourcepath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "src"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 515
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 516
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    .line 520
    :goto_0
    return-void

    .line 518
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->sourcePath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setSourcepathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 541
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->createSourcepath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 542
    return-void
.end method

.method public setSplitindex(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 927
    const-string/jumbo v0, "-splitindex"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 928
    return-void
.end method

.method public setStylesheetfile(Ljava/io/File;)V
    .locals 2
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 1132
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-stylesheetfile"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 1133
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->cmd:Lorg/apache/tools/ant/types/Commandline;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 1134
    return-void
.end method

.method public setUse(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 908
    const-string/jumbo v0, "-use"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 909
    return-void
.end method

.method public setUseExternalFile(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 467
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->useExternalFile:Z

    .line 468
    return-void
.end method

.method public setVerbose(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 868
    const-string/jumbo v0, "-verbose"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIf(ZLjava/lang/String;)V

    .line 869
    return-void
.end method

.method public setVersion(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 899
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javadoc;->version:Z

    .line 900
    return-void
.end method

.method public setWindowtitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 937
    const-string/jumbo v0, "-windowtitle"

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/Javadoc;->addArgIfNotEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    return-void
.end method
