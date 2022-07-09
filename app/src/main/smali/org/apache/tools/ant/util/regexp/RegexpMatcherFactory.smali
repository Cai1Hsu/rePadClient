.class public Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;
.super Ljava/lang/Object;
.source "RegexpMatcherFactory.java"


# static fields
.field static class$org$apache$tools$ant$util$regexp$RegexpMatcher:Ljava/lang/Class;

.field static class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
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
    .line 81
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

.method public static regexpMatcherPresent(Lorg/apache/tools/ant/Project;)Z
    .locals 2
    .param p0, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 108
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;-><init>()V

    invoke-virtual {v1, p0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->newRegexpMatcher(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    const/4 v1, 0x1

    .line 111
    :goto_0
    return v1

    .line 110
    :catch_0
    move-exception v0

    .line 111
    .local v0, "ex":Ljava/lang/Throwable;
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected createInstance(Ljava/lang/String;)Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
    .locals 2
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 81
    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.util.regexp.RegexpMatcherFactory"

    invoke-static {v0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$org$apache$tools$ant$util$regexp$RegexpMatcher:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.util.regexp.RegexpMatcher"

    invoke-static {v0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$org$apache$tools$ant$util$regexp$RegexpMatcher:Ljava/lang/Class;

    :goto_1
    invoke-static {p1, v1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$org$apache$tools$ant$util$regexp$RegexpMatcherFactory:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->class$org$apache$tools$ant$util$regexp$RegexpMatcher:Ljava/lang/Class;

    goto :goto_1
.end method

.method public newRegexpMatcher()Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->newRegexpMatcher(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    move-result-object v0

    return-object v0
.end method

.method public newRegexpMatcher(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/RegexpMatcher;
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 57
    const/4 v0, 0x0

    .line 58
    .local v0, "systemDefault":Ljava/lang/String;
    if-nez p1, :cond_0

    .line 59
    const-string/jumbo v1, "ant.regexp.regexpimpl"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    :goto_0
    if-eqz v0, :cond_1

    .line 65
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;->createInstance(Ljava/lang/String;)Lorg/apache/tools/ant/util/regexp/RegexpMatcher;

    move-result-object v1

    .line 70
    :goto_1
    return-object v1

    .line 61
    :cond_0
    const-string/jumbo v1, "ant.regexp.regexpimpl"

    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 70
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpMatcher;-><init>()V

    goto :goto_1
.end method

.method protected testAvailability(Ljava/lang/String;)V
    .locals 2
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 93
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "t":Ljava/lang/Throwable;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
