.class public Lorg/apache/tools/ant/types/selectors/NoneSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;
.source "NoneSelector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;-><init>()V

    .line 37
    return-void
.end method


# virtual methods
.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 3
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/NoneSelector;->validate()V

    .line 64
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/NoneSelector;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 67
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 68
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/selectors/FileSelector;

    invoke-interface {v2, p1, p2, p3}, Lorg/apache/tools/ant/types/selectors/FileSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v1

    .line 70
    .local v1, "result":Z
    if-eqz v1, :cond_0

    .line 71
    const/4 v2, 0x0

    .line 74
    .end local v1    # "result":Z
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 44
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/NoneSelector;->hasSelectors()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 45
    const-string/jumbo v1, "{noneselect: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 46
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 47
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 49
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
