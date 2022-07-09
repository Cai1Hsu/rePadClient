.class public Lorg/apache/tools/ant/taskdefs/Rmic;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Rmic.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;
    }
.end annotation


# static fields
.field public static final ERROR_BASE_NOT_SET:Ljava/lang/String; = "base or destdir attribute must be set!"

.field public static final ERROR_LOADING_CAUSED_EXCEPTION:Ljava/lang/String; = ". Loading caused Exception: "

.field public static final ERROR_NOT_A_DIR:Ljava/lang/String; = "base or destdir is not a directory:"

.field public static final ERROR_NOT_DEFINED:Ljava/lang/String; = ". It is not defined."

.field public static final ERROR_NOT_FOUND:Ljava/lang/String; = ". It could not be found."

.field public static final ERROR_NO_BASE_EXISTS:Ljava/lang/String; = "base or destdir does not exist: "

.field public static final ERROR_RMIC_FAILED:Ljava/lang/String; = "Rmic failed; see the compiler error output for details."

.field public static final ERROR_UNABLE_TO_VERIFY_CLASS:Ljava/lang/String; = "Unable to verify class "

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$java$rmi$Remote:Ljava/lang/Class;


# instance fields
.field private baseDir:Ljava/io/File;

.field private classname:Ljava/lang/String;

.field private compileClasspath:Lorg/apache/tools/ant/types/Path;

.field private compileList:Ljava/util/Vector;

.field private debug:Z

.field private destDir:Ljava/io/File;

.field private executable:Ljava/lang/String;

.field private extDirs:Lorg/apache/tools/ant/types/Path;

.field private facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

.field private filtering:Z

.field private idl:Z

.field private idlOpts:Ljava/lang/String;

.field private iiop:Z

.field private iiopOpts:Ljava/lang/String;

.field private includeAntRuntime:Z

.field private includeJavaRuntime:Z

.field private listFiles:Z

.field private loader:Lorg/apache/tools/ant/AntClassLoader;

.field private nestedAdapter:Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

.field private sourceBase:Ljava/io/File;

.field private stubVersion:Ljava/lang/String;

.field private verify:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 126
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Rmic;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 137
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 95
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->verify:Z

    .line 96
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->filtering:Z

    .line 98
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiop:Z

    .line 100
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idl:Z

    .line 102
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->debug:Z

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->includeAntRuntime:Z

    .line 104
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->includeJavaRuntime:Z

    .line 106
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    .line 108
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 128
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->executable:Ljava/lang/String;

    .line 130
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->listFiles:Z

    .line 132
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    .line 138
    new-instance v0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    const-string/jumbo v1, "default"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 139
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 798
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

.method private isValidRmiRemote(Ljava/lang/Class;)Z
    .locals 1
    .param p1, "testClass"    # Ljava/lang/Class;

    .prologue
    .line 816
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Rmic;->getRemoteInterface(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private moveGeneratedFile(Ljava/io/File;Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;)V
    .locals 12
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "sourceBaseFile"    # Ljava/io/File;
    .param p3, "classname"    # Ljava/lang/String;
    .param p4, "adapter"    # Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 696
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v10, 0x2e

    sget-char v11, Ljava/io/File;->separatorChar:C

    invoke-virtual {p3, v10, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".class"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 698
    .local v0, "classFileName":Ljava/lang/String;
    invoke-interface/range {p4 .. p4}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v9

    invoke-interface {v9, v0}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 700
    .local v2, "generatedFiles":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v9, v2

    if-ge v3, v9, :cond_3

    .line 701
    aget-object v1, v2, v3

    .line 702
    .local v1, "generatedFile":Ljava/lang/String;
    const-string/jumbo v9, ".class"

    invoke-virtual {v1, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 700
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 707
    :cond_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, ".class"

    invoke-static {v1, v10}, Lorg/apache/tools/ant/util/StringUtils;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ".java"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 711
    .local v8, "sourceFileName":Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, p1, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 712
    .local v7, "oldFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 717
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p2, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 719
    .local v6, "newFile":Ljava/io/File;
    :try_start_0
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->filtering:Z

    if-eqz v9, :cond_2

    .line 720
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Rmic;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    new-instance v10, Lorg/apache/tools/ant/types/FilterSetCollection;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/Project;->getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/types/FilterSetCollection;-><init>(Lorg/apache/tools/ant/types/FilterSet;)V

    invoke-virtual {v9, v7, v6, v10}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/FilterSetCollection;)V

    .line 726
    :goto_2
    invoke-virtual {v7}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 727
    :catch_0
    move-exception v4

    .line 728
    .local v4, "ioe":Ljava/io/IOException;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Failed to copy "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " due to "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 731
    .local v5, "msg":Ljava/lang/String;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v9, v5, v4, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9

    .line 724
    .end local v4    # "ioe":Ljava/io/IOException;
    .end local v5    # "msg":Ljava/lang/String;
    :cond_2
    :try_start_1
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Rmic;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v9, v7, v6}, Lorg/apache/tools/ant/util/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 734
    .end local v1    # "generatedFile":Ljava/lang/String;
    .end local v6    # "newFile":Ljava/io/File;
    .end local v7    # "oldFile":Ljava/io/File;
    .end local v8    # "sourceFileName":Ljava/lang/String;
    :cond_3
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;)V
    .locals 2
    .param p1, "adapter"    # Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    .prologue
    .line 572
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    if-eqz v0, :cond_0

    .line 573
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Can\'t have more than one rmic adapter"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 575
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    .line 576
    return-void
