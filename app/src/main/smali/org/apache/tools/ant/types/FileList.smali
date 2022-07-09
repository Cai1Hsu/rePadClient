.class public Lorg/apache/tools/ant/types/FileList;
.super Lorg/apache/tools/ant/types/DataType;
.source "FileList.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/FileList$FileName;
    }
.end annotation


# instance fields
.field private dir:Ljava/io/File;

.field private filenames:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 39
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    .line 48
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/FileList;)V
    .locals 1
    .param p1, "filelist"    # Lorg/apache/tools/ant/types/FileList;

    .prologue
    .line 55
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 39
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    .line 56
    iget-object v0, p1, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    .line 57
    iget-object v0, p1, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    iput-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    .line 58
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FileList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileList;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 59
    return-void
.end method


# virtual methods
.method public addConfiguredFile(Lorg/apache/tools/ant/types/FileList$FileName;)V
    .locals 2
    .param p1, "name"    # Lorg/apache/tools/ant/types/FileList$FileName;

    .prologue
    .line 179
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FileList$FileName;->getName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 180
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No name specified in nested file element"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 183
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/FileList$FileName;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 184
    return-void
.end method

.method public getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/FileList;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/FileList;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileList;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v0

    .line 96
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    goto :goto_0
.end method

.method public getFiles(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;
    .locals 3
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 123
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/FileList;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/FileList;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/FileList;->getFiles(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v0

    .line 136
    :goto_0
    return-object v0

    .line 126
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    if-nez v1, :cond_1

    .line 127
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No directory specified for filelist."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 130
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 131
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "No files specified for filelist."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 134
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 135
    .local v0, "result":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method protected getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/FileList;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 146
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/FileList;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FileList;

    return-object v0
.end method

.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 217
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 5

    .prologue
    .line 192
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileList;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/FileList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 195
    :goto_0
    return-object v0

    :cond_0
    new-instance v1, Lorg/apache/tools/ant/types/resources/FileResourceIterator;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    iget-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    iget-object v4, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/tools/ant/types/resources/FileResourceIterator;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;[Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_0
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "dir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->checkAttributesAllowed()V

    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    .line 86
    return-void
.end method

.method public setFiles(Ljava/lang/String;)V
    .locals 3
    .param p1, "filenames"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->checkAttributesAllowed()V

    .line 107
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 108
    new-instance v0, Ljava/util/StringTokenizer;

    const-string/jumbo v1, ", \t\n\r\u000c"

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 110
    .local v0, "tok":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    iget-object v1, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_0

    .line 114
    .end local v0    # "tok":Ljava/util/StringTokenizer;
    :cond_0
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/types/FileList;->dir:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-eqz v0, :cond_1

    .line 72
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 74
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 75
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 205
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 206
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FileList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FileList;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/FileList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileList;->size()I

    move-result v0

    .line 208
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/FileList;->filenames:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    goto :goto_0
.end method
