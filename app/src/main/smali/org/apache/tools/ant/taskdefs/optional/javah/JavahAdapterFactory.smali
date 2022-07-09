.class public Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;
.super Ljava/lang/Object;
.source "JavahAdapterFactory.java"


# static fields
.field static class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 118
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

.method public static getAdapter(Ljava/lang/String;Lorg/apache/tools/ant/ProjectComponent;)Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;
    .locals 1
    .param p0, "choice"    # Ljava/lang/String;
    .param p1, "log"    # Lorg/apache/tools/ant/ProjectComponent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->getAdapter(Ljava/lang/String;Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static getAdapter(Ljava/lang/String;Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;
    .locals 1
    .param p0, "choice"    # Ljava/lang/String;
    .param p1, "log"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p2, "classpath"    # Lorg/apache/tools/ant/types/Path;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isKaffe()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p0, :cond_1

    :cond_0
    const-string/jumbo v0, "kaffeh"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 86
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/javah/Kaffeh;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/Kaffeh;-><init>()V

    .line 101
    :goto_0
    return-object v0

    .line 87
    :cond_2
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isGij()Z

    move-result v0

    if-eqz v0, :cond_3

    if-eqz p0, :cond_4

    :cond_3
    const-string/jumbo v0, "gcjh"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 89
    :cond_4
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/javah/Gcjh;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/Gcjh;-><init>()V

    goto :goto_0

    .line 90
    :cond_5
    const-string/jumbo v0, "sun"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 91
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/javah/SunJavah;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/SunJavah;-><init>()V

    goto :goto_0

    .line 92
    :cond_6
    if-eqz p0, :cond_7

    .line 93
    invoke-virtual {p1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    move-result-object v0

    goto :goto_0

    .line 101
    :cond_7
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/javah/SunJavah;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/SunJavah;-><init>()V

    goto :goto_0
.end method

.method public static getDefault()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isKaffe()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 44
    const-string/jumbo v0, "kaffeh"

    .line 48
    :goto_0
    return-object v0

    .line 45
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isGij()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 46
    const-string/jumbo v0, "gcjh"

    goto :goto_0

    .line 48
    :cond_1
    const-string/jumbo v0, "sun"

    goto :goto_0
.end method

.method private static resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 116
    if-eqz p1, :cond_0

    .end local p1    # "loader":Ljava/lang/ClassLoader;
    :goto_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.optional.javah.JavahAdapter"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter:Ljava/lang/Class;

    :goto_1
    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapter;

    return-object v0

    .restart local p1    # "loader":Ljava/lang/ClassLoader;
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.optional.javah.JavahAdapterFactory"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapterFactory:Ljava/lang/Class;

    goto :goto_2

    .end local p1    # "loader":Ljava/lang/ClassLoader;
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/taskdefs/optional/javah/JavahAdapterFactory;->class$org$apache$tools$ant$taskdefs$optional$javah$JavahAdapter:Ljava/lang/Class;

    goto :goto_1
.end method
