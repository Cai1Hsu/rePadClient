.class public abstract Lorg/apache/tools/ant/util/ScriptRunnerBase;
.super Ljava/lang/Object;
.source "ScriptRunnerBase.java"


# instance fields
.field private beans:Ljava/util/Map;

.field private keepEngine:Z

.field private language:Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;

.field private script:Ljava/lang/String;

.field private scriptLoader:Ljava/lang/ClassLoader;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->keepEngine:Z

    .line 53
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->beans:Ljava/util/Map;

    return-void
.end method

.method private readSource(Ljava/io/Reader;Ljava/lang/String;)V
    .locals 6
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 213
    const/4 v1, 0x0

    .line 215
    .local v1, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 216
    .end local v1    # "in":Ljava/io/BufferedReader;
    .local v2, "in":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->safeReadFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 220
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 222
    return-void

    .line 217
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    :catch_0
    move-exception v0

    .line 218
    .local v0, "ex":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed to read "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 220
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_1
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v3

    .end local v1    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    goto :goto_1

    .line 217
    .end local v1    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :catch_1
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v1    # "in":Ljava/io/BufferedReader;
    goto :goto_0
.end method


# virtual methods
.method public addBean(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "bean"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 92
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierStart(C)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 95
    .local v1, "isValid":Z
    :cond_0
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 96
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v1

    .line 95
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 99
    :cond_1
    if-eqz v1, :cond_2

    .line 100
    iget-object v2, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->beans:Ljava/util/Map;

    invoke-interface {v2, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_2
    return-void
.end method

.method public addBeans(Ljava/util/Map;)V
    .locals 4
    .param p1, "dictionary"    # Ljava/util/Map;

    .prologue
    .line 71
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 72
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 74
    .local v1, "key":Ljava/lang/String;
    :try_start_0
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 75
    .local v2, "val":Ljava/lang/Object;
    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 76
    .end local v2    # "val":Ljava/lang/Object;
    :catch_0
    move-exception v3

    goto :goto_0

    .line 83
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 265
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;

    .line 266
    return-void
.end method

.method public bindToComponent(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 2
    .param p1, "component"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 306
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    .line 307
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getProperties()Ljava/util/Hashtable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBeans(Ljava/util/Map;)V

    .line 308
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getUserProperties()Ljava/util/Hashtable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBeans(Ljava/util/Map;)V

    .line 309
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getCopyOfTargets()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBeans(Ljava/util/Map;)V

    .line 310
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getCopyOfReferences()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBeans(Ljava/util/Map;)V

    .line 311
    const-string/jumbo v0, "project"

    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 312
    const-string/jumbo v0, "self"

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 313
    return-void
.end method

.method public bindToComponentMinimum(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 2
    .param p1, "component"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 321
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    .line 322
    const-string/jumbo v0, "project"

    iget-object v1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 323
    const-string/jumbo v0, "self"

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->addBean(Ljava/lang/String;Ljava/lang/Object;)V

    .line 324
    return-void
.end method

.method protected checkLanguage()V
    .locals 2

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->language:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 332
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "script language must be specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 335
    :cond_0
    return-void
.end method

.method public clearScript()V
    .locals 1

    .prologue
    .line 280
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;

    .line 281
    return-void
.end method

.method public abstract evaluateScript(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract executeScript(Ljava/lang/String;)V
.end method

.method protected getBeans()Ljava/util/Map;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->beans:Ljava/util/Map;

    return-object v0
.end method

.method public getKeepEngine()Z
    .locals 1

    .prologue
    .line 187
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->keepEngine:Z

    return v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->language:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getManagerName()Ljava/lang/String;
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 296
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getScript()Ljava/lang/String;
    .locals 1

    .prologue
    .line 273
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->script:Ljava/lang/String;

    return-object v0
.end method

.method protected getScriptClassLoader()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->scriptLoader:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public loadResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 6
    .param p1, "sourceResource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 232
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, "name":Ljava/lang/String;
    const/4 v1, 0x0

    .line 235
    .local v1, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    .line 242
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v3, v2}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->readSource(Ljava/io/Reader;Ljava/lang/String;)V

    .line 243
    return-void

    .line 236
    :catch_0
    move-exception v0

    .line 237
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed to open "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 238
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/UnsupportedOperationException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed to open "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " -it is not readable"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public loadResources(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 3
    .param p1, "collection"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 252
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 253
    .local v1, "resources":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 254
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    .line 255
    .local v0, "resource":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->loadResource(Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0

    .line 257
    .end local v0    # "resource":Lorg/apache/tools/ant/types/Resource;
    :cond_0
    return-void
.end method

.method protected replaceContextLoader()Ljava/lang/ClassLoader;
    .locals 3

    .prologue
    .line 343
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 345
    .local v0, "origContextClassLoader":Ljava/lang/ClassLoader;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->getScriptClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    if-nez v1, :cond_0

    .line 346
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->setScriptClassLoader(Ljava/lang/ClassLoader;)V

    .line 348
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->getScriptClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 349
    return-object v0
.end method

.method protected restoreContextLoader(Ljava/lang/ClassLoader;)V
    .locals 1
    .param p1, "origLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 359
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 361
    return-void
.end method

.method public setKeepEngine(Z)V
    .locals 0
    .param p1, "keepEngine"    # Z

    .prologue
    .line 179
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->keepEngine:Z

    .line 180
    return-void
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 147
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->language:Ljava/lang/String;

    .line 148
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 288
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->project:Lorg/apache/tools/ant/Project;

    .line 289
    return-void
.end method

.method public setScriptClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 163
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerBase;->scriptLoader:Ljava/lang/ClassLoader;

    .line 164
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 195
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 196
    .local v1, "filename":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 197
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 200
    :cond_0
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v2, v1}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->readSource(Ljava/io/Reader;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    return-void

    .line 201
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/io/FileNotFoundException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public abstract supportsLanguage()Z
.end method
