.class public Lorg/apache/tools/ant/types/resources/BCFileSet;
.super Lorg/apache/tools/ant/types/FileSet;
.source "BCFileSet.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 34
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/FileSet;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    .line 42
    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 3

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 51
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FileSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 56
    :goto_0
    return-object v0

    .line 53
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getDir()Ljava/io/File;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    .line 54
    .local v0, "result":Lorg/apache/tools/ant/types/resources/FileResourceIterator;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getDirectoryScanner()Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->addFiles([Ljava/lang/String;)V

    .line 55
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getDirectoryScanner()Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;->addFiles([Ljava/lang/String;)V

    goto :goto_0
.end method

.method public size()I
    .locals 2

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/AbstractFileSet;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->size()I

    move-result v0

    .line 68
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getDirectoryScanner()Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFilesCount()I

    move-result v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/BCFileSet;->getDirectoryScanner()Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirsCount()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0
.end method
