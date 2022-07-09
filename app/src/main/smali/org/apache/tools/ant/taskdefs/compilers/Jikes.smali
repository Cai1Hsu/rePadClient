.class public Lorg/apache/tools/ant/taskdefs/compilers/Jikes;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Jikes.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method

.method private addPropertyParams(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 7
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v6, 0x1

    .line 177
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v5, "build.compiler.emacs"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "emacsProperty":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 179
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "+E"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 188
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v5, "build.compiler.warnings"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 189
    .local v3, "warningsProperty":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 190
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v5, "!! the build.compiler.warnings property is deprecated. !!"

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 192
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v5, "!! Use the nowarn attribute instead. !!"

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 193
    invoke-static {v3}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 194
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-nowarn"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 197
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javac;->getNowarn()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 198
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "-nowarn"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 204
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v5, "build.compiler.pedantic"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 205
    .local v2, "pedanticProperty":Ljava/lang/String;
    if-eqz v2, :cond_3

    invoke-static {v2}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 206
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "+P"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 214
    :cond_3
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v5, "build.compiler.fulldepend"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 215
    .local v1, "fullDependProperty":Ljava/lang/String;
    if-eqz v1, :cond_4

    invoke-static {v1}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 217
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v4

    const-string/jumbo v5, "+F"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 219
    :cond_4
    return-void
.end method


# virtual methods
.method public execute()Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 47
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v11, "Using jikes compiler"

    const/4 v12, 0x3

    invoke-virtual {v10, v11, v12}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 49
    new-instance v2, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 53
    .local v2, "cmd":Lorg/apache/tools/ant/types/Commandline;
    const/4 v8, 0x0

    .line 54
    .local v8, "sourcepath":Lorg/apache/tools/ant/types/Path;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-eqz v10, :cond_10

    .line 55
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    .line 61
    :goto_0
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v10

    if-lez v10, :cond_0

    .line 62
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-sourcepath"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 63
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v10, v8}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 66
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v1, v10}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 68
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-eqz v10, :cond_1

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v10

    if-nez v10, :cond_2

    .line 70
    :cond_1
    iput-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->includeJavaRuntime:Z

    .line 77
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v10

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 80
    const-string/jumbo v10, "jikes.class.path"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 81
    .local v6, "jikesPath":Ljava/lang/String;
    if-eqz v6, :cond_3

    .line 82
    new-instance v10, Lorg/apache/tools/ant/types/Path;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v10, v11, v6}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-virtual {v1, v10}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 85
    :cond_3
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-eqz v10, :cond_4

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v10

    if-lez v10, :cond_4

    .line 86
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-extdirs"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 87
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 90
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v10

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javac;->getExecutable()Ljava/lang/String;

    move-result-object v4

    .line 91
    .local v4, "exec":Ljava/lang/String;
    if-nez v4, :cond_5

    const-string/jumbo v4, "jikes"

    .end local v4    # "exec":Ljava/lang/String;
    :cond_5
    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 93
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->deprecation:Z

    if-eqz v10, :cond_6

    .line 94
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-deprecation"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 97
    :cond_6
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->destDir:Ljava/io/File;

    if-eqz v10, :cond_7

    .line 98
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-d"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 99
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->destDir:Ljava/io/File;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 102
    :cond_7
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-classpath"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v10, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 105
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->encoding:Ljava/lang/String;

    if-eqz v10, :cond_8

    .line 106
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-encoding"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 107
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->encoding:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 109
    :cond_8
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->debug:Z

    if-eqz v10, :cond_12

    .line 110
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javac;->getDebugLevel()Ljava/lang/String;

    move-result-object v3

    .line 111
    .local v3, "debugLevel":Ljava/lang/String;
    if-eqz v3, :cond_11

    .line 112
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "-g:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 119
    .end local v3    # "debugLevel":Ljava/lang/String;
    :goto_1
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->optimize:Z

    if-eqz v10, :cond_9

    .line 120
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-O"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 122
    :cond_9
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->verbose:Z

    if-eqz v10, :cond_a

    .line 123
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-verbose"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 125
    :cond_a
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->depend:Z

    if-eqz v10, :cond_b

    .line 126
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-depend"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 129
    :cond_b
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->target:Ljava/lang/String;

    if-eqz v10, :cond_c

    .line 130
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-target"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 131
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->target:Ljava/lang/String;

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 134
    :cond_c
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->addPropertyParams(Lorg/apache/tools/ant/types/Commandline;)V

    .line 136
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javac;->getSource()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_e

    .line 137
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-source"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 138
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Javac;->getSource()Ljava/lang/String;

    move-result-object v7

    .line 139
    .local v7, "source":Ljava/lang/String;
    const-string/jumbo v10, "1.1"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_d

    const-string/jumbo v10, "1.2"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_13

    .line 142
    :cond_d
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Jikes doesn\'t support \'-source "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\', will use \'-source 1.3\' instead"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;)V

    .line 144
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "1.3"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 149
    .end local v7    # "source":Ljava/lang/String;
    :cond_e
    :goto_2
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->addCurrentCompilerArgs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 151
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v5

    .line 153
    .local v5, "firstFileName":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->getBootClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 154
    .local v0, "boot":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v10

    if-lez v10, :cond_f

    .line 155
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-bootclasspath"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 156
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v10, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 158
    :cond_f
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 160
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v10

    invoke-virtual {p0, v10, v5}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->executeExternalCompile([Ljava/lang/String;I)I

    move-result v10

    if-nez v10, :cond_14

    :goto_3
    return v9

    .line 57
    .end local v0    # "boot":Lorg/apache/tools/ant/types/Path;
    .end local v1    # "classpath":Lorg/apache/tools/ant/types/Path;
    .end local v5    # "firstFileName":I
    .end local v6    # "jikesPath":Ljava/lang/String;
    :cond_10
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;->src:Lorg/apache/tools/ant/types/Path;

    goto/16 :goto_0

    .line 114
    .restart local v1    # "classpath":Lorg/apache/tools/ant/types/Path;
    .restart local v3    # "debugLevel":Ljava/lang/String;
    .restart local v6    # "jikesPath":Ljava/lang/String;
    :cond_11
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-g"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 117
    .end local v3    # "debugLevel":Ljava/lang/String;
    :cond_12
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    const-string/jumbo v11, "-g:none"

    invoke-virtual {v10, v11}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 146
    .restart local v7    # "source":Ljava/lang/String;
    :cond_13
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v10

    invoke-virtual {v10, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_2

    .line 160
    .end local v7    # "source":Ljava/lang/String;
    .restart local v0    # "boot":Lorg/apache/tools/ant/types/Path;
    .restart local v5    # "firstFileName":I
    :cond_14
    const/4 v9, 0x0

    goto :goto_3
.end method
