.class final Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;
.super Lorg/apache/tools/ant/types/resources/Restrict;
.source "DependSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/DependSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NonExistent"
.end annotation


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/Restrict;-><init>()V

    .line 92
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 93
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/DependSet;->access$000()Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    move-result-object v0

    invoke-super {p0, v0}, Lorg/apache/tools/ant/types/resources/Restrict;->add(Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)V

    .line 94
    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/taskdefs/DependSet$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "x1"    # Lorg/apache/tools/ant/taskdefs/DependSet$1;

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/DependSet$NonExistent;-><init>(Lorg/apache/tools/ant/types/ResourceCollection;)V

    return-void
.end method
