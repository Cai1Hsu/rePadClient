.class public final Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;
.super Ljava/lang/Object;
.source "RmicAdapterFactory.java"


# static fields
.field public static final DEFAULT_COMPILER:Ljava/lang/String; = "default"

.field public static final ERROR_NOT_RMIC_ADAPTER:Ljava/lang/String; = "Class of unexpected Type: "

.field public static final ERROR_UNKNOWN_COMPILER:Ljava/lang/String; = "Class not found: "

.field static class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter:Ljava/lang/Class;

.field static class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory:Ljava/lang/Class;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 133
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

.method public static getRmic(Ljava/lang/String;Lorg/apache/tools/ant/Task;)Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    .locals 1
    .param p0, "rmicType"    # Ljava/lang/String;
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->getRmic(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static getRmic(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    .locals 1
    .param p0, "rmicType"    # Ljava/lang/String;
    .param p1, "task"    # Lorg/apache/tools/ant/Task;
    .param p2, "classpath"    # Lorg/apache/tools/ant/types/Path;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 97
    const-string/jumbo v0, "default"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 98
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo p0, "kaffe"

    .line 102
    :cond_1
    :goto_0
    const-string/jumbo v0, "sun"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 103
    new-instance v0, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/rmic/SunRmic;-><init>()V

    .line 114
    :goto_1
    return-object v0

    .line 98
    :cond_2
    const-string/jumbo p0, "sun"

    goto :goto_0

    .line 104
    :cond_3
    const-string/jumbo v0, "kaffe"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 105
    new-instance v0, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;-><init>()V

    goto :goto_1

    .line 106
    :cond_4
    const-string/jumbo v0, "weblogic"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 107
    new-instance v0, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/rmic/WLRmic;-><init>()V

    goto :goto_1

    .line 108
    :cond_5
    const-string/jumbo v0, "forking"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 109
    new-instance v0, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/rmic/ForkingSunRmic;-><init>()V

    goto :goto_1

    .line 110
    :cond_6
    const-string/jumbo v0, "xnew"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 111
    new-instance v0, Lorg/apache/tools/ant/taskdefs/rmic/XNewRmic;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/rmic/XNewRmic;-><init>()V

    goto :goto_1

    .line 114
    :cond_7
    invoke-virtual {p1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    move-result-object v0

    goto :goto_1
.end method

.method private static resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 131
    if-eqz p1, :cond_0

    .end local p1    # "loader":Ljava/lang/ClassLoader;
    :goto_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.rmic.RmicAdapter"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter:Ljava/lang/Class;

    :goto_1
    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;

    return-object v0

    .restart local p1    # "loader":Ljava/lang/ClassLoader;
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.rmic.RmicAdapterFactory"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$org$apache$tools$ant$taskdefs$rmic$RmicAdapterFactory:Ljava/lang/Class;

    goto :goto_2

    .end local p1    # "loader":Ljava/lang/ClassLoader;
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapterFactory;->class$org$apache$tools$ant$taskdefs$rmic$RmicAdapter:Ljava/lang/Class;

    goto :goto_1
.end method
