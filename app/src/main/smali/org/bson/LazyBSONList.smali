.class public Lorg/bson/LazyBSONList;
.super Lorg/bson/LazyBSONObject;
.source "LazyBSONList.java"

# interfaces
.implements Ljava/util/List;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/LazyBSONList$LazyBSONListIterator;
    }
.end annotation


# direct methods
.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lorg/bson/LazyBSONObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "data"    # [B
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lorg/bson/LazyBSONObject;-><init>([BLorg/bson/LazyBSONCallback;)V

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .locals 2
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 138
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public add(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 133
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addAll(ILjava/util/Collection;)Z
    .locals 2
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Ljava/util/Collection;

    .prologue
    .line 148
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 2
    .param p1, "arg0"    # Ljava/util/Collection;

    .prologue
    .line 143
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .locals 2

    .prologue
    .line 153
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 36
    invoke-virtual {p0, p1}, Lorg/bson/LazyBSONList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 3
    .param p1, "arg0"    # Ljava/util/Collection;

    .prologue
    .line 41
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 42
    .local v1, "obj":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lorg/bson/LazyBSONList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 43
    const/4 v2, 0x0

    .line 45
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .param p1, "pos"    # I

    .prologue
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONList;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .locals 4
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 60
    const/4 v2, 0x0

    .line 61
    .local v2, "pos":I
    invoke-virtual {p0}, Lorg/bson/LazyBSONList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 62
    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 63
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 64
    .local v0, "curr":Ljava/lang/Object;
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 69
    .end local v0    # "curr":Ljava/lang/Object;
    .end local v2    # "pos":I
    :goto_1
    return v2

    .line 67
    .restart local v0    # "curr":Ljava/lang/Object;
    .restart local v2    # "pos":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 68
    goto :goto_0

    .line 69
    .end local v0    # "curr":Ljava/lang/Object;
    :cond_1
    const/4 v2, -0x1

    goto :goto_1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 55
    new-instance v0, Lorg/bson/LazyBSONList$LazyBSONListIterator;

    invoke-direct {v0, p0}, Lorg/bson/LazyBSONList$LazyBSONListIterator;-><init>(Lorg/bson/LazyBSONList;)V

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .locals 5
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 74
    const/4 v3, 0x0

    .line 75
    .local v3, "pos":I
    const/4 v2, -0x1

    .line 77
    .local v2, "lastFound":I
    invoke-virtual {p0}, Lorg/bson/LazyBSONList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 78
    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 79
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "curr":Ljava/lang/Object;
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 81
    move v2, v3

    .line 83
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 84
    goto :goto_0

    .line 86
    .end local v0    # "curr":Ljava/lang/Object;
    :cond_1
    return v2
.end method

.method public listIterator()Ljava/util/ListIterator;
    .locals 2

    .prologue
    .line 127
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not Supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 122
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not Supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 2
    .param p1, "arg0"    # I

    .prologue
    .line 163
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 158
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 2
    .param p1, "arg0"    # Ljava/util/Collection;

    .prologue
    .line 168
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 2
    .param p1, "arg0"    # Ljava/util/Collection;

    .prologue
    .line 173
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "arg0"    # I
    .param p2, "arg1"    # Ljava/lang/Object;

    .prologue
    .line 178
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Read Only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 92
    invoke-virtual {p0}, Lorg/bson/LazyBSONList;->getElements()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public subList(II)Ljava/util/List;
    .locals 2
    .param p1, "arg0"    # I
    .param p2, "arg1"    # I

    .prologue
    .line 183
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not Supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 2

    .prologue
    .line 188
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not Supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .param p1, "arg0"    # [Ljava/lang/Object;

    .prologue
    .line 193
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not Supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
