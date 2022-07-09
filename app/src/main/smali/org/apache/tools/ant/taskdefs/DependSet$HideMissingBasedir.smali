.class final Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;
.super Ljava/lang/Object;
.source "DependSet.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/DependSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HideMissingBasedir"
.end annotation


# instance fields
.field private fs:Lorg/apache/tools/ant/types/FileSet;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "fs"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;->fs:Lorg/apache/tools/ant/types/FileSet;

    .line 103
    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/types/FileSet;Lorg/apache/tools/ant/taskdefs/DependSet$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/types/FileSet;
    .param p2, "x1"    # Lorg/apache/tools/ant/taskdefs/DependSet$1;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;-><init>(Lorg/apache/tools/ant/types/FileSet;)V

    return-void
.end method

.method private basedirExists()Z
    .locals 2

    .prologue
    .line 114
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;->fs:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/FileSet;->getDir()Ljava/io/File;

    move-result-object v0

    .line 116
    .local v0, "basedir":Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 111
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 105
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;->basedirExists()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;->fs:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/tools/ant/types/resources/Resources;->EMPTY_ITERATOR:Ljava/util/Iterator;

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 108
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;->basedirExists()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/DependSet$HideMissingBasedir;->fs:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FileSet;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
