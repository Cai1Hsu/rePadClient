.class public Lorg/apache/tools/ant/types/resources/selectors/None;
.super Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;
.source "None.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>()V

    .line 35
    return-void
.end method

.method public constructor <init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 0
    .param p1, "r"    # [Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 43
    return-void
.end method


# virtual methods
.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 3
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 51
    const/4 v1, 0x1

    .line 52
    .local v1, "none":Z
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/None;->getSelectors()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 53
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-interface {v2, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    :goto_1
    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 55
    :cond_1
    return v1
.end method
