.class public Lorg/apache/tools/ant/types/optional/depend/DependScanner;
.super Lorg/apache/tools/ant/DirectoryScanner;
.source "DependScanner.java"


# static fields
.field public static final DEFAULT_ANALYZER_CLASS:Ljava/lang/String; = "org.apache.tools.ant.util.depend.bcel.FullAnalyzer"


# instance fields
.field private additionalBaseDirs:Ljava/util/Vector;

.field private included:Ljava/util/Vector;

.field private parentScanner:Lorg/apache/tools/ant/DirectoryScanner;

.field private rootClasses:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/DirectoryScanner;)V
    .locals 1
    .param p1, "parentScanner"    # Lorg/apache/tools/ant/DirectoryScanner;

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/DirectoryScanner;-><init>()V

    .line 50
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->additionalBaseDirs:Ljava/util/Vector;

    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->parentScanner:Lorg/apache/tools/ant/DirectoryScanner;

    .line 68
    return-void
.end method


# virtual methods
.method public addBasedir(Ljava/io/File;)V
    .locals 1
    .param p1, "baseDir"    # Ljava/io/File;

    .prologue
    .line 221
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->additionalBaseDirs:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 222
    return-void
.end method

.method public addDefaultExcludes()V
    .locals 0

    .prologue
    .line 149
    return-void
.end method

.method public getExcludedDirectories()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 156
    const/4 v0, 0x0

    return-object v0
.end method

.method public getExcludedFiles()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x0

    return-object v0
.end method

.method public getIncludedDirectories()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 172
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getIncludedDirsCount()I
    .locals 1

    .prologue
    .line 180
    const/4 v0, 0x0

    return v0
.end method

.method public getIncludedFiles()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->getIncludedFilesCount()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    .line 86
    .local v0, "files":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 87
    iget-object v2, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->included:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    aput-object v2, v0, v1

    .line 86
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 89
    :cond_0
    return-object v0
.end method

.method public declared-synchronized getIncludedFilesCount()I
    .locals 1

    .prologue
    .line 94
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->included:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 97
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->included:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit p0

    return v0
.end method

.method public getNotIncludedDirectories()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 188
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNotIncludedFiles()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 196
    const/4 v0, 0x0

    return-object v0
.end method

.method public declared-synchronized scan()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    new-instance v12, Ljava/util/Vector;

    invoke-direct {v12}, Ljava/util/Vector;-><init>()V

    iput-object v12, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->included:Ljava/util/Vector;

    .line 107
    const-string/jumbo v3, "org.apache.tools.ant.util.depend.bcel.FullAnalyzer"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    .local v3, "analyzerClassName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 110
    .local v1, "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    :try_start_1
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 111
    .local v2, "analyzerClass":Ljava/lang/Class;
    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    check-cast v1, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    .restart local v1    # "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    :try_start_2
    new-instance v12, Lorg/apache/tools/ant/types/Path;

    const/4 v13, 0x0

    iget-object v14, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->basedir:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-interface {v1, v12}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addClassPath(Lorg/apache/tools/ant/types/Path;)V

    .line 117
    iget-object v12, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->additionalBaseDirs:Ljava/util/Vector;

    invoke-virtual {v12}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    .local v6, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_0

    .line 118
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 119
    .local v0, "additionalBaseDir":Ljava/io/File;
    new-instance v12, Lorg/apache/tools/ant/types/Path;

    const/4 v13, 0x0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-interface {v1, v12}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addClassPath(Lorg/apache/tools/ant/types/Path;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 106
    .end local v0    # "additionalBaseDir":Ljava/io/File;
    .end local v1    # "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    .end local v2    # "analyzerClass":Ljava/lang/Class;
    .end local v3    # "analyzerClassName":Ljava/lang/String;
    .end local v6    # "e":Ljava/util/Enumeration;
    :catchall_0
    move-exception v12

    monitor-exit p0

    throw v12

    .line 112
    .restart local v3    # "analyzerClassName":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 113
    .local v6, "e":Ljava/lang/Exception;
    :try_start_3
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Unable to load dependency analyzer: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 122
    .restart local v1    # "analyzer":Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;
    .restart local v2    # "analyzerClass":Ljava/lang/Class;
    .local v6, "e":Ljava/util/Enumeration;
    :cond_0
    iget-object v12, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v12}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 123
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 124
    .local v11, "rootClass":Ljava/lang/String;
    invoke-interface {v1, v11}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addRootClass(Ljava/lang/String;)V

    goto :goto_1

    .line 126
    .end local v11    # "rootClass":Ljava/lang/String;
    :cond_1
    invoke-interface {v1}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->getClassDependencies()Ljava/util/Enumeration;

    move-result-object v6

    .line 128
    iget-object v12, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->parentScanner:Lorg/apache/tools/ant/DirectoryScanner;

    invoke-virtual {v12}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v9

    .line 129
    .local v9, "parentFiles":[Ljava/lang/String;
    new-instance v10, Ljava/util/Hashtable;

    invoke-direct {v10}, Ljava/util/Hashtable;-><init>()V

    .line 130
    .local v10, "parentSet":Ljava/util/Hashtable;
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_2
    array-length v12, v9

    if-ge v8, v12, :cond_2

    .line 131
    aget-object v12, v9, v8

    aget-object v13, v9, v8

    invoke-virtual {v10, v12, v13}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 133
    :cond_2
    :goto_3
    invoke-interface {v6}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v12

    if-eqz v12, :cond_3

    .line 134
    invoke-interface {v6}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 135
    .local v4, "classname":Ljava/lang/String;
    const/16 v12, 0x2e

    sget-char v13, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v12, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    .line 136
    .local v7, "filename":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, ".class"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 137
    new-instance v5, Ljava/io/File;

    iget-object v12, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->basedir:Ljava/io/File;

    invoke-direct {v5, v12, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 138
    .local v5, "depFile":Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-virtual {v10, v7}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 140
    iget-object v12, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->included:Ljava/util/Vector;

    invoke-virtual {v12, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_3

    .line 143
    .end local v4    # "classname":Ljava/lang/String;
    .end local v5    # "depFile":Ljava/io/File;
    .end local v7    # "filename":Ljava/lang/String;
    :cond_3
    monitor-exit p0

    return-void
.end method

.method public setCaseSensitive(Z)V
    .locals 0
    .param p1, "isCaseSensitive"    # Z

    .prologue
    .line 218
    return-void
.end method

.method public setExcludes([Ljava/lang/String;)V
    .locals 0
    .param p1, "excludes"    # [Ljava/lang/String;

    .prologue
    .line 204
    return-void
.end method

.method public setIncludes([Ljava/lang/String;)V
    .locals 0
    .param p1, "includes"    # [Ljava/lang/String;

    .prologue
    .line 211
    return-void
.end method

.method public declared-synchronized setRootClasses(Ljava/util/Vector;)V
    .locals 1
    .param p1, "rootClasses"    # Ljava/util/Vector;

    .prologue
    .line 76
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->rootClasses:Ljava/util/Vector;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    monitor-exit p0

    return-void

    .line 76
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
