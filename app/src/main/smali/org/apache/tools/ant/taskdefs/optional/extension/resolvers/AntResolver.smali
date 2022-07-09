.class public Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;
.super Ljava/lang/Object;
.source "AntResolver.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/extension/ExtensionResolver;


# instance fields
.field private antfile:Ljava/io/File;

.field private destfile:Ljava/io/File;

.field private target:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private validate()V
    .locals 3

    .prologue
    .line 98
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->antfile:Ljava/io/File;

    if-nez v1, :cond_0

    .line 99
    const-string/jumbo v0, "Must specify Buildfile"

    .line 100
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Must specify Buildfile"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 103
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->destfile:Ljava/io/File;

    if-nez v1, :cond_1

    .line 104
    const-string/jumbo v0, "Must specify destination file"

    .line 105
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Must specify destination file"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method public resolve(Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;Lorg/apache/tools/ant/Project;)Ljava/io/File;
    .locals 5
    .param p1, "extension"    # Lorg/apache/tools/ant/taskdefs/optional/extension/Extension;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->validate()V

    .line 72
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Ant;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Ant;-><init>()V

    .line 73
    .local v0, "ant":Lorg/apache/tools/ant/taskdefs/Ant;
    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/taskdefs/Ant;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 74
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Ant;->setInheritAll(Z)V

    .line 75
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->antfile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Ant;->setAntfile(Ljava/lang/String;)V

    .line 78
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->antfile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v1

    .line 80
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Ant;->setDir(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->target:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 86
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->target:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/Ant;->setTarget(Ljava/lang/String;)V

    .line 89
    :cond_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Ant;->execute()V

    .line 91
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->destfile:Ljava/io/File;

    return-object v3

    .line 81
    .end local v1    # "dir":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 82
    .local v2, "ioe":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public setAntfile(Ljava/io/File;)V
    .locals 0
    .param p1, "antfile"    # Ljava/io/File;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->antfile:Ljava/io/File;

    .line 43
    return-void
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 0
    .param p1, "destfile"    # Ljava/io/File;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->destfile:Ljava/io/File;

    .line 51
    return-void
.end method

.method public setTarget(Ljava/lang/String;)V
    .locals 0
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 58
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->target:Ljava/lang/String;

    .line 59
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 114
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Ant["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->antfile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "==>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/resolvers/AntResolver;->destfile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
