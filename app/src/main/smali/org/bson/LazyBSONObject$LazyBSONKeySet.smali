.class public Lorg/bson/LazyBSONObject$LazyBSONKeySet;
.super Lorg/bson/LazyBSONObject$ReadOnlySet;
.source "LazyBSONObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/LazyBSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LazyBSONKeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/bson/LazyBSONObject$ReadOnlySet",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/LazyBSONObject;


# direct methods
.method public constructor <init>(Lorg/bson/LazyBSONObject;)V
    .locals 0

    .prologue
    .line 113
    iput-object p1, p0, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {p0, p1}, Lorg/bson/LazyBSONObject$ReadOnlySet;-><init>(Lorg/bson/LazyBSONObject;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 112
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->add(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public add(Ljava/lang/String;)Z
    .locals 2
    .param p1, "e"    # Ljava/lang/String;

    .prologue
    .line 178
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic addAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "x0"    # Ljava/util/Collection;

    .prologue
    .line 112
    invoke-super {p0, p1}, Lorg/bson/LazyBSONObject$ReadOnlySet;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic clear()V
    .locals 0

    .prologue
    .line 112
    invoke-super {p0}, Lorg/bson/LazyBSONObject$ReadOnlySet;->clear()V

    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 139
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 140
    const/4 v2, 0x1

    .line 143
    .end local v1    # "key":Ljava/lang/String;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 188
    .local p1, "collection":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 189
    .local v1, "item":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 190
    const/4 v2, 0x0

    .line 193
    .end local v1    # "item":Ljava/lang/Object;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-virtual {v0}, Lorg/bson/LazyBSONObject;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 148
    new-instance v0, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;

    iget-object v1, p0, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {v0, v1}, Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;-><init>(Lorg/bson/LazyBSONObject;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 183
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not supported yet."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic removeAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "x0"    # Ljava/util/Collection;

    .prologue
    .line 112
    invoke-super {p0, p1}, Lorg/bson/LazyBSONObject$ReadOnlySet;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic retainAll(Ljava/util/Collection;)Z
    .locals 1
    .param p1, "x0"    # Ljava/util/Collection;

    .prologue
    .line 112
    invoke-super {p0, p1}, Lorg/bson/LazyBSONObject$ReadOnlySet;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 3

    .prologue
    .line 122
    const/4 v1, 0x0

    .line 123
    .local v1, "size":I
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 124
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 125
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 128
    :cond_0
    return v1
.end method

.method public bridge synthetic toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->toArray()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->size()I

    move-result v5

    .line 162
    .local v5, "size":I
    array-length v6, p1

    if-lt v6, v5, :cond_0

    move-object v4, p1

    .line 165
    .local v4, "localArray":[Ljava/lang/Object;, "[TT;"
    :goto_0
    const/4 v0, 0x0

    .line 166
    .local v0, "i":I
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 167
    .local v3, "key":Ljava/lang/String;
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "i":I
    .local v1, "i":I
    aput-object v3, v4, v0

    move v0, v1

    .line 168
    .end local v1    # "i":I
    .restart local v0    # "i":I
    goto :goto_1

    .line 162
    .end local v0    # "i":I
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "localArray":[Ljava/lang/Object;, "[TT;"
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    check-cast v6, [Ljava/lang/Object;

    move-object v4, v6

    goto :goto_0

    .line 170
    .restart local v0    # "i":I
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "localArray":[Ljava/lang/Object;, "[TT;"
    :cond_1
    array-length v6, v4

    if-le v6, v0, :cond_2

    .line 171
    const/4 v6, 0x0

    aput-object v6, v4, v0

    .line 173
    :cond_2
    return-object v4
.end method

.method public toArray()[Ljava/lang/String;
    .locals 2

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->size()I

    move-result v1

    new-array v0, v1, [Ljava/lang/String;

    .line 154
    .local v0, "a":[Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    return-object v1
.end method
