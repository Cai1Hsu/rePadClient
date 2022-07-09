.class public Lorg/apache/tools/ant/taskdefs/TempFile;
.super Lorg/apache/tools/ant/Task;
.source "TempFile.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private createFile:Z

.field private deleteOnExit:Z

.field private destDir:Ljava/io/File;

.field private prefix:Ljava/lang/String;

.field private property:Ljava/lang/String;

.field private suffix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/TempFile;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->destDir:Ljava/io/File;

    .line 64
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->suffix:Ljava/lang/String;

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
    .line 152
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->property:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->property:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 153
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "no property specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 155
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->destDir:Ljava/io/File;

    if-nez v0, :cond_2

    .line 156
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/TempFile;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->destDir:Ljava/io/File;

    .line 158
    :cond_2
    sget-object v0, Lorg/apache/tools/ant/taskdefs/TempFile;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->prefix:Ljava/lang/String;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->suffix:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->destDir:Ljava/io/File;

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->deleteOnExit:Z

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->createFile:Z

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v6

    .line 160
    .local v6, "tfile":Ljava/io/File;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/TempFile;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->property:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    return-void
.end method

.method public isCreateFile()Z
    .locals 1

    .prologue
    .line 143
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->createFile:Z

    return v0
.end method

.method public isDeleteOnExit()Z
    .locals 1

    .prologue
    .line 127
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->deleteOnExit:Z

    return v0
.end method

.method public setCreateFile(Z)V
    .locals 0
    .param p1, "createFile"    # Z

    .prologue
    .line 135
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->createFile:Z

    .line 136
    return-void
.end method

.method public setDeleteOnExit(Z)V
    .locals 0
    .param p1, "deleteOnExit"    # Z

    .prologue
    .line 119
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->deleteOnExit:Z

    .line 120
    return-void
.end method

.method public setDestDir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 90
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->destDir:Ljava/io/File;

    .line 91
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->prefix:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->property:Ljava/lang/String;

    .line 80
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 110
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/TempFile;->suffix:Ljava/lang/String;

    .line 111
    return-void
.end method
