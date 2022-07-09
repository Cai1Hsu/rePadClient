.class public Lorg/apache/tools/ant/types/resources/comparators/Date;
.super Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.source "Date.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;-><init>()V

    return-void
.end method


# virtual methods
.method protected resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 8
    .param p1, "foo"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "bar"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const-wide/16 v6, 0x0

    .line 35
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 36
    .local v0, "diff":J
    cmp-long v2, v0, v6

    if-lez v2, :cond_0

    .line 37
    const/4 v2, 0x1

    .line 41
    :goto_0
    return v2

    .line 38
    :cond_0
    cmp-long v2, v0, v6

    if-gez v2, :cond_1

    .line 39
    const/4 v2, -0x1

    goto :goto_0

    .line 41
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
