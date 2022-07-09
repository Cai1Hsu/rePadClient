.class public Lcom/mongodb/BasicDBObjectBuilder;
.super Ljava/lang/Object;
.source "BasicDBObjectBuilder.java"


# instance fields
.field private final _stack:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    .line 37
    iget-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 38
    return-void
.end method

.method private _cur()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public static start()Lcom/mongodb/BasicDBObjectBuilder;
    .locals 1

    .prologue
    .line 45
    new-instance v0, Lcom/mongodb/BasicDBObjectBuilder;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObjectBuilder;-><init>()V

    return-object v0
.end method

.method public static start(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;
    .locals 1
    .param p0, "k"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/Object;

    .prologue
    .line 54
    new-instance v0, Lcom/mongodb/BasicDBObjectBuilder;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObjectBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    return-object v0
.end method

.method public static start(Ljava/util/Map;)Lcom/mongodb/BasicDBObjectBuilder;
    .locals 5
    .param p0, "m"    # Ljava/util/Map;

    .prologue
    .line 64
    new-instance v0, Lcom/mongodb/BasicDBObjectBuilder;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObjectBuilder;-><init>()V

    .line 65
    .local v0, "b":Lcom/mongodb/BasicDBObjectBuilder;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 66
    .local v2, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 67
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 68
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    goto :goto_0

    .line 70
    .end local v1    # "entry":Ljava/util/Map$Entry;
    :cond_0
    return-object v0
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 93
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/BasicDBObjectBuilder;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/Object;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/mongodb/BasicDBObjectBuilder;->_cur()Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    return-object p0
.end method

.method public get()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BasicDBObject;

    invoke-virtual {v0}, Lcom/mongodb/BasicDBObject;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public pop()Lcom/mongodb/BasicDBObjectBuilder;
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    .line 115
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "can\'t pop last element"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 116
    :cond_0
    iget-object v0, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 117
    return-object p0
.end method

.method public push(Ljava/lang/String;)Lcom/mongodb/BasicDBObjectBuilder;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 104
    .local v0, "o":Lcom/mongodb/BasicDBObject;
    invoke-direct {p0}, Lcom/mongodb/BasicDBObjectBuilder;->_cur()Lcom/mongodb/DBObject;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object v1, p0, Lcom/mongodb/BasicDBObjectBuilder;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 106
    return-object p0
.end method
