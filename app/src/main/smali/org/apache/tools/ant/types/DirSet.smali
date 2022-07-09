.class public Lorg/apache/tools/ant/types/DirSet;
.super Lorg/apache/tools/ant/types/AbstractFileSet;
.source "DirSet.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;-><init>()V

    .line 38
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/DirSet;)V
    .locals 0
    .param p1, "dirset"    # Lorg/apache/tools/ant/types/DirSet;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;-><init>(Lorg/apache/tools/ant/types/AbstractFileSet;)V

    .line 46
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 54
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 55
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/DirSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/DirSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/DirSet;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 57
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/DirSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/DirSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/DirSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 70
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/DirSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/DirSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/DirSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/DirSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/DirSet;->size()I

    move-result v0

    .line 83
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/DirSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirsCount()I

    move-result v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 101
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DirSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/DirSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    .line 102
    .local v1, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "dirs":[Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 105
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, v0

    if-ge v2, v4, :cond_1

    .line 106
    if-lez v2, :cond_0

    .line 107
    const/16 v4, 0x3b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 109
    :cond_0
    aget-object v4, v0, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 105
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 111
    :cond_1
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
