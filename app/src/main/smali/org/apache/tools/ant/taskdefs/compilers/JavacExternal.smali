.class public Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "JavacExternal.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method

.method private execOnVMS(Lorg/apache/tools/ant/types/Commandline;I)Z
    .locals 7
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "firstFileName"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 74
    const/4 v2, 0x0

    .line 76
    .local v2, "vmsFile":Ljava/io/File;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/util/JavaEnvUtils;->createVmsJavaOptionFile([Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 77
    const/4 v5, 0x3

    new-array v0, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getExecutable()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v5

    const/4 v5, 0x1

    const-string/jumbo v6, "-V"

    aput-object v6, v0, v5

    const/4 v5, 0x2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v5

    .line 80
    .local v0, "commandLine":[Ljava/lang/String;
    const/4 v5, 0x1

    invoke-virtual {p0, v0, p2, v5}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->executeExternalCompile([Ljava/lang/String;IZ)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_0

    .line 87
    :goto_0
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->delete(Ljava/io/File;)V

    return v3

    :cond_0
    move v3, v4

    .line 80
    goto :goto_0

    .line 84
    .end local v0    # "commandLine":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 85
    .local v1, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Failed to create a temporary file for \"-V\" switch"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 87
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->delete(Ljava/io/File;)V

    throw v3
.end method


# virtual methods
.method public execute()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 44
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v4, "Using external javac compiler"

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 46
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 47
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javac;->getJavacExecutable()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->assumeJava11()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->assumeJava12()Z

    move-result v3

    if-nez v3, :cond_1

    .line 49
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->setupModernJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)Lorg/apache/tools/ant/types/Commandline;

    .line 53
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->assumeJava11()Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v1, -0x1

    .line 54
    .local v1, "firstFileName":I
    :goto_1
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 58
    const-string/jumbo v3, "openvms"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 59
    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->execOnVMS(Lorg/apache/tools/ant/types/Commandline;I)Z

    move-result v2

    .line 61
    :cond_0
    :goto_2
    return v2

    .line 51
    .end local v1    # "firstFileName":I
    :cond_1
    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->setupJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;Z)Lorg/apache/tools/ant/types/Commandline;

    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v1

    goto :goto_1

    .line 61
    .restart local v1    # "firstFileName":I
    :cond_3
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v1, v2}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;->executeExternalCompile([Ljava/lang/String;IZ)I

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x0

    goto :goto_2
.end method
