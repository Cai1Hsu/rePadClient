.class public Lorg/apache/tools/ant/types/resources/comparators/Name;
.super Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.source "Name.java"


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
    .locals 2
    .param p1, "foo"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "bar"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 35
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method
