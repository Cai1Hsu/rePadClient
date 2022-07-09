.class public Lorg/apache/tools/ant/taskdefs/PreSetDef;
.super Lorg/apache/tools/ant/taskdefs/AntlibDefinition;
.source "PreSetDef.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    }
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private nestedTask:Lorg/apache/tools/ant/UnknownElement;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AntlibDefinition;-><init>()V

    .line 107
    return-void
.end method


# virtual methods
.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 2
    .param p1, "nestedTask"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->nestedTask:Lorg/apache/tools/ant/UnknownElement;

    if-eqz v0, :cond_0

    .line 61
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one nested element allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    :cond_0
    instance-of v0, p1, Lorg/apache/tools/ant/UnknownElement;

    if-nez v0, :cond_1

    .line 64
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "addTask called with a task that is not an unknown element"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_1
    check-cast p1, Lorg/apache/tools/ant/UnknownElement;

    .end local p1    # "nestedTask":Lorg/apache/tools/ant/Task;
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->nestedTask:Lorg/apache/tools/ant/UnknownElement;

    .line 68
    return-void
.end method

.method public execute()V
    .locals 7

    .prologue
    .line 75
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->nestedTask:Lorg/apache/tools/ant/UnknownElement;

    if-nez v4, :cond_0

    .line 76
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Missing nested element"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 78
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->name:Ljava/lang/String;

    if-nez v4, :cond_1

    .line 79
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Name not specified"

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 81
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PreSetDef;->getURI()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->name:Ljava/lang/String;

    invoke-static {v4, v5}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->name:Ljava/lang/String;

    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/PreSetDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v2

    .line 86
    .local v2, "helper":Lorg/apache/tools/ant/ComponentHelper;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->nestedTask:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v4}, Lorg/apache/tools/ant/UnknownElement;->getNamespace()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->nestedTask:Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v5}, Lorg/apache/tools/ant/UnknownElement;->getTag()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "componentName":Ljava/lang/String;
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/ComponentHelper;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v1

    .line 90
    .local v1, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v1, :cond_2

    .line 91
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to find typedef "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 94
    :cond_2
    new-instance v3, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->nestedTask:Lorg/apache/tools/ant/UnknownElement;

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;-><init>(Lorg/apache/tools/ant/AntTypeDefinition;Lorg/apache/tools/ant/UnknownElement;)V

    .line 96
    .local v3, "newDef":Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/taskdefs/PreSetDef$PreSetDefinition;->setName(Ljava/lang/String;)V

    .line 98
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/ComponentHelper;->addDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    .line 99
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "defining preset "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/PreSetDef;->log(Ljava/lang/String;I)V

    .line 100
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PreSetDef;->name:Ljava/lang/String;

    .line 53
    return-void
.end method
