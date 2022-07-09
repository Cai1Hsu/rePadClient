.class public Lorg/apache/tools/ant/taskdefs/compilers/Gcj;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Gcj.java"


# static fields
.field private static final CONFLICT_WITH_DASH_C:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 155
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "-o"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "--main="

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "-D"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "-fjni"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "-L"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->CONFLICT_WITH_DASH_C:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
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
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v3, "Using gcj compiler"

    const/4 v4, 0x3

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 43
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->setupGCJCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    .line 45
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v1

    .line 46
    .local v1, "firstFileName":I
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 48
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->executeExternalCompile([Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isNativeBuild()Z
    .locals 6

    .prologue
    .line 139
    const/4 v3, 0x0

    .line 140
    .local v3, "nativeBuild":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Javac;->getCurrentCompilerArgs()[Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "additionalArguments":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 142
    .local v1, "argsLength":I
    :goto_0
    if-nez v3, :cond_1

    array-length v4, v0

    if-ge v1, v4, :cond_1

    .line 143
    const/4 v2, 0x0

    .line 145
    .local v2, "conflictLength":I
    :goto_1
    if-nez v3, :cond_0

    sget-object v4, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->CONFLICT_WITH_DASH_C:[Ljava/lang/String;

    array-length v4, v4

    if-ge v2, v4, :cond_0

    .line 146
    aget-object v4, v0, v1

    sget-object v5, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->CONFLICT_WITH_DASH_C:[Ljava/lang/String;

    aget-object v5, v5, v2

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    .line 148
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 150
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 152
    .end local v2    # "conflictLength":I
    :cond_1
    return v3
.end method

.method protected setupGCJCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 9

    .prologue
    .line 57
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 58
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v0, v6}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 62
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->getBootClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    .line 63
    .local v3, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v6

    if-lez v6, :cond_0

    .line 64
    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 69
    :cond_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-nez v6, :cond_1

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->includeJavaRuntime:Z

    if-eqz v6, :cond_2

    .line 70
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/Path;->addExtdirs(Lorg/apache/tools/ant/types/Path;)V

    .line 73
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 77
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-eqz v6, :cond_4

    .line 78
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 83
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getExecutable()Ljava/lang/String;

    move-result-object v2

    .line 84
    .local v2, "exec":Ljava/lang/String;
    if-nez v2, :cond_3

    const-string/jumbo v2, "gcj"

    .end local v2    # "exec":Ljava/lang/String;
    :cond_3
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 86
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->destDir:Ljava/io/File;

    if-eqz v6, :cond_5

    .line 87
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-d"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 88
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->destDir:Ljava/io/File;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 90
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->destDir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->destDir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v6

    if-nez v6, :cond_5

    .line 91
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Can\'t make output directories. Maybe permission is wrong. "

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 80
    :cond_4
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0

    .line 96
    :cond_5
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-classpath"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 99
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->encoding:Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 100
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "--encoding="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->encoding:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 102
    :cond_6
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->debug:Z

    if-eqz v6, :cond_7

    .line 103
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-g1"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 105
    :cond_7
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->optimize:Z

    if-eqz v6, :cond_8

    .line 106
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-O"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 113
    :cond_8
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->isNativeBuild()Z

    move-result v6

    if-nez v6, :cond_9

    .line 114
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-C"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 117
    :cond_9
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getSource()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_a

    .line 118
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getSource()Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, "source":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "-fsource="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 122
    .end local v4    # "source":Ljava/lang/String;
    :cond_a
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getTarget()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_b

    .line 123
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getTarget()Ljava/lang/String;

    move-result-object v5

    .line 124
    .local v5, "target":Ljava/lang/String;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "-ftarget="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 127
    .end local v5    # "target":Ljava/lang/String;
    :cond_b
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;->addCurrentCompilerArgs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 129
    return-object v1
.end method
