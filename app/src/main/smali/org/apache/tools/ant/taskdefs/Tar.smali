.class public Lorg/apache/tools/ant/taskdefs/Tar;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Tar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;,
        Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;,
        Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field public static final FAIL:Ljava/lang/String; = "fail"

.field public static final GNU:Ljava/lang/String; = "gnu"

.field public static final OMIT:Ljava/lang/String; = "omit"

.field public static final TRUNCATE:Ljava/lang/String; = "truncate"

.field public static final WARN:Ljava/lang/String; = "warn"

.field static class$org$apache$tools$ant$taskdefs$Tar:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field baseDir:Ljava/io/File;

.field private compression:Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;

.field fileSetFiles:Ljava/util/Vector;

.field filesets:Ljava/util/Vector;

.field private longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

.field private longWarningGiven:Z

.field private resourceCollections:Ljava/util/Vector;

.field tarFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 100
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    .line 103
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    .line 106
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->resourceCollections:Ljava/util/Vector;

    .line 108
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->fileSetFiles:Ljava/util/Vector;

    .line 115
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longWarningGiven:Z

    .line 117
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->compression:Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;

    .line 910
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 544
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

.method protected static getFileNames(Lorg/apache/tools/ant/types/FileSet;)[Ljava/lang/String;
    .locals 7
    .param p0, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    const/4 v6, 0x0

    .line 704
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    .line 705
    .local v1, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v0

    .line 706
    .local v0, "directories":[Ljava/lang/String;
    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    .line 707
    .local v3, "filesPerSe":[Ljava/lang/String;
    array-length v4, v0

    array-length v5, v3

    add-int/2addr v4, v5

    new-array v2, v4, [Ljava/lang/String;

    .line 708
    .local v2, "files":[Ljava/lang/String;
    array-length v4, v0

    invoke-static {v0, v6, v2, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 709
    array-length v4, v0

    array-length v5, v3

    invoke-static {v3, v6, v2, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 711
    return-object v2
.end method

.method protected static isFileFileSet(Lorg/apache/tools/ant/types/ResourceCollection;)Z
    .locals 1
    .param p0, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 693
    instance-of v0, p0, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v0, :cond_0

    invoke-interface {p0}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "res"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->resourceCollections:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 137
    return-void
.end method

.method protected archiveIsUpToDate(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 4
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 527
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v2

    invoke-static {v0, p1, v2, v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->isOutOfDate(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;J)Z

    move-result v0

    return v0
.end method

.method protected archiveIsUpToDate([Ljava/lang/String;)Z
    .locals 1
    .param p1, "files"    # [Ljava/lang/String;

    .prologue
    .line 503
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->baseDir:Ljava/io/File;

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Tar;->archiveIsUpToDate([Ljava/lang/String;Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method protected archiveIsUpToDate([Ljava/lang/String;Ljava/io/File;)Z
    .locals 3
    .param p1, "files"    # [Ljava/lang/String;
    .param p2, "dir"    # Ljava/io/File;

    .prologue
    .line 514
    new-instance v1, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v1, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 515
    .local v1, "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    new-instance v0, Lorg/apache/tools/ant/util/MergingMapper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/MergingMapper;-><init>()V

    .line 516
    .local v0, "mm":Lorg/apache/tools/ant/util/MergingMapper;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/util/MergingMapper;->setTo(Ljava/lang/String;)V

    .line 517
    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2, v0}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected asTarFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    .locals 3
    .param p1, "archiveFileSet"    # Lorg/apache/tools/ant/types/ArchiveFileSet;

    .prologue
    .line 724
    const/4 v1, 0x0

    .line 725
    .local v1, "tfs":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    if-eqz p1, :cond_1

    instance-of v2, p1, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    if-eqz v2, :cond_1

    move-object v1, p1

    .line 726
    check-cast v1, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    .line 761
    :cond_0
    :goto_0
    return-object v1

    .line 728
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    .end local v1    # "tfs":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;-><init>()V

    .line 729
    .restart local v1    # "tfs":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 730
    if-eqz p1, :cond_0

    .line 731
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setPrefix(Ljava/lang/String;)V

    .line 732
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setFullpath(Ljava/lang/String;)V

    .line 733
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasFileModeBeenSet()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 734
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFileMode(Lorg/apache/tools/ant/Project;)I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->integerSetFileMode(I)V

    .line 737
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDirModeBeenSet()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 738
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getDirMode(Lorg/apache/tools/ant/Project;)I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->integerSetDirMode(I)V

    .line 742
    :cond_3
    instance-of v2, p1, Lorg/apache/tools/ant/types/TarFileSet;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 744
    check-cast v0, Lorg/apache/tools/ant/types/TarFileSet;

    .line 746
    .local v0, "t":Lorg/apache/tools/ant/types/TarFileSet;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->hasUserNameBeenSet()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 747
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getUserName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setUserName(Ljava/lang/String;)V

    .line 749
    :cond_4
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->hasGroupBeenSet()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 750
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getGroup()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setGroup(Ljava/lang/String;)V

    .line 752
    :cond_5
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->hasUserIdBeenSet()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 753
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getUid()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setUid(I)V

    .line 755
    :cond_6
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->hasGroupIdBeenSet()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 756
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/TarFileSet;->getGid()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setGid(I)V

    goto/16 :goto_0
.end method

.method protected check(Ljava/io/File;[Ljava/lang/String;)Z
    .locals 5
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "files"    # [Ljava/lang/String;

    .prologue
    .line 621
    const/4 v1, 0x1

    .line 622
    .local v1, "upToDate":Z
    invoke-virtual {p0, p2, p1}, Lorg/apache/tools/ant/taskdefs/Tar;->archiveIsUpToDate([Ljava/lang/String;Ljava/io/File;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 623
    const/4 v1, 0x0

    .line 626
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p2

    if-ge v0, v2, :cond_2

    .line 627
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    new-instance v3, Ljava/io/File;

    aget-object v4, p2, v0

    invoke-direct {v3, p1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 628
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "A tar file cannot include itself"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 626
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 632
    :cond_2
    return v1
.end method

.method protected check(Lorg/apache/tools/ant/types/ResourceCollection;)Z
    .locals 12
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 562
    const/4 v9, 0x1

    .line 563
    .local v9, "upToDate":Z
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Tar;->isFileFileSet(Lorg/apache/tools/ant/types/ResourceCollection;)Z

    move-result v10

    if-eqz v10, :cond_1

    move-object v5, p1

    .line 564
    check-cast v5, Lorg/apache/tools/ant/types/FileSet;

    .line 565
    .local v5, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v5, v10}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v10

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Tar;->getFileNames(Lorg/apache/tools/ant/types/FileSet;)[Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Tar;->check(Ljava/io/File;[Ljava/lang/String;)Z

    move-result v9

    .line 608
    .end local v5    # "fs":Lorg/apache/tools/ant/types/FileSet;
    :cond_0
    return v9

    .line 566
    :cond_1
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v10

    if-nez v10, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->supportsNonFileResources()Z

    move-result v10

    if-nez v10, :cond_2

    .line 567
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "only filesystem resources are supported"

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 568
    :cond_2
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v10

    if-eqz v10, :cond_9

    .line 569
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 570
    .local v2, "basedirs":Ljava/util/HashSet;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 571
    .local v1, "basedirToFilesMap":Ljava/util/HashMap;
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 572
    .local v6, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 573
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Resource;

    .line 574
    .local v8, "res":Lorg/apache/tools/ant/types/Resource;
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v10, :cond_5

    const-string/jumbo v10, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v10}, Lorg/apache/tools/ant/taskdefs/Tar;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    sput-object v10, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v8, v10}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-static {v10}, Lorg/apache/tools/ant/util/ResourceUtils;->asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v7

    .line 576
    .local v7, "r":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {v7}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v0

    .line 577
    .local v0, "base":Ljava/io/File;
    if-nez v0, :cond_3

    .line 578
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    .line 580
    :cond_3
    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 581
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Vector;

    .line 582
    .local v4, "files":Ljava/util/Vector;
    if-nez v4, :cond_4

    .line 583
    new-instance v4, Ljava/util/Vector;

    .end local v4    # "files":Ljava/util/Vector;
    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 584
    .restart local v4    # "files":Ljava/util/Vector;
    invoke-virtual {v1, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    :cond_4
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    if-ne v0, v10, :cond_6

    .line 587
    invoke-virtual {v7}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 574
    .end local v0    # "base":Ljava/io/File;
    .end local v4    # "files":Ljava/util/Vector;
    .end local v7    # "r":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_5
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 589
    .restart local v0    # "base":Ljava/io/File;
    .restart local v4    # "files":Ljava/util/Vector;
    .restart local v7    # "r":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_6
    invoke-virtual {v7}, Lorg/apache/tools/ant/types/resources/FileResource;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 592
    .end local v0    # "base":Ljava/io/File;
    .end local v4    # "files":Ljava/util/Vector;
    .end local v7    # "r":Lorg/apache/tools/ant/types/resources/FileResource;
    .end local v8    # "res":Lorg/apache/tools/ant/types/Resource;
    :cond_7
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 593
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 594
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 595
    .restart local v0    # "base":Ljava/io/File;
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Vector;

    .line 596
    .local v3, "f":Ljava/util/Vector;
    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v10

    new-array v10, v10, [Ljava/lang/String;

    invoke-virtual {v3, v10}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    .line 597
    .local v4, "files":[Ljava/lang/String;
    sget-object v10, Lorg/apache/tools/ant/taskdefs/Copy;->NULL_FILE_PLACEHOLDER:Ljava/io/File;

    if-ne v0, v10, :cond_8

    const/4 v0, 0x0

    .end local v0    # "base":Ljava/io/File;
    :cond_8
    invoke-virtual {p0, v0, v4}, Lorg/apache/tools/ant/taskdefs/Tar;->check(Ljava/io/File;[Ljava/lang/String;)Z

    move-result v10

    and-int/2addr v9, v10

    goto :goto_2

    .line 602
    .end local v1    # "basedirToFilesMap":Ljava/util/HashMap;
    .end local v2    # "basedirs":Ljava/util/HashSet;
    .end local v3    # "f":Ljava/util/Vector;
    .end local v4    # "files":[Ljava/lang/String;
    .end local v6    # "iter":Ljava/util/Iterator;
    :cond_9
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 603
    .restart local v6    # "iter":Ljava/util/Iterator;
    :goto_3
    if-eqz v9, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 604
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/Resource;

    .line 605
    .local v7, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/Tar;->archiveIsUpToDate(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v9

    goto :goto_3
.end method

.method public createTarFileSet()Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    .locals 2

    .prologue
    .line 124
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;-><init>()V

    .line 125
    .local v0, "fs":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 126
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 127
    return-object v0
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 229
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    if-nez v9, :cond_0

    .line 230
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "tarfile attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 234
    :cond_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_1

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 235
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "tarfile is a directory!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 239
    :cond_1
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_2

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->canWrite()Z

    move-result v9

    if-nez v9, :cond_2

    .line 240
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Can not write to the specified tarfile!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 244
    :cond_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Vector;

    .line 246
    .local v5, "savedFileSets":Ljava/util/Vector;
    :try_start_0
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->baseDir:Ljava/io/File;

    if-eqz v9, :cond_4

    .line 247
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->baseDir:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_3

    .line 248
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "basedir does not exist!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    :catchall_0
    move-exception v9

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    throw v9

    .line 253
    :cond_3
    :try_start_1
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v2, v9}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 254
    .local v2, "mainFileSet":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->baseDir:Ljava/io/File;

    invoke-virtual {v2, v9}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->setDir(Ljava/io/File;)V

    .line 255
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    invoke-virtual {v9, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 258
    .end local v2    # "mainFileSet":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    :cond_4
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-nez v9, :cond_5

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->resourceCollections:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->size()I

    move-result v9

    if-nez v9, :cond_5

    .line 259
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "You must supply either a basedir attribute or some nested resource collections."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 267
    :cond_5
    const/4 v8, 0x1

    .line 268
    .local v8, "upToDate":Z
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_6

    .line 269
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/Tar;->check(Lorg/apache/tools/ant/types/ResourceCollection;)Z

    move-result v9

    and-int/2addr v8, v9

    goto :goto_0

    .line 271
    :cond_6
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->resourceCollections:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 272
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 273
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/Tar;->check(Lorg/apache/tools/ant/types/ResourceCollection;)Z

    move-result v9

    and-int/2addr v8, v9

    goto :goto_1

    .line 276
    :cond_7
    if-eqz v8, :cond_8

    .line 277
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Nothing to do: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " is up to date."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x2

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/Tar;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 323
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    .line 325
    :goto_2
    return-void

    .line 282
    :cond_8
    :try_start_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 283
    .local v4, "parent":Ljava/io/File;
    if-eqz v4, :cond_9

    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-nez v9, :cond_9

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v9

    if-nez v9, :cond_9

    .line 284
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Failed to create missing parent directory for "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 288
    :cond_9
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Building tar: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x2

    invoke-virtual {p0, v9, v10}, Lorg/apache/tools/ant/taskdefs/Tar;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 290
    const/4 v6, 0x0

    .line 292
    .local v6, "tOut":Lorg/apache/tools/tar/TarOutputStream;
    :try_start_3
    new-instance v7, Lorg/apache/tools/tar/TarOutputStream;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->compression:Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;

    new-instance v10, Ljava/io/BufferedOutputStream;

    new-instance v11, Ljava/io/FileOutputStream;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-direct {v11, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v10, v11}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-static {v9, v10}, Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;->access$000(Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object v9

    invoke-direct {v7, v9}, Lorg/apache/tools/tar/TarOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 296
    .end local v6    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    .local v7, "tOut":Lorg/apache/tools/tar/TarOutputStream;
    const/4 v9, 0x1

    :try_start_4
    invoke-virtual {v7, v9}, Lorg/apache/tools/tar/TarOutputStream;->setDebug(Z)V

    .line 297
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->isTruncateMode()Z

    move-result v9

    if-eqz v9, :cond_a

    .line 298
    const/4 v9, 0x1

    invoke-virtual {v7, v9}, Lorg/apache/tools/tar/TarOutputStream;->setLongFileMode(I)V

    .line 307
    :goto_3
    const/4 v9, 0x0

    iput-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longWarningGiven:Z

    .line 308
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 309
    :goto_4
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_d

    .line 310
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    invoke-virtual {p0, v9, v7}, Lorg/apache/tools/ant/taskdefs/Tar;->tar(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/tar/TarOutputStream;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_4

    .line 316
    :catch_0
    move-exception v1

    move-object v6, v7

    .line 317
    .end local v7    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    .local v1, "ioe":Ljava/io/IOException;
    .restart local v6    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    :goto_5
    :try_start_5
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Problem creating TAR: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 318
    .local v3, "msg":Ljava/lang/String;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v9, v3, v1, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 320
    .end local v1    # "ioe":Ljava/io/IOException;
    .end local v3    # "msg":Ljava/lang/String;
    :catchall_1
    move-exception v9

    :goto_6
    :try_start_6
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 299
    .end local v6    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    .restart local v7    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    :cond_a
    :try_start_7
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->isFailMode()Z

    move-result v9

    if-nez v9, :cond_b

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->isOmitMode()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 301
    :cond_b
    const/4 v9, 0x0

    invoke-virtual {v7, v9}, Lorg/apache/tools/tar/TarOutputStream;->setLongFileMode(I)V

    goto :goto_3

    .line 320
    :catchall_2
    move-exception v9

    move-object v6, v7

    .end local v7    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    .restart local v6    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    goto :goto_6

    .line 304
    .end local v6    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    .restart local v7    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    :cond_c
    const/4 v9, 0x2

    invoke-virtual {v7, v9}, Lorg/apache/tools/tar/TarOutputStream;->setLongFileMode(I)V

    goto :goto_3

    .line 312
    :cond_d
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Tar;->resourceCollections:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 313
    :goto_7
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_e

    .line 314
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-virtual {p0, v9, v7}, Lorg/apache/tools/ant/taskdefs/Tar;->tar(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/tar/TarOutputStream;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_7

    .line 320
    :cond_e
    :try_start_8
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 323
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Tar;->filesets:Ljava/util/Vector;

    goto/16 :goto_2

    .line 316
    .end local v7    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    .restart local v6    # "tOut":Lorg/apache/tools/tar/TarOutputStream;
    :catch_1
    move-exception v1

    goto :goto_5
.end method

.method public setBasedir(Ljava/io/File;)V
    .locals 0
    .param p1, "baseDir"    # Ljava/io/File;

    .prologue
    .line 163
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->baseDir:Ljava/io/File;

    .line 164
    return-void
.end method

.method public setCompression(Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;)V
    .locals 0
    .param p1, "mode"    # Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;

    .prologue
    .line 221
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->compression:Lorg/apache/tools/ant/taskdefs/Tar$TarCompressionMethod;

    .line 222
    return-void
.end method

.method public setDestFile(Ljava/io/File;)V
    .locals 0
    .param p1, "destFile"    # Ljava/io/File;

    .prologue
    .line 155
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    .line 156
    return-void
.end method

.method public setLongfile(Ljava/lang/String;)V
    .locals 1
    .param p1, "mode"    # Ljava/lang/String;

    .prologue
    .line 186
    const-string/jumbo v0, "DEPRECATED - The setLongfile(String) method has been deprecated. Use setLongfile(Tar.TarLongFileMode) instead."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Tar;->log(Ljava/lang/String;)V

    .line 188
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    .line 189
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->setValue(Ljava/lang/String;)V

    .line 190
    return-void
.end method

.method public setLongfile(Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;)V
    .locals 0
    .param p1, "mode"    # Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    .prologue
    .line 207
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    .line 208
    return-void
.end method

.method public setTarfile(Ljava/io/File;)V
    .locals 0
    .param p1, "tarFile"    # Ljava/io/File;

    .prologue
    .line 146
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    .line 147
    return-void
.end method

.method protected supportsNonFileResources()Z
    .locals 2

    .prologue
    .line 544
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$taskdefs$Tar:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.Tar"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Tar;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$taskdefs$Tar:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$taskdefs$Tar:Ljava/lang/Class;

    goto :goto_0
.end method

.method protected tar(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/tar/TarOutputStream;)V
    .locals 12
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "tOut"    # Lorg/apache/tools/tar/TarOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 648
    const/4 v0, 0x0

    .line 649
    .local v0, "afs":Lorg/apache/tools/ant/types/ArchiveFileSet;
    instance-of v9, p1, Lorg/apache/tools/ant/types/ArchiveFileSet;

    if-eqz v9, :cond_0

    move-object v0, p1

    .line 650
    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    .line 652
    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ArchiveFileSet;->size()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_1

    .line 654
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "fullpath attribute may only be specified for filesets that specify a single file."

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 659
    :cond_1
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Tar;->asTarFileSet(Lorg/apache/tools/ant/types/ArchiveFileSet;)Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;

    move-result-object v8

    .line 661
    .local v8, "tfs":Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/Tar;->isFileFileSet(Lorg/apache/tools/ant/types/ResourceCollection;)Z

    move-result v9

    if-eqz v9, :cond_2

    move-object v3, p1

    .line 662
    check-cast v3, Lorg/apache/tools/ant/types/FileSet;

    .line 663
    .local v3, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Tar;->getFileNames(Lorg/apache/tools/ant/types/FileSet;)[Ljava/lang/String;

    move-result-object v2

    .line 664
    .local v2, "files":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v9, v2

    if-ge v4, v9, :cond_5

    .line 665
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v3, v9}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v9

    aget-object v10, v2, v4

    invoke-direct {v1, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 666
    .local v1, "f":Ljava/io/File;
    aget-object v9, v2, v4

    sget-char v10, Ljava/io/File;->separatorChar:C

    const/16 v11, 0x2f

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    .line 667
    .local v6, "name":Ljava/lang/String;
    invoke-virtual {p0, v1, p2, v6, v8}, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile(Ljava/io/File;Lorg/apache/tools/tar/TarOutputStream;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;)V

    .line 664
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 669
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "files":[Ljava/lang/String;
    .end local v3    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v4    # "i":I
    .end local v6    # "name":Ljava/lang/String;
    :cond_2
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v9

    if-eqz v9, :cond_4

    .line 670
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 671
    .local v5, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 672
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/Resource;

    .line 673
    .local v7, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v9, :cond_3

    const-string/jumbo v9, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/Tar;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v7, v9}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/resources/FileProvider;

    invoke-interface {v9}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    .line 674
    .restart local v1    # "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v1, p2, v9, v8}, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile(Ljava/io/File;Lorg/apache/tools/tar/TarOutputStream;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;)V

    goto :goto_1

    .line 673
    .end local v1    # "f":Ljava/io/File;
    :cond_3
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Tar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_2

    .line 677
    .end local v5    # "iter":Ljava/util/Iterator;
    .end local v7    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_4
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 678
    .restart local v5    # "iter":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 679
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/Resource;

    .line 680
    .restart local v7    # "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v7, p2, v9, v8}, Lorg/apache/tools/ant/taskdefs/Tar;->tarResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/tar/TarOutputStream;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;)V

    goto :goto_3

    .line 683
    .end local v5    # "iter":Ljava/util/Iterator;
    .end local v7    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_5
    return-void
.end method

.method protected tarFile(Ljava/io/File;Lorg/apache/tools/tar/TarOutputStream;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "tOut"    # Lorg/apache/tools/tar/TarOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "tarFileSet"    # Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 338
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar;->tarFile:Ljava/io/File;

    invoke-virtual {p1, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 351
    :goto_0
    return-void

    .line 350
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Tar;->tarResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/tar/TarOutputStream;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;)V

    goto :goto_0
.end method

.method protected tarResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/tar/TarOutputStream;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;)V
    .locals 16
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "tOut"    # Lorg/apache/tools/tar/TarOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "tarFileSet"    # Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 366
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v12

    if-nez v12, :cond_1

    .line 493
    :cond_0
    :goto_0
    return-void

    .line 370
    :cond_1
    const/4 v9, 0x0

    .line 372
    .local v9, "preserveLeadingSlashes":Z
    if-eqz p4, :cond_2

    .line 373
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v5

    .line 374
    .local v5, "fullpath":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_4

    .line 375
    move-object/from16 p3, v5

    .line 390
    :goto_1
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getPreserveLeadingSlashes()Z

    move-result v9

    .line 392
    const-string/jumbo v12, "/"

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    if-nez v9, :cond_2

    .line 393
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v7

    .line 394
    .local v7, "l":I
    const/4 v12, 0x1

    if-le v7, v12, :cond_0

    .line 398
    const/4 v12, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v12, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    .line 402
    .end local v5    # "fullpath":Ljava/lang/String;
    .end local v7    # "l":I
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v12

    if-eqz v12, :cond_3

    const-string/jumbo v12, "/"

    move-object/from16 v0, p3

    invoke-virtual {v0, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_3

    .line 403
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    .line 406
    :cond_3
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v12

    const/16 v13, 0x64

    if-lt v12, v13, :cond_7

    .line 407
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->isOmitMode()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 408
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Omitting: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Tar;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 378
    .restart local v5    # "fullpath":Ljava/lang/String;
    :cond_4
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_0

    .line 382
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v8

    .line 384
    .local v8, "prefix":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_5

    const-string/jumbo v12, "/"

    invoke-virtual {v8, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_5

    .line 385
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 387
    :cond_5
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    goto/16 :goto_1

    .line 410
    .end local v5    # "fullpath":Ljava/lang/String;
    .end local v8    # "prefix":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->isWarnMode()Z

    move-result v12

    if-eqz v12, :cond_9

    .line 411
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Entry: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " longer than "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const/16 v13, 0x64

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " characters."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Tar;->log(Ljava/lang/String;I)V

    .line 414
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/tools/ant/taskdefs/Tar;->longWarningGiven:Z

    if-nez v12, :cond_7

    .line 415
    const-string/jumbo v12, "Resulting tar file can only be processed successfully by GNU compatible tar commands"

    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Tar;->log(Ljava/lang/String;I)V

    .line 418
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lorg/apache/tools/ant/taskdefs/Tar;->longWarningGiven:Z

    .line 427
    :cond_7
    new-instance v10, Lorg/apache/tools/tar/TarEntry;

    move-object/from16 v0, p3

    invoke-direct {v10, v0, v9}, Lorg/apache/tools/tar/TarEntry;-><init>(Ljava/lang/String;Z)V

    .line 428
    .local v10, "te":Lorg/apache/tools/tar/TarEntry;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lorg/apache/tools/tar/TarEntry;->setModTime(J)V

    .line 430
    move-object/from16 v0, p1

    instance-of v12, v0, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    if-eqz v12, :cond_8

    move-object/from16 v2, p1

    .line 431
    check-cast v2, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    .line 432
    .local v2, "ar":Lorg/apache/tools/ant/types/resources/ArchiveResource;
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getMode()I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setMode(I)V

    .line 433
    move-object/from16 v0, p1

    instance-of v12, v0, Lorg/apache/tools/ant/types/resources/TarResource;

    if-eqz v12, :cond_8

    move-object/from16 v11, p1

    .line 434
    check-cast v11, Lorg/apache/tools/ant/types/resources/TarResource;

    .line 435
    .local v11, "tr":Lorg/apache/tools/ant/types/resources/TarResource;
    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/TarResource;->getUserName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setUserName(Ljava/lang/String;)V

    .line 436
    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/TarResource;->getUid()I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setUserId(I)V

    .line 437
    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/TarResource;->getGroup()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setGroupName(Ljava/lang/String;)V

    .line 438
    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/TarResource;->getGid()I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setGroupId(I)V

    .line 442
    .end local v2    # "ar":Lorg/apache/tools/ant/types/resources/ArchiveResource;
    .end local v11    # "tr":Lorg/apache/tools/ant/types/resources/TarResource;
    :cond_8
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_12

    .line 443
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->size()I

    move-result v12

    int-to-long v12, v12

    const-wide v14, 0x1ffffffffL

    cmp-long v12, v12, v14

    if-lez v12, :cond_a

    .line 444
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Resource: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " larger than "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-wide v14, 0x1ffffffffL

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " bytes."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 420
    .end local v10    # "te":Lorg/apache/tools/tar/TarEntry;
    :cond_9
    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/Tar;->longFileMode:Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;

    invoke-virtual {v12}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->isFailMode()Z

    move-result v12

    if-eqz v12, :cond_7

    .line 421
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Entry: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " longer than "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const/16 v14, 0x64

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, "characters."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v12

    .line 448
    .restart local v10    # "te":Lorg/apache/tools/tar/TarEntry;
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v12

    invoke-virtual {v10, v12, v13}, Lorg/apache/tools/tar/TarEntry;->setSize(J)V

    .line 450
    if-eqz p4, :cond_b

    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->hasFileModeBeenSet()Z

    move-result v12

    if-eqz v12, :cond_b

    .line 451
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getMode()I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setMode(I)V

    .line 458
    :cond_b
    :goto_2
    if-eqz p4, :cond_f

    .line 460
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->hasUserNameBeenSet()Z

    move-result v12

    if-eqz v12, :cond_c

    .line 461
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getUserName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setUserName(Ljava/lang/String;)V

    .line 463
    :cond_c
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->hasGroupBeenSet()Z

    move-result v12

    if-eqz v12, :cond_d

    .line 464
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getGroup()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setGroupName(Ljava/lang/String;)V

    .line 466
    :cond_d
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->hasUserIdBeenSet()Z

    move-result v12

    if-eqz v12, :cond_e

    .line 467
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getUid()I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setUserId(I)V

    .line 469
    :cond_e
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->hasGroupIdBeenSet()Z

    move-result v12

    if-eqz v12, :cond_f

    .line 470
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getGid()I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setGroupId(I)V

    .line 474
    :cond_f
    const/4 v6, 0x0

    .line 476
    .local v6, "in":Ljava/io/InputStream;
    :try_start_0
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/apache/tools/tar/TarOutputStream;->putNextEntry(Lorg/apache/tools/tar/TarEntry;)V

    .line 478
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v12

    if-nez v12, :cond_11

    .line 479
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    .line 481
    const/16 v12, 0x2000

    new-array v3, v12, [B

    .line 482
    .local v3, "buffer":[B
    const/4 v4, 0x0

    .line 484
    .local v4, "count":I
    :cond_10
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v12, v4}, Lorg/apache/tools/tar/TarOutputStream;->write([BII)V

    .line 485
    const/4 v12, 0x0

    array-length v13, v3

    invoke-virtual {v6, v3, v12, v13}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 486
    const/4 v12, -0x1

    if-ne v4, v12, :cond_10

    .line 489
    .end local v3    # "buffer":[B
    .end local v4    # "count":I
    :cond_11
    invoke-virtual/range {p2 .. p2}, Lorg/apache/tools/tar/TarOutputStream;->closeEntry()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 491
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_0

    .line 453
    .end local v6    # "in":Ljava/io/InputStream;
    :cond_12
    if-eqz p4, :cond_b

    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->hasDirModeBeenSet()Z

    move-result v12

    if-eqz v12, :cond_b

    .line 455
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Tar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    move-object/from16 v0, p4

    invoke-virtual {v0, v12}, Lorg/apache/tools/ant/taskdefs/Tar$TarFileSet;->getDirMode(Lorg/apache/tools/ant/Project;)I

    move-result v12

    invoke-virtual {v10, v12}, Lorg/apache/tools/tar/TarEntry;->setMode(I)V

    goto :goto_2

    .line 491
    .restart local v6    # "in":Ljava/io/InputStream;
    :catchall_0
    move-exception v12

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v12
.end method
