.class public Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;
.super Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;
.source "WLRmic.java"


# static fields
.field public static final COMPILER_NAME:Ljava/lang/String; = "weblogic"

.field public static final ERROR_NO_WLRMIC_ON_CLASSPATH:Ljava/lang/String; = "Cannot use WebLogic rmic, as it is not available. Add it to Ant\'s classpath with the -lib option"

.field public static final ERROR_WLRMIC_FAILED:Ljava/lang/String; = "Error starting WebLogic rmic: "

.field public static final UNSUPPORTED_STUB_OPTION:Ljava/lang/String; = "Unsupported stub option: "

.field public static final WLRMIC_CLASSNAME:Ljava/lang/String; = "weblogic.rmic"

.field public static final WL_RMI_SKEL_SUFFIX:Ljava/lang/String; = "_WLSkel"

.field public static final WL_RMI_STUB_SUFFIX:Ljava/lang/String; = "_WLStub"

.field static array$Ljava$lang$String:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 76
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


# virtual methods
.method protected addStubVersionOptions()Ljava/lang/String;
    .locals 4

    .prologue
    .line 128
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Rmic;->getStubVersion()Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "stubVersion":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unsupported stub option: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 133
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public execute()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    const-string/jumbo v6, "Using WebLogic rmic"

    const/4 v7, 0x3

    invoke-virtual {v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 62
    new-array v5, v9, [Ljava/lang/String;

    const-string/jumbo v6, "-noexit"

    aput-object v6, v5, v8

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->setupRmicCommand([Ljava/lang/String;)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    .line 64
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    const/4 v4, 0x0

    .line 67
    .local v4, "loader":Lorg/apache/tools/ant/AntClassLoader;
    const/4 v0, 0x0

    .line 68
    .local v0, "c":Ljava/lang/Class;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    if-nez v5, :cond_1

    .line 69
    const-string/jumbo v5, "weblogic.rmic"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 75
    :goto_0
    const-string/jumbo v6, "main"

    const/4 v5, 0x1

    new-array v7, v5, [Ljava/lang/Class;

    const/4 v8, 0x0

    sget-object v5, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v5, :cond_2

    const-string/jumbo v5, "[Ljava.lang.String;"

    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_1
    aput-object v5, v7, v8

    invoke-virtual {v0, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 77
    .local v2, "doRmic":Ljava/lang/reflect/Method;
    const/4 v5, 0x0

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v2, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    if-eqz v4, :cond_0

    .line 90
    invoke-virtual {v4}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_0
    return v9

    .line 71
    .end local v2    # "doRmic":Ljava/lang/reflect/Method;
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v4

    .line 73
    const-string/jumbo v5, "weblogic.rmic"

    const/4 v6, 0x1

    invoke-static {v5, v6, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    .line 75
    :cond_2
    sget-object v5, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->array$Ljava$lang$String:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 79
    :catch_0
    move-exception v3

    .line 80
    .local v3, "ex":Ljava/lang/ClassNotFoundException;
    :try_start_2
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Cannot use WebLogic rmic, as it is not available. Add it to Ant\'s classpath with the -lib option"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 89
    .end local v3    # "ex":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v5

    if-eqz v4, :cond_3

    .line 90
    invoke-virtual {v4}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    :cond_3
    throw v5

    .line 81
    :catch_1
    move-exception v3

    .line 82
    .local v3, "ex":Ljava/lang/Exception;
    :try_start_3
    instance-of v5, v3, Lorg/apache/tools/ant/BuildException;

    if-eqz v5, :cond_4

    .line 83
    check-cast v3, Lorg/apache/tools/ant/BuildException;

    .end local v3    # "ex":Ljava/lang/Exception;
    throw v3

    .line 85
    .restart local v3    # "ex":Ljava/lang/Exception;
    :cond_4
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Error starting WebLogic rmic: "

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v3, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public getSkelClassSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    const-string/jumbo v0, "_WLSkel"

    return-object v0
.end method

.method public getStubClassSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    const-string/jumbo v0, "_WLStub"

    return-object v0
.end method

.method protected preprocessCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p1, "compilerArgs"    # [Ljava/lang/String;

    .prologue
    .line 118
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;->filterJvmCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
