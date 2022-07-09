.class public Lorg/apache/tools/ant/taskdefs/compilers/Jvc;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Jvc.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 41
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v9, "Using jvc compiler"

    const/4 v10, 0x3

    invoke-virtual {v8, v9, v10}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 43
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v0, v8}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 47
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->getBootClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    .line 48
    .local v6, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v8

    if-lez v8, :cond_0

    .line 49
    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 52
    :cond_0
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->includeJavaRuntime:Z

    if-eqz v8, :cond_1

    .line 55
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/Path;->addExtdirs(Lorg/apache/tools/ant/types/Path;)V

    .line 58
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v8

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 62
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-eqz v8, :cond_a

    .line 63
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 68
    :goto_0
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 69
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Javac;->getExecutable()Ljava/lang/String;

    move-result-object v2

    .line 70
    .local v2, "exec":Ljava/lang/String;
    if-nez v2, :cond_2

    const-string/jumbo v2, "jvc"

    .end local v2    # "exec":Ljava/lang/String;
    :cond_2
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 72
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->destDir:Ljava/io/File;

    if-eqz v8, :cond_3

    .line 73
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/d"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 74
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->destDir:Ljava/io/File;

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 78
    :cond_3
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/cp:p"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 79
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 81
    const/4 v4, 0x1

    .line 82
    .local v4, "msExtensions":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    const-string/jumbo v9, "build.compiler.jvc.extensions"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "mse":Ljava/lang/String;
    if-eqz v5, :cond_4

    .line 84
    invoke-static {v5}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 87
    :cond_4
    if-eqz v4, :cond_5

    .line 89
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/x-"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 91
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/nomessage"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 95
    :cond_5
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/nologo"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 97
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->debug:Z

    if-eqz v8, :cond_6

    .line 98
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/g"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 100
    :cond_6
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->optimize:Z

    if-eqz v8, :cond_7

    .line 101
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/O"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 103
    :cond_7
    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->verbose:Z

    if-eqz v8, :cond_8

    .line 104
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v8

    const-string/jumbo v9, "/verbose"

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 107
    :cond_8
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->addCurrentCompilerArgs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 109
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v3

    .line 110
    .local v3, "firstFileName":I
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 112
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v3, v7}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->executeExternalCompile([Ljava/lang/String;IZ)I

    move-result v8

    if-nez v8, :cond_9

    const/4 v7, 0x1

    :cond_9
    return v7

    .line 65
    .end local v1    # "cmd":Lorg/apache/tools/ant/types/Commandline;
    .end local v3    # "firstFileName":I
    .end local v4    # "msExtensions":Z
    .end local v5    # "mse":Ljava/lang/String;
    :cond_a
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto/16 :goto_0
.end method
