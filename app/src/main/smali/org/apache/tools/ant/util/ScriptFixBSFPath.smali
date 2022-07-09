.class public Lorg/apache/tools/ant/util/ScriptFixBSFPath;
.super Ljava/lang/Object;
.source "ScriptFixBSFPath.java"


# static fields
.field private static final BSF_LANGUAGES:[Ljava/lang/String;

.field private static final BSF_LANGUAGE_MAP:Ljava/util/Map;

.field private static final BSF_MANAGER:Ljava/lang/String; = "org.apache.bsf.BSFManager"

.field private static final BSF_PACKAGE:Ljava/lang/String; = "org.apache.bsf"

.field private static final BSF_SCRIPT_RUNNER:Ljava/lang/String; = "org.apache.tools.ant.util.optional.ScriptRunner"

.field private static final UTIL_OPTIONAL_PACKAGE:Ljava/lang/String; = "org.apache.tools.ant.util.optional"


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 46
    const/16 v1, 0x10

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string/jumbo v3, "js"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string/jumbo v3, "org.mozilla.javascript.Scriptable"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string/jumbo v3, "javascript"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string/jumbo v3, "org.mozilla.javascript.Scriptable"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string/jumbo v3, "jacl"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string/jumbo v3, "tcl.lang.Interp"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string/jumbo v3, "netrexx"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string/jumbo v3, "netrexx.lang.Rexx"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string/jumbo v3, "nrx"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string/jumbo v3, "netrexx.lang.Rexx"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string/jumbo v3, "jython"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string/jumbo v3, "org.python.core.Py"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string/jumbo v3, "py"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string/jumbo v3, "org.python.core.Py"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string/jumbo v3, "xslt"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string/jumbo v3, "org.apache.xpath.objects.XObject"

    aput-object v3, v1, v2

    sput-object v1, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGES:[Ljava/lang/String;

    .line 58
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGE_MAP:Ljava/util/Map;

    .line 60
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 61
    sget-object v1, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGE_MAP:Ljava/util/Map;

    sget-object v2, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGES:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGES:[Ljava/lang/String;

    add-int/lit8 v4, v0, 0x1

    aget-object v3, v3, v4

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 63
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getClassSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "className"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-static {p2}, Lorg/apache/tools/ant/util/LoaderUtils;->classNameToResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lorg/apache/tools/ant/util/LoaderUtils;->getResourceSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private getClassSource(Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 72
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->getClassSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public fixClassLoader(Ljava/lang/ClassLoader;Ljava/lang/String;)V
    .locals 9
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "language"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 96
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    if-eq p1, v8, :cond_0

    instance-of v8, p1, Lorg/apache/tools/ant/AntClassLoader;

    if-nez v8, :cond_1

    .line 145
    :cond_0
    :goto_0
    return-void

    .line 100
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    .local v3, "myLoader":Ljava/lang/ClassLoader;
    move-object v1, p1

    .line 101
    check-cast v1, Lorg/apache/tools/ant/AntClassLoader;

    .line 104
    .local v1, "fixLoader":Lorg/apache/tools/ant/AntClassLoader;
    const-string/jumbo v8, "org.apache.bsf.BSFManager"

    invoke-direct {p0, v8}, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->getClassSource(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 108
    .local v0, "bsfSource":Ljava/io/File;
    if-nez v0, :cond_4

    move v5, v6

    .line 111
    .local v5, "needMoveRunner":Z
    :goto_1
    sget-object v8, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->BSF_LANGUAGE_MAP:Ljava/util/Map;

    invoke-interface {v8, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 114
    .local v2, "languageClassName":Ljava/lang/String;
    if-eqz v0, :cond_5

    if-eqz v2, :cond_5

    invoke-static {v3, v2}, Lorg/apache/tools/ant/util/LoaderUtils;->classExists(Ljava/lang/ClassLoader;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_5

    invoke-static {p1, v2}, Lorg/apache/tools/ant/util/LoaderUtils;->classExists(Ljava/lang/ClassLoader;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    move v4, v6

    .line 121
    .local v4, "needMoveBsf":Z
    :goto_2
    if-nez v5, :cond_2

    if-eqz v4, :cond_6

    :cond_2
    move v5, v6

    .line 124
    :goto_3
    if-nez v0, :cond_3

    .line 125
    const-string/jumbo v6, "org.apache.bsf.BSFManager"

    invoke-direct {p0, p1, v6}, Lorg/apache/tools/ant/util/ScriptFixBSFPath;->getClassSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 128
    :cond_3
    if-nez v0, :cond_7

    .line 129
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "Unable to find BSF classes for scripting"

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v2    # "languageClassName":Ljava/lang/String;
    .end local v4    # "needMoveBsf":Z
    .end local v5    # "needMoveRunner":Z
    :cond_4
    move v5, v7

    .line 108
    goto :goto_1

    .restart local v2    # "languageClassName":Ljava/lang/String;
    .restart local v5    # "needMoveRunner":Z
    :cond_5
    move v4, v7

    .line 114
    goto :goto_2

    .restart local v4    # "needMoveBsf":Z
    :cond_6
    move v5, v7

    .line 121
    goto :goto_3

    .line 133
    :cond_7
    if-eqz v4, :cond_8

    .line 134
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/AntClassLoader;->addPathComponent(Ljava/io/File;)V

    .line 135
    const-string/jumbo v6, "org.apache.bsf"

    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/AntClassLoader;->addLoaderPackageRoot(Ljava/lang/String;)V

    .line 138
    :cond_8
    if-eqz v5, :cond_0

    .line 139
    const-string/jumbo v6, "org.apache.tools.ant.util.optional.ScriptRunner"

    invoke-static {v6}, Lorg/apache/tools/ant/util/LoaderUtils;->classNameToResource(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v6}, Lorg/apache/tools/ant/util/LoaderUtils;->getResourceSource(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/AntClassLoader;->addPathComponent(Ljava/io/File;)V

    .line 143
    const-string/jumbo v6, "org.apache.tools.ant.util.optional"

    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/AntClassLoader;->addLoaderPackageRoot(Ljava/lang/String;)V

    goto :goto_0
.end method
