.class public Lorg/apache/tools/ant/taskdefs/compilers/Sj;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Sj.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
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
    .line 39
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/Sj;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v4, "Using symantec java compiler"

    const/4 v5, 0x3

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 41
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Sj;->setupJavacCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    .line 42
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/Sj;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javac;->getExecutable()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "exec":Ljava/lang/String;
    if-nez v1, :cond_0

    const-string/jumbo v1, "sj"

    .end local v1    # "exec":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/Sj;->compileList:[Ljava/io/File;

    array-length v4, v4

    sub-int v2, v3, v4

    .line 47
    .local v2, "firstFileName":I
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lorg/apache/tools/ant/taskdefs/compilers/Sj;->executeExternalCompile([Ljava/lang/String;I)I

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected getNoDebugArgument()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    const/4 v0, 0x0

    return-object v0
.end method
