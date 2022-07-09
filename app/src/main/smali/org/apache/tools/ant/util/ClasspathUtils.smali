.class public Lorg/apache/tools/ant/util/ClasspathUtils;
.super Ljava/lang/Object;
.source "ClasspathUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;
    }
.end annotation


# static fields
.field public static final REUSE_LOADER_REF:Ljava/lang/String; = "ant.reuse.loader"

.field static class$java$lang$Object:Ljava/lang/Class;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 307
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/Project;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 70
    invoke-static {p0}, Lorg/apache/tools/ant/util/ClasspathUtils;->isMagicPropertySet(Lorg/apache/tools/ant/Project;)Z

    move-result v0

    return v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 227
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

.method public static getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;)Ljava/lang/ClassLoader;
    .locals 1
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p2, "loaderId"    # Ljava/lang/String;

    .prologue
    .line 129
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;Z)Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;Z)Ljava/lang/ClassLoader;
    .locals 1
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p2, "loaderId"    # Ljava/lang/String;
    .param p3, "reverseLoader"    # Z

    .prologue
    .line 149
    invoke-static {p0}, Lorg/apache/tools/ant/util/ClasspathUtils;->isMagicPropertySet(Lorg/apache/tools/ant/Project;)Z

    move-result v0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;ZZ)Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;ZZ)Ljava/lang/ClassLoader;
    .locals 5
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p2, "loaderId"    # Ljava/lang/String;
    .param p3, "reverseLoader"    # Z
    .param p4, "reuseLoader"    # Z

    .prologue
    .line 171
    const/4 v0, 0x0

    .line 174
    .local v0, "cl":Ljava/lang/ClassLoader;
    if-eqz p2, :cond_1

    if-eqz p4, :cond_1

    .line 175
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 176
    .local v1, "reusedLoader":Ljava/lang/Object;
    if-eqz v1, :cond_0

    instance-of v2, v1, Ljava/lang/ClassLoader;

    if-nez v2, :cond_0

    .line 177
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "The specified loader id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " does not reference a class loader"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_0
    move-object v0, v1

    .line 180
    check-cast v0, Ljava/lang/ClassLoader;

    .line 182
    .end local v1    # "reusedLoader":Ljava/lang/Object;
    :cond_1
    if-nez v0, :cond_2

    .line 183
    invoke-static {p0, p1, p3}, Lorg/apache/tools/ant/util/ClasspathUtils;->getUniqueClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Ljava/lang/ClassLoader;

    move-result-object v0

    .line 184
    if-eqz p2, :cond_2

    if-eqz p4, :cond_2

    .line 185
    invoke-virtual {p0, p2, v0}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 188
    :cond_2
    return-object v0
.end method

.method public static getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Reference;)Ljava/lang/ClassLoader;
    .locals 1
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Reference;Z)Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Reference;Z)Ljava/lang/ClassLoader;
    .locals 6
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;
    .param p2, "reverseLoader"    # Z

    .prologue
    .line 107
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v2

    .line 108
    .local v2, "pathId":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 109
    .local v1, "path":Ljava/lang/Object;
    instance-of v3, v1, Lorg/apache/tools/ant/types/Path;

    if-nez v3, :cond_0

    .line 110
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "The specified classpathref "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " does not reference a Path."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 113
    :cond_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "ant.loader."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "loaderId":Ljava/lang/String;
    check-cast v1, Lorg/apache/tools/ant/types/Path;

    .end local v1    # "path":Ljava/lang/Object;
    invoke-static {p0, v1, v0, p2}, Lorg/apache/tools/ant/util/ClasspathUtils;->getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;Z)Ljava/lang/ClassLoader;

    move-result-object v3

    return-object v3
.end method

.method public static getDelegate(Lorg/apache/tools/ant/ProjectComponent;)Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;
    .locals 1
    .param p0, "component"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 278
    new-instance v0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;-><init>(Lorg/apache/tools/ant/ProjectComponent;)V

    return-object v0
.end method

.method public static getUniqueClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Ljava/lang/ClassLoader;
    .locals 2
    .param p0, "p"    # Lorg/apache/tools/ant/Project;
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p2, "reverseLoader"    # Z

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    .line 207
    .local v0, "acl":Lorg/apache/tools/ant/AntClassLoader;
    if-eqz p2, :cond_0

    .line 208
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntClassLoader;->setParentFirst(Z)V

    .line 209
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->addJavaLibraries()V

    .line 211
    :cond_0
    return-object v0
.end method

.method private static isMagicPropertySet(Lorg/apache/tools/ant/Project;)Z
    .locals 1
    .param p0, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 286
    const-string/jumbo v0, "ant.reuse.loader"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Object;
    .locals 1
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "userDefinedLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 227
    sget-object v0, Lorg/apache/tools/ant/util/ClasspathUtils;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "java.lang.Object"

    invoke-static {v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/util/ClasspathUtils;->class$java$lang$Object:Ljava/lang/Class;

    :goto_0
    invoke-static {p0, p1, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/util/ClasspathUtils;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_0
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 6
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "userDefinedLoader"    # Ljava/lang/ClassLoader;
    .param p2, "expectedType"    # Ljava/lang/Class;

    .prologue
    .line 249
    const/4 v3, 0x1

    :try_start_0
    invoke-static {p0, v3, p1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 250
    .local v0, "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    .line 251
    .local v2, "o":Ljava/lang/Object;
    invoke-virtual {p2, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 252
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Class of unexpected Type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " expected :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_0} :catch_3

    .line 256
    .end local v0    # "clazz":Ljava/lang/Class;
    .end local v2    # "o":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 257
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Class not found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 258
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v1

    .line 259
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not instantiate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ". Specified class should have a no "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "argument constructor."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 261
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v1

    .line 262
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not instantiate "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ". Specified class should have a "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "public constructor."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 264
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_3
    move-exception v1

    .line 265
    .local v1, "e":Ljava/lang/LinkageError;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " could not be loaded because of an invalid dependency."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 255
    .end local v1    # "e":Ljava/lang/LinkageError;
    .restart local v0    # "clazz":Ljava/lang/Class;
    .restart local v2    # "o":Ljava/lang/Object;
    :cond_0
    return-object v2
.end method
