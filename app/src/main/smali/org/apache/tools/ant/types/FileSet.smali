.class public Lorg/apache/tools/ant/types/FileSet;
.super Lorg/apache/tools/ant/types/AbstractFileSet;
.source "FileSet.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/types/AbstractFileSet;-><init>()V

    .line 37
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/AbstractFileSet;-><init>(Lorg/apache/tools/ant/types/AbstractFileSet;)V

    .line 45
    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 56
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
    .line 91
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 4

    .prologue
    .line 66
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 69
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->size()I

    move-result v0

    .line 82
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFilesCount()I

    move-result v0

    goto :goto_0
.end method
