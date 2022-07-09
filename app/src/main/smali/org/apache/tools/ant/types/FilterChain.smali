.class public Lorg/apache/tools/ant/types/FilterChain;
.super Lorg/apache/tools/ant/types/DataType;
.source "FilterChain.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private filterReaders:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 51
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/filters/ChainableReader;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/ChainableReader;

    .prologue
    .line 392
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 393
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 395
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 396
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 397
    return-void
.end method

.method public addClassConstants(Lorg/apache/tools/ant/filters/ClassConstants;)V
    .locals 1
    .param p1, "classConstants"    # Lorg/apache/tools/ant/filters/ClassConstants;

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 88
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 89
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 90
    return-void
.end method

.method public addContainsRegex(Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ContainsRegex;

    .prologue
    .line 302
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 303
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 305
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 306
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 307
    return-void
.end method

.method public addDeleteCharacters(Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;

    .prologue
    .line 288
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 289
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 291
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 292
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 293
    return-void
.end method

.method public addEscapeUnicode(Lorg/apache/tools/ant/filters/EscapeUnicode;)V
    .locals 1
    .param p1, "escapeUnicode"    # Lorg/apache/tools/ant/filters/EscapeUnicode;

    .prologue
    .line 260
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 263
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 264
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 265
    return-void
.end method

.method public addExpandProperties(Lorg/apache/tools/ant/filters/ExpandProperties;)V
    .locals 1
    .param p1, "expandProperties"    # Lorg/apache/tools/ant/filters/ExpandProperties;

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 101
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 102
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 103
    return-void
.end method

.method public addFilterReader(Lorg/apache/tools/ant/types/AntFilterReader;)V
    .locals 1
    .param p1, "filterReader"    # Lorg/apache/tools/ant/types/AntFilterReader;

    .prologue
    .line 59
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 62
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 64
    return-void
.end method

.method public addHeadFilter(Lorg/apache/tools/ant/filters/HeadFilter;)V
    .locals 1
    .param p1, "headFilter"    # Lorg/apache/tools/ant/filters/HeadFilter;

    .prologue
    .line 111
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 114
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 116
    return-void
.end method

.method public addIgnoreBlank(Lorg/apache/tools/ant/filters/TokenFilter$IgnoreBlank;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$IgnoreBlank;

    .prologue
    .line 359
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 362
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 363
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 364
    return-void
.end method

.method public addLineContains(Lorg/apache/tools/ant/filters/LineContains;)V
    .locals 1
    .param p1, "lineContains"    # Lorg/apache/tools/ant/filters/LineContains;

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 127
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 128
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 129
    return-void
.end method

.method public addLineContainsRegExp(Lorg/apache/tools/ant/filters/LineContainsRegExp;)V
    .locals 1
    .param p1, "lineContainsRegExp"    # Lorg/apache/tools/ant/filters/LineContainsRegExp;

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 141
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 143
    return-void
.end method

.method public addPrefixLines(Lorg/apache/tools/ant/filters/PrefixLines;)V
    .locals 1
    .param p1, "prefixLines"    # Lorg/apache/tools/ant/filters/PrefixLines;

    .prologue
    .line 151
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 154
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 155
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 156
    return-void
.end method

.method public addReplaceRegex(Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ReplaceRegex;

    .prologue
    .line 315
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 316
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 318
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 319
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 320
    return-void
.end method

.method public addReplaceString(Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$ReplaceString;

    .prologue
    .line 344
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 345
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 347
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 348
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 349
    return-void
.end method

.method public addReplaceTokens(Lorg/apache/tools/ant/filters/ReplaceTokens;)V
    .locals 1
    .param p1, "replaceTokens"    # Lorg/apache/tools/ant/filters/ReplaceTokens;

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 181
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 182
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 183
    return-void
.end method

.method public addStripJavaComments(Lorg/apache/tools/ant/filters/StripJavaComments;)V
    .locals 1
    .param p1, "stripJavaComments"    # Lorg/apache/tools/ant/filters/StripJavaComments;

    .prologue
    .line 192
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 195
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 196
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 197
    return-void
.end method

.method public addStripLineBreaks(Lorg/apache/tools/ant/filters/StripLineBreaks;)V
    .locals 1
    .param p1, "stripLineBreaks"    # Lorg/apache/tools/ant/filters/StripLineBreaks;

    .prologue
    .line 206
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 209
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 210
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 211
    return-void
.end method

.method public addStripLineComments(Lorg/apache/tools/ant/filters/StripLineComments;)V
    .locals 1
    .param p1, "stripLineComments"    # Lorg/apache/tools/ant/filters/StripLineComments;

    .prologue
    .line 220
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 223
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 224
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 225
    return-void
.end method

.method public addSuffixLines(Lorg/apache/tools/ant/filters/SuffixLines;)V
    .locals 1
    .param p1, "suffixLines"    # Lorg/apache/tools/ant/filters/SuffixLines;

    .prologue
    .line 165
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 168
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 169
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 170
    return-void
.end method

.method public addTabsToSpaces(Lorg/apache/tools/ant/filters/TabsToSpaces;)V
    .locals 1
    .param p1, "tabsToSpaces"    # Lorg/apache/tools/ant/filters/TabsToSpaces;

    .prologue
    .line 233
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 234
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 236
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 237
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 238
    return-void
.end method

.method public addTailFilter(Lorg/apache/tools/ant/filters/TailFilter;)V
    .locals 1
    .param p1, "tailFilter"    # Lorg/apache/tools/ant/filters/TailFilter;

    .prologue
    .line 246
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 249
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 250
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 251
    return-void
.end method

.method public addTokenFilter(Lorg/apache/tools/ant/filters/TokenFilter;)V
    .locals 1
    .param p1, "tokenFilter"    # Lorg/apache/tools/ant/filters/TokenFilter;

    .prologue
    .line 274
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 277
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 278
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 279
    return-void
.end method

.method public addTrim(Lorg/apache/tools/ant/filters/TokenFilter$Trim;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/filters/TokenFilter$Trim;

    .prologue
    .line 329
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 330
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 332
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V

    .line 333
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 334
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
    .line 401
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    .line 415
    :goto_0
    monitor-exit p0

    return-void

    .line 404
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 405
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 401
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 407
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 408
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 409
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_2

    .line 410
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-static {v1, p1, p2}, Lorg/apache/tools/ant/types/FilterChain;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 413
    :cond_3
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/types/FilterChain;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public getFilterReaders()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FilterChain;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/FilterChain;->getFilterReaders()Ljava/util/Vector;

    move-result-object v0

    .line 76
    :goto_0
    return-object v0

    .line 75
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->dieOnCircularReference()V

    .line 76
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    goto :goto_0
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 378
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterChain;->filterReaders:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 379
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/FilterChain;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 381
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 382
    return-void
.end method
