.class public Lcom/mongodb/LazyWriteableDBObject;
.super Lcom/mongodb/LazyDBObject;
.source "LazyWriteableDBObject.java"


# instance fields
.field private final writeable:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buff"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/LazyDBObject;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buff"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/mongodb/LazyDBObject;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    .line 32
    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/LazyDBObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    .line 45
    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "cbk"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mongodb/LazyWriteableDBObject;-><init>([BILorg/bson/LazyBSONCallback;)V

    .line 41
    return-void
.end method


# virtual methods
.method public containsField(Ljava/lang/String;)Z
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 97
    iget-object v1, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    .line 98
    .local v0, "has":Z
    if-eqz v0, :cond_0

    .end local v0    # "has":Z
    :goto_0
    return v0

    .restart local v0    # "has":Z
    :cond_0
    invoke-super {p0, p1}, Lcom/mongodb/LazyDBObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 79
    iget-object v1, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    invoke-super {p0, p1}, Lcom/mongodb/LazyDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/mongodb/LazyDBObject;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 107
    .local v0, "combined":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 108
    invoke-super {p0}, Lcom/mongodb/LazyDBObject;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 109
    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 1
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 72
    return-void
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 3
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 60
    invoke-interface {p1}, Lorg/bson/BSONObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 61
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p1, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/LazyWriteableDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 63
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v1, p0, Lcom/mongodb/LazyWriteableDBObject;->writeable:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 89
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .end local v0    # "o":Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0    # "o":Ljava/lang/Object;
    :cond_0
    invoke-super {p0, p1}, Lcom/mongodb/LazyDBObject;->removeField(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method
