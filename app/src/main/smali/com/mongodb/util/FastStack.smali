.class public Lcom/mongodb/util/FastStack;
.super Ljava/lang/Object;
.source "FastStack.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final _data:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 47
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 48
    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 1
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public peek()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    iget-object v1, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public pop()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    iget-object v1, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public push(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 43
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    .local p0, "this":Lcom/mongodb/util/FastStack;, "Lcom/mongodb/util/FastStack<TT;>;"
    iget-object v0, p0, Lcom/mongodb/util/FastStack;->_data:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
