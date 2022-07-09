.class public Lorg/apache/tools/ant/taskdefs/optional/Script;
.super Lorg/apache/tools/ant/Task;
.source "Script.java"


# instance fields
.field private helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 35
    new-instance v0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->addText(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getScriptRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    const-string/jumbo v1, "ANT"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->executeScript(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 98
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V

    .line 117
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 1
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setLanguage(Ljava/lang/String;)V

    .line 71
    return-void
.end method

.method public setManager(Ljava/lang/String;)V
    .locals 1
    .param p1, "manager"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setManager(Ljava/lang/String;)V

    .line 62
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 42
    invoke-super {p0, p1}, Lorg/apache/tools/ant/Task;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 43
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setProjectComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 44
    return-void
.end method

.method public setSetBeans(Z)V
    .locals 1
    .param p1, "setBeans"    # Z

    .prologue
    .line 130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSetBeans(Z)V

    .line 131
    return-void
.end method

.method public setSrc(Ljava/lang/String;)V
    .locals 2
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/Script;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSrc(Ljava/io/File;)V

    .line 80
    return-void
.end method
