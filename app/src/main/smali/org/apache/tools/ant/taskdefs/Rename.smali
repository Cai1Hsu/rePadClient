.class public Lorg/apache/tools/ant/taskdefs/Rename;
.super Lorg/apache/tools/ant/Task;
.source "Rename.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private dest:Ljava/io/File;

.field private replace:Z

.field private src:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Rename;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rename;->replace:Z

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 74
    const-string/jumbo v1, "DEPRECATED - The rename task is deprecated.  Use move instead."

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Rename;->log(Ljava/lang/String;)V

    .line 76
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Rename;->dest:Ljava/io/File;

    if-nez v1, :cond_0

    .line 77
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "dest attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rename;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 80
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Rename;->src:Ljava/io/File;

    if-nez v1, :cond_1

    .line 81
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "src attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rename;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 84
    :cond_1
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Rename;->replace:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Rename;->dest:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 85
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Rename;->dest:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " already exists."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 89
    :cond_2
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Rename;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Rename;->src:Ljava/io/File;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Rename;->dest:Ljava/io/File;

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    return-void

    .line 90
    :catch_0
    move-exception v0

    .line 91
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to rename "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Rename;->src:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Rename;->dest:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Rename;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v0, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v1
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "dest"    # Ljava/io/File;

    .prologue
    .line 56
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rename;->dest:Ljava/io/File;

    .line 57
    return-void
.end method

.method public setReplace(Ljava/lang/String;)V
    .locals 1
    .param p1, "replace"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-static {p1}, Lorg/apache/tools/ant/Project;->toBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Rename;->replace:Z

    .line 65
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 48
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Rename;->src:Ljava/io/File;

    .line 49
    return-void
.end method
