.class public Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "JlinkTask.java"


# instance fields
.field private addfiles:Lorg/apache/tools/ant/types/Path;

.field private compress:Z

.field private mergefiles:Lorg/apache/tools/ant/types/Path;

.field private outfile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 54
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 172
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->outfile:Ljava/io/File;

    .line 174
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    .line 176
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    .line 178
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->compress:Z

    return-void
.end method

.method private haveAddFiles()Z
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->haveEntries(Lorg/apache/tools/ant/types/Path;)Z

    move-result v0

    return v0
.end method

.method private haveEntries(Lorg/apache/tools/ant/types/Path;)Z
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    const/4 v0, 0x0

    .line 163
    if-nez p1, :cond_1

    .line 169
    :cond_0
    :goto_0
    return v0

    .line 166
    :cond_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 167
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private haveMergeFiles()Z
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->haveEntries(Lorg/apache/tools/ant/types/Path;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public createAddfiles()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    .line 97
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createMergefiles()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    .line 73
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 126
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->outfile:Ljava/io/File;

    if-nez v2, :cond_0

    .line 127
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "outfile attribute is required! Please set."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->haveAddFiles()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->haveMergeFiles()Z

    move-result v2

    if-nez v2, :cond_1

    .line 131
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "addfiles or mergefiles required! Please set."

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 134
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "linking:     "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->outfile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->log(Ljava/lang/String;)V

    .line 135
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "compression: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->compress:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->log(Ljava/lang/String;I)V

    .line 136
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;-><init>()V

    .line 137
    .local v1, "linker":Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->outfile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->setOutfile(Ljava/lang/String;)V

    .line 138
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->compress:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->setCompression(Z)V

    .line 139
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->haveMergeFiles()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 140
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "merge files: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->log(Ljava/lang/String;I)V

    .line 141
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addMergeFiles([Ljava/lang/String;)V

    .line 143
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->haveAddFiles()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 144
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "add files: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Path;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->log(Ljava/lang/String;I)V

    .line 145
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->addAddFiles([Ljava/lang/String;)V

    .line 148
    :cond_3
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/optional/jlink/jlink;->link()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    return-void

    .line 149
    :catch_0
    move-exception v0

    .line 150
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
.end method

.method public setAddfiles(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "addfiles"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 106
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    .line 110
    :goto_0
    return-void

    .line 108
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->addfiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setCompress(Z)V
    .locals 0
    .param p1, "compress"    # Z

    .prologue
    .line 117
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->compress:Z

    .line 118
    return-void
.end method

.method public setMergefiles(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "mergefiles"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 82
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    .line 86
    :goto_0
    return-void

    .line 84
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->mergefiles:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setOutfile(Ljava/io/File;)V
    .locals 0
    .param p1, "outfile"    # Ljava/io/File;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jlink/JlinkTask;->outfile:Ljava/io/File;

    .line 62
    return-void
.end method
