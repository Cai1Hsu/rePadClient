.class public Lorg/apache/tools/ant/types/resources/comparators/FileSystem;
.super Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.source "FileSystem.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 41
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
.method protected resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 7
    .param p1, "foo"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "bar"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 41
    sget-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v4, :cond_0

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 42
    .local v2, "fooFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-nez v2, :cond_1

    .line 43
    new-instance v4, Ljava/lang/ClassCastException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " doesn\'t provide files"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 41
    .end local v2    # "fooFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_0
    sget-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 46
    .restart local v2    # "fooFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_1
    invoke-interface {v2}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v3

    .line 47
    .local v3, "foofile":Ljava/io/File;
    sget-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v4, :cond_2

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {p2, v4}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 48
    .local v0, "barFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-nez v0, :cond_3

    .line 49
    new-instance v4, Ljava/lang/ClassCastException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " doesn\'t provide files"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 47
    .end local v0    # "barFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    sget-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 52
    .restart local v0    # "barFP":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_3
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    .line 53
    .local v1, "barfile":Ljava/io/File;
    invoke-virtual {v3, v1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x0

    :goto_2
    return v4

    :cond_4
    sget-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v4, v3, v1}, Lorg/apache/tools/ant/util/FileUtils;->isLeadingPath(Ljava/io/File;Ljava/io/File;)Z

    move-result v4

    if-eqz v4, :cond_5

    const/4 v4, -0x1

    goto :goto_2

    :cond_5
    sget-object v4, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    sget-object v5, Lorg/apache/tools/ant/types/resources/comparators/FileSystem;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/util/FileUtils;->normalize(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/File;->compareTo(Ljava/io/File;)I

    move-result v4

    goto :goto_2
.end method
