.class public Lorg/apache/tools/ant/types/selectors/SelectSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;
.source "SelectSelector.java"


# instance fields
.field private ifCondition:Ljava/lang/Object;

.field private unlessCondition:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;-><init>()V

    .line 46
    return-void
.end method

.method private getRef()Lorg/apache/tools/ant/types/selectors/SelectSelector;
    .locals 3

    .prologue
    .line 75
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string/jumbo v2, "SelectSelector"

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 76
    .local v0, "o":Ljava/lang/Object;
    check-cast v0, Lorg/apache/tools/ant/types/selectors/SelectSelector;

    .end local v0    # "o":Ljava/lang/Object;
    return-object v0
.end method


# virtual methods
.method public appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 133
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 134
    return-void
.end method

.method public getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getRef()Lorg/apache/tools/ant/types/selectors/SelectSelector;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v0

    .line 110
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v0

    goto :goto_0
.end method

.method public hasSelectors()Z
    .locals 1

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getRef()Lorg/apache/tools/ant/types/selectors/SelectSelector;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->hasSelectors()Z

    move-result v0

    .line 87
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->hasSelectors()Z

    move-result v0

    goto :goto_0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 3
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 216
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->validate()V

    .line 219
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->passesConditions()Z

    move-result v2

    if-nez v2, :cond_0

    .line 220
    const/4 v2, 0x0

    .line 228
    :goto_0
    return v2

    .line 223
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 224
    .local v0, "e":Ljava/util/Enumeration;
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_1

    .line 225
    const/4 v2, 0x1

    goto :goto_0

    .line 227
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/selectors/FileSelector;

    .line 228
    .local v1, "f":Lorg/apache/tools/ant/types/selectors/FileSelector;
    invoke-interface {v1, p1, p2, p3}, Lorg/apache/tools/ant/types/selectors/FileSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v2

    goto :goto_0
.end method

.method public passesConditions()Z
    .locals 2

    .prologue
    .line 155
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v0

    .line 156
    .local v0, "ph":Lorg/apache/tools/ant/PropertyHelper;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->ifCondition:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testIfCondition(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->unlessCondition:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/PropertyHelper;->testUnlessCondition(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public selectorCount()I
    .locals 1

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getRef()Lorg/apache/tools/ant/types/selectors/SelectSelector;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->selectorCount()I

    move-result v0

    .line 98
    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorCount()I

    move-result v0

    goto :goto_0
.end method

.method public selectorElements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 118
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 119
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->getRef()Lorg/apache/tools/ant/types/selectors/SelectSelector;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 121
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    goto :goto_0
.end method

.method public setIf(Ljava/lang/Object;)V
    .locals 0
    .param p1, "ifProperty"    # Ljava/lang/Object;

    .prologue
    .line 168
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->ifCondition:Ljava/lang/Object;

    .line 169
    return-void
.end method

.method public setIf(Ljava/lang/String;)V
    .locals 0
    .param p1, "ifProperty"    # Ljava/lang/String;

    .prologue
    .line 178
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->setIf(Ljava/lang/Object;)V

    .line 179
    return-void
.end method

.method public setUnless(Ljava/lang/Object;)V
    .locals 0
    .param p1, "unlessProperty"    # Ljava/lang/Object;

    .prologue
    .line 189
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->unlessCondition:Ljava/lang/Object;

    .line 190
    return-void
.end method

.method public setUnless(Ljava/lang/String;)V
    .locals 0
    .param p1, "unlessProperty"    # Ljava/lang/String;

    .prologue
    .line 199
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->setUnless(Ljava/lang/Object;)V

    .line 200
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 53
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->hasSelectors()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 54
    const-string/jumbo v1, "{select"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->ifCondition:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 56
    const-string/jumbo v1, " if: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 57
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->ifCondition:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 59
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->unlessCondition:Ljava/lang/Object;

    if-eqz v1, :cond_1

    .line 60
    const-string/jumbo v1, " unless: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/SelectSelector;->unlessCondition:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 63
    :cond_1
    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 64
    invoke-super {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public verifySettings()V
    .locals 2

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->selectorCount()I

    move-result v0

    .line 143
    .local v0, "cnt":I
    if-ltz v0, :cond_0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 144
    :cond_0
    const-string/jumbo v1, "Only one selector is allowed within the <selector> tag"

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/selectors/SelectSelector;->setError(Ljava/lang/String;)V

    .line 147
    :cond_1
    return-void
.end method
