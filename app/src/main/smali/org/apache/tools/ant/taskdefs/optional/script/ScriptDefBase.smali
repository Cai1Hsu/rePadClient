.class public Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;
.super Lorg/apache/tools/ant/Task;
.source "ScriptDefBase.java"

# interfaces
.implements Lorg/apache/tools/ant/DynamicConfigurator;


# instance fields
.field private attributes:Ljava/util/Map;

.field private nestedElementMap:Ljava/util/Map;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->nestedElementMap:Ljava/util/Map;

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->attributes:Ljava/util/Map;

    return-void
.end method

.method private getScript()Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;
    .locals 6

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getTaskType()Ljava/lang/String;

    move-result-object v1

    .line 55
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    const-string/jumbo v4, "org.apache.ant.scriptrepo"

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 57
    .local v2, "scriptRepository":Ljava/util/Map;
    if-nez v2, :cond_0

    .line 58
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Script repository not found for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 61
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getTaskType()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;

    .line 62
    .local v0, "definition":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;
    if-nez v0, :cond_1

    .line 63
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Script definition not found for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 65
    :cond_1
    return-object v0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->text:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public createDynamicElement(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->nestedElementMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 76
    .local v1, "nestedElementList":Ljava/util/List;
    if-nez v1, :cond_0

    .line 77
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "nestedElementList":Ljava/util/List;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 78
    .restart local v1    # "nestedElementList":Ljava/util/List;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->nestedElementMap:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getScript()Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->createNestedElement(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 81
    .local v0, "element":Ljava/lang/Object;
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    return-object v0
.end method

.method public execute()V
    .locals 3

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getScript()Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->attributes:Ljava/util/Map;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->nestedElementMap:Ljava/util/Map;

    invoke-virtual {v0, v1, v2, p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->executeScript(Ljava/util/Map;Ljava/util/Map;Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;)V

    .line 51
    return-void
.end method

.method public fail(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 128
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->text:Ljava/lang/String;

    return-object v0
.end method

.method public setDynamicAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getScript()Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;

    move-result-object v0

    .line 93
    .local v0, "definition":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->isAttributeSupported(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 94
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "<"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->getTaskType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "> does not support the \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" attribute"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 98
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;->attributes:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    return-void
.end method
