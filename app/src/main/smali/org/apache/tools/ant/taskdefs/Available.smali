.class public Lorg/apache/tools/ant/taskdefs/Available;
.super Lorg/apache/tools/ant/Task;
.source "Available.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Available$FileDir;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private classname:Ljava/lang/String;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private file:Ljava/io/File;

.field private filename:Ljava/lang/String;

.field private filepath:Lorg/apache/tools/ant/types/Path;

.field private ignoreSystemclasses:Z

.field private isTask:Z

.field private loader:Lorg/apache/tools/ant/AntClassLoader;

.field private property:Ljava/lang/String;

.field private resource:Ljava/lang/String;

.field private searchParents:Z

.field private type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

.field private value:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Available;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    const-string/jumbo v0, "true"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->value:Ljava/lang/Object;

    .line 55
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    .line 56
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Available;->ignoreSystemclasses:Z

    .line 57
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Available;->searchParents:Z

    .line 486
    return-void
.end method

.method private checkClass(Ljava/lang/String;)Z
    .locals 8
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 441
    :try_start_0
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->ignoreSystemclasses:Z

    if-eqz v5, :cond_1

    .line 442
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 443
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/AntClassLoader;->setParentFirst(Z)V

    .line 444
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v5}, Lorg/apache/tools/ant/AntClassLoader;->addJavaLibraries()V

    .line 445
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v5, :cond_0

    .line 447
    :try_start_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v5, p1}, Lorg/apache/tools/ant/AntClassLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_2

    .line 478
    :goto_0
    return v3

    .line 448
    :catch_0
    move-exception v2

    .line 452
    .local v2, "se":Ljava/lang/SecurityException;
    goto :goto_0

    .end local v2    # "se":Ljava/lang/SecurityException;
    :cond_0
    move v3, v4

    .line 455
    goto :goto_0

    .line 457
    :cond_1
    :try_start_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v5, :cond_2

    .line 458
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v5, p1}, Lorg/apache/tools/ant/AntClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 470
    :catch_1
    move-exception v0

    .line 471
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "class \""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, "\" was not found"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v7}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    move v3, v4

    .line 473
    goto :goto_0

    .line 460
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_2
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 463
    .local v1, "l":Ljava/lang/ClassLoader;
    if-eqz v1, :cond_3

    .line 464
    const/4 v5, 0x1

    invoke-static {p1, v5, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 474
    .end local v1    # "l":Ljava/lang/ClassLoader;
    :catch_2
    move-exception v0

    .line 475
    .local v0, "e":Ljava/lang/NoClassDefFoundError;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not load dependent class \""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, "\" for class \""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v5, "\""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v7}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    move v3, v4

    .line 478
    goto :goto_0

    .line 466
    .end local v0    # "e":Ljava/lang/NoClassDefFoundError;
    .restart local v1    # "l":Ljava/lang/ClassLoader;
    :cond_3
    :try_start_4
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0
.end method

