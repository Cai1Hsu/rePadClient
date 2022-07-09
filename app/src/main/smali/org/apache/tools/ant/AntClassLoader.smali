.class public Lorg/apache/tools/ant/AntClassLoader;
.super Ljava/lang/ClassLoader;
.source "AntClassLoader.java"

# interfaces
.implements Lorg/apache/tools/ant/SubBuildListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final CONSTRUCTOR_ARGS:[Ljava/lang/Class;

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final NUMBER_OF_STRINGS:I = 0x100

.field static class$java$lang$ClassLoader:Ljava/lang/Class;

.field static class$org$apache$tools$ant$AntClassLoader:Ljava/lang/Class;

.field static class$org$apache$tools$ant$Project:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

.field private static pathMap:Ljava/util/Map;

.field private static subClassToLoad:Ljava/lang/Class;


# instance fields
.field private ignoreBase:Z

.field private isContextLoaderSaved:Z

.field private jarFiles:Ljava/util/Hashtable;

.field private loaderPackages:Ljava/util/Vector;

.field private parent:Ljava/lang/ClassLoader;

.field private parentFirst:Z

.field private pathComponents:Ljava/util/Vector;

.field private project:Lorg/apache/tools/ant/Project;

.field private savedContextLoader:Ljava/lang/ClassLoader;

.field private systemPackages:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 72
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 220
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->pathMap:Ljava/util/Map;

    .line 1531
    const/4 v0, 0x0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->subClassToLoad:Ljava/lang/Class;

    .line 1532
    const/4 v0, 0x4

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$java$lang$ClassLoader:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "java.lang.ClassLoader"

    invoke-static {v0}, Lorg/apache/tools/ant/AntClassLoader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$java$lang$ClassLoader:Ljava/lang/Class;

    :goto_0
    aput-object v0, v1, v2

    const/4 v2, 0x1

    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v0, :cond_2

    const-string/jumbo v0, "org.apache.tools.ant.Project"

    invoke-static {v0}, Lorg/apache/tools/ant/AntClassLoader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_1
    aput-object v0, v1, v2

    const/4 v2, 0x2

    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    if-nez v0, :cond_3

    const-string/jumbo v0, "org.apache.tools.ant.types.Path"

    invoke-static {v0}, Lorg/apache/tools/ant/AntClassLoader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    :goto_2
    aput-object v0, v1, v2

    const/4 v0, 0x3

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v2, v1, v0

    sput-object v1, Lorg/apache/tools/ant/AntClassLoader;->CONSTRUCTOR_ARGS:[Ljava/lang/Class;

    .line 1537
    const-string/jumbo v0, "1.5"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isAtLeastJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1539
    :try_start_0
    const-string/jumbo v0, "org.apache.tools.ant.loader.AntClassLoader5"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->subClassToLoad:Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1545
    :cond_0
    :goto_3
    return-void

    .line 1532
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$java$lang$ClassLoader:Ljava/lang/Class;

    goto :goto_0

    :cond_2
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    goto :goto_1

    :cond_3
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$types$Path:Ljava/lang/Class;

    goto :goto_2

    .line 1541
    :catch_0
    move-exception v0

    goto :goto_3
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 251
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 174
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 192
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->systemPackages:Ljava/util/Vector;

    .line 199
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->loaderPackages:Ljava/util/Vector;

    .line 207
    iput-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    .line 212
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    .line 217
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    .line 226
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    .line 231
    iput-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    .line 252
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/AntClassLoader;->setParent(Ljava/lang/ClassLoader;)V

    .line 253
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;)V
    .locals 3
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .param p3, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 242
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 174
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 192
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->systemPackages:Ljava/util/Vector;

    .line 199
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->loaderPackages:Ljava/util/Vector;

    .line 207
    iput-boolean v1, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    .line 212
    iput-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    .line 217
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    .line 226
    iput-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    .line 231
    iput-boolean v1, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    .line 243
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->setParent(Ljava/lang/ClassLoader;)V

    .line 244
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/AntClassLoader;->setClassPath(Lorg/apache/tools/ant/types/Path;)V

    .line 245
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/AntClassLoader;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 246
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V
    .locals 0
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .param p3, "classpath"    # Lorg/apache/tools/ant/types/Path;
    .param p4, "parentFirst"    # Z

    .prologue
    .line 290
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/AntClassLoader;-><init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;)V

    .line 291
    if-eqz p1, :cond_0

    .line 292
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->setParent(Ljava/lang/ClassLoader;)V

    .line 294
    :cond_0
    invoke-virtual {p0, p4}, Lorg/apache/tools/ant/AntClassLoader;->setParentFirst(Z)V

    .line 295
    invoke-virtual {p0}, Lorg/apache/tools/ant/AntClassLoader;->addJavaLibraries()V

    .line 296
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;Z)V
    .locals 3
    .param p1, "parent"    # Ljava/lang/ClassLoader;
    .param p2, "parentFirst"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 327
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 174
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 192
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->systemPackages:Ljava/util/Vector;

    .line 199
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->loaderPackages:Ljava/util/Vector;

    .line 207
    iput-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    .line 212
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    .line 217
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    .line 226
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    .line 231
    iput-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    .line 328
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->setParent(Ljava/lang/ClassLoader;)V

    .line 329
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    .line 330
    iput-boolean p2, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 331
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;)V
    .locals 3
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 266
    invoke-direct {p0}, Ljava/lang/ClassLoader;-><init>()V

    .line 174
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    .line 185
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 192
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->systemPackages:Ljava/util/Vector;

    .line 199
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->loaderPackages:Ljava/util/Vector;

    .line 207
    iput-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    .line 212
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    .line 217
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    .line 226
    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    .line 231
    iput-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    .line 267
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/AntClassLoader;->setParent(Ljava/lang/ClassLoader;)V

    .line 268
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 269
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/AntClassLoader;->setClassPath(Lorg/apache/tools/ant/types/Path;)V

    .line 270
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "classpath"    # Lorg/apache/tools/ant/types/Path;
    .param p3, "parentFirst"    # Z

    .prologue
    .line 311
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/apache/tools/ant/AntClassLoader;-><init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V

    .line 312
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/AntClassLoader;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/AntClassLoader;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 375
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

