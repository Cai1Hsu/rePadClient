.class public Lorg/apache/tools/ant/types/optional/ScriptSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelector;
.source "ScriptSelector.java"


# instance fields
.field private basedir:Ljava/io/File;

.field private file:Ljava/io/File;

.field private filename:Ljava/lang/String;

.field private helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

.field private runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

.field private selected:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;-><init>()V

    .line 39
    new-instance v0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

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
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    if-eqz v0, :cond_0

    .line 96
    :goto_0
    return-void

    .line 95
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getScriptRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    goto :goto_0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->addText(Ljava/lang/String;)V

    .line 114
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getBasedir()Ljava/io/File;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->basedir:Ljava/io/File;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->file:Ljava/io/File;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public isSelected()Z
    .locals 1

    .prologue
    .line 211
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->selected:Z

    return v0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 2
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 170
    invoke-direct {p0}, Lorg/apache/tools/ant/types/optional/ScriptSelector;->init()V

    .line 171
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/optional/ScriptSelector;->setSelected(Z)V

    .line 172
    iput-object p3, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->file:Ljava/io/File;

    .line 173
    iput-object p1, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->basedir:Ljava/io/File;

    .line 174
    iput-object p2, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->filename:Ljava/lang/String;

    .line 175
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    const-string/jumbo v1, "basedir"

    invoke-virtual {v0, v1, p1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 176
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    const-string/jumbo v1, "filename"

    invoke-virtual {v0, v1, p2}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 177
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1, p3}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 178
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->runner:Lorg/apache/tools/ant/util/ScriptRunnerBase;

    const-string/jumbo v1, "ant_selector"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->executeScript(Ljava/lang/String;)V

    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/ScriptSelector;->isSelected()Z

    move-result v0

    return v0
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 123
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V

    .line 142
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 1
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setLanguage(Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method public setManager(Ljava/lang/String;)V
    .locals 1
    .param p1, "manager"    # Ljava/lang/String;

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setManager(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 63
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 64
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setProjectComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 65
    return-void
.end method

.method public setSelected(Z)V
    .locals 0
    .param p1, "selected"    # Z

    .prologue
    .line 220
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->selected:Z

    .line 221
    return-void
.end method

.method public setSetBeans(Z)V
    .locals 1
    .param p1, "setBeans"    # Z

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSetBeans(Z)V

    .line 156
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/ScriptSelector;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSrc(Ljava/io/File;)V

    .line 105
    return-void
.end method
