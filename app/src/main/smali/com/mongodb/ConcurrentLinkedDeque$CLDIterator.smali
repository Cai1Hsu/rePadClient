.class final Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;
.super Ljava/lang/Object;
.source "ConcurrentLinkedDeque.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ConcurrentLinkedDeque;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "CLDIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field last:Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field

.field next:Lcom/mongodb/ConcurrentLinkedDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mongodb/ConcurrentLinkedDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mongodb/ConcurrentLinkedDeque;


# direct methods
.method constructor <init>(Lcom/mongodb/ConcurrentLinkedDeque;)V
    .locals 1

    .prologue
    .line 868
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>.CLDIterator;"
    iput-object p1, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->this$0:Lcom/mongodb/ConcurrentLinkedDeque;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 870
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->this$0:Lcom/mongodb/ConcurrentLinkedDeque;

    invoke-static {v0}, Lcom/mongodb/ConcurrentLinkedDeque;->access$000(Lcom/mongodb/ConcurrentLinkedDeque;)Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->next:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 873
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>.CLDIterator;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->next:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 877
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>.CLDIterator;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->next:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    iput-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->last:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 878
    .local v0, "l":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-nez v0, :cond_0

    .line 879
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 880
    :cond_0
    iget-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->next:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    invoke-virtual {v1}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->forward()Lcom/mongodb/ConcurrentLinkedDeque$Node;

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->next:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 881
    iget-object v1, v0, Lcom/mongodb/ConcurrentLinkedDeque$Node;->element:Ljava/lang/Object;

    return-object v1
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 885
    .local p0, "this":Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;, "Lcom/mongodb/ConcurrentLinkedDeque<TE;>.CLDIterator;"
    iget-object v0, p0, Lcom/mongodb/ConcurrentLinkedDeque$CLDIterator;->last:Lcom/mongodb/ConcurrentLinkedDeque$Node;

    .line 886
    .local v0, "l":Lcom/mongodb/ConcurrentLinkedDeque$Node;, "Lcom/mongodb/ConcurrentLinkedDeque$Node<TE;>;"
    if-nez v0, :cond_0

    .line 887
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 888
    :cond_0
    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->delete()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Lcom/mongodb/ConcurrentLinkedDeque$Node;->isDeleted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 890
    :cond_1
    return-void
.end method
