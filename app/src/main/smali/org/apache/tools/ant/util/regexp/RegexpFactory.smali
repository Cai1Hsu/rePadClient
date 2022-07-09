.class public Lorg/apache/tools/ant/util/regexp/RegexpFactory;
.super Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;
.source "RegexpFactory.java"


# static fields
.field static class$org$apache$tools$ant$util$regexp$Regexp:Ljava/lang/Class;

.field static class$org$apache$tools$ant$util$regexp$RegexpFactory:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/util/regexp/RegexpMatcherFactory;-><init>()V

    .line 35
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


# virtual methods
.method protected createRegexpInstance(Ljava/lang/String;)Lorg/apache/tools/ant/util/regexp/Regexp;
    .locals 2
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 81
    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$org$apache$tools$ant$util$regexp$RegexpFactory:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.util.regexp.RegexpFactory"

    invoke-static {v0}, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$org$apache$tools$ant$util$regexp$RegexpFactory:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$org$apache$tools$ant$util$regexp$Regexp:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.util.regexp.Regexp"

    invoke-static {v0}, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$org$apache$tools$ant$util$regexp$Regexp:Ljava/lang/Class;

    :goto_1
    invoke-static {p1, v1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/util/regexp/Regexp;

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$org$apache$tools$ant$util$regexp$RegexpFactory:Ljava/lang/Class;

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->class$org$apache$tools$ant$util$regexp$Regexp:Ljava/lang/Class;

    goto :goto_1
.end method

.method public newRegexp()Lorg/apache/tools/ant/util/regexp/Regexp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->newRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    return-object v0
.end method

.method public newRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 54
    const/4 v0, 0x0

    .line 55
    .local v0, "systemDefault":Ljava/lang/String;
    if-nez p1, :cond_0

    .line 56
    const-string/jumbo v1, "ant.regexp.regexpimpl"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    :goto_0
    if-eqz v0, :cond_1

    .line 62
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/regexp/RegexpFactory;->createRegexpInstance(Ljava/lang/String;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v1

    .line 67
    :goto_1
    return-object v1

    .line 58
    :cond_0
    const-string/jumbo v1, "ant.regexp.regexpimpl"

    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 67
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpRegexp;

    invoke-direct {v1}, Lorg/apache/tools/ant/util/regexp/Jdk14RegexpRegexp;-><init>()V

    goto :goto_1
.end method
