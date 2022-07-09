.class public Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "JspC.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;
    }
.end annotation


# static fields
.field private static final FAIL_MSG:Ljava/lang/String; = "Compile failed, messages should have been provided."


# instance fields
.field private classpath:Lorg/apache/tools/ant/types/Path;

.field protected compileList:Ljava/util/Vector;

.field private compilerClasspath:Lorg/apache/tools/ant/types/Path;

.field private compilerName:Ljava/lang/String;

.field private destDir:Ljava/io/File;

.field protected failOnError:Z

.field private iepluginid:Ljava/lang/String;

.field javaFiles:Ljava/util/Vector;

.field private mapped:Z

.field private packageName:Ljava/lang/String;

.field private src:Lorg/apache/tools/ant/types/Path;

.field private uriroot:Ljava/io/File;

.field private verbose:I

.field protected webApp:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

.field private webinc:Ljava/io/File;

.field private webxml:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 73
    const-string/jumbo v0, "jasper"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerName:Ljava/lang/String;

    .line 80
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->verbose:I

    .line 82
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    .line 83
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->javaFiles:Ljava/util/Vector;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->failOnError:Z

    .line 681
    return-void
.end method

.method private doCompilation(Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;)V
    .locals 3
    .param p1, "compiler"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 545
    invoke-interface {p1, p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;->setJspc(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;)V

    .line 548
    invoke-interface {p1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;->execute()Z

    move-result v0

    if-nez v0, :cond_1

    .line 549
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->failOnError:Z

    if-eqz v0, :cond_0

    .line 550
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Compile failed, messages should have been provided."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 552
    :cond_0
    const-string/jumbo v0, "Compile failed, messages should have been provided."

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 555
    :cond_1
    return-void
.end method

.method private getActualDestDir()Ljava/io/File;
    .locals 6

    .prologue
    .line 528
    const/4 v0, 0x0

    .line 529
    .local v0, "dest":Ljava/io/File;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->packageName:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 530
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    .line 536
    :goto_0
    return-object v0

    .line 532
    :cond_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->packageName:Ljava/lang/String;

    const/16 v4, 0x2e

    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 534
    .local v1, "path":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    .end local v0    # "dest":Ljava/io/File;
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v0    # "dest":Ljava/io/File;
    goto :goto_0
.end method

.method private isCompileNeeded(Ljava/io/File;Ljava/io/File;)Z
    .locals 7
    .param p1, "srcFile"    # Ljava/io/File;
    .param p2, "javaFile"    # Ljava/io/File;

    .prologue
    const/4 v6, 0x3

    .line 615
    const/4 v0, 0x0

    .line 616
    .local v0, "shouldCompile":Z
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 617
    const/4 v0, 0x1

    .line 618
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Compiling "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " because java file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v6}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 637
    :cond_0
    :goto_0
    return v0

    .line 622
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-lez v1, :cond_2

    .line 623
    const/4 v0, 0x1

    .line 624
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Compiling "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " because it is out of date with respect to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v6}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 629
    :cond_2
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_0

    .line 630
    const/4 v0, 0x1

    .line 631
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Compiling "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " because java file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is empty"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v6}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method


