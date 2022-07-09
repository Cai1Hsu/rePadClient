.class public Lorg/apache/tools/ant/DirectoryScanner;
.super Ljava/lang/Object;
.source "DirectoryScanner.java"

# interfaces
.implements Lorg/apache/tools/ant/FileScanner;
.implements Lorg/apache/tools/ant/types/selectors/SelectorScanner;
.implements Lorg/apache/tools/ant/types/ResourceFactory;


# static fields
.field protected static final DEFAULTEXCLUDES:[Ljava/lang/String;

.field public static final DOES_NOT_EXIST_POSTFIX:Ljava/lang/String; = " does not exist."

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final MAX_LEVELS_OF_SYMLINKS:I = 0x5

.field private static final ON_VMS:Z

.field private static final SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

.field private static final defaultExcludes:Ljava/util/Set;


# instance fields
.field private areNonPatternSetsReady:Z

.field protected basedir:Ljava/io/File;

.field protected dirsDeselected:Ljava/util/Vector;

.field protected dirsExcluded:Ljava/util/Vector;

.field protected dirsIncluded:Ljava/util/Vector;

.field protected dirsNotIncluded:Ljava/util/Vector;

.field protected errorOnMissingDir:Z

.field protected everythingIncluded:Z

.field private excludeNonPatterns:Ljava/util/Map;

.field private excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

.field protected excludes:[Ljava/lang/String;

.field protected filesDeselected:Ljava/util/Vector;

.field protected filesExcluded:Ljava/util/Vector;

.field protected filesIncluded:Ljava/util/Vector;

.field protected filesNotIncluded:Ljava/util/Vector;

.field private followSymlinks:Z

.field protected haveSlowResults:Z

.field private illegal:Ljava/lang/IllegalStateException;

.field private includeNonPatterns:Ljava/util/Map;

.field private includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

.field protected includes:[Ljava/lang/String;

.field protected isCaseSensitive:Z

.field private maxLevelsOfSymlinks:I

.field private notFollowedSymlinks:Ljava/util/Set;

.field private scanLock:Ljava/lang/Object;

.field private scannedDirs:Ljava/util/Set;

.field private scanning:Z

.field protected selectors:[Lorg/apache/tools/ant/types/selectors/FileSelector;

.field private slowScanLock:Ljava/lang/Object;

.field private slowScanning:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 134
    const-string/jumbo v0, "openvms"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/apache/tools/ant/DirectoryScanner;->ON_VMS:Z

    .line 148
    const/16 v0, 0x1c

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "**/*~"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "**/#*#"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "**/.#*"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "**/%*%"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "**/._*"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "**/CVS"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "**/CVS/**"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "**/.cvsignore"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "**/SCCS"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "**/SCCS/**"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "**/vssver.scc"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "**/.svn"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "**/.svn/**"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "**/.git"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "**/.git/**"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "**/.gitattributes"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "**/.gitignore"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string/jumbo v2, "**/.gitmodules"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string/jumbo v2, "**/.hg"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string/jumbo v2, "**/.hg/**"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string/jumbo v2, "**/.hgignore"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string/jumbo v2, "**/.hgsub"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string/jumbo v2, "**/.hgsubstate"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string/jumbo v2, "**/.hgtags"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string/jumbo v2, "**/.bzr"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string/jumbo v2, "**/.bzr/**"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string/jumbo v2, "**/.bzrignore"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string/jumbo v2, "**/.DS_Store"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/DirectoryScanner;->DEFAULTEXCLUDES:[Ljava/lang/String;

    .line 208
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/DirectoryScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 211
    invoke-static {}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->getSymbolicLinkUtils()Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/DirectoryScanner;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    .line 219
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    .line 221
    invoke-static {}, Lorg/apache/tools/ant/DirectoryScanner;->resetDefaultExcludes()V

    .line 222
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 430
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 236
    iput-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->selectors:[Lorg/apache/tools/ant/types/selectors/FileSelector;

    .line 281
    iput-boolean v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->haveSlowResults:Z

    .line 287
    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive:Z

    .line 293
    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->errorOnMissingDir:Z

    .line 300
    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z

    .line 303
    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z

    .line 312
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->scannedDirs:Ljava/util/Set;

    .line 329
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    .line 346
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludeNonPatterns:Ljava/util/Map;

    .line 372
    iput-boolean v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->areNonPatternSetsReady:Z

    .line 379
    iput-boolean v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    .line 386
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    .line 393
    iput-boolean v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanning:Z

    .line 400
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    .line 407
    iput-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    .line 415
    const/4 v0, 0x5

    iput v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->maxLevelsOfSymlinks:I

    .line 425
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    .line 431
    return-void
.end method

.method private accountForIncludedDir(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Z)V
    .locals 6
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "fast"    # Z

    .prologue
    .line 1321
    iget-object v3, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsDeselected:Ljava/util/Vector;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/DirectoryScanner;->processIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;)V

    .line 1322
    if-eqz p3, :cond_0

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->contentsExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1323
    invoke-direct {p0, p2, p1, p3}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)V

    .line 1325
    :cond_0
    return-void
.end method

.method private accountForIncludedDir(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Z[Ljava/lang/String;Ljava/util/LinkedList;)V
    .locals 6
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "fast"    # Z
    .param p4, "children"    # [Ljava/lang/String;
    .param p5, "directoryNamesFollowed"    # Ljava/util/LinkedList;

    .prologue
    .line 1331
    iget-object v3, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsDeselected:Ljava/util/Vector;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/DirectoryScanner;->processIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;)V

    .line 1332
    if-eqz p3, :cond_0

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->contentsExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    if-nez v0, :cond_0

    move-object v0, p0

    move-object v1, p2

    move-object v2, p1

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 1333
    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z[Ljava/lang/String;Ljava/util/LinkedList;)V

    .line 1335
    :cond_0
    return-void
.end method

.method private accountForIncludedFile(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;)V
    .locals 6
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 1308
    iget-object v3, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesExcluded:Ljava/util/Vector;

    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesDeselected:Ljava/util/Vector;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/DirectoryScanner;->processIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;)V

    .line 1310
    return-void
.end method

.method public static addDefaultExclude(Ljava/lang/String;)Z
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 577
    sget-object v1, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    monitor-enter v1

    .line 578
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 579
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private causesIllegalSymlinkLoop(Ljava/lang/String;Ljava/io/File;Ljava/util/LinkedList;)Z
    .locals 9
    .param p1, "dirName"    # Ljava/lang/String;
    .param p2, "parent"    # Ljava/io/File;
    .param p3, "directoryNamesFollowed"    # Ljava/util/LinkedList;

    .prologue
    .line 1858
    :try_start_0
    invoke-virtual {p3}, Ljava/util/LinkedList;->size()I

    move-result v7

    iget v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->maxLevelsOfSymlinks:I

    if-lt v7, v8, :cond_1

    invoke-static {p3, p1}, Lorg/apache/tools/ant/util/CollectionUtils;->frequency(Ljava/util/Collection;Ljava/lang/Object;)I

    move-result v7

    iget v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->maxLevelsOfSymlinks:I

    if-lt v7, v8, :cond_1

    sget-object v7, Lorg/apache/tools/ant/DirectoryScanner;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    invoke-virtual {v7, p2, p1}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/io/File;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1863
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 1864
    .local v3, "files":Ljava/util/ArrayList;
    sget-object v7, Lorg/apache/tools/ant/DirectoryScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v7, p2, p1}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 1865
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v6

    .line 1866
    .local v6, "target":Ljava/lang/String;
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1868
    const-string/jumbo v5, ""

    .line 1869
    .local v5, "relPath":Ljava/lang/String;
    invoke-virtual {p3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 1870
    .local v4, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1871
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "../"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1872
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1873
    .local v0, "dir":Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1874
    sget-object v7, Lorg/apache/tools/ant/DirectoryScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, p2, v8}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 1875
    invoke-virtual {v2}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1876
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    iget v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->maxLevelsOfSymlinks:I

    if-le v7, v8, :cond_0

    invoke-static {v3, v6}, Lorg/apache/tools/ant/util/CollectionUtils;->frequency(Ljava/util/Collection;Ljava/lang/Object;)I

    move-result v7

    iget v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->maxLevelsOfSymlinks:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-le v7, v8, :cond_0

    .line 1879
    const/4 v7, 0x1

    .line 1885
    .end local v0    # "dir":Ljava/lang/String;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "files":Ljava/util/ArrayList;
    .end local v4    # "i":Ljava/util/Iterator;
    .end local v5    # "relPath":Ljava/lang/String;
    .end local v6    # "target":Ljava/lang/String;
    :goto_0
    return v7

    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 1886
    :catch_0
    move-exception v1

    .line 1887
    .local v1, "ex":Ljava/io/IOException;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Caught error while checking for symbolic links"

    invoke-direct {v7, v8, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method

.method private checkIncludePatterns()V
    .locals 22

    .prologue
    .line 931
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/DirectoryScanner;->ensureNonPatternSetsReady()V

    .line 932
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    .line 936
    .local v15, "newroots":Ljava/util/Map;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v10, v0, :cond_1

    .line 937
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-object/from16 v19, v0

    aget-object v19, v19, v10

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->toString()Ljava/lang/String;

    move-result-object v18

    .line 938
    .local v18, "pattern":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->shouldSkipPattern(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 939
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-object/from16 v19, v0

    aget-object v19, v19, v10

    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->rtrimWildcardTokens()Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-interface {v15, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 936
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 943
    .end local v18    # "pattern":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 944
    .local v13, "iter":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_3

    .line 945
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 946
    .local v7, "entry":Ljava/util/Map$Entry;
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 947
    .restart local v18    # "pattern":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->shouldSkipPattern(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2

    .line 948
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-interface {v15, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 952
    .end local v7    # "entry":Ljava/util/Map$Entry;
    .end local v18    # "pattern":Ljava/lang/String;
    :cond_3
    sget-object v19, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->EMPTY_PATH:Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    move-object/from16 v0, v19

    invoke-interface {v15, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    if-eqz v19, :cond_5

    .line 955
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    const-string/jumbo v20, ""

    const/16 v21, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Ljava/lang/String;Z)V

    .line 1044
    :cond_4
    return-void

    .line 959
    :cond_5
    invoke-interface {v15}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 961
    .local v12, "it":Ljava/util/Iterator;
    const/4 v4, 0x0

    .line 962
    .local v4, "canonBase":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    if-eqz v19, :cond_6

    .line 964
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 969
    :cond_6
    :goto_2
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_4

    .line 970
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 971
    .restart local v7    # "entry":Ljava/util/Map$Entry;
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .line 972
    .local v5, "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v6

    .line 973
    .local v6, "currentelement":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_7

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 977
    :cond_7
    new-instance v14, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v14, v0, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 979
    .local v14, "myfile":Ljava/io/File;
    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_9

    .line 984
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_c

    invoke-virtual {v14}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v17

    .line 988
    .local v17, "path":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    sget-boolean v19, Lorg/apache/tools/ant/DirectoryScanner;->ON_VMS:Z

    if-eqz v19, :cond_9

    .line 989
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->findFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v14

    .line 990
    if-eqz v14, :cond_9

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    if-eqz v19, :cond_9

    .line 991
    sget-object v19, Lorg/apache/tools/ant/DirectoryScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v14}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    .line 993
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_9

    .line 995
    new-instance v5, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .end local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    invoke-direct {v5, v6}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1005
    .end local v17    # "path":Ljava/lang/String;
    .restart local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    :cond_9
    if-eqz v14, :cond_a

    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_b

    :cond_a
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v19

    if-nez v19, :cond_b

    .line 1006
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->findFile(Ljava/io/File;Z)Ljava/io/File;

    move-result-object v9

    .line 1007
    .local v9, "f":Ljava/io/File;
    if-eqz v9, :cond_b

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_b

    .line 1010
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    if-nez v19, :cond_d

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    .line 1013
    :goto_4
    move-object v14, v9

    .line 1014
    new-instance v5, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .end local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    invoke-direct {v5, v6}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    .line 1018
    .end local v9    # "f":Ljava/io/File;
    .restart local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    :cond_b
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 1019
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z

    move/from16 v19, v0

    if-nez v19, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->isSymlink(Ljava/io/File;)Z

    move-result v19

    if-eqz v19, :cond_e

    .line 1020
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/apache/tools/ant/DirectoryScanner;->isExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v19

    if-nez v19, :cond_6

    .line 1021
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    move-object/from16 v19, v0

    invoke-virtual {v14}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v19 .. v20}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 965
    .end local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .end local v6    # "currentelement":Ljava/lang/String;
    .end local v7    # "entry":Ljava/util/Map$Entry;
    .end local v14    # "myfile":Ljava/io/File;
    :catch_0
    move-exception v8

    .line 966
    .local v8, "ex":Ljava/io/IOException;
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v19

    .line 984
    .end local v8    # "ex":Ljava/io/IOException;
    .restart local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .restart local v6    # "currentelement":Ljava/lang/String;
    .restart local v7    # "entry":Ljava/util/Map$Entry;
    .restart local v14    # "myfile":Ljava/io/File;
    :cond_c
    :try_start_2
    sget-object v19, Lorg/apache/tools/ant/DirectoryScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v14}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v4, v1}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v17

    goto/16 :goto_3

    .line 1000
    .end local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    :catch_1
    move-exception v8

    .line 1001
    .restart local v8    # "ex":Ljava/io/IOException;
    new-instance v19, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v19

    .line 1010
    .end local v8    # "ex":Ljava/io/IOException;
    .restart local v5    # "currentPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .restart local v9    # "f":Ljava/io/File;
    :cond_d
    sget-object v19, Lorg/apache/tools/ant/DirectoryScanner;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v9}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v6

    goto :goto_4

    .line 1025
    .end local v9    # "f":Ljava/io/File;
    :cond_e
    invoke-virtual {v14}, Ljava/io/File;->isDirectory()Z

    move-result v19

    if-eqz v19, :cond_10

    .line 1026
    move-object/from16 v0, p0

    invoke-direct {v0, v5}, Lorg/apache/tools/ant/DirectoryScanner;->isIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v19

    if-eqz v19, :cond_f

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v19

    if-lez v19, :cond_f

    .line 1028
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v5, v14, v1}, Lorg/apache/tools/ant/DirectoryScanner;->accountForIncludedDir(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Z)V

    goto/16 :goto_2

    .line 1030
    :cond_f
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-direct {v0, v14, v5, v1}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)V

    goto/16 :goto_2

    .line 1033
    :cond_10
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 1034
    .local v16, "originalpattern":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v19

    if-eqz v19, :cond_11

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    .line 1037
    .local v11, "included":Z
    :goto_5
    if-eqz v11, :cond_6

    .line 1038
    move-object/from16 v0, p0

    invoke-direct {v0, v5, v14}, Lorg/apache/tools/ant/DirectoryScanner;->accountForIncludedFile(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;)V

    goto/16 :goto_2

    .line 1034
    .end local v11    # "included":Z
    :cond_11
    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    goto :goto_5
