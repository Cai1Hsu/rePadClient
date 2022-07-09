.class public Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;
.super Lorg/apache/tools/ant/types/FileSet;
.source "ClassfileSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/optional/depend/ClassfileSet$ClassRoot;
    }
.end annotation


# instance fields
.field private rootClasses:Ljava/util/Vector;

.field private rootFileSets:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 42
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootFileSets:Ljava/util/Vector;

    .line 79
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;

    .prologue
    .line 99
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/FileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 42
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootFileSets:Ljava/util/Vector;

    .line 100
    iget-object v0, p1, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    .line 101
    return-void
.end method


# virtual methods
.method public addConfiguredRoot(Lorg/apache/tools/ant/types/optional/depend/ClassfileSet$ClassRoot;)V
    .locals 2
    .param p1, "root"    # Lorg/apache/tools/ant/types/optional/depend/ClassfileSet$ClassRoot;

    .prologue
    .line 154
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet$ClassRoot;->getClassname()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 155
    return-void
.end method

.method public addRootFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "rootFileSet"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootFileSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 90
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->setChecked(Z)V

    .line 91
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 163
    new-instance v1, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;

    :goto_0
    invoke-direct {v1, v0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;-><init>(Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;)V

    return-object v1

    :cond_0
    move-object v0, p0

    goto :goto_0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 168
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_1

    .line 183
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 173
    :cond_1
    :try_start_1
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/FileSet;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->isReference()Z

    move-result v2

    if-nez v2, :cond_0

    .line 176
    iget-object v2, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootFileSets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 177
    .local v1, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 178
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    .line 179
    .local v0, "additionalRootSet":Lorg/apache/tools/ant/types/FileSet;
    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 168
    .end local v0    # "additionalRootSet":Lorg/apache/tools/ant/types/FileSet;
    .end local v1    # "e":Ljava/util/Enumeration;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 181
    .restart local v1    # "e":Ljava/util/Enumeration;
    :cond_2
    const/4 v2, 0x1

    :try_start_2
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;
    .locals 13
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    const/16 v12, 0x2e

    .line 120
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->isReference()Z

    move-result v10

    if-eqz v10, :cond_0

    .line 121
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v10

    invoke-virtual {v10, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v9

    .line 145
    :goto_0
    return-object v9

    .line 123
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 124
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v8

    .line 125
    .local v8, "parentScanner":Lorg/apache/tools/ant/DirectoryScanner;
    new-instance v9, Lorg/apache/tools/ant/types/optional/depend/DependScanner;

    invoke-direct {v9, v8}, Lorg/apache/tools/ant/types/optional/depend/DependScanner;-><init>(Lorg/apache/tools/ant/DirectoryScanner;)V

    .line 126
    .local v9, "scanner":Lorg/apache/tools/ant/types/optional/depend/DependScanner;
    iget-object v10, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Vector;

    .line 127
    .local v2, "allRootClasses":Ljava/util/Vector;
    iget-object v10, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootFileSets:Ljava/util/Vector;

    invoke-virtual {v10}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v5

    .local v5, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v5}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 128
    invoke-interface {v5}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    .line 129
    .local v0, "additionalRootSet":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    .line 131
    .local v1, "additionalScanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v6

    .line 132
    .local v6, "files":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_2
    array-length v10, v6

    if-ge v7, v10, :cond_2

    .line 133
    aget-object v10, v6, v7

    const-string/jumbo v11, ".class"

    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 134
    aget-object v10, v6, v7

    const-string/jumbo v11, ".class"

    invoke-static {v10, v11}, Lorg/apache/tools/ant/util/StringUtils;->removeSuffix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 135
    .local v3, "classFilePath":Ljava/lang/String;
    const/16 v10, 0x2f

    invoke-virtual {v3, v10, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0x5c

    invoke-virtual {v10, v11, v12}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 137
    .local v4, "className":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 132
    .end local v3    # "classFilePath":Ljava/lang/String;
    .end local v4    # "className":Ljava/lang/String;
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 140
    :cond_2
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->addBasedir(Ljava/io/File;)V

    goto :goto_1

    .line 142
    .end local v0    # "additionalRootSet":Lorg/apache/tools/ant/types/FileSet;
    .end local v1    # "additionalScanner":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v6    # "files":[Ljava/lang/String;
    .end local v7    # "i":I
    :cond_3
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->setBasedir(Ljava/io/File;)V

    .line 143
    invoke-virtual {v9, v2}, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->setRootClasses(Ljava/util/Vector;)V

    .line 144
    invoke-virtual {v9}, Lorg/apache/tools/ant/types/optional/depend/DependScanner;->scan()V

    goto :goto_0
.end method

.method public setRootClass(Ljava/lang/String;)V
    .locals 1
    .param p1, "rootClass"    # Ljava/lang/String;

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/types/optional/depend/ClassfileSet;->rootClasses:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 110
    return-void
.end method
