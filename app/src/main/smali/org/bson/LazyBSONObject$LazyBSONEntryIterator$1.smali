.class Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;
.super Ljava/lang/Object;
.source "LazyBSONObject.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->next()Ljava/util/Map$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;

.field final synthetic val$nextElementRecord:Lorg/bson/LazyBSONObject$ElementRecord;


# direct methods
.method constructor <init>(Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;Lorg/bson/LazyBSONObject$ElementRecord;)V
    .locals 0

    .prologue
    .line 209
    iput-object p1, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->this$1:Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;

    iput-object p2, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->val$nextElementRecord:Lorg/bson/LazyBSONObject$ElementRecord;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 227
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-nez v2, :cond_1

    .line 230
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 229
    check-cast v0, Ljava/util/Map$Entry;

    .line 230
    .local v0, "e":Ljava/util/Map$Entry;
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->val$nextElementRecord:Lorg/bson/LazyBSONObject$ElementRecord;

    iget-object v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->this$1:Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;

    iget-object v0, v0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;->this$0:Lorg/bson/LazyBSONObject;

    iget-object v1, p0, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->val$nextElementRecord:Lorg/bson/LazyBSONObject$ElementRecord;

    invoke-virtual {v0, v1}, Lorg/bson/LazyBSONObject;->getElementValue(Lorg/bson/LazyBSONObject$ElementRecord;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 235
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 222
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 240
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONEntryIterator$1;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