.end method

.method private declared-synchronized clearCaches()V
    .locals 1

    .prologue
    .line 1801
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1802
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludeNonPatterns:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1803
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .line 1804
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .line 1805
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->areNonPatternSetsReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1806
    monitor-exit p0

    return-void

    .line 1801
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z
    .locals 4
    .param p1, "tokenizedName"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .prologue
    const/4 v3, 0x1

    .line 1414
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 1415
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v2, v2, v0

    invoke-direct {p0, p1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Lorg/apache/tools/ant/types/selectors/TokenizedPattern;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v3

    .line 1426
    :goto_1
    return v2

    .line 1414
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1419
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1420
    .local v1, "iter":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1421
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toPattern()Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-result-object v2

    invoke-direct {p0, p1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Lorg/apache/tools/ant/types/selectors/TokenizedPattern;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v3

    .line 1423
    goto :goto_1

    .line 1426
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Lorg/apache/tools/ant/types/selectors/TokenizedPattern;)Z
    .locals 1
    .param p1, "tokenizedName"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "tokenizedInclude"    # Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .prologue
    .line 1439
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v0

    invoke-virtual {p2, p1, v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->matchStartOf(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/DirectoryScanner;->isMorePowerfulThanExcludes(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p2, p1}, Lorg/apache/tools/ant/DirectoryScanner;->isDeeper(Lorg/apache/tools/ant/types/selectors/TokenizedPattern;Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private fillNonPatternSet(Ljava/util/Map;[Ljava/lang/String;)[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;
    .locals 5
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "patterns"    # [Ljava/lang/String;

    .prologue
    .line 1831
    new-instance v0, Ljava/util/ArrayList;

    array-length v3, p2

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1832
    .local v0, "al":Ljava/util/ArrayList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_2

    .line 1833
    aget-object v3, p2, v1

    invoke-static {v3}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->hasWildcards(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1834
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v3

    if-eqz v3, :cond_0

    aget-object v2, p2, v1

    .line 1836
    .local v2, "s":Ljava/lang/String;
    :goto_1
    new-instance v3, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {v3, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1832
    .end local v2    # "s":Ljava/lang/String;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1834
    :cond_0
    aget-object v3, p2, v1

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1838
    :cond_1
    new-instance v3, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v4, p2, v1

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 1841
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    return-object v3
.end method

.method public static getDefaultExcludes()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 560
    sget-object v1, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    monitor-enter v1

    .line 561
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    sget-object v2, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    monitor-exit v1

    return-object v0

    .line 563
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private hasBeenScanned(Ljava/lang/String;)Z
    .locals 1
    .param p1, "vpath"    # Ljava/lang/String;

    .prologue
    .line 1783
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->scannedDirs:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isDeeper(Lorg/apache/tools/ant/types/selectors/TokenizedPattern;Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z
    .locals 2
    .param p1, "pattern"    # Lorg/apache/tools/ant/types/selectors/TokenizedPattern;
    .param p2, "name"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .prologue
    .line 1453
    const-string/jumbo v0, "**"

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->containsPattern(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->depth()I

    move-result v0

    invoke-virtual {p2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->depth()I

    move-result v1

    if-le v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z
    .locals 4
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .prologue
    const/4 v1, 0x1

    .line 1521
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->ensureNonPatternSetsReady()V

    .line 1523
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludeNonPatterns:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1533
    :cond_0
    :goto_0
    return v1

    .line 1523
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludeNonPatterns:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1528
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 1529
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v2, v2, v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v3

    invoke-virtual {v2, p1, v3}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->matchPath(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1528
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1533
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z
    .locals 4
    .param p1, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .prologue
    const/4 v1, 0x1

    .line 1378
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->ensureNonPatternSetsReady()V

    .line 1380
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1390
    :cond_0
    :goto_0
    return v1

    .line 1380
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1385
    :cond_2
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 1386
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v2, v2, v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v3

    invoke-virtual {v2, p1, v3}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->matchPath(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1385
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1390
    :cond_3
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isMorePowerfulThanExcludes(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1474
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "**"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1476
    .local v1, "soughtexclude":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 1477
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1478
    const/4 v2, 0x0

    .line 1481
    :goto_1
    return v2

    .line 1476
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1481
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static match(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 524
    invoke-static {p0, p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected static match(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 546
    invoke-static {p0, p1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected static matchPath(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 488
    invoke-static {p0, p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected static matchPath(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 506
    invoke-static {p0, p1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method protected static matchPatternStart(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 450
    invoke-static {p0, p1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPatternStart(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected static matchPatternStart(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 1
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "isCaseSensitive"    # Z

    .prologue
    .line 473
    invoke-static {p0, p1, p2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPatternStart(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static normalizePattern(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "p"    # Ljava/lang/String;

    .prologue
    .line 797
    const/16 v1, 0x2f

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5c

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 799
    .local v0, "pattern":Ljava/lang/String;
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 800
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "**"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 802
    :cond_0
    return-object v0
.end method

.method private processIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Ljava/util/Vector;Ljava/util/Vector;Ljava/util/Vector;)V
    .locals 3
    .param p1, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "inc"    # Ljava/util/Vector;
    .param p4, "exc"    # Ljava/util/Vector;
    .param p5, "des"    # Ljava/util/Vector;

    .prologue
    .line 1340
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1341
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p3, v1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p4, v1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p5, v1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1355
    :cond_0
    :goto_0
    return-void

    .line 1345
    :cond_1
    const/4 v0, 0x0

    .line 1346
    .local v0, "included":Z
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->isExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1347
    invoke-virtual {p4, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 1354
    :goto_1
    iget-boolean v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z

    and-int/2addr v2, v0

    iput-boolean v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z

    goto :goto_0

    .line 1348
    :cond_2
    invoke-virtual {p0, v1, p2}, Lorg/apache/tools/ant/DirectoryScanner;->isSelected(Ljava/lang/String;Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1349
    const/4 v0, 0x1

    .line 1350
    invoke-virtual {p3, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1352
    :cond_3
    invoke-virtual {p5, v1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private processSlowScan([Ljava/lang/String;)V
    .locals 5
    .param p1, "arr"    # [Ljava/lang/String;

    .prologue
    .line 1144
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_2

    .line 1145
    new-instance v1, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    aget-object v2, p1, v0

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    .line 1146
    .local v1, "path":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->contentsExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1147
    :cond_0
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    aget-object v4, p1, v0

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-direct {p0, v2, v1, v3}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)V

    .line 1144
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1150
    .end local v1    # "path":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    :cond_2
    return-void
.end method

.method public static removeDefaultExclude(Ljava/lang/String;)Z
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 594
    sget-object v1, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    monitor-enter v1

    .line 595
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    monitor-exit v1

    return v0

    .line 596
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static resetDefaultExcludes()V
    .locals 4

    .prologue
    .line 605
    sget-object v2, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    monitor-enter v2

    .line 606
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    .line 607
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/DirectoryScanner;->DEFAULTEXCLUDES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 608
    sget-object v1, Lorg/apache/tools/ant/DirectoryScanner;->defaultExcludes:Ljava/util/Set;

    sget-object v3, Lorg/apache/tools/ant/DirectoryScanner;->DEFAULTEXCLUDES:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 607
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 610
    :cond_0
    monitor-exit v2

    .line 611
    return-void

    .line 610
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)V
    .locals 6
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p3, "fast"    # Z

    .prologue
    .line 1197
    if-nez p1, :cond_0

    .line 1198
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "dir must not be null."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1200
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 1201
    .local v4, "newfiles":[Ljava/lang/String;
    if-nez v4, :cond_3

    .line 1202
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1203
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1204
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1205
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is not a directory."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1207
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "IO error scanning directory \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1211
    :cond_3
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z[Ljava/lang/String;Ljava/util/LinkedList;)V

    .line 1212
    return-void
.end method

.method private scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z[Ljava/lang/String;Ljava/util/LinkedList;)V
    .locals 20
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .param p3, "fast"    # Z
    .param p4, "newfiles"    # [Ljava/lang/String;
    .param p5, "directoryNamesFollowed"    # Ljava/util/LinkedList;

    .prologue
    .line 1216
    invoke-virtual/range {p2 .. p2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->toString()Ljava/lang/String;

    move-result-object v19

    .line 1217
    .local v19, "vpath":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1218
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    .line 1222
    :cond_0
    if-eqz p3, :cond_2

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->hasBeenScanned(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1300
    :cond_1
    :goto_0
    return-void

    .line 1225
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z

    if-nez v3, :cond_9

    .line 1226
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 1227
    .local v18, "noLinks":Ljava/util/ArrayList;
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_1
    move-object/from16 v0, p4

    array-length v3, v0

    if-ge v14, v3, :cond_6

    .line 1229
    :try_start_0
    sget-object v3, Lorg/apache/tools/ant/DirectoryScanner;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    aget-object v6, p4, v14

    move-object/from16 v0, p1

    invoke-virtual {v3, v0, v6}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/io/File;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1230
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v6, p4, v14

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1231
    .local v17, "name":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    aget-object v3, p4, v14

    move-object/from16 v0, p1

    invoke-direct {v5, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1232
    .local v5, "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_4

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    :goto_2
    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1234
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->isExcluded(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1235
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1227
    .end local v5    # "file":Ljava/io/File;
    .end local v17    # "name":Ljava/lang/String;
    :cond_3
    :goto_3
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 1232
    .restart local v5    # "file":Ljava/io/File;
    .restart local v17    # "name":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->filesExcluded:Ljava/util/Vector;

    goto :goto_2

    .line 1238
    .end local v5    # "file":Ljava/io/File;
    .end local v17    # "name":Ljava/lang/String;
    :cond_5
    aget-object v3, p4, v14

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    .line 1240
    :catch_0
    move-exception v15

    .line 1241
    .local v15, "ioe":Ljava/io/IOException;
    const-string/jumbo v16, "IOException caught while checking for links, couldn\'t get canonical path!"

    .line 1244
    .local v16, "msg":Ljava/lang/String;
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1245
    aget-object v3, p4, v14

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 1248
    .end local v15    # "ioe":Ljava/io/IOException;
    .end local v16    # "msg":Ljava/lang/String;
    :cond_6
    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p4

    .end local p4    # "newfiles":[Ljava/lang/String;
    check-cast p4, [Ljava/lang/String;

    .line 1253
    .end local v14    # "i":I
    .end local v18    # "noLinks":Ljava/util/ArrayList;
    .restart local p4    # "newfiles":[Ljava/lang/String;
    :goto_4
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_5
    move-object/from16 v0, p4

    array-length v3, v0

    if-ge v14, v3, :cond_f

    .line 1254
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v6, p4, v14

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1255
    .restart local v17    # "name":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    aget-object v3, p4, v14

    move-object/from16 v0, p2

    invoke-direct {v4, v0, v3}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/lang/String;)V

    .line 1256
    .local v4, "newPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    new-instance v5, Ljava/io/File;

    aget-object v3, p4, v14

    move-object/from16 v0, p1

    invoke-direct {v5, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1257
    .restart local v5    # "file":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v7

    .line 1258
    .local v7, "children":[Ljava/lang/String;
    if-eqz v7, :cond_7

    array-length v3, v7

    if-nez v3, :cond_b

    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 1259
    :cond_7
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/DirectoryScanner;->isIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1260
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v5}, Lorg/apache/tools/ant/DirectoryScanner;->accountForIncludedFile(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;)V

    .line 1253
    :cond_8
    :goto_6
    add-int/lit8 v14, v14, 0x1

    goto :goto_5

    .line 1250
    .end local v4    # "newPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .end local v5    # "file":Ljava/io/File;
    .end local v7    # "children":[Ljava/lang/String;
    .end local v14    # "i":I
    .end local v17    # "name":Ljava/lang/String;
    :cond_9
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p5

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_4

    .line 1262
    .restart local v4    # "newPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .restart local v5    # "file":Ljava/io/File;
    .restart local v7    # "children":[Ljava/lang/String;
    .restart local v14    # "i":I
    .restart local v17    # "name":Ljava/lang/String;
    :cond_a
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z

    .line 1263
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->filesNotIncluded:Ljava/util/Vector;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_6

    .line 1267
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z

    if-eqz v3, :cond_c

    aget-object v3, p4, v14

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p5

    invoke-direct {v0, v3, v1, v2}, Lorg/apache/tools/ant/DirectoryScanner;->causesIllegalSymlinkLoop(Ljava/lang/String;Ljava/io/File;Ljava/util/LinkedList;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 1271
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "skipping symbolic link "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v8, " -- too many levels of symbolic"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v8, " links."

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1275
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 1279
    :cond_c
    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/DirectoryScanner;->isIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v3

    if-eqz v3, :cond_e

    move-object/from16 v3, p0

    move/from16 v6, p3

    move-object/from16 v8, p5

    .line 1280
    invoke-direct/range {v3 .. v8}, Lorg/apache/tools/ant/DirectoryScanner;->accountForIncludedDir(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Ljava/io/File;Z[Ljava/lang/String;Ljava/util/LinkedList;)V

    .line 1291
    :cond_d
    :goto_7
    if-nez p3, :cond_8

    move-object/from16 v8, p0

    move-object v9, v5

    move-object v10, v4

    move/from16 v11, p3

    move-object v12, v7

    move-object/from16 v13, p5

    .line 1292
    invoke-direct/range {v8 .. v13}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z[Ljava/lang/String;Ljava/util/LinkedList;)V

    goto/16 :goto_6

    .line 1283
    :cond_e
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z

    .line 1284
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1285
    if-eqz p3, :cond_d

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v3

    if-eqz v3, :cond_d

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/DirectoryScanner;->contentsExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v3

    if-nez v3, :cond_d

    move-object/from16 v8, p0

    move-object v9, v5

    move-object v10, v4

    move/from16 v11, p3

    move-object v12, v7

    move-object/from16 v13, p5

    .line 1287
    invoke-direct/range {v8 .. v13}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z[Ljava/lang/String;Ljava/util/LinkedList;)V

    goto :goto_7

    .line 1297
    .end local v4    # "newPath":Lorg/apache/tools/ant/types/selectors/TokenizedPath;
    .end local v5    # "file":Ljava/io/File;
    .end local v7    # "children":[Ljava/lang/String;
    .end local v17    # "name":Ljava/lang/String;
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z

    if-eqz v3, :cond_1

    .line 1298
    invoke-virtual/range {p5 .. p5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto/16 :goto_0
.end method

.method private shouldSkipPattern(Ljava/lang/String;)Z
    .locals 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 1053
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->isAbsolutePath(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1055
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v2

    invoke-static {p1, v1, v2}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPatternStart(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1065
    :cond_0
    :goto_0
    return v0

    .line 1061
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 1065
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized addDefaultExcludes()V
    .locals 8

    .prologue
    const/4 v1, 0x0

    .line 1748
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    if-nez v4, :cond_1

    .line 1750
    .local v1, "excludesLength":I
    :goto_0
    invoke-static {}, Lorg/apache/tools/ant/DirectoryScanner;->getDefaultExcludes()[Ljava/lang/String;

    move-result-object v0

    .line 1751
    .local v0, "defaultExcludesTemp":[Ljava/lang/String;
    array-length v4, v0

    add-int/2addr v4, v1

    new-array v3, v4, [Ljava/lang/String;

    .line 1752
    .local v3, "newExcludes":[Ljava/lang/String;
    if-lez v1, :cond_0

    .line 1753
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v4, v5, v3, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1755
    :cond_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v4, v0

    if-ge v2, v4, :cond_2

    .line 1756
    add-int v4, v2, v1

    aget-object v5, v0, v2

    const/16 v6, 0x2f

    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x5c

    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 1755
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1748
    .end local v0    # "defaultExcludesTemp":[Ljava/lang/String;
    .end local v1    # "excludesLength":I
    .end local v2    # "i":I
    .end local v3    # "newExcludes":[Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    array-length v1, v4

    goto :goto_0

    .line 1760
    .restart local v0    # "defaultExcludesTemp":[Ljava/lang/String;
    .restart local v1    # "excludesLength":I
    .restart local v2    # "i":I
    .restart local v3    # "newExcludes":[Ljava/lang/String;
    :cond_2
    iput-object v3, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1761
    monitor-exit p0

    return-void

    .line 1748
    .end local v0    # "defaultExcludesTemp":[Ljava/lang/String;
    .end local v1    # "excludesLength":I
    .end local v2    # "i":I
    .end local v3    # "newExcludes":[Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized addExcludes([Ljava/lang/String;)V
    .locals 6
    .param p1, "excludes"    # [Ljava/lang/String;

    .prologue
    .line 770
    monitor-enter p0

    if-eqz p1, :cond_1

    :try_start_0
    array-length v2, p1

    if-lez v2, :cond_1

    .line 771
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    array-length v2, v2

    if-lez v2, :cond_2

    .line 772
    array-length v2, p1

    iget-object v3, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    array-length v3, v3

    add-int/2addr v2, v3

    new-array v1, v2, [Ljava/lang/String;

    .line 774
    .local v1, "tmp":[Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    array-length v5, v5

    invoke-static {v2, v3, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 776
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 777
    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    array-length v2, v2

    add-int/2addr v2, v0

    aget-object v3, p1, v0

    invoke-static {v3}, Lorg/apache/tools/ant/DirectoryScanner;->normalizePattern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 776
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 780
    :cond_0
    iput-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 785
    .end local v0    # "i":I
    .end local v1    # "tmp":[Ljava/lang/String;
    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    .line 782
    :cond_2
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/DirectoryScanner;->setExcludes([Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 770
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected declared-synchronized clearResults()V
    .locals 1

    .prologue
    .line 1072
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    .line 1073
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesNotIncluded:Ljava/util/Vector;

    .line 1074
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesExcluded:Ljava/util/Vector;

    .line 1075
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesDeselected:Ljava/util/Vector;

    .line 1076
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    .line 1077
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    .line 1078
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    .line 1079
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsDeselected:Ljava/util/Vector;

    .line 1080
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z

    .line 1081
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->scannedDirs:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1082
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1083
    monitor-exit p0

    return-void

    .line 1080
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1072
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method contentsExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z
    .locals 3
    .param p1, "path"    # Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    .prologue
    .line 1490
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 1491
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v1, v1, v0

    const-string/jumbo v2, "**"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->withoutLastToken()Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive()Z

    move-result v2

    invoke-virtual {v1, p1, v2}, Lorg/apache/tools/ant/types/selectors/TokenizedPattern;->matchPath(Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1494
    const/4 v1, 0x1

    .line 1497
    :goto_1
    return v1

    .line 1490
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1497
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected couldHoldIncluded(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1402
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/DirectoryScanner;->couldHoldIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    return v0
.end method

.method declared-synchronized ensureNonPatternSetsReady()V
    .locals 2

    .prologue
    .line 1815
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->areNonPatternSetsReady:Z

    if-nez v0, :cond_0

    .line 1816
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->includeNonPatterns:Ljava/util/Map;

    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->fillNonPatternSet(Ljava/util/Map;[Ljava/lang/String;)[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->includePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .line 1817
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludeNonPatterns:Ljava/util/Map;

    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->fillNonPatternSet(Ljava/util/Map;[Ljava/lang/String;)[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludePatterns:[Lorg/apache/tools/ant/types/selectors/TokenizedPattern;

    .line 1818
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->areNonPatternSetsReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1820
    :cond_0
    monitor-exit p0

    return-void

    .line 1815
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getBasedir()Ljava/io/File;
    .locals 1

    .prologue
    .line 644
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDeselectedDirectories()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1721
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->slowScan()V

    .line 1722
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsDeselected:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1723
    .local v0, "directories":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsDeselected:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1724
    monitor-exit p0

    return-object v0

    .line 1721
    .end local v0    # "directories":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getDeselectedFiles()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1635
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->slowScan()V

    .line 1636
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesDeselected:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1637
    .local v0, "files":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesDeselected:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1638
    monitor-exit p0

    return-object v0

    .line 1635
    .end local v0    # "files":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getExcludedDirectories()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1703
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->slowScan()V

    .line 1704
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1705
    .local v0, "directories":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1706
    monitor-exit p0

    return-object v0

    .line 1703
    .end local v0    # "directories":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getExcludedFiles()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1617
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->slowScan()V

    .line 1618
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesExcluded:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1619
    .local v0, "files":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesExcluded:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1620
    monitor-exit p0

    return-object v0

    .line 1617
    .end local v0    # "files":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getIncludedDirectories()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 1651
    monitor-enter p0

    .line 1652
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    if-nez v1, :cond_0

    .line 1653
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Must call scan() first"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1657
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1655
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1656
    .local v0, "directories":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1657
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1658
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 1659
    return-object v0
.end method

.method public declared-synchronized getIncludedDirsCount()I
    .locals 2

    .prologue
    .line 1668
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 1669
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Must call scan() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1668
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1671
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit p0

    return v0
.end method

.method public getIncludedFiles()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 1565
    monitor-enter p0

    .line 1566
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    if-nez v1, :cond_0

    .line 1567
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Must call scan() first"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1571
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 1569
    :cond_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1570
    .local v0, "files":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1571
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1572
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 1573
    return-object v0
.end method

.method public declared-synchronized getIncludedFilesCount()I
    .locals 2

    .prologue
    .line 1582
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 1583
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Must call scan() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1582
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 1585
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesIncluded:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit p0

    return v0
.end method

.method public declared-synchronized getNotFollowedSymlinks()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 1736
    monitor-enter p0

    :try_start_0
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1737
    :try_start_1
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 1739
    .local v0, "links":[Ljava/lang/String;
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1740
    :try_start_2
    invoke-static {v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1741
    monitor-exit p0

    return-object v0

    .line 1739
    .end local v0    # "links":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1736
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getNotIncludedDirectories()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1685
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->slowScan()V

    .line 1686
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1687
    .local v0, "directories":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1688
    monitor-exit p0

    return-object v0

    .line 1685
    .end local v0    # "directories":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getNotIncludedFiles()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 1599
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->slowScan()V

    .line 1600
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesNotIncluded:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 1601
    .local v0, "files":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->filesNotIncluded:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1602
    monitor-exit p0

    return-object v0

    .line 1599
    .end local v0    # "files":[Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1771
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getScannedDirs()Ljava/util/Set;
    .locals 1

    .prologue
    .line 1792
    iget-object v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->scannedDirs:Ljava/util/Set;

    return-object v0
.end method

.method public declared-synchronized isCaseSensitive()Z
    .locals 1

    .prologue
    .line 654
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isEverythingIncluded()Z
    .locals 1

    .prologue
    .line 822
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->everythingIncluded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected isExcluded(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1509
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/DirectoryScanner;->isExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isFollowSymlinks()Z
    .locals 1

    .prologue
    .line 687
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected isIncluded(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1366
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/DirectoryScanner;->isIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v0

    return v0
.end method

.method protected isSelected(Ljava/lang/String;Ljava/io/File;)Z
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 1545
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->selectors:[Lorg/apache/tools/ant/types/selectors/FileSelector;

    if-eqz v1, :cond_1

    .line 1546
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->selectors:[Lorg/apache/tools/ant/types/selectors/FileSelector;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 1547
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->selectors:[Lorg/apache/tools/ant/types/selectors/FileSelector;

    aget-object v1, v1, v0

    iget-object v2, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-interface {v1, v2, p1, p2}, Lorg/apache/tools/ant/types/selectors/FileSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1548
    const/4 v1, 0x0

    .line 1552
    .end local v0    # "i":I
    :goto_1
    return v1

    .line 1546
    .restart local v0    # "i":I
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1552
    .end local v0    # "i":I
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method public scan()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v2, 0x1

    const/4 v6, 0x0

    .line 836
    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    monitor-enter v7

    .line 837
    :try_start_0
    iget-boolean v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    if-eqz v8, :cond_2

    .line 838
    :goto_0
    iget-boolean v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_0

    .line 840
    :try_start_1
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 841
    :catch_0
    move-exception v0

    .line 842
    .local v0, "e":Ljava/lang/InterruptedException;
    goto :goto_0

    .line 845
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    :try_start_2
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    if-eqz v5, :cond_1

    .line 846
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    throw v5

    .line 851
    :catchall_0
    move-exception v5

    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v5

    .line 848
    :cond_1
    :try_start_3
    monitor-exit v7

    .line 923
    :goto_1
    return-void

    .line 850
    :cond_2
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    .line 851
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 852
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    .line 854
    .local v4, "savedBase":Ljava/io/File;
    :try_start_4
    monitor-enter p0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 855
    const/4 v7, 0x0

    :try_start_5
    iput-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    .line 856
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->clearResults()V

    .line 859
    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    if-nez v7, :cond_4

    move v3, v2

    .line 860
    .local v3, "nullIncludes":Z
    :goto_2
    if-eqz v3, :cond_5

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string/jumbo v9, "**"

    aput-object v9, v7, v8

    :goto_3
    iput-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    .line 862
    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    if-nez v7, :cond_6

    .line 863
    .local v2, "nullExcludes":Z
    :goto_4
    if-eqz v2, :cond_7

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/String;

    :goto_5
    iput-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    .line 865
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    if-eqz v6, :cond_3

    iget-boolean v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z

    if-nez v6, :cond_3

    sget-object v6, Lorg/apache/tools/ant/DirectoryScanner;->SYMLINK_UTILS:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/util/SymbolicLinkUtils;->isSymbolicLink(Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 867
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->notFollowedSymlinks:Ljava/util/Set;

    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 868
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    .line 871
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    if-nez v6, :cond_8

    .line 873
    if-eqz v3, :cond_c

    .line 874
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 917
    iput-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    .line 918
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    monitor-enter v6

    .line 919
    const/4 v5, 0x0

    :try_start_6
    iput-boolean v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    .line 920
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 921
    monitor-exit v6

    goto :goto_1

    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v5

    .end local v2    # "nullExcludes":Z
    .end local v3    # "nullIncludes":Z
    :cond_4
    move v3, v6

    .line 859
    goto :goto_2

    .line 860
    .restart local v3    # "nullIncludes":Z
    :cond_5
    :try_start_7
    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    goto :goto_3

    :cond_6
    move v2, v6

    .line 862
    goto :goto_4

    .line 863
    .restart local v2    # "nullExcludes":Z
    :cond_7
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    goto :goto_5

    .line 877
    :cond_8
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_b

    .line 878
    iget-boolean v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->errorOnMissingDir:Z

    if-eqz v6, :cond_a

    .line 879
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "basedir "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " does not exist."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    .line 892
    :cond_9
    :goto_6
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    if-eqz v6, :cond_c

    .line 893
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    throw v5

    .line 913
    .end local v2    # "nullExcludes":Z
    .end local v3    # "nullIncludes":Z
    :catchall_2
    move-exception v5

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v5
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 914
    :catch_1
    move-exception v1

    .line 915
    .local v1, "ex":Ljava/io/IOException;
    :try_start_9
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 917
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_3
    move-exception v5

    iput-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    .line 918
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    monitor-enter v6

    .line 919
    const/4 v7, 0x0

    :try_start_a
    iput-boolean v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    .line 920
    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/lang/Object;->notifyAll()V

    .line 921
    monitor-exit v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 917
    throw v5

    .line 884
    .restart local v2    # "nullExcludes":Z
    .restart local v3    # "nullIncludes":Z
    :cond_a
    :try_start_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 917
    iput-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    .line 918
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    monitor-enter v6

    .line 919
    const/4 v5, 0x0

    :try_start_c
    iput-boolean v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    .line 920
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 921
    monitor-exit v6

    goto/16 :goto_1

    :catchall_4
    move-exception v5

    monitor-exit v6
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    throw v5

    .line 886
    :cond_b
    :try_start_d
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_9

    .line 887
    new-instance v6, Ljava/lang/IllegalStateException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "basedir "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " is not a"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " directory."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->illegal:Ljava/lang/IllegalStateException;

    goto :goto_6

    .line 896
    :cond_c
    sget-object v6, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->EMPTY_PATH:Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/DirectoryScanner;->isIncluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v6

    if-eqz v6, :cond_f

    .line 897
    sget-object v6, Lorg/apache/tools/ant/types/selectors/TokenizedPath;->EMPTY_PATH:Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/DirectoryScanner;->isExcluded(Lorg/apache/tools/ant/types/selectors/TokenizedPath;)Z

    move-result v6

    if-nez v6, :cond_e

    .line 898
    const-string/jumbo v6, ""

    iget-object v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/DirectoryScanner;->isSelected(Ljava/lang/String;Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_d

    .line 899
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsIncluded:Ljava/util/Vector;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 909
    :goto_7
    invoke-direct {p0}, Lorg/apache/tools/ant/DirectoryScanner;->checkIncludePatterns()V

    .line 910
    invoke-direct {p0}, Lorg/apache/tools/ant/DirectoryScanner;->clearCaches()V

    .line 911
    if-eqz v3, :cond_10

    move-object v6, v5

    :goto_8
    iput-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    .line 912
    if-eqz v2, :cond_11

    :goto_9
    iput-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    .line 913
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 917
    iput-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;

    .line 918
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    monitor-enter v6

    .line 919
    const/4 v5, 0x0

    :try_start_e
    iput-boolean v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanning:Z

    .line 920
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->scanLock:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 921
    monitor-exit v6

    goto/16 :goto_1

    :catchall_5
    move-exception v5

    monitor-exit v6
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    throw v5

    .line 901
    :cond_d
    :try_start_f
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsDeselected:Ljava/util/Vector;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_7

    .line 904
    :cond_e
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_7

    .line 907
    :cond_f
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    const-string/jumbo v7, ""

    invoke-virtual {v6, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_7

    .line 911
    :cond_10
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    goto :goto_8

    .line 912
    :cond_11
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    goto :goto_9

    .line 921
    .end local v2    # "nullExcludes":Z
    .end local v3    # "nullIncludes":Z
    :catchall_6
    move-exception v5

    :try_start_10
    monitor-exit v6
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    throw v5
.end method

.method protected scandir(Ljava/io/File;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "vpath"    # Ljava/lang/String;
    .param p3, "fast"    # Z

    .prologue
    .line 1173
    new-instance v0, Lorg/apache/tools/ant/types/selectors/TokenizedPath;

    invoke-direct {v0, p2}, Lorg/apache/tools/ant/types/selectors/TokenizedPath;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0, p3}, Lorg/apache/tools/ant/DirectoryScanner;->scandir(Ljava/io/File;Lorg/apache/tools/ant/types/selectors/TokenizedPath;Z)V

    .line 1174
    return-void
.end method

.method public declared-synchronized setBasedir(Ljava/io/File;)V
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;

    .prologue
    .line 634
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/DirectoryScanner;->basedir:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 635
    monitor-exit p0

    return-void

    .line 634
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setBasedir(Ljava/lang/String;)V
    .locals 4
    .param p1, "basedir"    # Ljava/lang/String;

    .prologue
    .line 622
    if-nez p1, :cond_0

    const/4 v0, 0x0

    check-cast v0, Ljava/io/File;

    :goto_0
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/DirectoryScanner;->setBasedir(Ljava/io/File;)V

    .line 625
    return-void

    .line 622
    :cond_0
    new-instance v0, Ljava/io/File;

    const/16 v1, 0x2f

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x5c

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public declared-synchronized setCaseSensitive(Z)V
    .locals 1
    .param p1, "isCaseSensitive"    # Z

    .prologue
    .line 665
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/DirectoryScanner;->isCaseSensitive:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 666
    monitor-exit p0

    return-void

    .line 665
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setErrorOnMissingDir(Z)V
    .locals 0
    .param p1, "errorOnMissingDir"    # Z

    .prologue
    .line 676
    iput-boolean p1, p0, Lorg/apache/tools/ant/DirectoryScanner;->errorOnMissingDir:Z

    .line 677
    return-void
.end method

.method public declared-synchronized setExcludes([Ljava/lang/String;)V
    .locals 3
    .param p1, "excludes"    # [Ljava/lang/String;

    .prologue
    .line 746
    monitor-enter p0

    if-nez p1, :cond_1

    .line 747
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 754
    :cond_0
    monitor-exit p0

    return-void

    .line 749
    :cond_1
    :try_start_1
    array-length v1, p1

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    .line 750
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 751
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    aget-object v2, p1, v0

    invoke-static {v2}, Lorg/apache/tools/ant/DirectoryScanner;->normalizePattern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 750
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 746
    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setFollowSymlinks(Z)V
    .locals 1
    .param p1, "followSymlinks"    # Z

    .prologue
    .line 696
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/DirectoryScanner;->followSymlinks:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 697
    monitor-exit p0

    return-void

    .line 696
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setIncludes([Ljava/lang/String;)V
    .locals 3
    .param p1, "includes"    # [Ljava/lang/String;

    .prologue
    .line 723
    monitor-enter p0

    if-nez p1, :cond_1

    .line 724
    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 731
    :cond_0
    monitor-exit p0

    return-void

    .line 726
    :cond_1
    :try_start_1
    array-length v1, p1

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    .line 727
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 728
    iget-object v1, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    aget-object v2, p1, v0

    invoke-static {v2}, Lorg/apache/tools/ant/DirectoryScanner;->normalizePattern(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 727
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 723
    .end local v0    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setMaxLevelsOfSymlinks(I)V
    .locals 0
    .param p1, "max"    # I

    .prologue
    .line 706
    iput p1, p0, Lorg/apache/tools/ant/DirectoryScanner;->maxLevelsOfSymlinks:I

    .line 707
    return-void
.end method

.method public declared-synchronized setSelectors([Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selectors"    # [Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 811
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/DirectoryScanner;->selectors:[Lorg/apache/tools/ant/types/selectors/FileSelector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 812
    monitor-exit p0

    return-void

    .line 811
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected slowScan()V
    .locals 9

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    const/4 v5, 0x0

    .line 1094
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    monitor-enter v6

    .line 1095
    :try_start_0
    iget-boolean v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->haveSlowResults:Z

    if-eqz v7, :cond_0

    .line 1096
    monitor-exit v6

    .line 1141
    :goto_0
    return-void

    .line 1098
    :cond_0
    iget-boolean v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanning:Z

    if-eqz v7, :cond_2

    .line 1099
    :goto_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_1

    .line 1101
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 1102
    :catch_0
    move-exception v4

    goto :goto_1

    .line 1106
    :cond_1
    :try_start_2
    monitor-exit v6

    goto :goto_0

    .line 1109
    :catchall_0
    move-exception v4

    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 1108
    :cond_2
    const/4 v7, 0x1

    :try_start_3
    iput-boolean v7, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanning:Z

    .line 1109
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1111
    :try_start_4
    monitor-enter p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 1114
    :try_start_5
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    if-nez v6, :cond_3

    move v3, v2

    .line 1115
    .local v3, "nullIncludes":Z
    :goto_2
    if-eqz v3, :cond_4

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    const-string/jumbo v8, "**"

    aput-object v8, v6, v7

    :goto_3
    iput-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    .line 1117
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    if-nez v6, :cond_5

    .line 1118
    .local v2, "nullExcludes":Z
    :goto_4
    if-eqz v2, :cond_6

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/String;

    :goto_5
    iput-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    .line 1120
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v0, v5, [Ljava/lang/String;

    .line 1121
    .local v0, "excl":[Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsExcluded:Ljava/util/Vector;

    invoke-virtual {v5, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1123
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v1, v5, [Ljava/lang/String;

    .line 1124
    .local v1, "notIncl":[Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->dirsNotIncluded:Ljava/util/Vector;

    invoke-virtual {v5, v1}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1126
    invoke-virtual {p0}, Lorg/apache/tools/ant/DirectoryScanner;->ensureNonPatternSetsReady()V

    .line 1128
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/DirectoryScanner;->processSlowScan([Ljava/lang/String;)V

    .line 1129
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/DirectoryScanner;->processSlowScan([Ljava/lang/String;)V

    .line 1130
    invoke-direct {p0}, Lorg/apache/tools/ant/DirectoryScanner;->clearCaches()V

    .line 1131
    if-eqz v3, :cond_7

    move-object v5, v4

    :goto_6
    iput-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    .line 1132
    if-eqz v2, :cond_8

    :goto_7
    iput-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    .line 1133
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 1135
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    monitor-enter v5

    .line 1136
    const/4 v4, 0x1

    :try_start_6
    iput-boolean v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->haveSlowResults:Z

    .line 1137
    const/4 v4, 0x0

    iput-boolean v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanning:Z

    .line 1138
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 1139
    monitor-exit v5

    goto :goto_0

    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v4

    .end local v0    # "excl":[Ljava/lang/String;
    .end local v1    # "notIncl":[Ljava/lang/String;
    .end local v2    # "nullExcludes":Z
    .end local v3    # "nullIncludes":Z
    :cond_3
    move v3, v5

    .line 1114
    goto :goto_2

    .line 1115
    .restart local v3    # "nullIncludes":Z
    :cond_4
    :try_start_7
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    goto :goto_3

    :cond_5
    move v2, v5

    .line 1117
    goto :goto_4

    .line 1118
    .restart local v2    # "nullExcludes":Z
    :cond_6
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    goto :goto_5

    .line 1131
    .restart local v0    # "excl":[Ljava/lang/String;
    .restart local v1    # "notIncl":[Ljava/lang/String;
    :cond_7
    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->includes:[Ljava/lang/String;

    goto :goto_6

    .line 1132
    :cond_8
    iget-object v4, p0, Lorg/apache/tools/ant/DirectoryScanner;->excludes:[Ljava/lang/String;

    goto :goto_7

    .line 1133
    .end local v0    # "excl":[Ljava/lang/String;
    .end local v1    # "notIncl":[Ljava/lang/String;
    .end local v2    # "nullExcludes":Z
    .end local v3    # "nullIncludes":Z
    :catchall_2
    move-exception v4

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :try_start_8
    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 1135
    :catchall_3
    move-exception v4

    iget-object v5, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    monitor-enter v5

    .line 1136
    const/4 v6, 0x1

    :try_start_9
    iput-boolean v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->haveSlowResults:Z

    .line 1137
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanning:Z

    .line 1138
    iget-object v6, p0, Lorg/apache/tools/ant/DirectoryScanner;->slowScanLock:Ljava/lang/Object;

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V

    .line 1139
    monitor-exit v5
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 1135
    throw v4

    .line 1139
    :catchall_4
    move-exception v4

    :try_start_a
    monitor-exit v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    throw v4
.end method
