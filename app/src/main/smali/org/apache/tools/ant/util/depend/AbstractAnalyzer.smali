.class public abstract Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;
.super Ljava/lang/Object;
.source "AbstractAnalyzer.java"

# interfaces
.implements Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;


# static fields
.field public static final MAX_LOOPS:I = 0x3e8


# instance fields
.field private classDependencies:Ljava/util/Vector;

.field private classPath:Lorg/apache/tools/ant/types/Path;

.field private closure:Z

.field private determined:Z

.field private fileDependencies:Ljava/util/Vector;

.field private final rootClasses:Ljava/util/Vector;

.field private sourcePath:Lorg/apache/tools/ant/types/Path;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->sourcePath:Lorg/apache/tools/ant/types/Path;

    .line 40
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classPath:Lorg/apache/tools/ant/types/Path;

    .line 43
    new-instance v0, Lorg/apache/tools/ant/util/VectorSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/VectorSet;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->rootClasses:Ljava/util/Vector;

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->determined:Z

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->closure:Z

    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->reset()V

    .line 59
    return-void
.end method

.method private getResourceContainer(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    .locals 6
    .param p1, "resourceLocation"    # Ljava/lang/String;
    .param p2, "paths"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, p2

    if-ge v1, v5, :cond_6

    .line 258
    new-instance v0, Ljava/io/File;

    aget-object v5, p2, v1

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 259
    .local v0, "element":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 257
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 262
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 263
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 264
    .local v2, "resource":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 282
    .end local v0    # "element":Ljava/io/File;
    .end local v2    # "resource":Ljava/io/File;
    :goto_2
    return-object v2

    .line 269
    .restart local v0    # "element":Ljava/io/File;
    :cond_2
    const/4 v3, 0x0

    .line 271
    .local v3, "zipFile":Ljava/util/zip/ZipFile;
    :try_start_0
    new-instance v4, Ljava/util/zip/ZipFile;

    invoke-direct {v4, v0}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 272
    .end local v3    # "zipFile":Ljava/util/zip/ZipFile;
    .local v4, "zipFile":Ljava/util/zip/ZipFile;
    :try_start_1
    invoke-virtual {v4, p1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v5

    if-eqz v5, :cond_4

    .line 276
    if-eqz v4, :cond_3

    .line 277
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V

    :cond_3
    move-object v2, v0

    goto :goto_2

    .line 276
    :cond_4
    if-eqz v4, :cond_0

    .line 277
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V

    goto :goto_1

    .line 276
    .end local v4    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v3    # "zipFile":Ljava/util/zip/ZipFile;
    :catchall_0
    move-exception v5

    :goto_3
    if-eqz v3, :cond_5

    .line 277
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->close()V

    :cond_5
    throw v5

    .line 282
    .end local v0    # "element":Ljava/io/File;
    .end local v3    # "zipFile":Ljava/util/zip/ZipFile;
    :cond_6
    const/4 v2, 0x0

    goto :goto_2

    .line 276
    .restart local v0    # "element":Ljava/io/File;
    .restart local v4    # "zipFile":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v3    # "zipFile":Ljava/util/zip/ZipFile;
    goto :goto_3
.end method


# virtual methods
.method public addClassPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "classPath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 162
    if-nez p1, :cond_0

    .line 168
    :goto_0
    return-void

    .line 166
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 167
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->setProject(Lorg/apache/tools/ant/Project;)V

    goto :goto_0
.end method

.method public addRootClass(Ljava/lang/String;)V
    .locals 1
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 178
    if-nez p1, :cond_1

    .line 184
    :cond_0
    :goto_0
    return-void

    .line 181
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public addSourcePath(Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "sourcePath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 146
    if-nez p1, :cond_0

    .line 151
    :goto_0
    return-void

    .line 149
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->sourcePath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->sourcePath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->setProject(Lorg/apache/tools/ant/Project;)V

    goto :goto_0
.end method

.method public config(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "info"    # Ljava/lang/Object;

    .prologue
    .line 195
    return-void
.end method

.method protected abstract determineDependencies(Ljava/util/Vector;Ljava/util/Vector;)V
.end method

.method public getClassContainer(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ".class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "classLocation":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->getResourceContainer(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public getClassDependencies()Ljava/util/Enumeration;
    .locals 2

    .prologue
    .line 99
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->determined:Z

    if-nez v0, :cond_0

    .line 100
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->fileDependencies:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classDependencies:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->determineDependencies(Ljava/util/Vector;Ljava/util/Vector;)V

    .line 102
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classDependencies:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getFileDependencies()Ljava/util/Enumeration;
    .locals 2

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->supportsFileDependencies()Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "File dependencies are not supported by this analyzer"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->determined:Z

    if-nez v0, :cond_1

    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->fileDependencies:Ljava/util/Vector;

    iget-object v1, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classDependencies:Ljava/util/Vector;

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->determineDependencies(Ljava/util/Vector;Ljava/util/Vector;)V

    .line 88
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->fileDependencies:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method protected getRootClasses()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getSourceContainer(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ".java"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "sourceLocation":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->sourcePath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->getResourceContainer(Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method protected isClosureRequired()Z
    .locals 1

    .prologue
    .line 225
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->closure:Z

    return v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 203
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->determined:Z

    .line 204
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->fileDependencies:Ljava/util/Vector;

    .line 205
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->classDependencies:Ljava/util/Vector;

    .line 206
    return-void
.end method

.method public setClosure(Z)V
    .locals 0
    .param p1, "closure"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/depend/AbstractAnalyzer;->closure:Z

    .line 71
    return-void
.end method

.method protected abstract supportsFileDependencies()Z
.end method
