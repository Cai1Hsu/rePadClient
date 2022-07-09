.class public Lorg/apache/tools/ant/util/ScriptRunnerHelper;
.super Ljava/lang/Object;
.source "ScriptRunnerHelper.java"


# instance fields
.field private cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

.field private language:Ljava/lang/String;

.field private manager:Ljava/lang/String;

.field private projectComponent:Lorg/apache/tools/ant/ProjectComponent;

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private scriptLoader:Ljava/lang/ClassLoader;

.field private setBeans:Z

.field private srcFile:Ljava/io/File;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    .line 34
    const-string/jumbo v0, "auto"

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->manager:Ljava/lang/String;

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setBeans:Z

    .line 39
    iput-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;

    .line 40
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->resources:Lorg/apache/tools/ant/types/resources/Union;

    return-void
.end method

.method private declared-synchronized generateClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 168
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    :goto_0
    monitor-exit p0

    return-object v0

    .line 171
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    if-nez v0, :cond_1

    .line 172
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;

    .line 173
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;

    goto :goto_0

    .line 175
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;

    .line 176
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 168
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private getClassPathDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    if-nez v0, :cond_0

    .line 181
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->projectComponent:Lorg/apache/tools/ant/ProjectComponent;

    invoke-static {v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->getDelegate(Lorg/apache/tools/ant/ProjectComponent;)Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    .line 183
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->cpDelegate:Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    return-object v0
.end method

.method private getRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;
    .locals 4

    .prologue
    .line 190
    new-instance v0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;

    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->projectComponent:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerCreator;-><init>(Lorg/apache/tools/ant/Project;)V

    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->manager:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->language:Ljava/lang/String;

    invoke-direct {p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->generateClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->createRunner(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "resource"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 201
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 202
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 116
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->text:Ljava/lang/String;

    .line 117
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getClassPathDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->language:Ljava/lang/String;

    return-object v0
.end method

.method public getScriptRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;
    .locals 2

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    .line 56
    .local v0, "runner":Lorg/apache/tools/ant/util/ScriptRunnerBase;
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->srcFile:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 57
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->srcFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->setSrc(Ljava/io/File;)V

    .line 59
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->text:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 60
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addText(Ljava/lang/String;)V

    .line 62
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v1, :cond_2

    .line 63
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->loadResources(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 65
    :cond_2
    iget-boolean v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setBeans:Z

    if-eqz v1, :cond_3

    .line 66
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->projectComponent:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->bindToComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 70
    :goto_0
    return-object v0

    .line 68
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->projectComponent:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->bindToComponentMinimum(Lorg/apache/tools/ant/ProjectComponent;)V

    goto :goto_0
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 164
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->scriptLoader:Ljava/lang/ClassLoader;

    .line 165
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 88
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getClassPathDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 89
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 98
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getClassPathDelegate()Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->setClasspathref(Lorg/apache/tools/ant/types/Reference;)V

    .line 99
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->language:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setManager(Ljava/lang/String;)V
    .locals 0
    .param p1, "manager"    # Ljava/lang/String;

    .prologue
    .line 125
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->manager:Ljava/lang/String;

    .line 126
    return-void
.end method

.method public setProjectComponent(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 0
    .param p1, "component"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 47
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->projectComponent:Lorg/apache/tools/ant/ProjectComponent;

    .line 48
    return-void
.end method

.method public setSetBeans(Z)V
    .locals 0
    .param p1, "setBeans"    # Z

    .prologue
    .line 156
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setBeans:Z

    .line 157
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 107
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->srcFile:Ljava/io/File;

    .line 108
    return-void
.end method
