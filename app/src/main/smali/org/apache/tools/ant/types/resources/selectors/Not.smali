.class public Lorg/apache/tools/ant/types/resources/selectors/Not;
.super Ljava/lang/Object;
.source "Not.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# instance fields
.field private sel:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 0
    .param p1, "s"    # Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/selectors/Not;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 42
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V
    .locals 2
    .param p1, "s"    # Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 50
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Not;->sel:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    if-eqz v0, :cond_0

    .line 51
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "The Not ResourceSelector accepts a single nested ResourceSelector"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Not;->sel:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .line 55
    return-void
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Not;->sel:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-interface {v0, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
