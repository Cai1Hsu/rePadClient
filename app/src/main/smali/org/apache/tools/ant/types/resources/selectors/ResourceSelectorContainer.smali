.class public Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;
.super Lorg/apache/tools/ant/types/DataType;
.source "ResourceSelectorContainer.java"


# instance fields
.field private v:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 35
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    .line 41
    return-void
.end method

.method public constructor <init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 2
    .param p1, "r"    # [Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 35
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    .line 48
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 49
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 48
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 51
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 1
    .param p1, "s"    # Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 61
    :cond_0
    if-nez p1, :cond_1

    .line 66
    :goto_0
    return-void

    .line 64
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->setChecked(Z)V

    goto :goto_0
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 126
    :goto_0
    return-void

    .line 115
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 116
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 118
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 119
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 120
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 121
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 124
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->setChecked(Z)V

    goto :goto_0
.end method

.method public getSelectors()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 97
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 98
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->getSelectors()Ljava/util/Iterator;

    move-result-object v0

    .line 101
    :goto_0
    return-object v0

    .line 100
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->dieOnCircularReference()V

    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method public hasSelectors()Z
    .locals 1

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->hasSelectors()Z

    move-result v0

    .line 77
    :goto_0
    return v0

    .line 76
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->dieOnCircularReference()V

    .line 77
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public selectorCount()I
    .locals 1

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->selectorCount()I

    move-result v0

    .line 89
    :goto_0
    return v0

    .line 88
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->dieOnCircularReference()V

    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;->v:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    goto :goto_0
.end method
