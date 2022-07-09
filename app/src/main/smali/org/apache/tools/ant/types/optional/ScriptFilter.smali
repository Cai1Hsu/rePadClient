.class public Lorg/apache/tools/ant/types/optional/ScriptFilter;
.super Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;
.source "ScriptFilter.java"


# instance fields
.field private helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

.field private runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

.field private token:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;-><init>()V

    .line 43
    new-instance v0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    return-void
.end method

.method private init()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    if-eqz v0, :cond_0

    .line 79
    :goto_0
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getScriptRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    goto :goto_0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->addText(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-direct {p0}, Lorg/apache/tools/ant/types/optional/ScriptFilter;->init()V

    .line 109
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/optional/ScriptFilter;->setToken(Ljava/lang/String;)V

    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    const-string/jumbo v1, "ant_filter"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->executeScript(Ljava/lang/String;)V

    .line 111
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/ScriptFilter;->getToken()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->token:Ljava/lang/String;

    return-object v0
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 147
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V

    .line 166
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 1
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setLanguage(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public setManager(Ljava/lang/String;)V
    .locals 1
    .param p1, "manager"    # Ljava/lang/String;

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setManager(Ljava/lang/String;)V

    .line 139
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 56
    invoke-super {p0, p1}, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 57
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setProjectComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 58
    return-void
.end method

.method public setSetBeans(Z)V
    .locals 1
    .param p1, "setBeans"    # Z

    .prologue
    .line 180
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSetBeans(Z)V

    .line 181
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSrc(Ljava/io/File;)V

    .line 121
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 87
    iput-object p1, p0, Lorg/apache/tools/ant/types/optional/ScriptFilter;->token:Ljava/lang/String;

    .line 88
    return-void
.end method
