.class public final Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapterFactory;
.super Ljava/lang/Object;
.source "JspCompilerAdapterFactory.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    .locals 2
    .param p0, "compilerType"    # Ljava/lang/String;
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 56
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapterFactory;->getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/AntClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/AntClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    .locals 2
    .param p0, "compilerType"    # Ljava/lang/String;
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "loader"    # Lorg/apache/tools/ant/AntClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 83
    const-string/jumbo v0, "jasper"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;-><init>(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;)V

    .line 91
    :goto_0
    return-object v0

    .line 87
    :cond_0
    const-string/jumbo v0, "jasper41"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 89
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;

    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/jsp/Jasper41Mangler;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/Jasper41Mangler;-><init>()V

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JasperC;-><init>(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspMangler;)V

    goto :goto_0

    .line 91
    :cond_1
    invoke-static {p0, p2}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapterFactory;->resolveClassName(Ljava/lang/String;Lorg/apache/tools/ant/AntClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;

    move-result-object v0

    goto :goto_0
.end method

.method private static resolveClassName(Ljava/lang/String;Lorg/apache/tools/ant/AntClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    .locals 8
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classloader"    # Lorg/apache/tools/ant/AntClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 107
    :try_start_0
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/AntClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 108
    .local v0, "c":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 109
    .local v3, "o":Ljava/lang/Object;
    check-cast v3, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .end local v3    # "o":Ljava/lang/Object;
    return-object v3

    .line 110
    .end local v0    # "c":Ljava/lang/Class;
    :catch_0
    move-exception v2

    .line 111
    .local v2, "cnfe":Ljava/lang/ClassNotFoundException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " can\'t be found."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 112
    .end local v2    # "cnfe":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v1

    .line 113
    .local v1, "cce":Ljava/lang/ClassCastException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " isn\'t the classname of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "a compiler adapter."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 115
    .end local v1    # "cce":Ljava/lang/ClassCastException;
    :catch_2
    move-exception v4

    .line 117
    .local v4, "t":Ljava/lang/Throwable;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " caused an interesting "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "exception."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method
