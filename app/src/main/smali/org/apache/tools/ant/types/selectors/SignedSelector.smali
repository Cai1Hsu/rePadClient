.class public Lorg/apache/tools/ant/types/selectors/SignedSelector;
.super Lorg/apache/tools/ant/types/DataType;
.source "SignedSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/FileSelector;


# instance fields
.field private isSigned:Lorg/apache/tools/ant/taskdefs/condition/IsSigned;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 30
    new-instance v0, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/SignedSelector;->isSigned:Lorg/apache/tools/ant/taskdefs/condition/IsSigned;

    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 2
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 51
    invoke-virtual {p3}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    const/4 v0, 0x0

    .line 56
    :goto_0
    return v0

    .line 54
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/SignedSelector;->isSigned:Lorg/apache/tools/ant/taskdefs/condition/IsSigned;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SignedSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 55
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/SignedSelector;->isSigned:Lorg/apache/tools/ant/taskdefs/condition/IsSigned;

    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->setFile(Ljava/io/File;)V

    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/SignedSelector;->isSigned:Lorg/apache/tools/ant/taskdefs/condition/IsSigned;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->eval()Z

    move-result v0

    goto :goto_0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/SignedSelector;->isSigned:Lorg/apache/tools/ant/taskdefs/condition/IsSigned;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/condition/IsSigned;->setName(Ljava/lang/String;)V

    .line 39
    return-void
.end method
