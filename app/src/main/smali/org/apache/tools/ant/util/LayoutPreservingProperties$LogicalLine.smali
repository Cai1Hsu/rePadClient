.class abstract Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
.super Ljava/lang/Object;
.source "LayoutPreservingProperties.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/LayoutPreservingProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "LogicalLine"
.end annotation


# instance fields
.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 622
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 623
    iput-object p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;->text:Ljava/lang/String;

    .line 624
    return-void
.end method


# virtual methods
.method public setText(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 627
    iput-object p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;->text:Ljava/lang/String;

    .line 628
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 631
    iget-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;->text:Ljava/lang/String;

    return-object v0
.end method
