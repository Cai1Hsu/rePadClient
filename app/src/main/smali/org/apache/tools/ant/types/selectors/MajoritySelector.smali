.class public Lorg/apache/tools/ant/types/selectors/MajoritySelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;
.source "MajoritySelector.java"


# instance fields
.field private allowtie:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;-><init>()V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/MajoritySelector;->allowtie:Z

    .line 43
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 5
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/MajoritySelector;->validate()V

    .line 82
    const/4 v3, 0x0

    .line 83
    .local v3, "yesvotes":I
    const/4 v1, 0x0

    .line 84
    .local v1, "novotes":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/MajoritySelector;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 87
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 88
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/selectors/FileSelector;

    invoke-interface {v4, p1, p2, p3}, Lorg/apache/tools/ant/types/selectors/FileSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v2

    .line 90
    .local v2, "result":Z
    if-eqz v2, :cond_0

    .line 91
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 93
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 96
    .end local v2    # "result":Z
    :cond_1
    if-le v3, v1, :cond_2

    .line 97
    const/4 v4, 0x1

    .line 102
    :goto_1
    return v4

    .line 98
    :cond_2
    if-le v1, v3, :cond_3

    .line 99
    const/4 v4, 0x0

    goto :goto_1

    .line 102
    :cond_3
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/selectors/MajoritySelector;->allowtie:Z

    goto :goto_1
.end method

.method public setAllowtie(Z)V
    .locals 0
    .param p1, "tiebreaker"    # Z

    .prologue
    .line 66
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/MajoritySelector;->allowtie:Z

    .line 67
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 50
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/MajoritySelector;->hasSelectors()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 51
    const-string/jumbo v1, "{majorityselect: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 52
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 53
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