.method private checkFile()Z
    .locals 10

    .prologue
    const/4 v5, 0x0

    const/4 v9, 0x3

    const/4 v4, 0x1

    .line 333
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->filepath:Lorg/apache/tools/ant/types/Path;

    if-nez v6, :cond_1

    .line 334
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Available;->file:Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-direct {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/Available;->checkFile(Ljava/io/File;Ljava/lang/String;)Z

    move-result v4

    .line 393
    :cond_0
    :goto_0
    return v4

    .line 336
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->filepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v3

    .line 337
    .local v3, "paths":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v6, v3

    if-ge v0, v6, :cond_c

    .line 338
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Searching "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, v3, v0

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v9}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    .line 339
    new-instance v2, Ljava/io/File;

    aget-object v6, v3, v0

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 343
    .local v2, "path":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_6

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    aget-object v7, v3, v0

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 346
    :cond_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    if-nez v6, :cond_3

    .line 347
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v9}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 349
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->isDir()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 351
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Found directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v9}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 353
    :cond_4
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->isFile()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 355
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Found file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v9}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_5
    move v4, v5

    .line 359
    goto/16 :goto_0

    .line 361
    :cond_6
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 363
    .local v1, "parent":Ljava/io/File;
    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_9

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9

    .line 365
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    if-nez v6, :cond_7

    .line 366
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v9}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 368
    :cond_7
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->isDir()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 369
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Found directory: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v9}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    :cond_8
    move v4, v5

    .line 373
    goto/16 :goto_0

    .line 376
    :cond_9
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 377
    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-direct {v6, v2, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Available;->checkFile(Ljava/io/File;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 384
    :cond_a
    :goto_2
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Available;->searchParents:Z

    if-eqz v6, :cond_b

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 385
    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-direct {v6, v1, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/Available;->checkFile(Ljava/io/File;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 389
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    goto :goto_2

    .line 337
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_1

    .end local v1    # "parent":Ljava/io/File;
    .end local v2    # "path":Ljava/io/File;
    :cond_c
    move v4, v5

    .line 393
    goto/16 :goto_0
.end method

.method private checkFile(Ljava/io/File;Ljava/lang/String;)Z
    .locals 3
    .param p1, "f"    # Ljava/io/File;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x3

    .line 400
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    if-eqz v0, :cond_3

    .line 401
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->isDir()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 402
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 403
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Found directory: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    .line 405
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    .line 416
    :goto_0
    return v0

    .line 406
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->isFile()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 407
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 408
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Found file: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    .line 410
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    goto :goto_0

    .line 413
    :cond_3
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 414
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Found: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    .line 416
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    goto :goto_0
.end method

.method private checkResource(Ljava/lang/String;)Z
    .locals 4
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 423
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_2

    .line 424
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/AntClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 430
    :cond_0
    :goto_0
    return v1

    :cond_1
    move v1, v2

    .line 424
    goto :goto_0

    .line 426
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 427
    .local v0, "cL":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_3

    .line 428
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0

    .line 430
    :cond_3
    invoke-static {p1}, Ljava/lang/ClassLoader;->getSystemResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 89
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createFilepath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->filepath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 119
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->filepath:Lorg/apache/tools/ant/types/Path;

    .line 121
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->filepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public eval()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 264
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->classname:Ljava/lang/String;

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->file:Ljava/io/File;

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->resource:Ljava/lang/String;

    if-nez v3, :cond_2

    .line 265
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "At least one of (classname|file|resource) is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_0

    .line 306
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 307
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 309
    :cond_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    if-nez v3, :cond_1

    .line 310
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Available;->setTaskName(Ljava/lang/String;)V

    .line 305
    :cond_1
    throw v2

    .line 268
    :cond_2
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    if-eqz v3, :cond_3

    .line 269
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->file:Ljava/io/File;

    if-nez v3, :cond_3

    .line 270
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "The type attribute is only valid when specifying the file attribute."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 275
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v3, :cond_4

    .line 276
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Path;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 277
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Available;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 279
    :cond_4
    const-string/jumbo v0, ""

    .line 280
    .local v0, "appendix":Ljava/lang/String;
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    if-eqz v3, :cond_7

    .line 281
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, " to set property "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Available;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 285
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->classname:Ljava/lang/String;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->classname:Ljava/lang/String;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/Available;->checkClass(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 286
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to load class "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Available;->classname:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 305
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_5

    .line 306
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 307
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 309
    :cond_5
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    if-nez v3, :cond_6

    .line 310
    :goto_1
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Available;->setTaskName(Ljava/lang/String;)V

    .line 313
    :cond_6
    :goto_2
    return v2

    .line 283
    :cond_7
    :try_start_2
    const-string/jumbo v3, "available"

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Available;->setTaskName(Ljava/lang/String;)V

    goto :goto_0

    .line 290
    :cond_8
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->file:Ljava/io/File;

    if-eqz v3, :cond_b

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Available;->checkFile()Z

    move-result v3

    if-nez v3, :cond_b

    .line 291
    new-instance v1, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "Unable to find "

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 292
    .local v1, "buf":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    if-eqz v3, :cond_9

    .line 293
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 295
    :cond_9
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 296
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 305
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_a

    .line 306
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 307
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 309
    :cond_a
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    if-nez v3, :cond_6

    goto :goto_1

    .line 299
    .end local v1    # "buf":Ljava/lang/StringBuffer;
    :cond_b
    :try_start_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->resource:Ljava/lang/String;

    if-eqz v3, :cond_d

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->resource:Ljava/lang/String;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/Available;->checkResource(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_d

    .line 300
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to load resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Available;->resource:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 305
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v3, :cond_c

    .line 306
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v3}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 307
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 309
    :cond_c
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    if-nez v3, :cond_6

    goto/16 :goto_1

    .line 305
    :cond_d
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v2, :cond_e

    .line 306
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v2}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 307
    iput-object v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 309
    :cond_e
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    if-nez v2, :cond_f

    .line 310
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Available;->setTaskName(Ljava/lang/String;)V

    .line 313
    :cond_f
    const/4 v2, 0x1

    goto/16 :goto_2
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v3, 0x1

    .line 229
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->property:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 230
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "property attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 234
    :cond_0
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    .line 236
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->eval()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 237
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    .line 238
    .local v1, "ph":Lorg/apache/tools/ant/PropertyHelper;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->property:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/PropertyHelper;->getProperty(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 239
    .local v0, "oldvalue":Ljava/lang/Object;
    if-eqz v0, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->value:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 240
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "DEPRECATED - <available> used to override an existing property."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "  Build file should not reuse the same property"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " name for different values."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    .line 249
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Available;->property:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Available;->value:Ljava/lang/Object;

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lorg/apache/tools/ant/PropertyHelper;->setProperty(Ljava/lang/String;Ljava/lang/Object;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    .end local v0    # "oldvalue":Ljava/lang/Object;
    .end local v1    # "ph":Lorg/apache/tools/ant/PropertyHelper;
    :cond_2
    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    .line 254
    return-void

    .line 252
    :catchall_0
    move-exception v2

    iput-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Available;->isTask:Z

    throw v2
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 1
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 161
    const-string/jumbo v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 162
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->classname:Ljava/lang/String;

    .line 164
    :cond_0
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 78
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 100
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 173
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->file:Ljava/io/File;

    .line 174
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Available;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->filename:Ljava/lang/String;

    .line 175
    return-void
.end method

.method public setFilepath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "filepath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Available;->createFilepath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 109
    return-void
.end method

.method public setIgnoresystemclasses(Z)V
    .locals 0
    .param p1, "ignore"    # Z

    .prologue
    .line 220
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->ignoreSystemclasses:Z

    .line 221
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->property:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 0
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    .line 183
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->resource:Ljava/lang/String;

    .line 184
    return-void
.end method

.method public setSearchParents(Z)V
    .locals 0
    .param p1, "searchParents"    # Z

    .prologue
    .line 68
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->searchParents:Z

    .line 69
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 195
    const-string/jumbo v0, "DEPRECATED - The setType(String) method has been deprecated. Use setType(Available.FileDir) instead."

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Available;->log(Ljava/lang/String;I)V

    .line 198
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    .line 199
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Available$FileDir;->setValue(Ljava/lang/String;)V

    .line 200
    return-void
.end method

.method public setType(Lorg/apache/tools/ant/taskdefs/Available$FileDir;)V
    .locals 0
    .param p1, "type"    # Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    .prologue
    .line 210
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->type:Lorg/apache/tools/ant/taskdefs/Available$FileDir;

    .line 211
    return-void
.end method

.method public setValue(Ljava/lang/Object;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Available;->value:Ljava/lang/Object;

    .line 142
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 151
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Available;->setValue(Ljava/lang/Object;)V

    .line 152
    return-void
.end method
