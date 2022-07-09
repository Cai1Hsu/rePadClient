.class public Lorg/apache/tools/ant/taskdefs/WhichResource;
.super Lorg/apache/tools/ant/Task;
.source "WhichResource.java"


# instance fields
.field private classname:Ljava/lang/String;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private property:Ljava/lang/String;

.field private resource:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method

.method private validate()V
    .locals 3

    .prologue
    .line 100
    const/4 v0, 0x0

    .line 101
    .local v0, "setcount":I
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classname:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 102
    add-int/lit8 v0, v0, 0x1

    .line 104
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 105
    add-int/lit8 v0, v0, 0x1

    .line 109
    :cond_1
    if-nez v0, :cond_2

    .line 110
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "One of classname or resource must be specified"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    :cond_2
    const/4 v1, 0x1

    if-le v0, v1, :cond_3

    .line 114
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Only one of classname or resource can be specified"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->property:Ljava/lang/String;

    if-nez v1, :cond_4

    .line 118
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No property defined"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 120
    :cond_4
    return-void
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 81
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 83
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    .line 127
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->validate()V

    .line 128
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v3, :cond_2

    .line 129
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v4, "ignore"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "using user supplied classpath: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 138
    :goto_0
    const/4 v0, 0x0

    .line 140
    .local v0, "loader":Lorg/apache/tools/ant/AntClassLoader;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getCoreLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    const/4 v6, 0x0

    invoke-static {v3, v4, v5, v6}, Lorg/apache/tools/ant/AntClassLoader;->newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    .line 143
    const/4 v1, 0x0

    .line 144
    .local v1, "loc":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classname:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 146
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classname:Ljava/lang/String;

    const/16 v5, 0x2e

    const/16 v6, 0x2f

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ".class"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    .line 149
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 150
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "One of class or resource is required"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 166
    .end local v1    # "loc":Ljava/lang/String;
    :catchall_0
    move-exception v3

    if-eqz v0, :cond_1

    .line 167
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_1
    throw v3

    .line 133
    .end local v0    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    :cond_2
    new-instance v3, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 134
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    const-string/jumbo v4, "only"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 135
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "using system classpath: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v6}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 153
    .restart local v0    # "loader":Lorg/apache/tools/ant/AntClassLoader;
    .restart local v1    # "loc":Ljava/lang/String;
    :cond_3
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    const-string/jumbo v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 154
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    .line 157
    :cond_4
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Searching for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/WhichResource;->log(Ljava/lang/String;I)V

    .line 159
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/AntClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 160
    .local v2, "url":Ljava/net/URL;
    if-eqz v2, :cond_5

    .line 162
    invoke-virtual {v2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v1

    .line 163
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->property:Ljava/lang/String;

    invoke-virtual {v3, v4, v1}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 166
    :cond_5
    if-eqz v0, :cond_6

    .line 167
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 170
    :cond_6
    return-void
.end method

.method public setClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 187
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classname:Ljava/lang/String;

    .line 188
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "cp"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 69
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 73
    :goto_0
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/WhichResource;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 94
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->property:Ljava/lang/String;

    .line 197
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 0
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    .line 178
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/WhichResource;->resource:Ljava/lang/String;

    .line 179
    return-void
.end method
