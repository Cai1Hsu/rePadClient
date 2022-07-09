.class public Lorg/apache/tools/ant/ProjectHelperRepository;
.super Ljava/lang/Object;
.source "ProjectHelperRepository.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static final DEBUG_PROJECT_HELPER_REPOSITORY:Ljava/lang/String; = "ant.project-helper-repo.debug"

.field private static final NO_CLASS:[Ljava/lang/Class;

.field private static final NO_OBJECT:[Ljava/lang/Object;

.field private static PROJECTHELPER2_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

.field static class$org$apache$tools$ant$helper$ProjectHelper2:Ljava/lang/Class;

.field private static instance:Lorg/apache/tools/ant/ProjectHelperRepository;


# instance fields
.field private helpers:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 49
    const-string/jumbo v1, "true"

    const-string/jumbo v2, "ant.project-helper-repo.debug"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    sput-boolean v1, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    .line 52
    new-instance v1, Lorg/apache/tools/ant/ProjectHelperRepository;

    invoke-direct {v1}, Lorg/apache/tools/ant/ProjectHelperRepository;-><init>()V

    sput-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->instance:Lorg/apache/tools/ant/ProjectHelperRepository;

    .line 57
    new-array v1, v3, [Ljava/lang/Class;

    sput-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->NO_CLASS:[Ljava/lang/Class;

    .line 58
    new-array v1, v3, [Ljava/lang/Object;

    sput-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->NO_OBJECT:[Ljava/lang/Object;

    .line 64
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->class$org$apache$tools$ant$helper$ProjectHelper2:Ljava/lang/Class;

    if-nez v1, :cond_0

    const-string/jumbo v1, "org.apache.tools.ant.helper.ProjectHelper2"

    invoke-static {v1}, Lorg/apache/tools/ant/ProjectHelperRepository;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->class$org$apache$tools$ant$helper$ProjectHelper2:Ljava/lang/Class;

    :goto_0
    sget-object v2, Lorg/apache/tools/ant/ProjectHelperRepository;->NO_CLASS:[Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->PROJECTHELPER2_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    .line 70
    return-void

    .line 64
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->class$org$apache$tools$ant$helper$ProjectHelper2:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 66
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/ProjectHelperRepository;->helpers:Ljava/util/List;

    .line 77
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectHelperRepository;->collectProjectHelpers()V

    .line 78
    return-void
.end method

.method static access$000()Ljava/lang/reflect/Constructor;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lorg/apache/tools/ant/ProjectHelperRepository;->PROJECTHELPER2_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    return-object v0
.end method

.method static access$100()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lorg/apache/tools/ant/ProjectHelperRepository;->NO_OBJECT:[Ljava/lang/Object;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 64
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

.method private collectProjectHelpers()V
    .locals 9

    .prologue
    .line 82
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectHelperRepository;->getProjectHelperBySystemProperty()Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 83
    .local v2, "projectHelper":Ljava/lang/reflect/Constructor;
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/ProjectHelperRepository;->registerProjectHelper(Ljava/lang/reflect/Constructor;)V

    .line 88
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 89
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_1

    .line 90
    const-string/jumbo v6, "META-INF/services/org.apache.tools.ant.ProjectHelper"

    invoke-virtual {v0, v6}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v4

    .line 92
    .local v4, "resources":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 93
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/URL;

    .line 94
    .local v3, "resource":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {p0, v6}, Lorg/apache/tools/ant/ProjectHelperRepository;->getProjectHelperByService(Ljava/io/InputStream;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 96
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/ProjectHelperRepository;->registerProjectHelper(Ljava/lang/reflect/Constructor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    .end local v0    # "classLoader":Ljava/lang/ClassLoader;
    .end local v3    # "resource":Ljava/net/URL;
    .end local v4    # "resources":Ljava/util/Enumeration;
    :catch_0
    move-exception v1

    .line 107
    .local v1, "e":Ljava/lang/Exception;
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Unable to load ProjectHelper from service META-INF/services/org.apache.tools.ant.ProjectHelper ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 111
    sget-boolean v6, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    if-eqz v6, :cond_0

    .line 112
    sget-object v6, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v6}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 115
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_1
    return-void

    .line 100
    .restart local v0    # "classLoader":Ljava/lang/ClassLoader;
    :cond_1
    :try_start_1
    const-string/jumbo v6, "META-INF/services/org.apache.tools.ant.ProjectHelper"

    invoke-static {v6}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 102
    .local v5, "systemResource":Ljava/io/InputStream;
    if-eqz v5, :cond_0

    .line 103
    invoke-direct {p0, v5}, Lorg/apache/tools/ant/ProjectHelperRepository;->getProjectHelperByService(Ljava/io/InputStream;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 104
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/ProjectHelperRepository;->registerProjectHelper(Ljava/lang/reflect/Constructor;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private getHelperConstructor(Ljava/lang/String;)Ljava/lang/reflect/Constructor;
    .locals 4
    .param p1, "helperClass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 229
    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 231
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    const/4 v1, 0x0

    .line 232
    .local v1, "clazz":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 234
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 239
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 240
    :try_start_1
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 242
    :cond_1
    sget-object v3, Lorg/apache/tools/ant/ProjectHelperRepository;->NO_CLASS:[Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    return-object v3

    .line 243
    :catch_0
    move-exception v2

    .line 244
    .local v2, "e":Ljava/lang/Exception;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 235
    .end local v2    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    goto :goto_0
.end method

.method public static getInstance()Lorg/apache/tools/ant/ProjectHelperRepository;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lorg/apache/tools/ant/ProjectHelperRepository;->instance:Lorg/apache/tools/ant/ProjectHelperRepository;

    return-object v0
.end method

.method private getProjectHelperByService(Ljava/io/InputStream;)Ljava/lang/reflect/Constructor;
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 191
    :try_start_0
    new-instance v2, Ljava/io/InputStreamReader;

    const-string/jumbo v4, "UTF-8"

    invoke-direct {v2, p1, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 195
    .local v2, "isr":Ljava/io/InputStreamReader;
    :goto_0
    :try_start_1
    new-instance v3, Ljava/io/BufferedReader;

    invoke-direct {v3, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 197
    .local v3, "rd":Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .line 198
    .local v1, "helperClassName":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 200
    if-eqz v1, :cond_0

    const-string/jumbo v4, ""

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 201
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelperConstructor(Ljava/lang/String;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    .line 210
    .end local v1    # "helperClassName":Ljava/lang/String;
    .end local v2    # "isr":Ljava/io/InputStreamReader;
    .end local v3    # "rd":Ljava/io/BufferedReader;
    :goto_1
    return-object v4

    .line 192
    :catch_0
    move-exception v0

    .line 193
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/io/InputStreamReader;

    invoke-direct {v2, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .restart local v2    # "isr":Ljava/io/InputStreamReader;
    goto :goto_0

    .line 203
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v2    # "isr":Ljava/io/InputStreamReader;
    :catch_1
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to load ProjectHelper from service META-INF/services/org.apache.tools.ant.ProjectHelper ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 206
    sget-boolean v4, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    if-eqz v4, :cond_0

    .line 207
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v4}, Ljava/lang/Exception;->printStackTrace(Ljava/io/PrintStream;)V

    .line 210
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private getProjectHelperBySystemProperty()Ljava/lang/reflect/Constructor;
    .locals 5

    .prologue
    .line 168
    const-string/jumbo v2, "org.apache.tools.ant.ProjectHelper"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 170
    .local v1, "helperClass":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 171
    :try_start_0
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelperConstructor(Ljava/lang/String;)Ljava/lang/reflect/Constructor;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 182
    :goto_0
    return-object v2

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to load ProjectHelper class \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " specified in system property "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "org.apache.tools.ant.ProjectHelper"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/SecurityException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 178
    sget-boolean v2, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    if-eqz v2, :cond_0

    .line 179
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v2}, Ljava/lang/SecurityException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 182
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private registerProjectHelper(Ljava/lang/reflect/Constructor;)V
    .locals 3
    .param p1, "helperConstructor"    # Ljava/lang/reflect/Constructor;

    .prologue
    .line 157
    if-nez p1, :cond_0

    .line 165
    :goto_0
    return-void

    .line 160
    :cond_0
    sget-boolean v0, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    if-eqz v0, :cond_1

    .line 161
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ProjectHelper "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " registered."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 164
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/ProjectHelperRepository;->helpers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public getHelpers()Ljava/util/Iterator;
    .locals 2

    .prologue
    .line 304
    new-instance v0, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;

    iget-object v1, p0, Lorg/apache/tools/ant/ProjectHelperRepository;->helpers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/ProjectHelperRepository$ConstructingIterator;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public getProjectHelperForAntlib(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/ProjectHelper;
    .locals 5
    .param p1, "antlib"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 279
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelpers()Ljava/util/Iterator;

    move-result-object v1

    .line 280
    .local v1, "it":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 281
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ProjectHelper;

    .line 282
    .local v0, "helper":Lorg/apache/tools/ant/ProjectHelper;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/ProjectHelper;->canParseAntlibDescriptor(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 283
    sget-boolean v2, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    if-eqz v2, :cond_1

    .line 284
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "ProjectHelper "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " selected for the antlib "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 289
    :cond_1
    return-object v0

    .line 292
    .end local v0    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "BUG: at least the ProjectHelper2 should have supported the file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getProjectHelperForBuildFile(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/ProjectHelper;
    .locals 5
    .param p1, "buildFile"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 255
    invoke-virtual {p0}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelpers()Ljava/util/Iterator;

    move-result-object v1

    .line 256
    .local v1, "it":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 257
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ProjectHelper;

    .line 258
    .local v0, "helper":Lorg/apache/tools/ant/ProjectHelper;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/ProjectHelper;->canParseBuildFile(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 259
    sget-boolean v2, Lorg/apache/tools/ant/ProjectHelperRepository;->DEBUG:Z

    if-eqz v2, :cond_1

    .line 260
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "ProjectHelper "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " selected for the build file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 265
    :cond_1
    return-object v0

    .line 268
    .end local v0    # "helper":Lorg/apache/tools/ant/ProjectHelper;
    :cond_2
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "BUG: at least the ProjectHelper2 should have supported the file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public registerProjectHelper(Ljava/lang/Class;)V
    .locals 4
    .param p1, "helperClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 149
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/ProjectHelperRepository;->NO_CLASS:[Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/tools/ant/ProjectHelperRepository;->registerProjectHelper(Ljava/lang/reflect/Constructor;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    return-void

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Couldn\'t find no-arg constructor in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public registerProjectHelper(Ljava/lang/String;)V
    .locals 1
    .param p1, "helperClassName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/ProjectHelperRepository;->getHelperConstructor(Ljava/lang/String;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/ProjectHelperRepository;->registerProjectHelper(Ljava/lang/reflect/Constructor;)V

    .line 133
    return-void
.end method
