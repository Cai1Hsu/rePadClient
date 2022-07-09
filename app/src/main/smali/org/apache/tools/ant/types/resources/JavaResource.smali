.class public Lorg/apache/tools/ant/types/resources/JavaResource;
.super Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;
.source "JavaResource.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/URLProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;-><init>()V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;-><init>()V

    .line 48
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/JavaResource;->setName(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/resources/JavaResource;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 50
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 7
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 106
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->isReference()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Comparable;

    invoke-interface {v3, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v3

    .line 137
    :cond_0
    :goto_0
    return v3

    .line 109
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    move-object v1, p1

    .line 110
    check-cast v1, Lorg/apache/tools/ant/types/resources/JavaResource;

    .line 111
    .local v1, "otherjr":Lorg/apache/tools/ant/types/resources/JavaResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 114
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v5

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v6

    if-eq v5, v6, :cond_4

    .line 115
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 118
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v3

    if-nez v3, :cond_3

    move v3, v4

    .line 119
    goto :goto_0

    .line 121
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getLoader()Lorg/apache/tools/ant/types/Reference;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 124
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    .line 125
    .local v2, "p":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 126
    .local v0, "op":Lorg/apache/tools/ant/types/Path;
    if-eq v2, v0, :cond_6

    .line 127
    if-eqz v2, :cond_0

    .line 130
    if-nez v0, :cond_5

    move v3, v4

    .line 131
    goto :goto_0

    .line 133
    :cond_5
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v3

    goto :goto_0

    .line 135
    :cond_6
    const/4 v3, 0x0

    goto :goto_0

    .line 137
    .end local v0    # "op":Lorg/apache/tools/ant/types/Path;
    .end local v1    # "otherjr":Lorg/apache/tools/ant/types/resources/JavaResource;
    .end local v2    # "p":Lorg/apache/tools/ant/types/Path;
    :cond_7
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource;->compareTo(Ljava/lang/Object;)I

    move-result v3

    goto :goto_0
.end method

.method public getURL()Ljava/net/URL;
    .locals 3

    .prologue
    .line 82
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getCheckedRef()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/JavaResource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/JavaResource;->getURL()Ljava/net/URL;

    move-result-object v1

    .line 93
    :goto_0
    return-object v1

    .line 85
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getClassLoader()Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;

    move-result-object v0

    .line 87
    .local v0, "classLoader":Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->getLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    if-nez v1, :cond_1

    .line 88
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/ClassLoader;->getSystemResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    goto :goto_0

    .line 91
    :cond_1
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->getLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 93
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->cleanup()V

    goto :goto_0

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/AbstractClasspathResource$ClassLoaderWithFlag;->cleanup()V

    throw v1
.end method

.method protected openInputStream(Ljava/lang/ClassLoader;)Ljava/io/InputStream;
    .locals 4
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    if-nez p1, :cond_0

    .line 62
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 63
    .local v0, "inputStream":Ljava/io/InputStream;
    if-nez v0, :cond_1

    .line 64
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "No resource "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " on Ant\'s classpath"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 68
    .end local v0    # "inputStream":Ljava/io/InputStream;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 69
    .restart local v0    # "inputStream":Ljava/io/InputStream;
    if-nez v0, :cond_1

    .line 70
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "No resource "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " on the classpath "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 74
    :cond_1
    return-object v0
.end method
