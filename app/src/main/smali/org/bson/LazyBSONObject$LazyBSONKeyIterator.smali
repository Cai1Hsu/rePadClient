.class Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;
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
    name = "LazyBSONKeyIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field offset:I

.field final synthetic this$0:Lorg/bson/LazyBSONObject;


# direct methods
.method constructor <init>(Lorg/bson/LazyBSONObject;)V
    .locals 1

    .prologue
    .line 88
    iput-object p1, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v0, v0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v1, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

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
    .line 88
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 5

    .prologue
    .line 95
    iget-object v3, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v4, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v1

    .line 96
    .local v1, "fieldSize":I
    iget-object v3, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget v4, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

    invoke-virtual {v3, v4}, Lorg/bson/LazyBSONObject;->getElementBSONSize(I)I

    move-result v0

    .line 97
    .local v0, "elementSize":I
    iget-object v3, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget-object v3, v3, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    iget v4, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v3, v4}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, "key":Ljava/lang/String;
    iget v3, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

    add-int v4, v1, v0

    add-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    iput v3, p0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;->offset:I

    .line 99
    return-object v2
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 103
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
