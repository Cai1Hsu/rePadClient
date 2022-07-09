.class public Lorg/apache/tools/ant/taskdefs/compilers/Kjc;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Kjc.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 42
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v3, "Using kjc compiler"

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 43
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->setupKjcCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    .line 44
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    const-string/jumbo v2, "at.dms.kjc.Main"

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 45
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecuteJava;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;-><init>()V

    .line 46
    .local v1, "ej":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setJavaCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 47
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->fork(Lorg/apache/tools/ant/ProjectComponent;)I

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected setupKjcCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 6

    .prologue
    .line 55
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 58
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 60
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->deprecation:Z

    if-eqz v4, :cond_0

    .line 61
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-deprecation"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 64
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->destDir:Ljava/io/File;

    if-eqz v4, :cond_1

    .line 65
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-d"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 66
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->destDir:Ljava/io/File;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 70
    :cond_1
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-classpath"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 72
    new-instance v2, Lorg/apache/tools/ant/types/Path;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 75
    .local v2, "cp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->getBootClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    .line 76
    .local v3, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 77
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 80
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-eqz v4, :cond_3

    .line 81
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/Path;->addExtdirs(Lorg/apache/tools/ant/types/Path;)V

    .line 84
    :cond_3
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 85
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-eqz v4, :cond_8

    .line 86
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 91
    :goto_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 95
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->encoding:Ljava/lang/String;

    if-eqz v4, :cond_4

    .line 96
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-encoding"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->encoding:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 100
    :cond_4
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->debug:Z

    if-eqz v4, :cond_5

    .line 101
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-g"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 104
    :cond_5
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->optimize:Z

    if-eqz v4, :cond_6

    .line 105
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-O2"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 108
    :cond_6
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->verbose:Z

    if-eqz v4, :cond_7

    .line 109
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-verbose"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 112
    :cond_7
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->addCurrentCompilerArgs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 114
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 115
    return-object v1

    .line 88
    :cond_8
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method
