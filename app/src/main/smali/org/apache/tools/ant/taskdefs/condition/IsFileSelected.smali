.class public Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;
.super Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;
.source "IsFileSelected.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private baseDir:Ljava/io/File;

.field private file:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;-><init>()V

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 4

    .prologue
    .line 67
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->file:Ljava/io/File;

    if-nez v2, :cond_0

    .line 68
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "file attribute not set"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 70
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->validate()V

    .line 71
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->baseDir:Ljava/io/File;

    .line 72
    .local v1, "myBaseDir":Ljava/io/File;
    if-nez v1, :cond_1

    .line 73
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    .line 76
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v0, v2, v3

    .line 77
    .local v0, "f":Lorg/apache/tools/ant/types/selectors/FileSelector;
    sget-object v2, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->file:Ljava/io/File;

    invoke-virtual {v2, v1, v3}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->file:Ljava/io/File;

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/tools/ant/types/selectors/FileSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v2

    return v2
.end method

.method public setBaseDir(Ljava/io/File;)V
    .locals 0
    .param p1, "baseDir"    # Ljava/io/File;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->baseDir:Ljava/io/File;

    .line 50
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 40
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->file:Ljava/io/File;

    .line 41
    return-void
.end method

.method public validate()V
    .locals 2

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/IsFileSelected;->selectorCount()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 57
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one selector allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->validate()V

    .line 60
    return-void
.end method
