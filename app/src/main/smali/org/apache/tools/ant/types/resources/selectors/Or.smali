.class public Lorg/apache/tools/ant/types/resources/selectors/Or;
.super Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;
.source "Or.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>()V

    .line 34
    return-void
.end method

.method public constructor <init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 0
    .param p1, "r"    # [Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelectorContainer;-><init>([Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 42
    return-void
.end method


# virtual methods
.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 2
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Or;->getSelectors()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 51
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-interface {v1, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 52
    const/4 v1, 0x1

    .line 55
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
