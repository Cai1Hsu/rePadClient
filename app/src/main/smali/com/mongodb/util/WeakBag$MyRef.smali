.class Lcom/mongodb/util/WeakBag$MyRef;
.super Ljava/lang/ref/WeakReference;
.source "WeakBag.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/WeakBag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyRef"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/WeakReference",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/util/WeakBag;


# direct methods
.method constructor <init>(Lcom/mongodb/util/WeakBag;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "this":Lcom/mongodb/util/WeakBag$MyRef;, "Lcom/mongodb/util/WeakBag<TT;>.MyRef;"
    .local p2, "t":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/mongodb/util/WeakBag$MyRef;->this$0:Lcom/mongodb/util/WeakBag;

    .line 123
    invoke-direct {p0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 124
    return-void
.end method
