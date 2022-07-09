.class public Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;
.super Lorg/apache/tools/ant/taskdefs/DefBase;
.source "ScriptDef.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;,
        Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;
    }
.end annotation


# static fields
.field static class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase:Ljava/lang/Class;


# instance fields
.field private attributeSet:Ljava/util/Set;

.field private attributes:Ljava/util/List;

.field private helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

.field private name:Ljava/lang/String;

.field private nestedElementMap:Ljava/util/Map;

.field private nestedElements:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DefBase;-><init>()V

    .line 52
    new-instance v0, Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributes:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElements:Ljava/util/List;

    .line 129
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 251
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

.method private lookupScriptRepository()Ljava/util/Map;
    .locals 5

    .prologue
    .line 262
    const/4 v2, 0x0

    .line 263
    .local v2, "scriptRepository":Ljava/util/Map;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    .line 264
    .local v1, "p":Lorg/apache/tools/ant/Project;
    monitor-enter v1

    .line 265
    :try_start_0
    const-string/jumbo v4, "org.apache.ant.scriptrepo"

    invoke-virtual {v1, v4}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/util/Map;

    move-object v2, v0

    .line 267
    if-nez v2, :cond_0

    .line 268
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 269
    .end local v2    # "scriptRepository":Ljava/util/Map;
    .local v3, "scriptRepository":Ljava/util/Map;
    :try_start_1
    const-string/jumbo v4, "org.apache.ant.scriptrepo"

    invoke-virtual {v1, v4, v3}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v2, v3

    .line 272
    .end local v3    # "scriptRepository":Ljava/util/Map;
    .restart local v2    # "scriptRepository":Ljava/util/Map;
    :cond_0
    :try_start_2
    monitor-exit v1

    .line 273
    return-object v2

    .line 272
    :catchall_0
    move-exception v4

    :goto_0
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .end local v2    # "scriptRepository":Ljava/util/Map;
    .restart local v3    # "scriptRepository":Ljava/util/Map;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "scriptRepository":Ljava/util/Map;
    .restart local v2    # "scriptRepository":Ljava/util/Map;
    goto :goto_0
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "resource"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 395
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 396
    return-void
.end method

.method public addAttribute(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;)V
    .locals 1
    .param p1, "attribute"    # Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;

    .prologue
    .line 123
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    return-void
.end method

.method public addElement(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)V
    .locals 1
    .param p1, "nestedElement"    # Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;

    .prologue
    .line 179
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElements:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 386
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->addText(Ljava/lang/String;)V

    .line 387
    return-void
.end method

