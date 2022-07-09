.class public Lorg/apache/tools/ant/taskdefs/Mkdir;
.super Lorg/apache/tools/ant/Task;
.source "Mkdir.java"


# static fields
.field private static final MKDIR_RETRY_SLEEP_MILLIS:I = 0xa


# instance fields
.field private dir:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method

.method private mkdirs(Ljava/io/File;)Z
    .locals 4
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 102
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 104
    const-wide/16 v2, 0xa

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 105
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 110
    :goto_0
    return v1

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "ex":Ljava/lang/InterruptedException;
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    goto :goto_0

    .line 110
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method


# virtual methods
.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    .line 49
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    if-nez v2, :cond_0

    .line 50
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "dir attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Mkdir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 53
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 54
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to create directory as a file already exists with that name: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 59
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_4

    .line 60
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Mkdir;->mkdirs(Ljava/io/File;)Z

    move-result v1

    .line 61
    .local v1, "result":Z
    if-nez v1, :cond_3

    .line 62
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 63
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "A different process or task has already created dir "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/Mkdir;->log(Ljava/lang/String;I)V

    .line 77
    .end local v1    # "result":Z
    :goto_0
    return-void

    .line 68
    .restart local v1    # "result":Z
    :cond_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Directory "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " creation was not successful for an unknown reason"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Mkdir;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 72
    .end local v0    # "msg":Ljava/lang/String;
    :cond_3
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Created dir: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Mkdir;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 74
    .end local v1    # "result":Z
    :cond_4
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Skipping "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " because it already exists."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/Mkdir;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public getDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    return-object v0
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Mkdir;->dir:Ljava/io/File;

    .line 86
    return-void
.end method
