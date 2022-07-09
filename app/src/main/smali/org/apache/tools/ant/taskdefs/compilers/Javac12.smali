.class public Lorg/apache/tools/ant/taskdefs/compilers/Javac12;
.super Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.source "Javac12.java"


# static fields
.field protected static final CLASSIC_COMPILER_CLASSNAME:Ljava/lang/String; = "sun.tools.javac.Main"

.field static array$Ljava$lang$String:Ljava/lang/Class;

.field static class$java$io$OutputStream:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 57
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
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 48
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v9, "Using classic compiler"

    const/4 v10, 0x3

    invoke-virtual {v8, v9, v10}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 49
    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->setupJavacCommand(Z)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v1

    .line 51
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    new-instance v6, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-direct {v6, v8, v11}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    .line 55
    .local v6, "logstr":Ljava/io/OutputStream;
    :try_start_0
    const-string/jumbo v8, "sun.tools.javac.Main"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 56
    .local v0, "c":Ljava/lang/Class;
    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Class;

    const/4 v10, 0x0

    sget-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$java$io$OutputStream:Ljava/lang/Class;

    if-nez v8, :cond_0

    const-string/jumbo v8, "java.io.OutputStream"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$java$io$OutputStream:Ljava/lang/Class;

    :goto_0
    aput-object v8, v9, v10

    const/4 v10, 0x1

    sget-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$java$lang$String:Ljava/lang/Class;

    if-nez v8, :cond_1

    const-string/jumbo v8, "java.lang.String"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$java$lang$String:Ljava/lang/Class;

    :goto_1
    aput-object v8, v9, v10

    invoke-virtual {v0, v9}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 59
    .local v4, "cons":Ljava/lang/reflect/Constructor;
    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v6, v8, v9

    const/4 v9, 0x1

    const-string/jumbo v10, "javac"

    aput-object v10, v8, v9

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 63
    .local v3, "compiler":Ljava/lang/Object;
    const-string/jumbo v9, "compile"

    const/4 v8, 0x1

    new-array v10, v8, [Ljava/lang/Class;

    const/4 v11, 0x0

    sget-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->array$Ljava$lang$String:Ljava/lang/Class;

    if-nez v8, :cond_2

    const-string/jumbo v8, "[Ljava.lang.String;"

    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->array$Ljava$lang$String:Ljava/lang/Class;

    :goto_2
    aput-object v8, v10, v11

    invoke-virtual {v0, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 65
    .local v2, "compile":Ljava/lang/reflect/Method;
    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->getArguments()[Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v2, v3, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    .line 68
    .local v7, "ok":Ljava/lang/Boolean;
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    .line 87
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    return v8

    .line 56
    .end local v2    # "compile":Ljava/lang/reflect/Method;
    .end local v3    # "compiler":Ljava/lang/Object;
    .end local v4    # "cons":Ljava/lang/reflect/Constructor;
    .end local v7    # "ok":Ljava/lang/Boolean;
    :cond_0
    :try_start_1
    sget-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$java$io$OutputStream:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1

    .line 63
    .restart local v3    # "compiler":Ljava/lang/Object;
    .restart local v4    # "cons":Ljava/lang/reflect/Constructor;
    :cond_2
    sget-object v8, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->array$Ljava$lang$String:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 69
    .end local v0    # "c":Ljava/lang/Class;
    .end local v3    # "compiler":Ljava/lang/Object;
    .end local v4    # "cons":Ljava/lang/reflect/Constructor;
    :catch_0
    move-exception v5

    .line 70
    .local v5, "ex":Ljava/lang/ClassNotFoundException;
    :try_start_2
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Cannot use classic compiler , as it is not available. \n A common solution is to set the environment variable JAVA_HOME to your jdk directory.\nIt is currently set to \""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJavaHome()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->location:Lorg/apache/tools/ant/Location;

    invoke-direct {v8, v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 87
    .end local v5    # "ex":Ljava/lang/ClassNotFoundException;
    :catchall_0
    move-exception v8

    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v8

    .line 79
    :catch_1
    move-exception v5

    .line 80
    .local v5, "ex":Ljava/lang/Exception;
    :try_start_3
    instance-of v8, v5, Lorg/apache/tools/ant/BuildException;

    if-eqz v8, :cond_3

    .line 81
    check-cast v5, Lorg/apache/tools/ant/BuildException;

    .end local v5    # "ex":Ljava/lang/Exception;
    throw v5

    .line 83
    .restart local v5    # "ex":Ljava/lang/Exception;
    :cond_3
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "Error starting classic compiler: "

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/compilers/Javac12;->location:Lorg/apache/tools/ant/Location;

    invoke-direct {v8, v9, v5, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method