.method public createNestedElement(Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p1, "elementName"    # Ljava/lang/String;

    .prologue
    .line 283
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElementMap:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;

    .line 285
    .local v1, "definition":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;
    if-nez v1, :cond_0

    .line 286
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "<"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "> does not support "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "the <"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "> nested element"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 290
    :cond_0
    const/4 v3, 0x0

    .line 291
    .local v3, "instance":Ljava/lang/Object;
    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$200(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v0

    .line 292
    .local v0, "classname":Ljava/lang/String;
    if-nez v0, :cond_2

    .line 293
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$300(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->createTask(Ljava/lang/String;)Lorg/apache/tools/ant/Task;

    move-result-object v3

    .line 294
    .local v3, "instance":Lorg/apache/tools/ant/Task;
    if-nez v3, :cond_1

    .line 295
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$300(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->createDataType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 314
    .end local v3    # "instance":Lorg/apache/tools/ant/Task;
    :cond_1
    :goto_0
    if-nez v3, :cond_4

    .line 315
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "<"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "> is unable to create "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "the <"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "> nested element"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 303
    .local v3, "instance":Ljava/lang/Object;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->createLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    .line 306
    .local v4, "loader":Ljava/lang/ClassLoader;
    :try_start_0
    invoke-static {v0, v4}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 311
    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    goto :goto_0

    .line 307
    :catch_0
    move-exception v2

    .line 308
    .local v2, "e":Lorg/apache/tools/ant/BuildException;
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef:Ljava/lang/Class;

    if-nez v5, :cond_3

    const-string/jumbo v5, "org.apache.tools.ant.taskdefs.optional.script.ScriptDef"

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    invoke-static {v0, v5}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_1

    :cond_3
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$org$apache$tools$ant$taskdefs$optional$script$ScriptDef:Ljava/lang/Class;

    goto :goto_2

    .line 318
    .end local v2    # "e":Lorg/apache/tools/ant/BuildException;
    .end local v3    # "instance":Ljava/lang/Object;
    .end local v4    # "loader":Ljava/lang/ClassLoader;
    :cond_4
    return-object v3
.end method

.method public execute()V
    .locals 8

    .prologue
    .line 186
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    if-nez v5, :cond_0

    .line 187
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "scriptdef requires a name attribute to name the script"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 191
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v5}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getLanguage()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1

    .line 192
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "<scriptdef> requires a language attribute to specify the script language"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 197
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getAntlibClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    if-nez v5, :cond_2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->hasCpDelegate()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 198
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->createLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 201
    :cond_3
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributeSet:Ljava/util/Set;

    .line 202
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributes:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 203
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;

    .line 204
    .local v0, "attribute":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;
    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;->access$000(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_4

    .line 205
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "scriptdef <attribute> elements must specify an attribute name"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 209
    :cond_4
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributeSet:Ljava/util/Set;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;->access$000(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 210
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "scriptdef <"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "> declares "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "the "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;->access$000(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " attribute more than once"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 213
    :cond_5
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributeSet:Ljava/util/Set;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;->access$000(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 216
    .end local v0    # "attribute":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$Attribute;
    :cond_6
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElementMap:Ljava/util/Map;

    .line 217
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElements:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    .line 218
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;

    .line 219
    .local v3, "nestedElement":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$100(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_7

    .line 220
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "scriptdef <element> elements must specify an element name"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 223
    :cond_7
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElementMap:Ljava/util/Map;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$100(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8

    .line 224
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "scriptdef <"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "> declares "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "the "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$100(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " nested element more "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "than once"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 229
    :cond_8
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$200(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_9

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$300(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_9

    .line 231
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "scriptdef <element> elements must specify either a classname or type attribute"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 234
    :cond_9
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$200(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_a

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$300(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_a

    .line 236
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "scriptdef <element> elements must specify only one of the classname and type attributes"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 242
    :cond_a
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->nestedElementMap:Ljava/util/Map;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;->access$100(Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 246
    .end local v3    # "nestedElement":Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef$NestedElement;
    :cond_b
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->lookupScriptRepository()Ljava/util/Map;

    move-result-object v4

    .line 247
    .local v4, "scriptRepository":Ljava/util/Map;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getURI()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-static {v5, v6}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    .line 248
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-interface {v4, v5, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    new-instance v1, Lorg/apache/tools/ant/AntTypeDefinition;

    invoke-direct {v1}, Lorg/apache/tools/ant/AntTypeDefinition;-><init>()V

    .line 250
    .local v1, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/AntTypeDefinition;->setName(Ljava/lang/String;)V

    .line 251
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase:Ljava/lang/Class;

    if-nez v5, :cond_c

    const-string/jumbo v5, "org.apache.tools.ant.taskdefs.optional.script.ScriptDefBase"

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/AntTypeDefinition;->setClass(Ljava/lang/Class;)V

    .line 252
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v5

    invoke-virtual {v5, v1}, Lorg/apache/tools/ant/ComponentHelper;->addDataTypeDefinition(Lorg/apache/tools/ant/AntTypeDefinition;)V

    .line 254
    return-void

    .line 251
    :cond_c
    sget-object v5, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->class$org$apache$tools$ant$taskdefs$optional$script$ScriptDefBase:Ljava/lang/Class;

    goto :goto_2
.end method

.method public executeScript(Ljava/util/Map;Ljava/util/Map;)V
    .locals 1
    .param p1, "attributes"    # Ljava/util/Map;
    .param p2, "elements"    # Ljava/util/Map;

    .prologue
    .line 330
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->executeScript(Ljava/util/Map;Ljava/util/Map;Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;)V

    .line 331
    return-void
.end method

.method public executeScript(Ljava/util/Map;Ljava/util/Map;Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;)V
    .locals 3
    .param p1, "attributes"    # Ljava/util/Map;
    .param p2, "elements"    # Ljava/util/Map;
    .param p3, "instance"    # Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDefBase;

    .prologue
    .line 343
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->getScriptRunner()Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    .line 344
    .local v0, "runner":Lorg/apache/tools/ant/util/ScriptRunnerBase;
    const-string/jumbo v1, "attributes"

    invoke-virtual {v0, v1, p1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 345
    const-string/jumbo v1, "elements"

    invoke-virtual {v0, v1, p2}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 346
    const-string/jumbo v1, "project"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 347
    if-eqz p3, :cond_0

    .line 348
    const-string/jumbo v1, "self"

    invoke-virtual {v0, v1, p3}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 350
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "scriptdef_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->executeScript(Ljava/lang/String;)V

    .line 351
    return-void
.end method

.method public isAttributeSupported(Ljava/lang/String;)Z
    .locals 1
    .param p1, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->attributeSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 1
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 368
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setLanguage(Ljava/lang/String;)V

    .line 369
    return-void
.end method

.method public setManager(Ljava/lang/String;)V
    .locals 1
    .param p1, "manager"    # Ljava/lang/String;

    .prologue
    .line 359
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setManager(Ljava/lang/String;)V

    .line 360
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->name:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 2
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 74
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/DefBase;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p0}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setProjectComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 76
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSetBeans(Z)V

    .line 77
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 377
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/script/ScriptDef;->helper:Lorg/apache/tools/ant/util/ScriptRunnerHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerHelper;->setSrc(Ljava/io/File;)V

    .line 378
    return-void
.end method
