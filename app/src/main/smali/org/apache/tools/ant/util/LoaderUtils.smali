.class public Lorg/apache/tools/ant/util/LoaderUtils;
.super Ljava/lang/Object;
.source "LoaderUtils.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$util$LoaderUtils:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/LoaderUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 113
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

.method public static classExists(Ljava/lang/ClassLoader;Ljava/lang/String;)Z
    .locals 1
    .param p0, "loader"    # Ljava/lang/ClassLoader;
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-static {p1}, Lorg/apache/tools/ant/util/LoaderUtils;->classNameToResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static classNameToResource(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, ".class"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getClassSource(Ljava/lang/Class;)Ljava/io/File;
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 97
    invoke-static {p0}, Lorg/apache/tools/ant/launch/Locator;->getClassSource(Ljava/lang/Class;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/LoaderUtils;->normalizeSource(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public static getContextClassLoader()Ljava/lang/ClassLoader;
    .locals 2

    .prologue
    .line 54
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 55
    .local v0, "currentThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    return-object v1
.end method

.method public static getResourceSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p0, "c"    # Ljava/lang/ClassLoader;
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    .line 112
    if-nez p0, :cond_0

    .line 113
    sget-object v0, Lorg/apache/tools/ant/util/LoaderUtils;->class$org$apache$tools$ant$util$LoaderUtils:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.util.LoaderUtils"

    invoke-static {v0}, Lorg/apache/tools/ant/util/LoaderUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/LoaderUtils;->class$org$apache$tools$ant$util$LoaderUtils:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    .line 115
    :cond_0
    invoke-static {p0, p1}, Lorg/apache/tools/ant/launch/Locator;->getResourceSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/LoaderUtils;->normalizeSource(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0

    .line 113
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/util/LoaderUtils;->class$org$apache$tools$ant$util$LoaderUtils:Ljava/lang/Class;

    goto :goto_0
.end method

.method public static isContextLoaderAvailable()Z
    .locals 1

    .prologue
    .line 65
    const/4 v0, 0x1

    return v0
.end method

.method private static normalizeSource(Ljava/io/File;)Ljava/io/File;
    .locals 2
    .param p0, "source"    # Ljava/io/File;

    .prologue
    .line 76
    if-eqz p0, :cond_0

    .line 78
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/util/LoaderUtils;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 84
    :cond_0
    :goto_0
    return-object p0

    .line 79
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static setContextClassLoader(Ljava/lang/ClassLoader;)V
    .locals 1
    .param p0, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 42
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 43
    .local v0, "currentThread":Ljava/lang/Thread;
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 44
    return-void
.end method