# virtual methods
.method public addWebApp(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;)V
    .locals 2
    .param p1, "webappParam"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 388
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webApp:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

    if-nez v0, :cond_0

    .line 389
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webApp:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

    .line 393
    return-void

    .line 391
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one webapp can be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 292
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 293
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 295
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createCompilerclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 339
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 340
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    .line 342
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public deleteEmptyJavaFiles()V
    .locals 6

    .prologue
    .line 666
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->javaFiles:Ljava/util/Vector;

    if-eqz v2, :cond_1

    .line 667
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->javaFiles:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 668
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 669
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 670
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    .line 671
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "deleting empty output file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;)V

    .line 672
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_0

    .line 676
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "file":Ljava/io/File;
    :cond_1
    return-void
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 428
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    if-nez v10, :cond_0

    .line 429
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "destdir attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 433
    :cond_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_1

    .line 434
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "destination directory \""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\" does not exist or is not a directory"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 439
    :cond_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getActualDestDir()Ljava/io/File;

    move-result-object v2

    .line 441
    .local v2, "dest":Ljava/io/File;
    const/4 v0, 0x0

    .line 444
    .local v0, "al":Lorg/apache/tools/ant/AntClassLoader;
    :try_start_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerName:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    invoke-static {v10, p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapterFactory;->getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/AntClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;

    move-result-object v1

    .line 451
    .local v1, "compiler":Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webApp:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

    if-eqz v10, :cond_3

    .line 452
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->doCompilation(Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 517
    if-eqz v0, :cond_2

    .line 518
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 521
    :cond_2
    :goto_0
    return-void

    .line 457
    :cond_3
    :try_start_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->src:Lorg/apache/tools/ant/types/Path;

    if-nez v10, :cond_5

    .line 458
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "srcdir attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 517
    .end local v1    # "compiler":Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    :catchall_0
    move-exception v10

    if-eqz v0, :cond_4

    .line 518
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_4
    throw v10

    .line 461
    .restart local v1    # "compiler":Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    :cond_5
    :try_start_2
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v7

    .line 462
    .local v7, "list":[Ljava/lang/String;
    array-length v10, v7

    if-nez v10, :cond_6

    .line 463
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v11, "srcdir attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 470
    :cond_6
    invoke-interface {v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;->implementsOwnDependencyChecking()Z

    move-result v10

    if-eqz v10, :cond_7

    .line 471
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->doCompilation(Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 517
    if-eqz v0, :cond_2

    .line 518
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto :goto_0

    .line 477
    :cond_7
    :try_start_3
    invoke-interface {v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;->createMangler()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;

    move-result-object v8

    .line 481
    .local v8, "mangler":Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->resetFileLists()V

    .line 482
    const/4 v4, 0x0

    .line 483
    .local v4, "filecount":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    array-length v10, v7

    if-ge v6, v10, :cond_9

    .line 484
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    aget-object v11, v7, v6

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    .line 485
    .local v9, "srcDir":Ljava/io/File;
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_8

    .line 486
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "srcdir \""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\" does not exist!"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v12

    invoke-direct {v10, v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v10

    .line 490
    :cond_8
    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v3

    .line 491
    .local v3, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v5

    .line 492
    .local v5, "files":[Ljava/lang/String;
    array-length v4, v5

    .line 493
    invoke-virtual {p0, v9, v2, v8, v5}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->scanDir(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;[Ljava/lang/String;)V

    .line 483
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 498
    .end local v3    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v5    # "files":[Ljava/lang/String;
    .end local v9    # "srcDir":Ljava/io/File;
    :cond_9
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "compiling "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " files"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 501
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    if-lez v10, :cond_b

    .line 503
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Compiling "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    invoke-virtual {v11}, Ljava/util/Vector;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " source file"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->size()I

    move-result v10

    const/4 v12, 0x1

    if-ne v10, v12, :cond_a

    const-string/jumbo v10, ""

    :goto_2
    invoke-virtual {v11, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;)V

    .line 507
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->doCompilation(Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 517
    :goto_3
    if-eqz v0, :cond_2

    .line 518
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto/16 :goto_0

    .line 503
    :cond_a
    :try_start_4
    const-string/jumbo v10, "s"

    goto :goto_2

    .line 510
    :cond_b
    if-nez v4, :cond_c

    .line 511
    const-string/jumbo v10, "there were no files to compile"

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 513
    :cond_c
    const-string/jumbo v10, "all files are up to date"

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 311
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getCompileList()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    return-object v0
.end method

.method public getCompilerclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getDestdir()Ljava/io/File;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    return-object v0
.end method

.method public getFailonerror()Z
    .locals 1

    .prologue
    .line 201
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->failOnError:Z

    return v0
.end method

.method public getIeplugin()Ljava/lang/String;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->iepluginid:Ljava/lang/String;

    return-object v0
.end method

.method public getPackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getSrcDir()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->src:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getUribase()Ljava/io/File;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->uriroot:Ljava/io/File;

    return-object v0
.end method

.method public getUriroot()Ljava/io/File;
    .locals 1

    .prologue
    .line 271
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->uriroot:Ljava/io/File;

    return-object v0
.end method

.method public getVerbose()I
    .locals 1

    .prologue
    .line 185
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->verbose:I

    return v0
.end method

.method public getWebApp()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;
    .locals 1

    .prologue
    .line 400
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webApp:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC$WebAppParameter;

    return-object v0
.end method

.method public getWebinc()Ljava/io/File;
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webinc:Ljava/io/File;

    return-object v0
.end method

.method public getWebxml()Ljava/io/File;
    .locals 1

    .prologue
    .line 359
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webxml:Ljava/io/File;

    return-object v0
.end method

.method public isMapped()Z
    .locals 1

    .prologue
    .line 225
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->mapped:Z

    return v0
.end method

.method protected mapToJavaFile(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;Ljava/io/File;Ljava/io/File;Ljava/io/File;)Ljava/io/File;
    .locals 3
    .param p1, "mangler"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;
    .param p2, "srcFile"    # Ljava/io/File;
    .param p3, "srcDir"    # Ljava/io/File;
    .param p4, "dest"    # Ljava/io/File;

    .prologue
    .line 652
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ".jsp"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 653
    const/4 v1, 0x0

    .line 657
    :goto_0
    return-object v1

    .line 655
    :cond_0
    invoke-interface {p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;->mapJspToJavaName(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 657
    .local v0, "javaFileName":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected resetFileLists()V
    .locals 1

    .prologue
    .line 561
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 562
    return-void
.end method

.method protected scanDir(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;[Ljava/lang/String;)V
    .locals 10
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "dest"    # Ljava/io/File;
    .param p3, "mangler"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;
    .param p4, "files"    # [Ljava/lang/String;

    .prologue
    .line 575
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v7}, Ljava/util/Date;->getTime()J

    move-result-wide v4

    .line 577
    .local v4, "now":J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, p4

    if-ge v1, v7, :cond_3

    .line 578
    aget-object v0, p4, v1

    .line 579
    .local v0, "filename":Ljava/lang/String;
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 580
    .local v6, "srcFile":Ljava/io/File;
    invoke-virtual {p0, p3, v6, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->mapToJavaFile(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;Ljava/io/File;Ljava/io/File;Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 581
    .local v2, "javaFile":Ljava/io/File;
    if-nez v2, :cond_1

    .line 577
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 585
    :cond_1
    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v7, v8, v4

    if-lez v7, :cond_2

    .line 586
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Warning: file modified in the future: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 589
    :cond_2
    const/4 v3, 0x0

    .line 590
    .local v3, "shouldCompile":Z
    invoke-direct {p0, v6, v2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->isCompileNeeded(Ljava/io/File;Ljava/io/File;)Z

    move-result v3

    .line 591
    if-eqz v3, :cond_0

    .line 592
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compileList:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 593
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->javaFiles:Ljava/util/Vector;

    invoke-virtual {v7, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    .line 596
    .end local v0    # "filename":Ljava/lang/String;
    .end local v2    # "javaFile":Ljava/io/File;
    .end local v3    # "shouldCompile":Z
    .end local v6    # "srcFile":Ljava/io/File;
    :cond_3
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "cp"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 281
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 285
    :goto_0
    return-void

    .line 283
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 303
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 304
    return-void
.end method

.method public setCompiler(Ljava/lang/String;)V
    .locals 0
    .param p1, "compiler"    # Ljava/lang/String;

    .prologue
    .line 408
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerName:Ljava/lang/String;

    .line 409
    return-void
.end method

.method public setCompilerclasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "cp"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 319
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 320
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    .line 324
    :goto_0
    return-void

    .line 322
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->compilerClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 145
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->destDir:Ljava/io/File;

    .line 146
    return-void
.end method

.method public setFailonerror(Z)V
    .locals 0
    .param p1, "fail"    # Z

    .prologue
    .line 194
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->failOnError:Z

    .line 195
    return-void
.end method

.method public setIeplugin(Ljava/lang/String;)V
    .locals 0
    .param p1, "iepluginid"    # Ljava/lang/String;

    .prologue
    .line 216
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->iepluginid:Ljava/lang/String;

    .line 217
    return-void
.end method

.method public setMapped(Z)V
    .locals 0
    .param p1, "mapped"    # Z

    .prologue
    .line 234
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->mapped:Z

    .line 235
    return-void
.end method

.method public setPackage(Ljava/lang/String;)V
    .locals 0
    .param p1, "pkg"    # Ljava/lang/String;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->packageName:Ljava/lang/String;

    .line 162
    return-void
.end method

.method public setSrcDir(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "srcDir"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->src:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 125
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->src:Lorg/apache/tools/ant/types/Path;

    .line 129
    :goto_0
    return-void

    .line 127
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setUribase(Ljava/io/File;)V
    .locals 2
    .param p1, "uribase"    # Ljava/io/File;

    .prologue
    .line 245
    const-string/jumbo v0, "Uribase is currently an unused parameter"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 246
    return-void
.end method

.method public setUriroot(Ljava/io/File;)V
    .locals 0
    .param p1, "uriroot"    # Ljava/io/File;

    .prologue
    .line 263
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->uriroot:Ljava/io/File;

    .line 264
    return-void
.end method

.method public setVerbose(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 177
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->verbose:I

    .line 178
    return-void
.end method

.method public setWebinc(Ljava/io/File;)V
    .locals 0
    .param p1, "webinc"    # Ljava/io/File;

    .prologue
    .line 368
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webinc:Ljava/io/File;

    .line 369
    return-void
.end method

.method public setWebxml(Ljava/io/File;)V
    .locals 0
    .param p1, "webxml"    # Ljava/io/File;

    .prologue
    .line 351
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->webxml:Ljava/io/File;

    .line 352
    return-void
.end method
