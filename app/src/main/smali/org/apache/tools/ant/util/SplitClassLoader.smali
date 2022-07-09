.class public final Lorg/apache/tools/ant/util/SplitClassLoader;
.super Lorg/apache/tools/ant/AntClassLoader;
.source "SplitClassLoader.java"


# instance fields
.field private final splitClasses:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/types/Path;Lorg/apache/tools/ant/Project;[Ljava/lang/String;)V
    .locals 1
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p3, "project"    # Lorg/apache/tools/ant/Project;
    .param p4, "splitClasses"    # [Ljava/lang/String;

    .prologue
    .line 39
    const/4 v0, 0x1

    invoke-direct {p0, p1, p3, p2, v0}, Lorg/apache/tools/ant/AntClassLoader;-><init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V

    .line 40
    iput-object p4, p0, Lorg/apache/tools/ant/util/SplitClassLoader;->splitClasses:[Ljava/lang/String;

    .line 41
    return-void
.end method

.method private isSplit(Ljava/lang/String;)Z
    .locals 4
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 63
    const/16 v2, 0x2e

    invoke-virtual {p1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 64
    .local v1, "simplename":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/SplitClassLoader;->splitClasses:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_2

    .line 65
    iget-object v2, p0, Lorg/apache/tools/ant/util/SplitClassLoader;->splitClasses:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/util/SplitClassLoader;->splitClasses:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const/16 v3, 0x24

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 67
    :cond_0
    const/4 v2, 0x1

    .line 70
    :goto_1
    return v2

    .line 64
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 70
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method


# virtual methods
.method protected declared-synchronized loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 2
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "resolve"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 47
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/SplitClassLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 48
    .local v0, "theClass":Ljava/lang/Class;
    if-eqz v0, :cond_0

    move-object v1, v0

    .line 58
    :goto_0
    monitor-exit p0

    return-object v1

    .line 51
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/SplitClassLoader;->isSplit(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 52
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/SplitClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 53
    if-eqz p2, :cond_1

    .line 54
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/SplitClassLoader;->resolveClass(Ljava/lang/Class;)V

    :cond_1
    move-object v1, v0

    .line 56
    goto :goto_0

    .line 58
    :cond_2
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    goto :goto_0

    .line 47
    .end local v0    # "theClass":Ljava/lang/Class;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
