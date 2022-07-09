.class public Lorg/apache/tools/ant/util/WeakishReference$HardReference;
.super Lorg/apache/tools/ant/util/WeakishReference;
.source "WeakishReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/WeakishReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HardReference"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 86
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/WeakishReference;-><init>(Ljava/lang/Object;)V

    .line 87
    return-void
.end method
