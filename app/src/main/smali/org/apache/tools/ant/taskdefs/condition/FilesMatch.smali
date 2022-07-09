.class public Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;
.super Ljava/lang/Object;
.source "FilesMatch.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private file1:Ljava/io/File;

.field private file2:Ljava/io/File;

.field private textfile:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->textfile:Z

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->file1:Ljava/io/File;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->file2:Ljava/io/File;

    if-nez v2, :cond_1

    .line 85
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "both file1 and file2 are required in filesmatch"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_1
    const/4 v1, 0x0

    .line 92
    .local v1, "matches":Z
    :try_start_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->file1:Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->file2:Ljava/io/File;

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->textfile:Z

    invoke-virtual {v2, v3, v4, v5}, Lorg/apache/tools/ant/util/FileUtils;->contentEquals(Ljava/io/File;Ljava/io/File;Z)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 97
    return v1

    .line 93
    :catch_0
    move-exception v0

    .line 94
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "when comparing files: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setFile1(Ljava/io/File;)V
    .locals 0
    .param p1, "file1"    # Ljava/io/File;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->file1:Ljava/io/File;

    .line 54
    return-void
.end method

.method public setFile2(Ljava/io/File;)V
    .locals 0
    .param p1, "file2"    # Ljava/io/File;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->file2:Ljava/io/File;

    .line 64
    return-void
.end method

.method public setTextfile(Z)V
    .locals 0
    .param p1, "textfile"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/FilesMatch;->textfile:Z

    .line 72
    return-void
.end method
