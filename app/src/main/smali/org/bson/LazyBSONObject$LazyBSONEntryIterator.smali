.class Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;
.super Ljava/lang/Object;
.source "LazyBSONObject.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/LazyBSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "LazyBSONEntryIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field offset:I

.field final synthetic this$0:Lorg/bson/LazyBSONObject;


# direct methods
.method constructor <init>(Lorg/bson/LazyBSONObject;)V
    .locals 1

    .prologue
    .line 197
    iput-object p1, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 249
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v0, v0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v1, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    invoke-virtual {v0, v1}, Lorg/bson/LazyBSONObject;->isElementEmpty(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 197
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    iget-object v4, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v5, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v1

    .line 205
    .local v1, "fieldSize":I
    iget-object v4, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v5, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    invoke-virtual {v4, v5}, Lorg/bson/LazyBSONObject;->getElementBSONSize(I)I

    move-result v0

    .line 206
    .local v0, "elementSize":I
    iget-object v4, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget-object v4, v4, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    iget v5, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v2

    .line 207
    .local v2, "key":Ljava/lang/String;
    new-instance v3, Lorg/bson/LazyBSONObject$ElementRecord;

    iget-object v4, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v5, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    invoke-direct {v3, v4, v2, v5}, Lorg/bson/LazyBSONObject$ElementRecord;-><init>(Lorg/bson/LazyBSONObject;Ljava/lang/String;I)V

    .line 208
    .local v3, "nextElementRecord":Lorg/bson/LazyBSONObject$ElementRecord;
    iget v4, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    add-int v5, v1, v0

    add-int/2addr v4, v5

    iput v4, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->offset:I

    .line 209
    new-instance v4, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;

    invoke-direct {v4, p0, v3}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;-><init>(Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;Lorg/bson/LazyBSONObject$ElementRecord;)V

    return-object v4
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 246
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
