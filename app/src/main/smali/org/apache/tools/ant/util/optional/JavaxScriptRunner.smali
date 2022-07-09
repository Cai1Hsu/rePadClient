.class public Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;
.super Lorg/apache/tools/ant/util/ScriptRunnerBase;
.source "JavaxScriptRunner.java"


# static fields
.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# instance fields
.field private engine:Lorg/apache/tools/ant/util/ReflectWrapper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ScriptRunnerBase;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 93
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

.method private createEngine()Lorg/apache/tools/ant/util/ReflectWrapper;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v3, p0, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->engine:Lorg/apache/tools/ant/util/ReflectWrapper;

    if-eqz v3, :cond_1

    .line 131
    iget-object v2, p0, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->engine:Lorg/apache/tools/ant/util/ReflectWrapper;

    .line 144
    :cond_0
    :goto_0
    return-object v2

    .line 133
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/util/ReflectWrapper;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    const-string/jumbo v4, "javax.script.ScriptEngineManager"

    invoke-direct {v1, v3, v4}, Lorg/apache/tools/ant/util/ReflectWrapper;-><init>(Ljava/lang/ClassLoader;Ljava/lang/String;)V

    .line 135
    .local v1, "manager":Lorg/apache/tools/ant/util/ReflectWrapper;
    const-string/jumbo v4, "getEngineByName"

    sget-object v3, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    if-nez v3, :cond_2

    const-string/jumbo v3, "java.lang.String"

    invoke-static {v3}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getLanguage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v3, v5}, Lorg/apache/tools/ant/util/ReflectWrapper;->invoke(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 137
    .local v0, "e":Ljava/lang/Object;
    if-nez v0, :cond_3

    .line 138
    const/4 v2, 0x0

    goto :goto_0

    .line 135
    .end local v0    # "e":Ljava/lang/Object;
    :cond_2
    sget-object v3, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1

    .line 140
    .restart local v0    # "e":Ljava/lang/Object;
    :cond_3
    new-instance v2, Lorg/apache/tools/ant/util/ReflectWrapper;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/util/ReflectWrapper;-><init>(Ljava/lang/Object;)V

    .line 141
    .local v2, "ret":Lorg/apache/tools/ant/util/ReflectWrapper;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getKeepEngine()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 142
    iput-object v2, p0, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->engine:Lorg/apache/tools/ant/util/ReflectWrapper;

    goto :goto_0
.end method

.method private static unwrap(Ljava/lang/Throwable;)Lorg/apache/tools/ant/BuildException;
    .locals 3
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 152
    instance-of v2, p0, Lorg/apache/tools/ant/BuildException;

    if-eqz v2, :cond_1

    move-object v2, p0

    check-cast v2, Lorg/apache/tools/ant/BuildException;

    move-object v1, v2

    .line 154
    .local v1, "deepest":Lorg/apache/tools/ant/BuildException;
    :goto_0
    move-object v0, p0

    .line 155
    .local v0, "current":Ljava/lang/Throwable;
    :cond_0
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 156
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 157
    instance-of v2, v0, Lorg/apache/tools/ant/BuildException;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 158
    check-cast v1, Lorg/apache/tools/ant/BuildException;

    goto :goto_1

    .line 152
    .end local v0    # "current":Ljava/lang/Throwable;
    .end local v1    # "deepest":Lorg/apache/tools/ant/BuildException;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 161
    .restart local v0    # "current":Ljava/lang/Throwable;
    .restart local v1    # "deepest":Lorg/apache/tools/ant/BuildException;
    :cond_2
    return-object v1
.end method


# virtual methods
.method public evaluateScript(Ljava/lang/String;)Ljava/lang/Object;
    .locals 12
    .param p1, "execName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->checkLanguage()V

    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->replaceContextLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    .line 82
    .local v8, "origLoader":Ljava/lang/ClassLoader;
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->createEngine()Lorg/apache/tools/ant/util/ReflectWrapper;

    move-result-object v0

    .line 83
    .local v0, "engine":Lorg/apache/tools/ant/util/ReflectWrapper;
    if-nez v0, :cond_0

    .line 84
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to create javax script engine for "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getLanguage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    .end local v0    # "engine":Lorg/apache/tools/ant/util/ReflectWrapper;
    :catch_0
    move-exception v6

    .line 111
    .local v6, "be":Lorg/apache/tools/ant/BuildException;
    :try_start_1
    invoke-static {v6}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->unwrap(Ljava/lang/Throwable;)Lorg/apache/tools/ant/BuildException;

    move-result-object v1

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    .end local v6    # "be":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v1

    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->restoreContextLoader(Ljava/lang/ClassLoader;)V

    throw v1

    .line 88
    .restart local v0    # "engine":Lorg/apache/tools/ant/util/ReflectWrapper;
    :cond_0
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getBeans()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 89
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 90
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getBeans()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 91
    .local v5, "value":Ljava/lang/Object;
    const-string/jumbo v1, "FX"

    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getLanguage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 92
    const-string/jumbo v1, "put"

    sget-object v2, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    if-nez v2, :cond_1

    const-string/jumbo v2, "java.lang.String"

    invoke-static {v2}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    :goto_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v11, ":"

    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v3    # "key":Ljava/lang/String;
    sget-object v4, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v4, :cond_2

    const-string/jumbo v4, "java.lang.Object"

    invoke-static {v4}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$Object:Ljava/lang/Class;

    :goto_2
    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/ReflectWrapper;->invoke(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 112
    .end local v0    # "engine":Lorg/apache/tools/ant/util/ReflectWrapper;
    .end local v5    # "value":Ljava/lang/Object;
    .end local v7    # "i":Ljava/util/Iterator;
    :catch_1
    move-exception v6

    .line 114
    .local v6, "be":Ljava/lang/Exception;
    move-object v9, v6

    .line 115
    .local v9, "t":Ljava/lang/Throwable;
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v10

    .line 116
    .local v10, "te":Ljava/lang/Throwable;
    if-eqz v10, :cond_9

    .line 117
    instance-of v1, v10, Lorg/apache/tools/ant/BuildException;

    if-eqz v1, :cond_8

    .line 118
    check-cast v10, Lorg/apache/tools/ant/BuildException;

    .end local v10    # "te":Ljava/lang/Throwable;
    throw v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 92
    .end local v6    # "be":Ljava/lang/Exception;
    .end local v9    # "t":Ljava/lang/Throwable;
    .restart local v0    # "engine":Lorg/apache/tools/ant/util/ReflectWrapper;
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v5    # "value":Ljava/lang/Object;
    .restart local v7    # "i":Ljava/util/Iterator;
    :cond_1
    :try_start_4
    sget-object v2, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1

    .end local v3    # "key":Ljava/lang/String;
    :cond_2
    sget-object v4, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_2

    .line 97
    .restart local v3    # "key":Ljava/lang/String;
    :cond_3
    const-string/jumbo v1, "put"

    sget-object v2, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    if-nez v2, :cond_4

    const-string/jumbo v2, "java.lang.String"

    invoke-static {v2}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    :goto_3
    sget-object v4, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v4, :cond_5

    const-string/jumbo v4, "java.lang.Object"

    invoke-static {v4}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$Object:Ljava/lang/Class;

    :goto_4
    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/ReflectWrapper;->invoke(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_4
    sget-object v2, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_3

    :cond_5
    sget-object v4, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_4

    .line 103
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/Object;
    :cond_6
    const-string/jumbo v2, "eval"

    sget-object v1, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_7

    const-string/jumbo v1, "java.lang.String"

    invoke-static {v1}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;

    :goto_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->getScript()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v1, v4}, Lorg/apache/tools/ant/util/ReflectWrapper;->invoke(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v1

    .line 125
    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->restoreContextLoader(Ljava/lang/ClassLoader;)V

    return-object v1

    .line 103
    :cond_7
    :try_start_5
    sget-object v1, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->class$java$lang$String:Ljava/lang/Class;
    :try_end_5
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_5

    .line 120
    .end local v0    # "engine":Lorg/apache/tools/ant/util/ReflectWrapper;
    .end local v7    # "i":Ljava/util/Iterator;
    .restart local v6    # "be":Ljava/lang/Exception;
    .restart local v9    # "t":Ljava/lang/Throwable;
    .restart local v10    # "te":Ljava/lang/Throwable;
    :cond_8
    move-object v9, v10

    .line 123
    :cond_9
    :try_start_6
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
.end method

.method public executeScript(Ljava/lang/String;)V
    .locals 0
    .param p1, "execName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->evaluateScript(Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    return-void
.end method

.method public getManagerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    const-string/jumbo v0, "javax"

    return-object v0
.end method

.method public supportsLanguage()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 44
    iget-object v4, p0, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->engine:Lorg/apache/tools/ant/util/ReflectWrapper;

    if-eqz v4, :cond_0

    .line 54
    :goto_0
    return v2

    .line 47
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->checkLanguage()V

    .line 48
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->replaceContextLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 50
    .local v1, "origLoader":Ljava/lang/ClassLoader;
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->createEngine()Lorg/apache/tools/ant/util/ReflectWrapper;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    if-eqz v4, :cond_1

    .line 54
    :goto_1
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->restoreContextLoader(Ljava/lang/ClassLoader;)V

    goto :goto_0

    :cond_1
    move v2, v3

    .line 50
    goto :goto_1

    .line 51
    :catch_0
    move-exception v0

    .line 54
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->restoreContextLoader(Ljava/lang/ClassLoader;)V

    move v2, v3

    goto :goto_0

    .end local v0    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/util/optional/JavaxScriptRunner;->restoreContextLoader(Ljava/lang/ClassLoader;)V

    throw v2
.end method
