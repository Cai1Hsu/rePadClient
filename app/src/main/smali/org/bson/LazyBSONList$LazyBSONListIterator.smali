.class public Lorg/bson/LazyBSONList$LazyBSONListIterator;
.super Ljava/lang/Object;
.source "LazyBSONList.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/LazyBSONList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LazyBSONListIterator"
.end annotation


# instance fields
.field elements:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/bson/LazyBSONObject$ElementRecord;",
            ">;"
        }
    .end annotation
.end field

.field pos:I

.field final synthetic this$0:Lorg/bson/LazyBSONList;


# direct methods
.method public constructor <init>(Lorg/bson/LazyBSONList;)V
    .locals 1

    .prologue
    .line 99
    iput-object p1, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->this$0:Lorg/bson/LazyBSONList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->pos:I

    .line 100
    invoke-virtual {p1}, Lorg/bson/LazyBSONList;->getElements()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->elements:Ljava/util/List;

    .line 101
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 105
    iget v0, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->pos:I

    iget-object v1, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->elements:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 4

    .prologue
    .line 110
    iget-object v1, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->this$0:Lorg/bson/LazyBSONList;

    iget-object v0, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->elements:Ljava/util/List;

    iget v2, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/bson/LazyBSONList$LazyBSONListIterator;->pos:I

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/LazyBSONObject$ElementRecord;

    invoke-virtual {v1, v0}, Lorg/bson/LazyBSONList;->getElementValue(Lorg/bson/LazyBSONObject$ElementRecord;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 115
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
