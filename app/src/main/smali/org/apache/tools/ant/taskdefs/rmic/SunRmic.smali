.class public Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;
.super Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;
.source "SunRmic.java"


# static fields
.field public static final COMPILER_NAME:Ljava/lang/String; = "sun"

.field public static final ERROR_NO_RMIC_ON_CLASSPATH:Ljava/lang/String; = "Cannot use SUN rmic, as it is not available.  A common solution is to set the environment variable JAVA_HOME"

.field public static final ERROR_RMIC_FAILED:Ljava/lang/String; = "Error starting SUN rmic: "

.field public static final RMIC_CLASSNAME:Ljava/lang/String; = "sun.rmi.rmic.Main"

.field public static final RMIC_EXECUTABLE:Ljava/lang/String; = "rmic"

.field static array$Ljava$lang$String:Ljava/lang/Class;

.field static class$java$io$OutputStream:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
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
.method public execute()Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x1

    .line 65
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v9

    const-string/jumbo v10, "Using SUN rmic compiler"

    const/4 v11, 0x3

    invoke-virtual {v9, v10, v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 66
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->setupRmicCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    .line 70
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    new-instance v6, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v9

    invoke-direct {v6, v9, v12}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .line 74
    .local v6, "logstr":Lorg/apache/tools/ant/taskdefs/LogOutputStream;
    :try_start_0
    const-string/jumbo v9, "sun.rmi.rmic.Main"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 75
    .local v0, "c":Ljava/lang/Class;
    const/4 v9, 0x2

    new-array v10, v9, [Ljava/lang/Class;

    const/4 v11, 0x0

    sget-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$java$io$OutputStream:Ljava/lang/Class;

    if-nez v9, :cond_0

    const-string/jumbo v9, "java.io.OutputStream"

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$java$io$OutputStream:Ljava/lang/Class;

    :goto_0
    aput-object v9, v10, v11

    const/4 v11, 0x1

    sget-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$java$lang$String:Ljava/lang/Class;

    if-nez v9, :cond_1

    const-string/jumbo v9, "java.lang.String"

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$java$lang$String:Ljava/lang/Class;

    :goto_1
    aput-object v9, v10, v11

    invoke-virtual {v0, v10}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 77
    .local v2, "cons":Ljava/lang/reflect/Constructor;
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v6, v9, v10

    const/4 v10, 0x1

    const-string/jumbo v11, "rmic"

    aput-object v11, v9, v10

    invoke-virtual {v2, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 79
    .local v8, "rmic":Ljava/lang/Object;
    const-string/jumbo v10, "compile"

    const/4 v9, 0x1

    new-array v11, v9, [Ljava/lang/Class;

    const/4 v12, 0x0

    sget-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v9, :cond_2

    const-string/jumbo v9, "[Ljava.lang.String;"

    invoke-static {v9}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_2
    aput-object v9, v11, v12

    invoke-virtual {v0, v10, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 81
    .local v3, "doRmic":Ljava/lang/reflect/Method;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v3, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    .line 84
    .local v7, "ok":Ljava/lang/Boolean;
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v9

    .line 97
    :try_start_1
    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 100
    return v9

    .line 75
    .end local v2    # "cons":Ljava/lang/reflect/Constructor;
    .end local v3    # "doRmic":Ljava/lang/reflect/Method;
    .end local v7    # "ok":Ljava/lang/Boolean;
    .end local v8    # "rmic":Ljava/lang/Object;
    :cond_0
    :try_start_2
    sget-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$java$io$OutputStream:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1

    .line 79
    .restart local v2    # "cons":Ljava/lang/reflect/Constructor;
    .restart local v8    # "rmic":Ljava/lang/Object;
    :cond_2
    sget-object v9, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->array$Ljava$lang$String:Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 98
    .restart local v3    # "doRmic":Ljava/lang/reflect/Method;
    .restart local v7    # "ok":Ljava/lang/Boolean;
    :catch_0
    move-exception v4

    .line 99
    .local v4, "e":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 85
    .end local v0    # "c":Ljava/lang/Class;
    .end local v2    # "cons":Ljava/lang/reflect/Constructor;
    .end local v3    # "doRmic":Ljava/lang/reflect/Method;
    .end local v4    # "e":Ljava/io/IOException;
    .end local v7    # "ok":Ljava/lang/Boolean;
    .end local v8    # "rmic":Ljava/lang/Object;
    :catch_1
    move-exception v5

    .line 86
    .local v5, "ex":Ljava/lang/ClassNotFoundException;
    :try_start_3
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Cannot use SUN rmic, as it is not available.  A common solution is to set the environment variable JAVA_HOME"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 96
    .end local v5    # "ex":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v9

    .line 97
    :try_start_4
    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    .line 100
    throw v9

    .line 88
    :catch_2
    move-exception v5

    .line 89
    .local v5, "ex":Ljava/lang/Exception;
    :try_start_5
    instance-of v9, v5, Lorg/apache/tools/ant/BuildException;

    if-eqz v9, :cond_3

    .line 90
    check-cast v5, Lorg/apache/tools/ant/BuildException;

    .end local v5    # "ex":Ljava/lang/Exception;
    throw v5

    .line 92
    .restart local v5    # "ex":Ljava/lang/Exception;
    :cond_3
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Error starting SUN rmic: "

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v11

    invoke-direct {v9, v10, v5, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v9
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 98
    .end local v5    # "ex":Ljava/lang/Exception;
    :catch_3
    move-exception v4

    .line 99
    .restart local v4    # "e":Ljava/io/IOException;
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v9, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v9
.end method

.method protected preprocessCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p1, "compilerArgs"    # [Ljava/lang/String;

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;->filterJvmCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
