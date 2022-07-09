.class Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;
.super Ljava/lang/Object;
.source "ModelUtil.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private _i:Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ListIterator",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/ListIterator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ListIterator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 292
    .local p0, "this":Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;, "Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator<TT;>;"
    .local p1, "i":Ljava/util/ListIterator;, "Ljava/util/ListIterator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 293
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;->_i:Ljava/util/ListIterator;

    .line 294
    :goto_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;->_i:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;->_i:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    goto :goto_0

    .line 296
    :cond_0
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 299
    .local p0, "this":Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;, "Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator<TT;>;"
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;->_i:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 303
    .local p0, "this":Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;, "Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator<TT;>;"
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;->_i:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 307
    .local p0, "this":Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;, "Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator<TT;>;"
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/util/ReverseListIterator;->_i:Ljava/util/ListIterator;

    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    .line 308
    return-void
.end method
