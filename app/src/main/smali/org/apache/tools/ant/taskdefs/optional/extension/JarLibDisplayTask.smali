.class public Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;
.super Lorg/apache/tools/ant/Task;
.source "JarLibDisplayTask.java"


# instance fields
.field private libraryFile:Ljava/io/File;

.field private final libraryFileSets:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 51
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFileSets:Ljava/util/Vector;

    return-void
.end method

.method private validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 105
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFileSets:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    const-string/jumbo v0, "File attribute not specified."

    .line 107
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "File attribute not specified."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 110
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "File \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 111
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 113
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_2

    .line 114
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\' is not a file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 115
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 117
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    return-void
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fileSet"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFileSets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 69
    return-void
.end method

.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->validate()V

    .line 79
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;-><init>()V

    .line 81
    .local v1, "displayer":Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFileSets:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    .line 82
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFileSets:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 83
    .local v6, "iterator":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 84
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/FileSet;

    .line 85
    .local v3, "fileSet":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v3, v8}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v7

    .line 87
    .local v7, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v7}, Lorg/apache/tools/ant/DirectoryScanner;->getBasedir()Ljava/io/File;

    move-result-object v0

    .line 88
    .local v0, "basedir":Ljava/io/File;
    invoke-virtual {v7}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v4

    .line 89
    .local v4, "files":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    array-length v8, v4

    if-ge v5, v8, :cond_0

    .line 90
    new-instance v2, Ljava/io/File;

    aget-object v8, v4, v5

    invoke-direct {v2, v0, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 91
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->displayLibrary(Ljava/io/File;)V

    .line 89
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 95
    .end local v0    # "basedir":Ljava/io/File;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "fileSet":Lorg/apache/tools/ant/types/FileSet;
    .end local v4    # "files":[Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "iterator":Ljava/util/Iterator;
    .end local v7    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    invoke-virtual {v1, v8}, Lorg/apache/tools/ant/taskdefs/optional/extension/LibraryDisplayer;->displayLibrary(Ljava/io/File;)V

    .line 97
    :cond_2
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask;->libraryFile:Ljava/io/File;

    .line 60
    return-void
.end method
