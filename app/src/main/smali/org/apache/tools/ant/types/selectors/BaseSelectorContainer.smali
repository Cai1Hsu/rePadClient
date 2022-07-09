.class public abstract Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;
.super Lorg/apache/tools/ant/types/selectors/BaseSelector;
.source "BaseSelectorContainer.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/SelectorContainer;


# instance fields
.field private selectorsList:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;-><init>()V

    .line 40
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    .line 46
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 328
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 329
    return-void
.end method

.method public addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/AndSelector;

    .prologue
    .line 182
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 183
    return-void
.end method

.method public addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsSelector;

    .prologue
    .line 254
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 255
    return-void
.end method

.method public addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;

    .prologue
    .line 302
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 303
    return-void
.end method

.method public addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/ExtendSelector;

    .prologue
    .line 246
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 247
    return-void
.end method

.method public addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DateSelector;

    .prologue
    .line 222
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 223
    return-void
.end method

.method public addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DependSelector;

    .prologue
    .line 278
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 279
    return-void
.end method

.method public addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DepthSelector;

    .prologue
    .line 270
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 271
    return-void
.end method

.method public addDifferent(Lorg/apache/tools/ant/types/selectors/DifferentSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/DifferentSelector;

    .prologue
    .line 286
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 287
    return-void
.end method

.method public addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FilenameSelector;

    .prologue
    .line 238
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 239
    return-void
.end method

.method public addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/MajoritySelector;

    .prologue
    .line 214
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 215
    return-void
.end method

.method public addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;

    .prologue
    .line 311
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 312
    return-void
.end method

.method public addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NoneSelector;

    .prologue
    .line 206
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 207
    return-void
.end method

.method public addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/NotSelector;

    .prologue
    .line 198
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 199
    return-void
.end method

.method public addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/OrSelector;

    .prologue
    .line 190
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 191
    return-void
.end method

.method public addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/PresentSelector;

    .prologue
    .line 262
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 263
    return-void
.end method

.method public addReadable(Lorg/apache/tools/ant/types/selectors/ReadableSelector;)V
    .locals 0
    .param p1, "r"    # Lorg/apache/tools/ant/types/selectors/ReadableSelector;

    .prologue
    .line 315
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 316
    return-void
.end method

.method public addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SelectSelector;

    .prologue
    .line 174
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 175
    return-void
.end method

.method public addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/SizeSelector;

    .prologue
    .line 230
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 231
    return-void
.end method

.method public addType(Lorg/apache/tools/ant/types/selectors/TypeSelector;)V
    .locals 0
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/TypeSelector;

    .prologue
    .line 294
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 295
    return-void
.end method

.method public addWritable(Lorg/apache/tools/ant/types/selectors/WritableSelector;)V
    .locals 0
    .param p1, "w"    # Lorg/apache/tools/ant/types/selectors/WritableSelector;

    .prologue
    .line 319
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V

    .line 320
    return-void
.end method

.method public appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
    .locals 1
    .param p1, "selector"    # Lorg/apache/tools/ant/types/selectors/FileSelector;

    .prologue
    .line 116
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 117
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->setChecked(Z)V

    .line 118
    return-void
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 333
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 347
    :goto_0
    monitor-exit p0

    return-void

    .line 336
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 337
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 333
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 339
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 340
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 341
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 342
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 345
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->dieOnCircularReference()V

    .line 73
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lorg/apache/tools/ant/types/selectors/FileSelector;

    .line 74
    .local v0, "result":[Lorg/apache/tools/ant/types/selectors/FileSelector;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 75
    return-object v0
.end method

.method public hasSelectors()Z
    .locals 1

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->dieOnCircularReference()V

    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
.end method

.method public selectorCount()I
    .locals 1

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->dieOnCircularReference()V

    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    return v0
.end method

.method public selectorElements()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 83
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->dieOnCircularReference()V

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorsList:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->dieOnCircularReference()V

    .line 96
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 97
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorElements()Ljava/util/Enumeration;

    move-result-object v1

    .line 98
    .local v1, "e":Ljava/util/Enumeration;
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 99
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 100
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 101
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    const-string/jumbo v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 107
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public validate()V
    .locals 4

    .prologue
    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->verifySettings()V

    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->dieOnCircularReference()V

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->getError()Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "errmsg":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 141
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 143
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelectorContainer;->selectorElements()Ljava/util/Enumeration;

    move-result-object v0

    .line 144
    .local v0, "e":Ljava/util/Enumeration;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 145
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .line 146
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, Lorg/apache/tools/ant/types/selectors/BaseSelector;

    if-eqz v3, :cond_1

    .line 147
    check-cast v2, Lorg/apache/tools/ant/types/selectors/BaseSelector;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/selectors/BaseSelector;->validate()V

    goto :goto_0

    .line 150
    :cond_2
    return-void
.end method
