.class Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;
.super Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
.source "LayoutPreservingProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/LayoutPreservingProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Comment"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/util/LayoutPreservingProperties;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/util/LayoutPreservingProperties;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/LayoutPreservingProperties;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 648
    iput-object p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Comment;->this$0:Lorg/apache/tools/ant/util/LayoutPreservingProperties;

    .line 649
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;-><init>(Ljava/lang/String;)V

    .line 650
    return-void
.end method