.end method

.method protected cleanup()V
    .locals 1

    .prologue
    .line 682
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v0, :cond_0

    .line 683
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 684
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 686
    :cond_0
    return-void
.end method

.method public declared-synchronized createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 288
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 289
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 291
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 288
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public createCompilerArg()Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;
    .locals 2

    .prologue
    .line 514
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;-><init>(Lorg/apache/tools/ant/taskdefs/Rmic;)V

    .line 515
    .local v0, "arg":Lorg/apache/tools/ant/taskdefs/Rmic$ImplementationSpecificArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->addImplementationArgument(Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;)V

    .line 516
    return-object v0
.end method

.method public createCompilerClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 555
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementationClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized createExtdirs()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 463
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 464
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;

    .line 466
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 463
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public execute()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    .line 586
    :try_start_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->clear()V

    .line 588
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getOutputDir()Ljava/io/File;

    move-result-object v8

    .line 589
    .local v8, "outputDir":Ljava/io/File;
    if-nez v8, :cond_0

    .line 590
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "base or destdir attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 672
    .end local v8    # "outputDir":Ljava/io/File;
    :catchall_0
    move-exception v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->cleanup()V

    throw v10

    .line 592
    .restart local v8    # "outputDir":Ljava/io/File;
    :cond_0
    :try_start_1
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_1

    .line 593
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "base or destdir does not exist: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 596
    :cond_1
    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_2

    .line 597
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "base or destdir is not a directory:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 599
    :cond_2
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->verify:Z

    if-eqz v10, :cond_3

    .line 600
    const-string/jumbo v10, "Verify has been turned on."

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 602
    :cond_3
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    if-eqz v10, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    .line 608
    .local v0, "adapter":Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    :goto_0
    invoke-interface {v0, p0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;->setRmic(Lorg/apache/tools/ant/taskdefs/Rmic;)V

    .line 610
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 611
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v10, v1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v10

    iput-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 615
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->classname:Ljava/lang/String;

    if-nez v10, :cond_5

    .line 616
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->baseDir:Ljava/io/File;

    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/Rmic;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v2

    .line 617
    .local v2, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v2}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v5

    .line 618
    .local v5, "files":[Ljava/lang/String;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->baseDir:Ljava/io/File;

    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v11

    invoke-virtual {p0, v10, v5, v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->scanDir(Ljava/io/File;[Ljava/lang/String;Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 634
    .end local v2    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v5    # "files":[Ljava/lang/String;
    :goto_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v4

    .line 635
    .local v4, "fileCount":I
    if-lez v4, :cond_9

    .line 636
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "RMI Compiling "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " class"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    if-le v4, v14, :cond_7

    const-string/jumbo v10, "es"

    :goto_2
    invoke-virtual {v11, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 640
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->listFiles:Z

    if-eqz v10, :cond_8

    .line 641
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v4, :cond_8

    .line 642
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    invoke-virtual {v10, v6}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;)V

    .line 641
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 602
    .end local v0    # "adapter":Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    .end local v1    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v4    # "fileCount":I
    .end local v6    # "i":I
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getCompiler()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->createCompilerClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v11

    invoke-static {v10, p0, v11}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->getRmic(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    move-result-object v0

    goto/16 :goto_0

    .line 621
    .restart local v0    # "adapter":Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    .restart local v1    # "classpath":Lorg/apache/tools/ant/types/Path;
    :cond_5
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->classname:Ljava/lang/String;

    const/16 v12, 0x2e

    sget-char v13, Ljava/io/File;->separatorChar:C

    invoke-virtual {v11, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, ".class"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 623
    .local v9, "path":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->baseDir:Ljava/io/File;

    invoke-direct {v3, v10, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 624
    .local v3, "f":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v10

    if-eqz v10, :cond_6

    .line 625
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->baseDir:Ljava/io/File;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    aput-object v9, v11, v12

    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v12

    invoke-virtual {p0, v10, v11, v12}, Lorg/apache/tools/ant/taskdefs/Rmic;->scanDir(Ljava/io/File;[Ljava/lang/String;Lorg/apache/tools/ant/util/FileNameMapper;)V

    goto/16 :goto_1

    .line 631
    :cond_6
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->classname:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 636
    .end local v3    # "f":Ljava/io/File;
    .end local v9    # "path":Ljava/lang/String;
    .restart local v4    # "fileCount":I
    :cond_7
    const-string/jumbo v10, ""

    goto/16 :goto_2

    .line 647
    :cond_8
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;->execute()Z

    move-result v10

    if-nez v10, :cond_9

    .line 648
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "Rmic failed; see the compiler error output for details."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 656
    :cond_9
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->sourceBase:Ljava/io/File;

    if-eqz v10, :cond_a

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->sourceBase:Ljava/io/File;

    invoke-virtual {v8, v10}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a

    if-lez v4, :cond_a

    .line 658
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idl:Z

    if-eqz v10, :cond_b

    .line 659
    const-string/jumbo v10, "Cannot determine sourcefiles in idl mode, "

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 661
    const-string/jumbo v10, "sourcebase attribute will be ignored."

    const/4 v11, 0x1

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 672
    :cond_a
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->cleanup()V

    .line 674
    return-void

    .line 664
    :cond_b
    const/4 v7, 0x0

    .local v7, "j":I
    :goto_4
    if-ge v7, v4, :cond_a

    .line 665
    :try_start_2
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->sourceBase:Ljava/io/File;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    invoke-virtual {v10, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-direct {p0, v8, v11, v10, v0}, Lorg/apache/tools/ant/taskdefs/Rmic;->moveGeneratedFile(Ljava/io/File;Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 664
    add-int/lit8 v7, v7, 0x1

    goto :goto_4
.end method

.method public getBase()Ljava/io/File;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->baseDir:Ljava/io/File;

    return-object v0
.end method

.method public getClassname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->classname:Ljava/lang/String;

    return-object v0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 308
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getCompileList()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 482
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    return-object v0
.end method

.method public getCompiler()Ljava/lang/String;
    .locals 3

    .prologue
    .line 504
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "build.rmic"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setMagicValue(Ljava/lang/String;)V

    .line 505
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementation()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentCompilerArgs()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 525
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getCompiler()Ljava/lang/String;

    .line 526
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getArgs()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDebug()Z
    .locals 1

    .prologue
    .line 268
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->debug:Z

    return v0
.end method

.method public getDestdir()Ljava/io/File;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->destDir:Ljava/io/File;

    return-object v0
.end method

.method public getExecutable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 545
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->executable:Ljava/lang/String;

    return-object v0
.end method

.method public getExtdirs()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 475
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getFileList()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 403
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    return-object v0
.end method

.method public getFiltering()Z
    .locals 1

    .prologue
    .line 251
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->filtering:Z

    return v0
.end method

.method public getIdl()Z
    .locals 1

    .prologue
    .line 379
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idl:Z

    return v0
.end method

.method public getIdlopts()Ljava/lang/String;
    .locals 1

    .prologue
    .line 395
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idlOpts:Ljava/lang/String;

    return-object v0
.end method

.method public getIiop()Z
    .locals 1

    .prologue
    .line 345
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiop:Z

    return v0
.end method

.method public getIiopopts()Ljava/lang/String;
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiopOpts:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludeantruntime()Z
    .locals 1

    .prologue
    .line 422
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->includeAntRuntime:Z

    return v0
.end method

.method public getIncludejavaruntime()Z
    .locals 1

    .prologue
    .line 442
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->includeJavaRuntime:Z

    return v0
.end method

.method public getLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 824
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    return-object v0
.end method

.method public getOutputDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 174
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getDestdir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getDestdir()Ljava/io/File;

    move-result-object v0

    .line 177
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getBase()Ljava/io/File;

    move-result-object v0

    goto :goto_0
.end method

.method public getRemoteInterface(Ljava/lang/Class;)Ljava/lang/Class;
    .locals 4
    .param p1, "testClass"    # Ljava/lang/Class;

    .prologue
    .line 798
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Rmic;->class$java$rmi$Remote:Ljava/lang/Class;

    if-nez v2, :cond_0

    const-string/jumbo v2, "java.rmi.Remote"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/Rmic;->class$java$rmi$Remote:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 799
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 800
    .local v1, "interfaces":[Ljava/lang/Class;
    if-eqz v1, :cond_3

    .line 801
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v2, v1

    if-ge v0, v2, :cond_3

    .line 802
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Rmic;->class$java$rmi$Remote:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "java.rmi.Remote"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/Rmic;->class$java$rmi$Remote:Ljava/lang/Class;

    :goto_2
    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 803
    aget-object v2, v1, v0

    .line 808
    .end local v0    # "i":I
    .end local v1    # "interfaces":[Ljava/lang/Class;
    :goto_3
    return-object v2

    .line 798
    :cond_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Rmic;->class$java$rmi$Remote:Ljava/lang/Class;

    goto :goto_0

    .line 802
    .restart local v0    # "i":I
    .restart local v1    # "interfaces":[Ljava/lang/Class;
    :cond_1
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Rmic;->class$java$rmi$Remote:Ljava/lang/Class;

    goto :goto_2

    .line 801
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 808
    .end local v0    # "i":I
    .end local v1    # "interfaces":[Ljava/lang/Class;
    :cond_3
    const/4 v2, 0x0

    goto :goto_3
.end method

.method public getSourceBase()Ljava/io/File;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->sourceBase:Ljava/io/File;

    return-object v0
.end method

.method public getStubVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->stubVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getVerify()Z
    .locals 1

    .prologue
    .line 327
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->verify:Z

    return v0
.end method

.method public isValidRmiRemote(Ljava/lang/String;)Z
    .locals 7
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    const/4 v6, 0x1

    .line 769
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v4, p1}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 771
    .local v2, "testClass":Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiop:Z

    if-nez v4, :cond_0

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idl:Z

    if-nez v4, :cond_0

    .line 787
    .end local v2    # "testClass":Ljava/lang/Class;
    :goto_0
    return v3

    .line 774
    .restart local v2    # "testClass":Ljava/lang/Class;
    :cond_0
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->isValidRmiRemote(Ljava/lang/Class;)Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    move-result v3

    goto :goto_0

    .line 775
    .end local v2    # "testClass":Ljava/lang/Class;
    :catch_0
    move-exception v0

    .line 776
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to verify class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ". It could not be found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 778
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v0

    .line 779
    .local v0, "e":Ljava/lang/NoClassDefFoundError;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to verify class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ". It is not defined."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 781
    .end local v0    # "e":Ljava/lang/NoClassDefFoundError;
    :catch_2
    move-exception v1

    .line 782
    .local v1, "t":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unable to verify class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ". Loading caused Exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method protected scanDir(Ljava/io/File;[Ljava/lang/String;Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 7
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "files"    # [Ljava/lang/String;
    .param p3, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    const/4 v6, 0x3

    .line 744
    move-object v2, p2

    .line 745
    .local v2, "newFiles":[Ljava/lang/String;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idl:Z

    if-eqz v4, :cond_0

    .line 746
    const-string/jumbo v4, "will leave uptodate test to rmic implementation in idl mode."

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 755
    :goto_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, v2

    if-ge v0, v4, :cond_2

    .line 756
    aget-object v4, v2, v0

    sget-char v5, Ljava/io/File;->separatorChar:C

    const/16 v6, 0x2e

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 757
    .local v1, "name":Ljava/lang/String;
    const/4 v4, 0x0

    const-string/jumbo v5, ".class"

    invoke-virtual {v1, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 758
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileList:Ljava/util/Vector;

    invoke-virtual {v4, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 755
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 748
    .end local v0    # "i":I
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiop:Z

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiopOpts:Ljava/lang/String;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiopOpts:Ljava/lang/String;

    const-string/jumbo v5, "-always"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-le v4, v5, :cond_1

    .line 749
    const-string/jumbo v4, "no uptodate test as -always option has been specified"

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 752
    :cond_1
    new-instance v3, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v3, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 753
    .local v3, "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->getOutputDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v3, p2, p1, v4, p3}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrict([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 760
    .end local v3    # "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    .restart local v0    # "i":I
    :cond_2
    return-void
.end method

.method public setBase(Ljava/io/File;)V
    .locals 0
    .param p1, "base"    # Ljava/io/File;

    .prologue
    .line 146
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->baseDir:Ljava/io/File;

    .line 147
    return-void
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 194
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->classname:Ljava/lang/String;

    .line 195
    return-void
.end method

.method public declared-synchronized setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 276
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 277
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    :goto_0
    monitor-exit p0

    return-void

    .line 279
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 276
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "pathRef"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 300
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rmic;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 301
    return-void
.end method

.method public setCompiler(Ljava/lang/String;)V
    .locals 1
    .param p1, "compiler"    # Ljava/lang/String;

    .prologue
    .line 493
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 494
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    .line 496
    :cond_0
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 260
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->debug:Z

    .line 261
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "destdir"    # Ljava/io/File;

    .prologue
    .line 155
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->destDir:Ljava/io/File;

    .line 156
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 0
    .param p1, "ex"    # Ljava/lang/String;

    .prologue
    .line 535
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->executable:Ljava/lang/String;

    .line 536
    return-void
.end method

.method public declared-synchronized setExtdirs(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "extDirs"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 451
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 452
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 456
    :goto_0
    monitor-exit p0

    return-void

    .line 454
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->extDirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 451
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setFiltering(Z)V
    .locals 0
    .param p1, "filter"    # Z

    .prologue
    .line 243
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->filtering:Z

    .line 244
    return-void
.end method

.method public setIdl(Z)V
    .locals 0
    .param p1, "idl"    # Z

    .prologue
    .line 371
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idl:Z

    .line 372
    return-void
.end method

.method public setIdlopts(Ljava/lang/String;)V
    .locals 0
    .param p1, "idlOpts"    # Ljava/lang/String;

    .prologue
    .line 387
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->idlOpts:Ljava/lang/String;

    .line 388
    return-void
.end method

.method public setIiop(Z)V
    .locals 0
    .param p1, "iiop"    # Z

    .prologue
    .line 337
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiop:Z

    .line 338
    return-void
.end method

.method public setIiopopts(Ljava/lang/String;)V
    .locals 0
    .param p1, "iiopOpts"    # Ljava/lang/String;

    .prologue
    .line 353
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->iiopOpts:Ljava/lang/String;

    .line 354
    return-void
.end method

.method public setIncludeantruntime(Z)V
    .locals 0
    .param p1, "include"    # Z

    .prologue
    .line 413
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->includeAntRuntime:Z

    .line 414
    return-void
.end method

.method public setIncludejavaruntime(Z)V
    .locals 0
    .param p1, "include"    # Z

    .prologue
    .line 433
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->includeJavaRuntime:Z

    .line 434
    return-void
.end method

.method public setListfiles(Z)V
    .locals 0
    .param p1, "list"    # Z

    .prologue
    .line 564
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->listFiles:Z

    .line 565
    return-void
.end method

.method public setSourceBase(Ljava/io/File;)V
    .locals 0
    .param p1, "sourceBase"    # Ljava/io/File;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->sourceBase:Ljava/io/File;

    .line 211
    return-void
.end method

.method public setStubVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "stubVersion"    # Ljava/lang/String;

    .prologue
    .line 227
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->stubVersion:Ljava/lang/String;

    .line 228
    return-void
.end method

.method public setVerify(Z)V
    .locals 0
    .param p1, "verify"    # Z

    .prologue
    .line 319
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Rmic;->verify:Z

    .line 320
    return-void
.end method
