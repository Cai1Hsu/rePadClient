.class public Lorg/apache/tools/ant/types/resources/comparators/Type;
.super Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.source "Type.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;-><init>()V

    return-void
.end method


# virtual methods
.method protected resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 2
    .param p1, "foo"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "bar"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 37
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v0

    .line 38
    .local v0, "f":Z
    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v1

    if-ne v0, v1, :cond_0

    .line 39
    const/4 v1, 0x0

    .line 41
    :goto_0
    return v1

    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, -0x1

    goto :goto_0
.end method
