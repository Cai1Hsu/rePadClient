.class public Lorg/apache/tools/ant/taskdefs/MakeUrl;
.super Lorg/apache/tools/ant/Task;
.source "MakeUrl.java"


# static fields
.field public static final ERROR_MISSING_FILE:Ljava/lang/String; = "A source file is missing :"

.field public static final ERROR_NO_FILES:Ljava/lang/String; = "No files defined"

.field public static final ERROR_NO_PROPERTY:Ljava/lang/String; = "No property defined"


# instance fields
.field private file:Ljava/io/File;

.field private filesets:Ljava/util/List;

.field private paths:Ljava/util/List;

.field private property:Ljava/lang/String;

.field private separator:Ljava/lang/String;

.field private validate:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 59
    const-string/jumbo v0, " "

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    .line 64
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->filesets:Ljava/util/List;

    .line 69
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->paths:Ljava/util/List;

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validate:Z

    return-void
.end method

.method private filesetsToURL()Ljava/lang/String;
    .locals 11

    .prologue
    .line 147
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->filesets:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 148
    const-string/jumbo v9, ""

    .line 168
    :goto_0
    return-object v9

    .line 150
    :cond_0
    const/4 v1, 0x0

    .line 151
    .local v1, "count":I
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    .line 152
    .local v8, "urls":Ljava/lang/StringBuffer;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->filesets:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v5

    .line 153
    .local v5, "list":Ljava/util/ListIterator;
    :cond_1
    invoke-interface {v5}, Ljava/util/ListIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 154
    invoke-interface {v5}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/tools/ant/types/FileSet;

    .line 155
    .local v7, "set":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v7, v9}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v6

    .line 156
    .local v6, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v3

    .line 157
    .local v3, "files":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v9, v3

    if-ge v4, v9, :cond_1

    .line 158
    new-instance v2, Ljava/io/File;

    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getBasedir()Ljava/io/File;

    move-result-object v9

    aget-object v10, v3, v4

    invoke-direct {v2, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 159
    .local v2, "f":Ljava/io/File;
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validateFile(Ljava/io/File;)V

    .line 160
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->toURL(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 161
    .local v0, "asUrl":Ljava/lang/String;
    invoke-virtual {v8, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 162
    const/4 v9, 0x4

    invoke-virtual {p0, v0, v9}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->log(Ljava/lang/String;I)V

    .line 163
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 164
    add-int/lit8 v1, v1, 0x1

    .line 157
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 168
    .end local v0    # "asUrl":Ljava/lang/String;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "files":[Ljava/lang/String;
    .end local v4    # "i":I
    .end local v6    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v7    # "set":Lorg/apache/tools/ant/types/FileSet;
    :cond_2
    invoke-direct {p0, v8, v1}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->stripTrailingSeparator(Ljava/lang/StringBuffer;I)Ljava/lang/String;

    move-result-object v9

    goto :goto_0
.end method

.method private pathsToURL()Ljava/lang/String;
    .locals 9

    .prologue
    .line 196
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->paths:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 197
    const-string/jumbo v8, ""

    .line 216
    :goto_0
    return-object v8

    .line 199
    :cond_0
    const/4 v1, 0x0

    .line 200
    .local v1, "count":I
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    .line 201
    .local v7, "urls":Ljava/lang/StringBuffer;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->paths:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v5

    .line 202
    .local v5, "list":Ljava/util/ListIterator;
    :cond_1
    invoke-interface {v5}, Ljava/util/ListIterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 203
    invoke-interface {v5}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/types/Path;

    .line 204
    .local v6, "path":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    .line 205
    .local v2, "elements":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v8, v2

    if-ge v4, v8, :cond_1

    .line 206
    new-instance v3, Ljava/io/File;

    aget-object v8, v2, v4

    invoke-direct {v3, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 207
    .local v3, "f":Ljava/io/File;
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validateFile(Ljava/io/File;)V

    .line 208
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->toURL(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 209
    .local v0, "asUrl":Ljava/lang/String;
    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 210
    const/4 v8, 0x4

    invoke-virtual {p0, v0, v8}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->log(Ljava/lang/String;I)V

    .line 211
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 212
    add-int/lit8 v1, v1, 0x1

    .line 205
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 216
    .end local v0    # "asUrl":Ljava/lang/String;
    .end local v2    # "elements":[Ljava/lang/String;
    .end local v3    # "f":Ljava/io/File;
    .end local v4    # "i":I
    .end local v6    # "path":Lorg/apache/tools/ant/types/Path;
    :cond_2
    invoke-direct {p0, v7, v1}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->stripTrailingSeparator(Ljava/lang/StringBuffer;I)Ljava/lang/String;

    move-result-object v8

    goto :goto_0
.end method

.method private stripTrailingSeparator(Ljava/lang/StringBuffer;I)Ljava/lang/String;
    .locals 2
    .param p1, "urls"    # Ljava/lang/StringBuffer;
    .param p2, "count"    # I

    .prologue
    .line 181
    if-lez p2, :cond_0

    .line 182
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuffer;->delete(II)Ljava/lang/StringBuffer;

    .line 183
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/StringBuffer;)V

    .line 185
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private toURL(Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p1, "fileToConvert"    # Ljava/io/File;

    .prologue
    .line 292
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->toURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 294
    .local v0, "url":Ljava/lang/String;
    return-object v0
.end method

.method private validate()V
    .locals 2

    .prologue
    .line 274
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->property:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 275
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No property defined"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->file:Ljava/io/File;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->filesets:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->paths:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 278
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No files defined"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 280
    :cond_1
    return-void
.end method

.method private validateFile(Ljava/io/File;)V
    .locals 3
    .param p1, "fileToCheck"    # Ljava/io/File;

    .prologue
    .line 226
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validate:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 227
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "A source file is missing :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_0
    return-void
.end method


# virtual methods
.method public addFileSet(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->filesets:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    return-void
.end method

.method public addPath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 138
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->paths:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    return-void
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 238
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validate()V

    .line 240
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 266
    :goto_0
    return-void

    .line 244
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->filesetsToURL()Ljava/lang/String;

    move-result-object v0

    .line 245
    .local v0, "filesetURL":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->file:Ljava/io/File;

    if-eqz v3, :cond_3

    .line 246
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->file:Ljava/io/File;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validateFile(Ljava/io/File;)V

    .line 247
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->file:Ljava/io/File;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->toURL(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 249
    .local v2, "url":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 250
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 256
    :cond_1
    :goto_1
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->pathsToURL()Ljava/lang/String;

    move-result-object v1

    .line 257
    .local v1, "pathURL":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 258
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4

    .line 259
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 264
    :cond_2
    :goto_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Setting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->property:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " to URL "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->log(Ljava/lang/String;I)V

    .line 265
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/MakeUrl;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->property:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 253
    .end local v1    # "pathURL":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    :cond_3
    move-object v2, v0

    .restart local v2    # "url":Ljava/lang/String;
    goto :goto_1

    .line 261
    .restart local v1    # "pathURL":Ljava/lang/String;
    :cond_4
    move-object v2, v1

    goto :goto_2
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 99
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->file:Ljava/io/File;

    .line 100
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->property:Ljava/lang/String;

    .line 91
    return-void
.end method

.method public setSeparator(Ljava/lang/String;)V
    .locals 0
    .param p1, "separator"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->separator:Ljava/lang/String;

    .line 119
    return-void
.end method

.method public setValidate(Z)V
    .locals 0
    .param p1, "validate"    # Z

    .prologue
    .line 128
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MakeUrl;->validate:Z

    .line 129
    return-void
.end method
