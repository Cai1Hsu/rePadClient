.class public final Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;
.super Ljava/lang/Object;
.source "CompilerAdapterFactory.java"


# static fields
.field private static final MODERN_COMPILER:Ljava/lang/String; = "com.sun.tools.javac.Main"

.field static class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 170
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

.method private static doesModernCompilerExist()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 166
    :try_start_0
    const-string/jumbo v3, "com.sun.tools.javac.Main"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    .local v1, "cnfe":Ljava/lang/ClassNotFoundException;
    :goto_0
    return v2

    .line 168
    .end local v1    # "cnfe":Ljava/lang/ClassNotFoundException;
    :catch_0
    move-exception v1

    .line 170
    .restart local v1    # "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;

    if-nez v3, :cond_1

    const-string/jumbo v3, "org.apache.tools.ant.taskdefs.compilers.CompilerAdapterFactory"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 171
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_0

    .line 172
    const-string/jumbo v3, "com.sun.tools.javac.Main"

    invoke-virtual {v0, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    goto :goto_0

    .line 175
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    :catch_1
    move-exception v2

    .line 179
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 170
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1
.end method

.method public static getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    .locals 1
    .param p0, "compilerType"    # Ljava/lang/String;
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    .locals 3
    .param p0, "compilerType"    # Ljava/lang/String;
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "classpath"    # Lorg/apache/tools/ant/types/Path;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 101
    const-string/jumbo v0, "jikes"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 102
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/Jikes;-><init>()V

    .line 155
    :goto_0
    return-object v0

    .line 104
    :cond_0
    const-string/jumbo v0, "extjavac"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 105
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/JavacExternal;-><init>()V

    goto :goto_0

    .line 107
    :cond_1
    const-string/jumbo v0, "classic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "javac1.1"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "javac1.2"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 110
    :cond_2
    const-string/jumbo v0, "This version of java does not support the classic compiler; upgrading to modern"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 114
    const-string/jumbo p0, "modern"

    .line 118
    :cond_3
    const-string/jumbo v0, "modern"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "javac1.3"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "javac1.4"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "javac1.5"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "javac1.6"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string/jumbo v0, "javac1.7"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 125
    :cond_4
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->doesModernCompilerExist()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 126
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/Javac13;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/Javac13;-><init>()V

    goto :goto_0

    .line 128
    :cond_5
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unable to find a javac compiler;\ncom.sun.tools.javac.Main is not on the classpath.\nPerhaps JAVA_HOME does not point to the JDK.\nIt is currently set to \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJavaHome()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_6
    const-string/jumbo v0, "jvc"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7

    const-string/jumbo v0, "microsoft"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 143
    :cond_7
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/Jvc;-><init>()V

    goto/16 :goto_0

    .line 145
    :cond_8
    const-string/jumbo v0, "kjc"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 146
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/Kjc;-><init>()V

    goto/16 :goto_0

    .line 148
    :cond_9
    const-string/jumbo v0, "gcj"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 149
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/Gcj;-><init>()V

    goto/16 :goto_0

    .line 151
    :cond_a
    const-string/jumbo v0, "sj"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b

    const-string/jumbo v0, "symantec"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 153
    :cond_b
    new-instance v0, Lorg/apache/tools/ant/taskdefs/compilers/Sj;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/compilers/Sj;-><init>()V

    goto/16 :goto_0

    .line 155
    :cond_c
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    move-result-object v0

    goto/16 :goto_0
.end method

.method private static resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 194
    if-eqz p1, :cond_0

    .end local p1    # "loader":Ljava/lang/ClassLoader;
    :goto_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.compilers.CompilerAdapter"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter:Ljava/lang/Class;

    :goto_1
    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    return-object v0

    .restart local p1    # "loader":Ljava/lang/ClassLoader;
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.compilers.CompilerAdapterFactory"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapterFactory:Ljava/lang/Class;

    goto :goto_2

    .end local p1    # "loader":Ljava/lang/ClassLoader;
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->class$org$apache$tools$ant$taskdefs$compilers$CompilerAdapter:Ljava/lang/Class;

    goto :goto_1
.end method
