.class public interface abstract Lorg/apache/tools/ant/types/selectors/SelectorContainer;
.super Ljava/lang/Object;
.source "SelectorContainer.java"


# virtual methods
.method public abstract add(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
.end method

.method public abstract addAnd(Lorg/apache/tools/ant/types/selectors/AndSelector;)V
.end method

.method public abstract addContains(Lorg/apache/tools/ant/types/selectors/ContainsSelector;)V
.end method

.method public abstract addContainsRegexp(Lorg/apache/tools/ant/types/selectors/ContainsRegexpSelector;)V
.end method

.method public abstract addCustom(Lorg/apache/tools/ant/types/selectors/ExtendSelector;)V
.end method

.method public abstract addDate(Lorg/apache/tools/ant/types/selectors/DateSelector;)V
.end method

.method public abstract addDepend(Lorg/apache/tools/ant/types/selectors/DependSelector;)V
.end method

.method public abstract addDepth(Lorg/apache/tools/ant/types/selectors/DepthSelector;)V
.end method

.method public abstract addDifferent(Lorg/apache/tools/ant/types/selectors/DifferentSelector;)V
.end method

.method public abstract addFilename(Lorg/apache/tools/ant/types/selectors/FilenameSelector;)V
.end method

.method public abstract addMajority(Lorg/apache/tools/ant/types/selectors/MajoritySelector;)V
.end method

.method public abstract addModified(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;)V
.end method

.method public abstract addNone(Lorg/apache/tools/ant/types/selectors/NoneSelector;)V
.end method

.method public abstract addNot(Lorg/apache/tools/ant/types/selectors/NotSelector;)V
.end method

.method public abstract addOr(Lorg/apache/tools/ant/types/selectors/OrSelector;)V
.end method

.method public abstract addPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector;)V
.end method

.method public abstract addSelector(Lorg/apache/tools/ant/types/selectors/SelectSelector;)V
.end method

.method public abstract addSize(Lorg/apache/tools/ant/types/selectors/SizeSelector;)V
.end method

.method public abstract addType(Lorg/apache/tools/ant/types/selectors/TypeSelector;)V
.end method

.method public abstract appendSelector(Lorg/apache/tools/ant/types/selectors/FileSelector;)V
.end method

.method public abstract getSelectors(Lorg/apache/tools/ant/Project;)[Lorg/apache/tools/ant/types/selectors/FileSelector;
.end method

.method public abstract hasSelectors()Z
.end method

.method public abstract selectorCount()I
.end method

.method public abstract selectorElements()Ljava/util/Enumeration;
.end method
