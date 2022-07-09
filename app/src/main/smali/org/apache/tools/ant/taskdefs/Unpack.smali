.class public abstract Lorg/apache/tools/ant/taskdefs/Unpack;
.super Lorg/apache/tools/ant/Task;
.source "Unpack.java"


# static fields
.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field protected dest:Ljava/io/File;

.field protected source:Ljava/io/File;

.field protected srcResource:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 94
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

.method private createDestFile(Ljava/lang/String;)V
    .locals 6
    .param p1, "defaultExtension"    # Ljava/lang/String;

    .prologue
    .line 143
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->source:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 144
    .local v1, "sourceName":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 145
    .local v0, "len":I
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v0, v2, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int v2, v0, v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 149
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int v5, v0, v5

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    .line 154
    :goto_0
    return-void

    .line 152
    :cond_0
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    invoke-direct {v2, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    goto :goto_0
.end method

.method private validate()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->srcResource:Lorg/apache/tools/ant/types/Resource;

    if-nez v1, :cond_0

    .line 129
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No Src specified"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 132
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    if-nez v1, :cond_1

    .line 133
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->source:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    .line 136
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->getDefaultExtension()Ljava/lang/String;

    move-result-object v0

    .line 138
    .local v0, "defaultExtension":Ljava/lang/String;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->createDestFile(Ljava/lang/String;)V

    .line 140
    .end local v0    # "defaultExtension":Ljava/lang/String;
    :cond_2
    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 112
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 113
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported as archives"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 117
    return-void
.end method

.method public execute()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    .line 163
    .local v0, "savedDest":Ljava/io/File;
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->validate()V

    .line 164
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->extract()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    .line 168
    return-void

    .line 166
    :catchall_0
    move-exception v1

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    throw v1
.end method

.method protected abstract extract()V
.end method

.method protected abstract getDefaultExtension()Ljava/lang/String;
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 124
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->dest:Ljava/io/File;

    .line 125
    return-void
.end method

.method public setDest(Ljava/lang/String;)V
    .locals 1
    .param p1, "dest"    # Ljava/lang/String;

    .prologue
    .line 68
    const-string/jumbo v0, "DEPRECATED - The setDest(String) method has been deprecated. Use setDest(File) instead."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->log(Ljava/lang/String;)V

    .line 70
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->setDest(Ljava/io/File;)V

    .line 71
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 78
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 79
    return-void
.end method

.method public setSrc(Ljava/lang/String;)V
    .locals 1
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 53
    const-string/jumbo v0, "DEPRECATED - The setSrc(String) method has been deprecated. Use setSrc(File) instead."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->log(Ljava/lang/String;)V

    .line 55
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Unpack;->setSrc(Ljava/io/File;)V

    .line 56
    return-void
.end method

.method public setSrcResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 4
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 86
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 87
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "the archive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t exist"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 90
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 91
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "the archive "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " can\'t be a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 94
    :cond_1
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Unpack;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_3

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Unpack;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Unpack;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 95
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_4

    .line 96
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->source:Ljava/io/File;

    .line 104
    :cond_2
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Unpack;->srcResource:Lorg/apache/tools/ant/types/Resource;

    .line 105
    return-void

    .line 94
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_3
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Unpack;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 97
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Unpack;->supportsNonFileResources()Z

    move-result v1

    if-nez v1, :cond_2

    .line 98
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not a FileSystem "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "Only FileSystem resources are"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " supported."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected supportsNonFileResources()Z
    .locals 1

    .prologue
    .line 191
    const/4 v0, 0x0

    return v0
.end method
