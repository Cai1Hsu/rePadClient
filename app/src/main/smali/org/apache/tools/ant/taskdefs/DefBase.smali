.class public abstract Lorg/apache/tools/ant/taskdefs/DefBase;
.super Lorg/apache/tools/ant/taskdefs/AntlibDefinition;
.source "DefBase.java"


# instance fields
.field private cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

.field private createdLoader:Ljava/lang/ClassLoader;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;-><init>()V

    return-void
.end method

.method private getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    if-nez v0, :cond_0

    .line 163
    invoke-static {p0}, Lorg/apache/tools/ant/util/ClasspathUtils;->getDelegate(Lorg/apache/tools/ant/ProjectComponent;)Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    .line 165
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    return-object v0
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 105
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected createLoader()Ljava/lang/ClassLoader;
    .locals 2

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getAntlibClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    if-nez v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getAntlibClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 149
    :goto_0
    return-object v0

    .line 141
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->createdLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_1

    .line 142
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->createdLoader:Ljava/lang/ClassLoader;

    .line 146
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->createdLoader:Ljava/lang/ClassLoader;

    check-cast v0, Lorg/apache/tools/ant/AntClassLoader;

    const-string/jumbo v1, "org.apache.tools.ant"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntClassLoader;->addSystemPackageRoot(Ljava/lang/String;)V

    .line 149
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->createdLoader:Ljava/lang/ClassLoader;

    goto :goto_0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getClasspathId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClassLoadId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLoaderId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClassLoadId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected hasCpDelegate()Z
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefBase;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public init()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 158
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;->init()V

    .line 159
    return-void
.end method

.method public isReverseLoader()Z
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->isReverseLoader()Z

    move-result v0

    return v0
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 96
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 97
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 114
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->setClasspathref(Lorg/apache/tools/ant/types/Reference;)V

    .line 115
    return-void
.end method

.method public setLoaderRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 130
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->setLoaderRef(Lorg/apache/tools/ant/types/Reference;)V

    .line 131
    return-void
.end method

.method public setReverseLoader(Z)V
    .locals 2
    .param p1, "reverseLoader"    # Z

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;->getDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->setReverseLoader(Z)V

    .line 56
    const-string/jumbo v0, "The reverseloader attribute is DEPRECATED. It will be removed"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/DefBase;->log(Ljava/lang/String;I)V

    .line 58
    return-void
.end method
