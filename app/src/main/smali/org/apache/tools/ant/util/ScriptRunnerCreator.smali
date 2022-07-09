.class public Lorg/apache/tools/ant/util/ScriptRunnerCreator;
.super Ljava/lang/Object;
.source "ScriptRunnerCreator.java"


# static fields
.field private static final AUTO:Ljava/lang/String; = "auto"

.field private static final BSF:Ljava/lang/String; = "bsf"

.field private static final BSF_MANAGER:Ljava/lang/String; = "org.apache.bsf.BSFManager"

.field private static final BSF_PACK:Ljava/lang/String; = "org.apache.bsf"

.field private static final BSF_RUNNER:Ljava/lang/String; = "org.apache.tools.ant.util.optional.ScriptRunner"

.field private static final JAVAX:Ljava/lang/String; = "javax"

.field private static final JAVAX_MANAGER:Ljava/lang/String; = "javax.script.ScriptEngineManager"

.field private static final JAVAX_RUNNER:Ljava/lang/String; = "org.apache.tools.ant.util.optional.JavaxScriptRunner"

.field private static final OATAU:Ljava/lang/String; = "org.apache.tools.ant.util"

.field private static final UTIL_OPT:Ljava/lang/String; = "org.apache.tools.ant.util.optional"


# instance fields
.field private language:Ljava/lang/String;

.field private manager:Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;

.field private scriptLoader:Ljava/lang/ClassLoader;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->scriptLoader:Ljava/lang/ClassLoader;

    .line 51
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->project:Lorg/apache/tools/ant/Project;

    .line 52
    return-void
.end method

.method private createRunner(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/tools/ant/util/ScriptRunnerBase;
    .locals 6
    .param p1, "checkManager"    # Ljava/lang/String;
    .param p2, "managerClass"    # Ljava/lang/String;
    .param p3, "runnerClass"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 112
    const/4 v2, 0x0

    .line 113
    .local v2, "runner":Lorg/apache/tools/ant/util/ScriptRunnerBase;
    iget-object v4, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->manager:Ljava/lang/String;

    const-string/jumbo v5, "auto"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->manager:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 131
    :cond_0
    :goto_0
    return-object v3

    .line 116
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->scriptLoader:Ljava/lang/ClassLoader;

    invoke-static {p2}, Lorg/apache/tools/ant/util/LoaderUtils;->classNameToResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 119
    const-string/jumbo v3, "org.apache.bsf.BSFManager"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 120
    new-instance v3, Lorg/apache/tools/ant/util/ScriptFixBSFPath;

    invoke-direct {v3}, Lorg/apache/tools/ant/util/ScriptFixBSFPath;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->scriptLoader:Ljava/lang/ClassLoader;

    iget-object v5, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->language:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->fixClassLoader(Ljava/lang/ClassLoader;Ljava/lang/String;)V

    .line 123
    :cond_2
    const/4 v3, 0x1

    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->scriptLoader:Ljava/lang/ClassLoader;

    invoke-static {p3, v3, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-object v2, v0

    .line 125
    iget-object v3, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->setProject(Lorg/apache/tools/ant/Project;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    iget-object v3, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->language:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->setLanguage(Ljava/lang/String;)V

    .line 130
    iget-object v3, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->scriptLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/util/ScriptRunnerBase;->setScriptClassLoader(Ljava/lang/ClassLoader;)V

    move-object v3, v2

    .line 131
    goto :goto_0

    .line 126
    :catch_0
    move-exception v1

    .line 127
    .local v1, "ex":Ljava/lang/Exception;
    invoke-static {v1}, Lorg/apache/tools/ant/util/ReflectUtil;->toBuildException(Ljava/lang/Exception;)Lorg/apache/tools/ant/BuildException;

    move-result-object v3

    throw v3
.end method


# virtual methods
.method public declared-synchronized createRunner(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/util/ScriptRunnerBase;
    .locals 4
    .param p1, "manager"    # Ljava/lang/String;
    .param p2, "language"    # Ljava/lang/String;
    .param p3, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 64
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->manager:Ljava/lang/String;

    .line 65
    iput-object p2, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->language:Ljava/lang/String;

    .line 66
    iput-object p3, p0, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->scriptLoader:Ljava/lang/ClassLoader;

    .line 68
    if-nez p2, :cond_0

    .line 69
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "script language must be specified"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 71
    :cond_0
    :try_start_1
    const-string/jumbo v1, "auto"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "javax"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "bsf"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 72
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unsupported language prefix "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_1
    const/4 v0, 0x0

    .line 80
    .local v0, "ret":Lorg/apache/tools/ant/util/ScriptRunnerBase;
    const-string/jumbo v1, "bsf"

    const-string/jumbo v2, "org.apache.bsf.BSFManager"

    const-string/jumbo v3, "org.apache.tools.ant.util.optional.ScriptRunner"

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->createRunner(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/tools/ant/util/ScriptRunnerBase;

    move-result-object v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    const-string/jumbo v1, "javax"

    const-string/jumbo v2, "javax.script.ScriptEngineManager"

    const-string/jumbo v3, "org.apache.tools.ant.util.optional.JavaxScriptRunner"

    invoke-direct {p0, v1, v2, v3}, Lorg/apache/tools/ant/util/ScriptRunnerCreator;->createRunner(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/apache/tools/ant/util/ScriptRunnerBase;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 84
    :cond_2
    if-eqz v0, :cond_3

    .line 85
    monitor-exit p0

    return-object v0

    .line 87
    :cond_3
    :try_start_2
    const-string/jumbo v1, "javax"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 88
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Unable to load the script engine manager (javax.script.ScriptEngineManager)"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    :cond_4
    const-string/jumbo v1, "bsf"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 92
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Unable to load the BSF script engine manager (org.apache.bsf.BSFManager)"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 95
    :cond_5
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Unable to load a script engine manager (org.apache.bsf.BSFManager or javax.script.ScriptEngineManager)"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method
