.class public Lorg/apache/tools/ant/taskdefs/Copydir;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Copydir.java"


# instance fields
.field private destDir:Ljava/io/File;

.field private filecopyList:Ljava/util/Hashtable;

.field private filtering:Z

.field private flatten:Z

.field private forceOverwrite:Z

.field private srcDir:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 41
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filtering:Z

    .line 42
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->flatten:Z

    .line 43
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->forceOverwrite:Z

    .line 44
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    return-void
.end method

.method private scanDir(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;)V
    .locals 8
    .param p1, "from"    # Ljava/io/File;
    .param p2, "to"    # Ljava/io/File;
    .param p3, "files"    # [Ljava/lang/String;

    .prologue
    .line 147
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v4, p3

    if-ge v2, v4, :cond_3

    .line 148
    aget-object v1, p3, v2

    .line 149
    .local v1, "filename":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 151
    .local v3, "srcFile":Ljava/io/File;
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->flatten:Z

    if-eqz v4, :cond_2

    .line 152
    new-instance v0, Ljava/io/File;

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, p2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 156
    .local v0, "destFile":Ljava/io/File;
    :goto_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->forceOverwrite:Z

    if-nez v4, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    .line 158
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 154
    .end local v0    # "destFile":Ljava/io/File;
    :cond_2
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .restart local v0    # "destFile":Ljava/io/File;
    goto :goto_1

    .line 162
    .end local v0    # "destFile":Ljava/io/File;
    .end local v1    # "filename":Ljava/lang/String;
    .end local v3    # "srcFile":Ljava/io/File;
    :cond_3
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    .line 97
    const-string/jumbo v7, "DEPRECATED - The copydir task is deprecated.  Use copy instead."

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/Copydir;->log(Ljava/lang/String;)V

    .line 99
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    if-nez v7, :cond_0

    .line 100
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "src attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copydir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 104
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-nez v7, :cond_1

    .line 105
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "srcdir "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " does not exist!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copydir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 109
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->destDir:Ljava/io/File;

    if-nez v7, :cond_2

    .line 110
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "The dest attribute must be set."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copydir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v7

    .line 114
    :cond_2
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->destDir:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 115
    const-string/jumbo v7, "Warning: src == dest"

    invoke-virtual {p0, v7, v9}, Lorg/apache/tools/ant/taskdefs/Copydir;->log(Ljava/lang/String;I)V

    .line 118
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    invoke-super {p0, v7}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 121
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "files":[Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->destDir:Ljava/io/File;

    invoke-direct {p0, v7, v8, v2}, Lorg/apache/tools/ant/taskdefs/Copydir;->scanDir(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;)V

    .line 123
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v7}, Ljava/util/Hashtable;->size()I

    move-result v7

    if-lez v7, :cond_5

    .line 124
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Copying "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v8}, Ljava/util/Hashtable;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " file"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v7}, Ljava/util/Hashtable;->size()I

    move-result v7

    if-ne v7, v9, :cond_4

    const-string/jumbo v7, ""

    :goto_0
    invoke-virtual {v8, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->destDir:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/Copydir;->log(Ljava/lang/String;)V

    .line 127
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v7}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v1

    .line 128
    .local v1, "e":Ljava/util/Enumeration;
    :goto_1
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 129
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 130
    .local v3, "fromFile":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v7, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    .local v6, "toFile":Ljava/lang/String;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copydir;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    iget-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filtering:Z

    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->forceOverwrite:Z

    invoke-virtual {v7, v3, v6, v8, v9}, Lorg/apache/tools/ant/Project;->copyFile(Ljava/lang/String;Ljava/lang/String;ZZ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 134
    :catch_0
    move-exception v4

    .line 135
    .local v4, "ioe":Ljava/io/IOException;
    :try_start_2
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Failed to copy "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " due to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 137
    .local v5, "msg":Ljava/lang/String;
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copydir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v7, v5, v4, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 142
    .end local v1    # "e":Ljava/util/Enumeration;
    .end local v2    # "files":[Ljava/lang/String;
    .end local v3    # "fromFile":Ljava/lang/String;
    .end local v4    # "ioe":Ljava/io/IOException;
    .end local v5    # "msg":Ljava/lang/String;
    .end local v6    # "toFile":Ljava/lang/String;
    :catchall_0
    move-exception v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v8}, Ljava/util/Hashtable;->clear()V

    throw v7

    .line 124
    .restart local v2    # "files":[Ljava/lang/String;
    :cond_4
    :try_start_3
    const-string/jumbo v7, "s"
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 142
    :cond_5
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filecopyList:Ljava/util/Hashtable;

    invoke-virtual {v7}, Ljava/util/Hashtable;->clear()V

    .line 144
    return-void
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->destDir:Ljava/io/File;

    .line 62
    return-void
.end method

.method public setFiltering(Z)V
    .locals 0
    .param p1, "filter"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->filtering:Z

    .line 71
    return-void
.end method

.method public setFlatten(Z)V
    .locals 0
    .param p1, "flatten"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->flatten:Z

    .line 80
    return-void
.end method

.method public setForceoverwrite(Z)V
    .locals 0
    .param p1, "force"    # Z

    .prologue
    .line 89
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->forceOverwrite:Z

    .line 90
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copydir;->srcDir:Ljava/io/File;

    .line 53
    return-void
.end method
