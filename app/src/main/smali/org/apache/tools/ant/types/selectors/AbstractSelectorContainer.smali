.class public abstract Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;
.super Lorg/apache/tools/ant/types/DataType;
.source "AbstractSelectorContainer.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/tools/ant/types/selectors/SelectorContainer;


# instance fields
.field private selectorsList:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 40
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 322
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 323
    return-void
.end method

.method public addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/AndSelector;

    .prologue
    .line 176
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 177
    return-void
.end method

.method public addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsSelector;

    .prologue
    .line 248
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 249
    return-void
.end method

.method public addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;

    .prologue
    .line 296
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 297
    return-void
.end method

.method public addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ExtendSelector;

    .prologue
    .line 240
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 241
    return-void
.end method

.method public addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DateSelector;

    .prologue
    .line 216
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 217
    return-void
.end method

.method public addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DependSelector;

    .prologue
    .line 272
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 273
    return-void
.end method

.method public addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DepthSelector;

    .prologue
    .line 264
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 265
    return-void
.end method

.method public addDifferent(Lorg/apache/tools/ant/types/selectors/DifferentSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DifferentSelector;

    .prologue
    .line 280
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 281
    return-void
.end method

.method public addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FilenameSelector;

    .prologue
    .line 232
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 233
    return-void
.end method

.method public addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/MajoritySelector;

    .prologue
    .line 208
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 209
    return-void
.end method

.method public addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;

    .prologue
    .line 305
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 306
    return-void
.end method

.method public addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NoneSelector;

    .prologue
    .line 200
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 201
    return-void
.end method

.method public addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NotSelector;

    .prologue
    .line 192
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 193
    return-void
.end method

.method public addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/OrSelector;

    .prologue
    .line 184
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 185
    return-void
.end method

.method public addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/PresentSelector;

    .prologue
    .line 256
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 257
    return-void
.end method

.method public addReadable(Lorg/apache/tools/ant/types/selectors/ReadableSelector;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/selectors/ReadableSelector;

    .prologue
    .line 309
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 310
    return-void
.end method

.method public addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SelectSelector;

    .prologue
    .line 168
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 169
    return-void
.end method

.method public addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SizeSelector;

    .prologue
    .line 224
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 225
    return-void
.end method

.method public addType(Lorg/apache/tools/ant/types/selectors/TypeSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/TypeSelector;

    .prologue
    .line 288
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 289
    return-void
.end method

.method public addWritable(Lorg/apache/tools/ant/types/selectors/WritableSelector;)V
    .locals 0
    .param p1, "w"    # Lorg/apache/tools/ant/types/selectors/WritableSelector;

    .prologue
    .line 313
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 314
    return-void
.end method

.method public appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 127
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->setChecked(Z)V

    .line 128
    return-void
.end method

.method public declared-synchronized clone()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 343
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 344
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->clone()Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 350
    :goto_0
    monitor-exit p0

    return-object v1

    .line 347
    :cond_0
    :try_start_1
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    .line 349
    .local v1, "sc":Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;
    new-instance v2, Ljava/util/Vector;

    iget-object v3, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-direct {v2, v3}, Ljava/util/Vector;-><init>(Ljava/util/Collection;)V

    iput-object v2, v1, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 351
    .end local v1    # "sc":Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;
    :catch_0
    move-exception v0

    .line 352
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    :try_start_2
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 343
    .end local v0    # "e":Ljava/lang/CloneNotSupportedException;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 326
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 340
    :goto_0
    monitor-exit p0

    return-void

    .line 329
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 330
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 326
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 332
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 333
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 334
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 335
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 338
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 73
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;

    move-result-object v0

    .line 79
    :goto_0
    return-object v0

    .line 76
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 77
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lorg/apache/tools/ant/types/selectors/FileSelector;

    .line 78
    .local v0, "result":[Lorg/apache/tools/ant/types/selectors/FileSelector;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public hasSelectors()Z
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->hasSelectors()Z

    move-result v0

    .line 51
    :goto_0
    return v0

    .line 50
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->dieOnCircularReference()V

    .line 51
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

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
    .line 59
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorCount()I

    move-result v0

    .line 63
    :goto_0
    return v0

    .line 62
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->dieOnCircularReference()V

    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    goto :goto_0
.end method

.method public selectorElements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 92
    :goto_0
    return-object v0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->dieOnCircularReference()V

    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 104
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorElements()Ljava/util/Enumeration;

    move-result-object v1

    .line 105
    .local v1, "e":Ljava/util/Enumeration;
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 106
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 107
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 108
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 109
    const-string/jumbo v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 114
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public validate()V
    .locals 3

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 148
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->getCheckedRef()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->validate()V

    .line 150
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->dieOnCircularReference()V

    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/AbstractSelectorContainer;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 152
    .local v0, "e":Ljava/util/Enumeration;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 153
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    .line 154
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/selectors/BaseSelector;

    if-eqz v2, :cond_1

    .line 155
    check-cast v1, Lorg/apache/tools/ant/types/selectors/BaseSelector;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->validate()V

    goto :goto_0

    .line 158
    :cond_2
    return-void
.end method
