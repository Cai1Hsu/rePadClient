.class public Lorg/apache/tools/ant/taskdefs/Copyfile;
.super Lorg/apache/tools/ant/Task;
.source "Copyfile.java"


# instance fields
.field private destFile:Ljava/io/File;

.field private filtering:Z

.field private forceOverwrite:Z

.field private srcFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 40
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->filtering:Z

    .line 41
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->forceOverwrite:Z

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 83
    const-string/jumbo v2, "DEPRECATED - The copyfile task is deprecated.  Use copy instead."

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Copyfile;->log(Ljava/lang/String;)V

    .line 85
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    if-nez v2, :cond_0

    .line 86
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "The src attribute must be present."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copyfile;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 90
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 91
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "src "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " does not exist."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copyfile;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 95
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->destFile:Ljava/io/File;

    if-nez v2, :cond_2

    .line 96
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "The dest attribute must be present."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copyfile;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 100
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->destFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 101
    const-string/jumbo v2, "Warning: src == dest"

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Copyfile;->log(Ljava/lang/String;I)V

    .line 104
    :cond_3
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->forceOverwrite:Z

    if-nez v2, :cond_4

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->destFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-lez v2, :cond_5

    .line 107
    :cond_4
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Copyfile;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->destFile:Ljava/io/File;

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->filtering:Z

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->forceOverwrite:Z

    invoke-virtual {v2, v3, v4, v5, v6}, Lorg/apache/tools/ant/Project;->copyFile(Ljava/io/File;Ljava/io/File;ZZ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :cond_5
    return-void

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Error copying file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " due to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 111
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 66
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->destFile:Ljava/io/File;

    .line 67
    return-void
.end method

.method public setFiltering(Ljava/lang/String;)V
    .locals 1
    .param p1, "filter"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-static {p1}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->filtering:Z

    .line 76
    return-void
.end method

.method public setForceoverwrite(Z)V
    .locals 0
    .param p1, "force"    # Z

    .prologue
    .line 58
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->forceOverwrite:Z

    .line 59
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 48
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Copyfile;->srcFile:Ljava/io/File;

    .line 49
    return-void
.end method
