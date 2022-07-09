.class public abstract Lorg/apache/tools/ant/types/selectors/BaseSelector;
.super Lorg/apache/tools/ant/types/DataType;
.source "BaseSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/FileSelector;


# instance fields
.field private errmsg:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelector;->errmsg:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public getError()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelector;->errmsg:Ljava/lang/String;

    return-object v0
.end method

.method public abstract isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
.end method

.method public setError(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelector;->errmsg:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/BaseSelector;->errmsg:Ljava/lang/String;

    .line 55
    :cond_0
    return-void
.end method

.method public validate()V
    .locals 2

    .prologue
    .line 86
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->getError()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 87
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->verifySettings()V

    .line 89
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->getError()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 90
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/BaseSelector;->errmsg:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 92
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->isReference()Z

    move-result v0

    if-nez v0, :cond_2

    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->dieOnCircularReference()V

    .line 95
    :cond_2
    return-void
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 75
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/selectors/BaseSelector;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->verifySettings()V

    .line 78
    :cond_0
    return-void
.end method
