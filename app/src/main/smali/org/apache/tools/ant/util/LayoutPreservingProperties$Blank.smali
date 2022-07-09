.class Lorg/apache/tools/ant/util/LayoutPreservingProperties$Blank;
.super Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
.source "LayoutPreservingProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/LayoutPreservingProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Blank"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 640
    const-string/jumbo v0, ""

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;-><init>(Ljava/lang/String;)V

    .line 641
    return-void
.end method
