.class public abstract Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;
.super Ljava/lang/Object;
.source "AbstractHashedMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "HashIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected expectedModCount:I

.field protected hashIndex:I

.field protected last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field protected next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field protected final parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;


# direct methods
.method protected constructor <init>(Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 1105
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator<TK;TV;>;"
    .local p1, "parent":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1106
    iput-object p1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    .line 1107
    iget-object v0, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1108
    .local v0, "data":[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    array-length v1, v0

    .line 1109
    .local v1, "i":I
    const/4 v2, 0x0

    .line 1110
    .local v2, "next":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_0
    if-lez v1, :cond_0

    if-nez v2, :cond_0

    .line 1111
    add-int/lit8 v1, v1, -0x1

    aget-object v2, v0, v1

    goto :goto_0

    .line 1113
    :cond_0
    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1114
    iput v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->hashIndex:I

    .line 1115
    iget v3, p1, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    iput v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->expectedModCount:I

    .line 1116
    return-void
.end method


# virtual methods
.method protected currentEntry()Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1143
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    return-object v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 1119
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected nextEntry()Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1123
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator<TK;TV;>;"
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    iget v4, v4, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    iget v5, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->expectedModCount:I

    if-eq v4, v5, :cond_0

    .line 1124
    new-instance v4, Ljava/util/ConcurrentModificationException;

    invoke-direct {v4}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v4

    .line 1126
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1127
    .local v3, "newCurrent":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    if-nez v3, :cond_1

    .line 1128
    new-instance v4, Ljava/util/NoSuchElementException;

    const-string/jumbo v5, "No next() entry in the iteration"

    invoke-direct {v4, v5}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 1130
    :cond_1
    iget-object v4, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    iget-object v0, v4, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->data:[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1131
    .local v0, "data":[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "[Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->hashIndex:I

    .line 1132
    .local v1, "i":I
    iget-object v2, v3, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1133
    .local v2, "n":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry<TK;TV;>;"
    :goto_0
    if-nez v2, :cond_2

    if-lez v1, :cond_2

    .line 1134
    add-int/lit8 v1, v1, -0x1

    aget-object v2, v0, v1

    goto :goto_0

    .line 1136
    :cond_2
    iput-object v2, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->next:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1137
    iput v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->hashIndex:I

    .line 1138
    iput-object v3, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1139
    return-object v3
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 1147
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    if-nez v0, :cond_0

    .line 1148
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "remove() can only be called once after next()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1150
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    iget v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    iget v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->expectedModCount:I

    if-eq v0, v1, :cond_1

    .line 1151
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0

    .line 1153
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1154
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    .line 1155
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->parent:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;

    iget v0, v0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap;->modCount:I

    iput v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->expectedModCount:I

    .line 1156
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1159
    .local p0, "this":Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;, "Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator<TK;TV;>;"
    iget-object v0, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    if-eqz v0, :cond_0

    .line 1160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Iterator["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashIterator;->last:Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;

    invoke-virtual {v1}, Lorg/jivesoftware/smack/util/collections/AbstractHashedMap$HashEntry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1162
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "Iterator[]"

    goto :goto_0
.end method
