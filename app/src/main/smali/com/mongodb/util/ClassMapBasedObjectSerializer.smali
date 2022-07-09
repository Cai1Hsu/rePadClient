.class Lcom/mongodb/util/ClassMapBasedObjectSerializer;
.super Lcom/mongodb/util/AbstractObjectSerializer;
.source "ClassMapBasedObjectSerializer.java"


# instance fields
.field private _serializers:Lorg/bson/util/ClassMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/ClassMap",
            "<",
            "Lcom/mongodb/util/ObjectSerializer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/mongodb/util/AbstractObjectSerializer;-><init>()V

    .line 82
    new-instance v0, Lorg/bson/util/ClassMap;

    invoke-direct {v0}, Lorg/bson/util/ClassMap;-><init>()V

    iput-object v0, p0, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->_serializers:Lorg/bson/util/ClassMap;

    return-void
.end method


# virtual methods
.method addObjectSerializer(Ljava/lang/Class;Lcom/mongodb/util/ObjectSerializer;)V
    .locals 1
    .param p1, "c"    # Ljava/lang/Class;
    .param p2, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->_serializers:Lorg/bson/util/ClassMap;

    invoke-virtual {v0, p1, p2}, Lorg/bson/util/ClassMap;->put(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 55
    invoke-static {p1}, Lcom/mongodb/Bytes;->applyEncodingHooks(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 57
    if-nez p1, :cond_0

    .line 58
    const-string/jumbo v4, " null "

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :goto_0
    return-void

    .line 62
    :cond_0
    const/4 v3, 0x0

    .line 65
    .local v3, "serializer":Lcom/mongodb/util/ObjectSerializer;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lorg/bson/util/ClassMap;->getAncestry(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    .line 67
    .local v1, "ancestors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 68
    .local v0, "ancestor":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v4, p0, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->_serializers:Lorg/bson/util/ClassMap;

    invoke-virtual {v4, v0}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "serializer":Lcom/mongodb/util/ObjectSerializer;
    check-cast v3, Lcom/mongodb/util/ObjectSerializer;

    .line 69
    .restart local v3    # "serializer":Lcom/mongodb/util/ObjectSerializer;
    if-eqz v3, :cond_1

    .line 73
    .end local v0    # "ancestor":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_2
    if-nez v3, :cond_3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 74
    iget-object v4, p0, Lcom/mongodb/util/ClassMapBasedObjectSerializer;->_serializers:Lorg/bson/util/ClassMap;

    const-class v5, [Ljava/lang/Object;

    invoke-virtual {v4, v5}, Lorg/bson/util/ClassMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "serializer":Lcom/mongodb/util/ObjectSerializer;
    check-cast v3, Lcom/mongodb/util/ObjectSerializer;

    .line 76
    .restart local v3    # "serializer":Lcom/mongodb/util/ObjectSerializer;
    :cond_3
    if-nez v3, :cond_4

    .line 77
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "json can\'t serialize type : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 79
    :cond_4
    invoke-interface {v3, p1, p2}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    goto :goto_0
.end method
