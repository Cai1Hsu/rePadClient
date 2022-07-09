.class public Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "AptExternalCompilerAdapter.java"


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
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 50
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v5, "Using external apt compiler"

    const/4 v6, 0x3

    invoke-virtual {v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 54
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;->getApt()Lorg/apache/tools/ant/taskdefs/Apt;

    move-result-object v0

    .line 55
    .local v0, "apt":Lorg/apache/tools/ant/taskdefs/Apt;
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 56
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Apt;->getAptExecutable()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;->setupModernJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)Lorg/apache/tools/ant/types/Commandline;

    .line 58
    invoke-static {v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/AptCompilerAdapter;->setAptCommandlineSwitches(Lorg/apache/tools/ant/taskdefs/Apt;Lorg/apache/tools/ant/types/Commandline;)V

    .line 59
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->size()I

    move-result v2

    .line 61
    .local v2, "firstFileName":I
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 64
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v2, v3}, Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;->executeExternalCompile([Ljava/lang/String;IZ)I

    move-result v4

    if-nez v4, :cond_0

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method protected getApt()Lorg/apache/tools/ant/taskdefs/Apt;
    .locals 1

    .prologue
    .line 41
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/AptExternalCompilerAdapter;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Apt;

    return-object v0
.end method