.method private findBaseClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1387
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findSystemClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method private findClassInComponents(Ljava/lang/String;)Ljava/lang/Class;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1344
    const/4 v5, 0x0

    .line 1345
    .local v5, "stream":Ljava/io/InputStream;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->getClassFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1347
    .local v0, "classFilename":Ljava/lang/String;
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v6}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 1348
    .local v1, "e":Ljava/util/Enumeration;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1349
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1351
    .local v3, "pathComponent":Ljava/io/File;
    :try_start_1
    invoke-direct {p0, v3, v0}, Lorg/apache/tools/ant/AntClassLoader;->getResourceStream(Ljava/io/File;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 1352
    if-eqz v5, :cond_0

    .line 1353
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Loaded from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x4

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 1355
    invoke-direct {p0, v5, p1, v3}, Lorg/apache/tools/ant/AntClassLoader;->getClassFromStream(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/File;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v6

    .line 1367
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    return-object v6

    .line 1357
    :catch_0
    move-exception v4

    .line 1358
    .local v4, "se":Ljava/lang/SecurityException;
    :try_start_2
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1367
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v3    # "pathComponent":Ljava/io/File;
    .end local v4    # "se":Ljava/lang/SecurityException;
    :catchall_0
    move-exception v6

    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v6

    .line 1359
    .restart local v1    # "e":Ljava/util/Enumeration;
    .restart local v3    # "pathComponent":Ljava/io/File;
    :catch_1
    move-exception v2

    .line 1361
    .local v2, "ioe":Ljava/io/IOException;
    :try_start_3
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Exception reading component "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " (reason: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x3

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 1365
    .end local v2    # "ioe":Ljava/io/IOException;
    .end local v3    # "pathComponent":Ljava/io/File;
    :cond_1
    new-instance v6, Ljava/lang/ClassNotFoundException;

    invoke-direct {v6, p1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method private getCertificates(Ljava/io/File;Ljava/lang/String;)[Ljava/security/cert/Certificate;
    .locals 4
    .param p1, "container"    # Ljava/io/File;
    .param p2, "entry"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1197
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1205
    :cond_0
    :goto_0
    return-object v2

    .line 1200
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v3, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/jar/JarFile;

    .line 1201
    .local v1, "jarFile":Ljava/util/jar/JarFile;
    if-eqz v1, :cond_0

    .line 1204
    invoke-virtual {v1, p2}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;

    move-result-object v0

    .line 1205
    .local v0, "ent":Ljava/util/jar/JarEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/jar/JarEntry;->getCertificates()[Ljava/security/cert/Certificate;

    move-result-object v2

    goto :goto_0
.end method

.method private getClassFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 1100
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

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

.method private getClassFromStream(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/File;)Ljava/lang/Class;
    .locals 7
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "container"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x2000

    const/4 v5, 0x0

    .line 1291
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1292
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    const/4 v2, -0x1

    .line 1293
    .local v2, "bytesRead":I
    new-array v1, v6, [B

    .line 1295
    .local v1, "buffer":[B
    :goto_0
    invoke-virtual {p1, v1, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    .line 1296
    invoke-virtual {v0, v1, v5, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 1298
    :cond_0
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    .line 1299
    .local v3, "classData":[B
    invoke-virtual {p0, p3, v3, p2}, Lorg/apache/tools/ant/AntClassLoader;->defineClassFromData(Ljava/io/File;[BLjava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    return-object v4
.end method

.method private getJarManifest(Ljava/io/File;)Ljava/util/jar/Manifest;
    .locals 3
    .param p1, "container"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1174
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1181
    :cond_0
    :goto_0
    return-object v1

    .line 1177
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/jar/JarFile;

    .line 1178
    .local v0, "jarFile":Ljava/util/jar/JarFile;
    if-eqz v0, :cond_0

    .line 1181
    invoke-virtual {v0}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;

    move-result-object v1

    goto :goto_0
.end method

.method private getResourceStream(Ljava/io/File;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 7
    .param p1, "file"    # Ljava/io/File;
    .param p2, "resourceName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 778
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/jar/JarFile;

    .line 779
    .local v2, "jarFile":Ljava/util/jar/JarFile;
    if-nez v2, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 780
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 781
    .local v3, "resource":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 782
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 805
    .end local v2    # "jarFile":Ljava/util/jar/JarFile;
    .end local v3    # "resource":Ljava/io/File;
    :goto_0
    return-object v4

    .line 785
    .restart local v2    # "jarFile":Ljava/util/jar/JarFile;
    :cond_0
    if-nez v2, :cond_1

    .line 786
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 787
    new-instance v2, Ljava/util/jar/JarFile;

    .end local v2    # "jarFile":Ljava/util/jar/JarFile;
    invoke-direct {v2, p1}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V

    .line 788
    .restart local v2    # "jarFile":Ljava/util/jar/JarFile;
    iget-object v4, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v4, p1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 794
    iget-object v4, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v4, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "jarFile":Ljava/util/jar/JarFile;
    check-cast v2, Ljava/util/jar/JarFile;

    .line 796
    .restart local v2    # "jarFile":Ljava/util/jar/JarFile;
    :cond_1
    invoke-virtual {v2, p2}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;

    move-result-object v1

    .line 797
    .local v1, "entry":Ljava/util/jar/JarEntry;
    if-eqz v1, :cond_3

    .line 798
    invoke-virtual {v2, v1}, Ljava/util/jar/JarFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_0

    .end local v1    # "entry":Ljava/util/jar/JarEntry;
    :cond_2
    move-object v4, v5

    .line 790
    goto :goto_0

    .line 801
    .end local v2    # "jarFile":Ljava/util/jar/JarFile;
    :catch_0
    move-exception v0

    .line 802
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Ignoring Exception "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v6, ": "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v6, " reading resource "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v6, " from "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    invoke-virtual {p0, v4, v6}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .end local v0    # "e":Ljava/lang/Exception;
    :cond_3
    move-object v4, v5

    .line 805
    goto :goto_0
.end method

.method private getRootLoader()Ljava/lang/ClassLoader;
    .locals 2

    .prologue
    .line 853
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 854
    .local v0, "ret":Ljava/lang/ClassLoader;
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 855
    invoke-virtual {v0}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_0

    .line 857
    :cond_0
    return-object v0
.end method

.method public static initializeClass(Ljava/lang/Class;)V
    .locals 4
    .param p0, "theClass"    # Ljava/lang/Class;

    .prologue
    const/4 v3, 0x0

    .line 581
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 583
    .local v0, "cons":[Ljava/lang/reflect/Constructor;
    if-eqz v0, :cond_0

    .line 584
    array-length v2, v0

    if-lez v2, :cond_0

    aget-object v2, v0, v3

    if-eqz v2, :cond_0

    .line 585
    const/16 v2, 0x100

    new-array v1, v2, [Ljava/lang/String;

    .line 587
    .local v1, "strs":[Ljava/lang/String;
    const/4 v2, 0x0

    :try_start_0
    aget-object v2, v0, v2

    check-cast v1, [Ljava/lang/Object;

    .end local v1    # "strs":[Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 606
    :cond_0
    :goto_0
    return-void

    .line 590
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private isParentFirst(Ljava/lang/String;)Z
    .locals 4
    .param p1, "resourceName"    # Ljava/lang/String;

    .prologue
    .line 829
    iget-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 831
    .local v2, "useParentFirst":Z
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->systemPackages:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 832
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 833
    .local v1, "packageName":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 834
    const/4 v2, 0x1

    .line 838
    .end local v1    # "packageName":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->loaderPackages:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 839
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 840
    .restart local v1    # "packageName":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 841
    const/4 v2, 0x0

    .line 845
    .end local v1    # "packageName":Ljava/lang/String;
    :cond_3
    return v2
.end method

.method private loadBaseResource(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 761
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_0
.end method

.method private loadResource(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 740
    const/4 v2, 0x0

    .line 742
    .local v2, "stream":Ljava/io/InputStream;
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 743
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    if-nez v2, :cond_0

    .line 744
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 745
    .local v1, "pathComponent":Ljava/io/File;
    invoke-direct {p0, v1, p1}, Lorg/apache/tools/ant/AntClassLoader;->getResourceStream(Ljava/io/File;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_0

    .line 747
    .end local v1    # "pathComponent":Ljava/io/File;
    :cond_0
    return-object v2
.end method

.method public static newAntClassLoader(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)Lorg/apache/tools/ant/AntClassLoader;
    .locals 5
    .param p0, "parent"    # Ljava/lang/ClassLoader;
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "path"    # Lorg/apache/tools/ant/types/Path;
    .param p3, "parentFirst"    # Z

    .prologue
    .line 1554
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->subClassToLoad:Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 1555
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->subClassToLoad:Ljava/lang/Class;

    sget-object v1, Lorg/apache/tools/ant/AntClassLoader;->CONSTRUCTOR_ARGS:[Ljava/lang/Class;

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    const/4 v3, 0x2

    aput-object p2, v2, v3

    const/4 v3, 0x3

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lorg/apache/tools/ant/util/ReflectUtil;->newInstance(Ljava/lang/Class;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntClassLoader;

    .line 1563
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/AntClassLoader;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/apache/tools/ant/AntClassLoader;-><init>(Ljava/lang/ClassLoader;Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Z)V

    goto :goto_0
.end method


# virtual methods
.method public addJavaLibraries()V
    .locals 4

    .prologue
    .line 1515
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJrePackages()Ljava/util/Vector;

    move-result-object v2

    .line 1516
    .local v2, "packages":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 1517
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1518
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1519
    .local v1, "packageName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/AntClassLoader;->addSystemPackageRoot(Ljava/lang/String;)V

    goto :goto_0

    .line 1521
    .end local v1    # "packageName":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public addLoaderPackageRoot(Ljava/lang/String;)V
    .locals 3
    .param p1, "packageRoot"    # Ljava/lang/String;

    .prologue
    .line 631
    iget-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->loaderPackages:Ljava/util/Vector;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 632
    return-void

    .line 631
    :cond_0
    const-string/jumbo v0, "."

    goto :goto_0
.end method

.method public addPathComponent(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 462
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 466
    :goto_0
    return-void

    .line 465
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public addPathElement(Ljava/lang/String;)V
    .locals 3
    .param p1, "pathElement"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 445
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 448
    .local v1, "pathComponent":Ljava/io/File;
    :goto_0
    :try_start_0
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/AntClassLoader;->addPathFile(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 452
    return-void

    .line 445
    .end local v1    # "pathComponent":Ljava/io/File;
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 449
    .restart local v1    # "pathComponent":Ljava/io/File;
    :catch_0
    move-exception v0

    .line 450
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected addPathFile(Ljava/io/File;)V
    .locals 14
    .param p1, "pathComponent"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 479
    iget-object v11, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v11, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_0

    .line 480
    iget-object v11, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v11, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 482
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v11

    if-eqz v11, :cond_2

    .line 529
    :cond_1
    :goto_0
    return-void

    .line 486
    :cond_2
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "-"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 488
    .local v0, "absPathPlusTimeAndLength":Ljava/lang/String;
    sget-object v11, Lorg/apache/tools/ant/AntClassLoader;->pathMap:Ljava/util/Map;

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 489
    .local v2, "classpath":Ljava/lang/String;
    if-nez v2, :cond_6

    .line 490
    const/4 v5, 0x0

    .line 492
    .local v5, "jarFile":Ljava/util/jar/JarFile;
    :try_start_0
    new-instance v6, Ljava/util/jar/JarFile;

    invoke-direct {v6, p1}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 493
    .end local v5    # "jarFile":Ljava/util/jar/JarFile;
    .local v6, "jarFile":Ljava/util/jar/JarFile;
    :try_start_1
    invoke-virtual {v6}, Ljava/util/jar/JarFile;->getManifest()Ljava/util/jar/Manifest;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v9

    .line 494
    .local v9, "manifest":Ljava/util/jar/Manifest;
    if-nez v9, :cond_3

    .line 500
    if-eqz v6, :cond_1

    .line 501
    invoke-virtual {v6}, Ljava/util/jar/JarFile;->close()V

    goto :goto_0

    .line 497
    :cond_3
    :try_start_2
    invoke-virtual {v9}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v11

    sget-object v12, Ljava/util/jar/Attributes$Name;->CLASS_PATH:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v11, v12}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v2

    .line 500
    if-eqz v6, :cond_4

    .line 501
    invoke-virtual {v6}, Ljava/util/jar/JarFile;->close()V

    .line 504
    :cond_4
    if-nez v2, :cond_5

    .line 505
    const-string/jumbo v2, ""

    .line 507
    :cond_5
    sget-object v11, Lorg/apache/tools/ant/AntClassLoader;->pathMap:Ljava/util/Map;

    invoke-interface {v11, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    .end local v6    # "jarFile":Ljava/util/jar/JarFile;
    .end local v9    # "manifest":Ljava/util/jar/Manifest;
    :cond_6
    const-string/jumbo v11, ""

    invoke-virtual {v11, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_1

    .line 511
    sget-object v11, Lorg/apache/tools/ant/AntClassLoader;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v11, p1}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v1

    .line 512
    .local v1, "baseURL":Ljava/net/URL;
    new-instance v10, Ljava/util/StringTokenizer;

    invoke-direct {v10, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 513
    .local v10, "st":Ljava/util/StringTokenizer;
    :cond_7
    :goto_1
    invoke-virtual {v10}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v11

    if-eqz v11, :cond_1

    .line 514
    invoke-virtual {v10}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 515
    .local v3, "classpathElement":Ljava/lang/String;
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v1, v3}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 516
    .local v8, "libraryURL":Ljava/net/URL;
    invoke-virtual {v8}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "file"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_9

    .line 517
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Skipping jar library "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " since only relative URLs are supported by this"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " loader"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 500
    .end local v1    # "baseURL":Ljava/net/URL;
    .end local v3    # "classpathElement":Ljava/lang/String;
    .end local v8    # "libraryURL":Ljava/net/URL;
    .end local v10    # "st":Ljava/util/StringTokenizer;
    .restart local v5    # "jarFile":Ljava/util/jar/JarFile;
    :catchall_0
    move-exception v11

    :goto_2
    if-eqz v5, :cond_8

    .line 501
    invoke-virtual {v5}, Ljava/util/jar/JarFile;->close()V

    :cond_8
    throw v11

    .line 522
    .end local v5    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v1    # "baseURL":Ljava/net/URL;
    .restart local v3    # "classpathElement":Ljava/lang/String;
    .restart local v8    # "libraryURL":Ljava/net/URL;
    .restart local v10    # "st":Ljava/util/StringTokenizer;
    :cond_9
    invoke-virtual {v8}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lorg/apache/tools/ant/launch/Locator;->decodeUri(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 523
    .local v4, "decodedPath":Ljava/lang/String;
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 524
    .local v7, "libraryFile":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_7

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/AntClassLoader;->isInPath(Ljava/io/File;)Z

    move-result v11

    if-nez v11, :cond_7

    .line 525
    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/AntClassLoader;->addPathFile(Ljava/io/File;)V

    goto :goto_1

    .line 500
    .end local v1    # "baseURL":Ljava/net/URL;
    .end local v3    # "classpathElement":Ljava/lang/String;
    .end local v4    # "decodedPath":Ljava/lang/String;
    .end local v7    # "libraryFile":Ljava/io/File;
    .end local v8    # "libraryURL":Ljava/net/URL;
    .end local v10    # "st":Ljava/util/StringTokenizer;
    .restart local v6    # "jarFile":Ljava/util/jar/JarFile;
    :catchall_1
    move-exception v11

    move-object v5, v6

    .end local v6    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v5    # "jarFile":Ljava/util/jar/JarFile;
    goto :goto_2
.end method

.method public addSystemPackageRoot(Ljava/lang/String;)V
    .locals 3
    .param p1, "packageRoot"    # Ljava/lang/String;

    .prologue
    .line 618
    iget-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->systemPackages:Ljava/util/Vector;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 619
    return-void

    .line 618
    :cond_0
    const-string/jumbo v0, "."

    goto :goto_0
.end method

.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1436
    invoke-virtual {p0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 1437
    return-void
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1427
    return-void
.end method

.method public declared-synchronized cleanup()V
    .locals 3

    .prologue
    .line 1395
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1396
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/jar/JarFile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1398
    .local v1, "jarFile":Ljava/util/jar/JarFile;
    :try_start_1
    invoke-virtual {v1}, Ljava/util/jar/JarFile;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1399
    :catch_0
    move-exception v2

    goto :goto_0

    .line 1403
    .end local v1    # "jarFile":Ljava/util/jar/JarFile;
    :cond_0
    :try_start_2
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    .line 1404
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    if-eqz v2, :cond_1

    .line 1405
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/Project;->removeBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 1407
    :cond_1
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1408
    monitor-exit p0

    return-void

    .line 1395
    .end local v0    # "e":Ljava/util/Enumeration;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected defineClassFromData(Ljava/io/File;[BLjava/lang/String;)Ljava/lang/Class;
    .locals 9
    .param p1, "container"    # Ljava/io/File;
    .param p2, "classData"    # [B
    .param p3, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1118
    invoke-virtual {p0, p1, p3}, Lorg/apache/tools/ant/AntClassLoader;->definePackage(Ljava/io/File;Ljava/lang/String;)V

    .line 1119
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.Project"

    invoke-static {v0}, Lorg/apache/tools/ant/AntClassLoader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getProtectionDomain()Ljava/security/ProtectionDomain;

    move-result-object v7

    .line 1120
    .local v7, "currentPd":Ljava/security/ProtectionDomain;
    invoke-direct {p0, p3}, Lorg/apache/tools/ant/AntClassLoader;->getClassFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1121
    .local v6, "classResource":Ljava/lang/String;
    new-instance v8, Ljava/security/CodeSource;

    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v0

    invoke-direct {p0, p1, v6}, Lorg/apache/tools/ant/AntClassLoader;->getCertificates(Ljava/io/File;Ljava/lang/String;)[Ljava/security/cert/Certificate;

    move-result-object v1

    invoke-direct {v8, v0, v1}, Ljava/security/CodeSource;-><init>(Ljava/net/URL;[Ljava/security/cert/Certificate;)V

    .line 1124
    .local v8, "src":Ljava/security/CodeSource;
    new-instance v5, Ljava/security/ProtectionDomain;

    invoke-virtual {v7}, Ljava/security/ProtectionDomain;->getPermissions()Ljava/security/PermissionCollection;

    move-result-object v0

    invoke-virtual {v7}, Ljava/security/ProtectionDomain;->getPrincipals()[Ljava/security/Principal;

    move-result-object v1

    invoke-direct {v5, v8, v0, p0, v1}, Ljava/security/ProtectionDomain;-><init>(Ljava/security/CodeSource;Ljava/security/PermissionCollection;Ljava/lang/ClassLoader;[Ljava/security/Principal;)V

    .line 1128
    .local v5, "classesPd":Ljava/security/ProtectionDomain;
    const/4 v3, 0x0

    array-length v4, p2

    move-object v0, p0

    move-object v1, p3

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/AntClassLoader;->defineClass(Ljava/lang/String;[BIILjava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0

    .line 1119
    .end local v5    # "classesPd":Ljava/security/ProtectionDomain;
    .end local v6    # "classResource":Ljava/lang/String;
    .end local v7    # "currentPd":Ljava/security/ProtectionDomain;
    .end local v8    # "src":Ljava/security/CodeSource;
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$Project:Ljava/lang/Class;

    goto :goto_0
.end method

.method protected definePackage(Ljava/io/File;Ljava/lang/String;)V
    .locals 11
    .param p1, "container"    # Ljava/io/File;
    .param p2, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1143
    const/16 v0, 0x2e

    invoke-virtual {p2, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    .line 1144
    .local v9, "classIndex":I
    const/4 v0, -0x1

    if-ne v9, v0, :cond_1

    .line 1160
    :cond_0
    :goto_0
    return-void

    .line 1147
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p2, v0, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1148
    .local v1, "packageName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/AntClassLoader;->getPackage(Ljava/lang/String;)Ljava/lang/Package;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1153
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->getJarManifest(Ljava/io/File;)Ljava/util/jar/Manifest;

    move-result-object v10

    .line 1155
    .local v10, "manifest":Ljava/util/jar/Manifest;
    if-nez v10, :cond_2

    move-object v0, p0

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    move-object v6, v2

    move-object v7, v2

    move-object v8, v2

    .line 1156
    invoke-virtual/range {v0 .. v8}, Lorg/apache/tools/ant/AntClassLoader;->definePackage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/lang/Package;

    goto :goto_0

    .line 1158
    :cond_2
    invoke-virtual {p0, p1, v1, v10}, Lorg/apache/tools/ant/AntClassLoader;->definePackage(Ljava/io/File;Ljava/lang/String;Ljava/util/jar/Manifest;)V

    goto :goto_0
.end method

.method protected definePackage(Ljava/io/File;Ljava/lang/String;Ljava/util/jar/Manifest;)V
    .locals 16
    .param p1, "container"    # Ljava/io/File;
    .param p2, "packageName"    # Ljava/lang/String;
    .param p3, "manifest"    # Ljava/util/jar/Manifest;

    .prologue
    .line 1217
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v2, 0x2e

    const/16 v15, 0x2f

    move-object/from16 v0, p2

    invoke-virtual {v0, v2, v15}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    .line 1219
    .local v14, "sectionName":Ljava/lang/String;
    const/4 v3, 0x0

    .line 1220
    .local v3, "specificationTitle":Ljava/lang/String;
    const/4 v5, 0x0

    .line 1221
    .local v5, "specificationVendor":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1222
    .local v4, "specificationVersion":Ljava/lang/String;
    const/4 v6, 0x0

    .line 1223
    .local v6, "implementationTitle":Ljava/lang/String;
    const/4 v8, 0x0

    .line 1224
    .local v8, "implementationVendor":Ljava/lang/String;
    const/4 v7, 0x0

    .line 1225
    .local v7, "implementationVersion":Ljava/lang/String;
    const/4 v12, 0x0

    .line 1226
    .local v12, "sealedString":Ljava/lang/String;
    const/4 v9, 0x0

    .line 1228
    .local v9, "sealBase":Ljava/net/URL;
    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Ljava/util/jar/Manifest;->getAttributes(Ljava/lang/String;)Ljava/util/jar/Attributes;

    move-result-object v13

    .line 1229
    .local v13, "sectionAttributes":Ljava/util/jar/Attributes;
    if-eqz v13, :cond_0

    .line 1230
    sget-object v1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v3

    .line 1231
    sget-object v1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v5

    .line 1232
    sget-object v1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v4

    .line 1233
    sget-object v1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v6

    .line 1234
    sget-object v1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v8

    .line 1235
    sget-object v1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v7

    .line 1236
    sget-object v1, Ljava/util/jar/Attributes$Name;->SEALED:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v13, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v12

    .line 1238
    :cond_0
    invoke-virtual/range {p3 .. p3}, Ljava/util/jar/Manifest;->getMainAttributes()Ljava/util/jar/Attributes;

    move-result-object v10

    .line 1239
    .local v10, "mainAttributes":Ljava/util/jar/Attributes;
    if-eqz v10, :cond_7

    .line 1240
    if-nez v3, :cond_1

    .line 1241
    sget-object v1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v3

    .line 1243
    :cond_1
    if-nez v5, :cond_2

    .line 1244
    sget-object v1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v5

    .line 1246
    :cond_2
    if-nez v4, :cond_3

    .line 1247
    sget-object v1, Ljava/util/jar/Attributes$Name;->SPECIFICATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v4

    .line 1249
    :cond_3
    if-nez v6, :cond_4

    .line 1250
    sget-object v1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_TITLE:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v6

    .line 1252
    :cond_4
    if-nez v8, :cond_5

    .line 1253
    sget-object v1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VENDOR:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v8

    .line 1255
    :cond_5
    if-nez v7, :cond_6

    .line 1256
    sget-object v1, Ljava/util/jar/Attributes$Name;->IMPLEMENTATION_VERSION:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v7

    .line 1258
    :cond_6
    if-nez v12, :cond_7

    .line 1259
    sget-object v1, Ljava/util/jar/Attributes$Name;->SEALED:Ljava/util/jar/Attributes$Name;

    invoke-virtual {v10, v1}, Ljava/util/jar/Attributes;->getValue(Ljava/util/jar/Attributes$Name;)Ljava/lang/String;

    move-result-object v12

    .line 1262
    :cond_7
    if-eqz v12, :cond_8

    const-string/jumbo v1, "true"

    invoke-virtual {v12, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1264
    :try_start_0
    new-instance v11, Ljava/net/URL;

    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v11, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v9    # "sealBase":Ljava/net/URL;
    .local v11, "sealBase":Ljava/net/URL;
    move-object v9, v11

    .end local v11    # "sealBase":Ljava/net/URL;
    .restart local v9    # "sealBase":Ljava/net/URL;
    :cond_8
    :goto_0
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    .line 1269
    invoke-virtual/range {v1 .. v9}, Lorg/apache/tools/ant/AntClassLoader;->definePackage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;)Ljava/lang/Package;

    .line 1271
    return-void

    .line 1265
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public findClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1314
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Finding class "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 1315
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findClassInComponents(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method protected findResources(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 935
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/AntClassLoader;->findResources(Ljava/lang/String;Z)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method protected findResources(Ljava/lang/String;Z)Ljava/util/Enumeration;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "parentHasBeenSearched"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 953
    new-instance v1, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;

    invoke-direct {v1, p0, p1}, Lorg/apache/tools/ant/AntClassLoader$ResourceEnumeration;-><init>(Lorg/apache/tools/ant/AntClassLoader;Ljava/lang/String;)V

    .line 955
    .local v1, "mine":Ljava/util/Enumeration;
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    if-eqz v2, :cond_2

    if-eqz p2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    invoke-virtual {p0}, Lorg/apache/tools/ant/AntClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v3

    if-eq v2, v3, :cond_2

    .line 957
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    invoke-virtual {v2, p1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v0

    .line 966
    .local v0, "base":Ljava/util/Enumeration;
    :goto_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->isParentFirst(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 968
    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/CollectionUtils;->append(Ljava/util/Enumeration;Ljava/util/Enumeration;)Ljava/util/Enumeration;

    move-result-object v1

    .line 975
    .end local v1    # "mine":Ljava/util/Enumeration;
    :cond_1
    :goto_1
    return-object v1

    .line 964
    .end local v0    # "base":Ljava/util/Enumeration;
    .restart local v1    # "mine":Ljava/util/Enumeration;
    :cond_2
    new-instance v0, Lorg/apache/tools/ant/util/CollectionUtils$EmptyEnumeration;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/CollectionUtils$EmptyEnumeration;-><init>()V

    .restart local v0    # "base":Ljava/util/Enumeration;
    goto :goto_0

    .line 970
    :cond_3
    iget-boolean v2, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    if-eqz v2, :cond_4

    .line 971
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader;->getRootLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader;->getRootLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/util/CollectionUtils;->append(Ljava/util/Enumeration;Ljava/util/Enumeration;)Ljava/util/Enumeration;

    move-result-object v1

    goto :goto_1

    .line 975
    :cond_4
    invoke-static {v1, v0}, Lorg/apache/tools/ant/util/CollectionUtils;->append(Ljava/util/Enumeration;Ljava/util/Enumeration;)Ljava/util/Enumeration;

    move-result-object v1

    goto :goto_1
.end method

.method public forceLoadClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 650
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "force loading "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 652
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 654
    .local v0, "theClass":Ljava/lang/Class;
    if-nez v0, :cond_0

    .line 655
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 657
    :cond_0
    return-object v0
.end method

.method public forceLoadSystemClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 3
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 677
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "force system loading "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 679
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 681
    .local v0, "theClass":Ljava/lang/Class;
    if-nez v0, :cond_0

    .line 682
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findBaseClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 684
    :cond_0
    return-object v0
.end method

.method public getClasspath()Ljava/lang/String;
    .locals 4

    .prologue
    .line 538
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 539
    .local v2, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x1

    .line 540
    .local v1, "firstPass":Z
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 541
    .local v0, "componentEnum":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 542
    if-nez v1, :cond_0

    .line 543
    const-string/jumbo v3, "path.separator"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 547
    :goto_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 545
    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 549
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getConfiguredParent()Ljava/lang/ClassLoader;
    .locals 1

    .prologue
    .line 1417
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    return-object v0
.end method

.method public getNamedResources(Ljava/lang/String;)Ljava/util/Enumeration;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 922
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/AntClassLoader;->findResources(Ljava/lang/String;Z)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getResource(Ljava/lang/String;)Ljava/net/URL;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x4

    .line 875
    const/4 v2, 0x0

    .line 876
    .local v2, "url":Ljava/net/URL;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->isParentFirst(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 877
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    if-nez v3, :cond_4

    invoke-super {p0, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 879
    :cond_0
    :goto_0
    if-eqz v2, :cond_5

    .line 880
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from parent loader"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 893
    :cond_1
    if-nez v2, :cond_2

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->isParentFirst(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 895
    iget-boolean v3, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    if-eqz v3, :cond_8

    .line 896
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader;->getRootLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    if-nez v3, :cond_7

    const/4 v2, 0x0

    .line 900
    :goto_1
    if-eqz v2, :cond_2

    .line 901
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from parent loader"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 904
    :cond_2
    if-nez v2, :cond_3

    .line 905
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Couldn\'t load Resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 907
    :cond_3
    return-object v2

    .line 877
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    invoke-virtual {v3, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    goto :goto_0

    .line 884
    :cond_5
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 885
    .local v0, "e":Ljava/util/Enumeration;
    :cond_6
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    if-nez v2, :cond_1

    .line 886
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 887
    .local v1, "pathComponent":Ljava/io/File;
    invoke-virtual {p0, v1, p1}, Lorg/apache/tools/ant/AntClassLoader;->getResourceURL(Ljava/io/File;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    .line 888
    if-eqz v2, :cond_6

    .line 889
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from ant loader"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    goto :goto_2

    .line 896
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "pathComponent":Ljava/io/File;
    :cond_7
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader;->getRootLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    goto/16 :goto_1

    .line 898
    :cond_8
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    if-nez v3, :cond_9

    invoke-super {p0, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    :goto_3
    goto/16 :goto_1

    :cond_9
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    invoke-virtual {v3, p1}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v2

    goto :goto_3
.end method

.method public getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x4

    .line 697
    const/4 v0, 0x0

    .line 698
    .local v0, "resourceStream":Ljava/io/InputStream;
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->isParentFirst(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 699
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->loadBaseResource(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 701
    :cond_0
    if-eqz v0, :cond_4

    .line 702
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ResourceStream for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " loaded from parent loader"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 711
    :cond_1
    :goto_0
    if-nez v0, :cond_2

    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->isParentFirst(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 712
    iget-boolean v1, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    if-eqz v1, :cond_6

    .line 713
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader;->getRootLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    if-nez v1, :cond_5

    const/4 v0, 0x0

    .line 717
    :goto_1
    if-eqz v0, :cond_2

    .line 718
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ResourceStream for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " loaded from parent loader"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 722
    :cond_2
    if-nez v0, :cond_3

    .line 723
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Couldn\'t load ResourceStream for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 725
    :cond_3
    return-object v0

    .line 705
    :cond_4
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->loadResource(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 706
    if-eqz v0, :cond_1

    .line 707
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "ResourceStream for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " loaded from ant loader"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v3}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 713
    :cond_5
    invoke-direct {p0}, Lorg/apache/tools/ant/AntClassLoader;->getRootLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_1

    .line 715
    :cond_6
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->loadBaseResource(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_1
.end method

.method protected getResourceURL(Ljava/io/File;Ljava/lang/String;)Ljava/net/URL;
    .locals 10
    .param p1, "file"    # Ljava/io/File;
    .param p2, "resourceName"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 992
    :try_start_0
    iget-object v7, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v7, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/jar/JarFile;

    .line 993
    .local v3, "jarFile":Ljava/util/jar/JarFile;
    if-nez v3, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 994
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 996
    .local v5, "resource":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-result v7

    if-eqz v7, :cond_0

    .line 998
    :try_start_1
    sget-object v7, Lorg/apache/tools/ant/AntClassLoader;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v7, v5}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v6

    .line 1029
    .end local v3    # "jarFile":Ljava/util/jar/JarFile;
    .end local v5    # "resource":Ljava/io/File;
    :cond_0
    :goto_0
    return-object v6

    .line 999
    .restart local v3    # "jarFile":Ljava/util/jar/JarFile;
    .restart local v5    # "resource":Ljava/io/File;
    :catch_0
    move-exception v2

    .line 1000
    .local v2, "ex":Ljava/net/MalformedURLException;
    goto :goto_0

    .line 1004
    .end local v2    # "ex":Ljava/net/MalformedURLException;
    .end local v5    # "resource":Ljava/io/File;
    :cond_1
    if-nez v3, :cond_2

    .line 1005
    :try_start_2
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1006
    new-instance v3, Ljava/util/jar/JarFile;

    .end local v3    # "jarFile":Ljava/util/jar/JarFile;
    invoke-direct {v3, p1}, Ljava/util/jar/JarFile;-><init>(Ljava/io/File;)V

    .line 1007
    .restart local v3    # "jarFile":Ljava/util/jar/JarFile;
    iget-object v7, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v7, p1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1012
    iget-object v7, p0, Lorg/apache/tools/ant/AntClassLoader;->jarFiles:Ljava/util/Hashtable;

    invoke-virtual {v7, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "jarFile":Ljava/util/jar/JarFile;
    check-cast v3, Ljava/util/jar/JarFile;

    .line 1014
    .restart local v3    # "jarFile":Ljava/util/jar/JarFile;
    :cond_2
    invoke-virtual {v3, p2}, Ljava/util/jar/JarFile;->getJarEntry(Ljava/lang/String;)Ljava/util/jar/JarEntry;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v1

    .line 1015
    .local v1, "entry":Ljava/util/jar/JarEntry;
    if-eqz v1, :cond_0

    .line 1017
    :try_start_3
    new-instance v7, Ljava/net/URL;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "jar:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    sget-object v9, Lorg/apache/tools/ant/AntClassLoader;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v9, p1}, Lorg/apache/tools/ant/util/FileUtils;->getFileURL(Ljava/io/File;)Ljava/net/URL;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "!/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-object v6, v7

    goto :goto_0

    .line 1018
    :catch_1
    move-exception v2

    .line 1019
    .restart local v2    # "ex":Ljava/net/MalformedURLException;
    goto :goto_0

    .line 1023
    .end local v1    # "entry":Ljava/util/jar/JarEntry;
    .end local v2    # "ex":Ljava/net/MalformedURLException;
    .end local v3    # "jarFile":Ljava/util/jar/JarFile;
    :catch_2
    move-exception v0

    .line 1024
    .local v0, "e":Ljava/lang/Exception;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Unable to obtain resource from "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1025
    .local v4, "msg":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V

    .line 1026
    sget-object v7, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v7, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1027
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_0
.end method

.method protected isInPath(Ljava/io/File;)Z
    .locals 1
    .param p1, "component"    # Ljava/io/File;

    .prologue
    .line 1326
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected declared-synchronized loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .locals 5
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "resolve"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1058
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 1059
    .local v1, "theClass":Ljava/lang/Class;
    if-eqz v1, :cond_0

    move-object v2, v1

    .line 1087
    .end local v1    # "theClass":Ljava/lang/Class;
    .local v2, "theClass":Ljava/lang/Class;
    :goto_0
    monitor-exit p0

    return-object v2

    .line 1062
    .end local v2    # "theClass":Ljava/lang/Class;
    .restart local v1    # "theClass":Ljava/lang/Class;
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->isParentFirst(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-eqz v3, :cond_2

    .line 1064
    :try_start_2
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findBaseClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1065
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from parent loader "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "(parentFirst)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1084
    :goto_1
    if-eqz p2, :cond_1

    .line 1085
    :try_start_3
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/AntClassLoader;->resolveClass(Ljava/lang/Class;)V

    :cond_1
    move-object v2, v1

    .line 1087
    .end local v1    # "theClass":Ljava/lang/Class;
    .restart local v2    # "theClass":Ljava/lang/Class;
    goto :goto_0

    .line 1067
    .end local v2    # "theClass":Ljava/lang/Class;
    .restart local v1    # "theClass":Ljava/lang/Class;
    :catch_0
    move-exception v0

    .line 1068
    .local v0, "cnfe":Ljava/lang/ClassNotFoundException;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1069
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from ant loader "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "(parentFirst)"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 1058
    .end local v0    # "cnfe":Ljava/lang/ClassNotFoundException;
    .end local v1    # "theClass":Ljava/lang/Class;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1074
    .restart local v1    # "theClass":Ljava/lang/Class;
    :cond_2
    :try_start_4
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1075
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from ant loader"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 1076
    :catch_1
    move-exception v0

    .line 1077
    .restart local v0    # "cnfe":Ljava/lang/ClassNotFoundException;
    :try_start_5
    iget-boolean v3, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z

    if-eqz v3, :cond_3

    .line 1078
    throw v0

    .line 1080
    :cond_3
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/AntClassLoader;->findBaseClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 1081
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " loaded from parent loader"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/AntClassLoader;->log(Ljava/lang/String;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_1
.end method

.method protected log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "priority"    # I

    .prologue
    .line 399
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    if-eqz v0, :cond_0

    .line 400
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 402
    :cond_0
    return-void
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1508
    return-void
.end method

.method public resetThreadContextLoader()V
    .locals 1

    .prologue
    .line 427
    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->isContextLoaderAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    if-eqz v0, :cond_0

    .line 428
    iget-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    invoke-static {v0}, Lorg/apache/tools/ant/util/LoaderUtils;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 429
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    .line 430
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    .line 432
    :cond_0
    return-void
.end method

.method public setClassPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 4
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 353
    iget-object v3, p0, Lorg/apache/tools/ant/AntClassLoader;->pathComponents:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->removeAllElements()V

    .line 354
    if-eqz p1, :cond_0

    .line 355
    const-string/jumbo v3, "ignore"

    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 356
    .local v0, "actualClasspath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    .line 357
    .local v2, "pathElements":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 359
    :try_start_0
    aget-object v3, v2, v1

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/AntClassLoader;->addPathElement(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 366
    .end local v0    # "actualClasspath":Lorg/apache/tools/ant/types/Path;
    .end local v1    # "i":I
    .end local v2    # "pathElements":[Ljava/lang/String;
    :cond_0
    return-void

    .line 360
    .restart local v0    # "actualClasspath":Lorg/apache/tools/ant/types/Path;
    .restart local v1    # "i":I
    .restart local v2    # "pathElements":[Ljava/lang/String;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public declared-synchronized setIsolated(Z)V
    .locals 1
    .param p1, "isolated"    # Z

    .prologue
    .line 562
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lorg/apache/tools/ant/AntClassLoader;->ignoreBase:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 563
    monitor-exit p0

    return-void

    .line 562
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setParent(Ljava/lang/ClassLoader;)V
    .locals 1
    .param p1, "parent"    # Ljava/lang/ClassLoader;

    .prologue
    .line 375
    if-nez p1, :cond_0

    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$AntClassLoader:Ljava/lang/Class;

    if-nez v0, :cond_1

    const-string/jumbo v0, "org.apache.tools.ant.AntClassLoader"

    invoke-static {v0}, Lorg/apache/tools/ant/AntClassLoader;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$AntClassLoader:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    .end local p1    # "parent":Ljava/lang/ClassLoader;
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/AntClassLoader;->parent:Ljava/lang/ClassLoader;

    .line 376
    return-void

    .line 375
    .restart local p1    # "parent":Ljava/lang/ClassLoader;
    :cond_1
    sget-object v0, Lorg/apache/tools/ant/AntClassLoader;->class$org$apache$tools$ant$AntClassLoader:Ljava/lang/Class;

    goto :goto_0
.end method

.method public setParentFirst(Z)V
    .locals 0
    .param p1, "parentFirst"    # Z

    .prologue
    .line 387
    iput-boolean p1, p0, Lorg/apache/tools/ant/AntClassLoader;->parentFirst:Z

    .line 388
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 339
    iput-object p1, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    .line 340
    if-eqz p1, :cond_0

    .line 341
    invoke-virtual {p1, p0}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 343
    :cond_0
    return-void
.end method

.method public setThreadContextLoader()V
    .locals 4

    .prologue
    .line 409
    iget-boolean v1, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    if-eqz v1, :cond_0

    .line 410
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Context loader has not been reset"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 412
    :cond_0
    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->isContextLoaderAvailable()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 413
    invoke-static {}, Lorg/apache/tools/ant/util/LoaderUtils;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->savedContextLoader:Ljava/lang/ClassLoader;

    .line 414
    move-object v0, p0

    .line 415
    .local v0, "loader":Ljava/lang/ClassLoader;
    iget-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    if-eqz v1, :cond_1

    const-string/jumbo v1, "only"

    iget-object v2, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    const-string/jumbo v3, "build.sysclasspath"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 416
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 418
    :cond_1
    invoke-static {v0}, Lorg/apache/tools/ant/util/LoaderUtils;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 419
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/tools/ant/AntClassLoader;->isContextLoaderSaved:Z

    .line 421
    .end local v0    # "loader":Ljava/lang/ClassLoader;
    :cond_2
    return-void
.end method

.method public subBuildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 2
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1449
    invoke-virtual {p1}, Lorg/apache/tools/ant/BuildEvent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/AntClassLoader;->project:Lorg/apache/tools/ant/Project;

    if-ne v0, v1, :cond_0

    .line 1450
    invoke-virtual {p0}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 1452
    :cond_0
    return-void
.end method

.method public subBuildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1463
    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1481
    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1472
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1499
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 1490
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1528
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "AntClassLoader["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/AntClassLoader;->getClasspath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
