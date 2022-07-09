.class public Lorg/bson/BasicBSONCallback;
.super Ljava/lang/Object;
.source "BasicBSONCallback.java"

# interfaces
.implements Lorg/bson/BSONCallback;


# instance fields
.field private final _nameStack:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private _root:Ljava/lang/Object;

.field private final _stack:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lorg/bson/BSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 214
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    .line 215
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    .line 39
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->reset()V

    .line 40
    return-void
.end method


# virtual methods
.method protected _put(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;

    .prologue
    .line 184
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v0

    invoke-static {}, Lorg/bson/BSON;->hasDecodeHooks()Z

    move-result v1

    if-nez v1, :cond_0

    .end local p2    # "o":Ljava/lang/Object;
    :goto_0
    invoke-interface {v0, p1, p2}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    return-void

    .line 184
    .restart local p2    # "o":Ljava/lang/Object;
    :cond_0
    invoke-static {p2}, Lorg/bson/BSON;->applyDecodingHooks(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    goto :goto_0
.end method

.method public arrayDone()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->objectDone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public arrayStart()V
    .locals 1

    .prologue
    .line 94
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/bson/BasicBSONCallback;->objectStart(Z)V

    .line 95
    return-void
.end method

.method public arrayStart(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 98
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONCallback;->objectStart(ZLjava/lang/String;)V

    .line 99
    return-void
.end method

.method public create()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 43
    new-instance v0, Lorg/bson/BasicBSONObject;

    invoke-direct {v0}, Lorg/bson/BasicBSONObject;-><init>()V

    return-object v0
.end method

.method public create(ZLjava/util/List;)Lorg/bson/BSONObject;
    .locals 1
    .param p1, "array"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/bson/BSONObject;"
        }
    .end annotation

    .prologue
    .line 55
    .local p2, "path":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->createList()Lorg/bson/BSONObject;

    move-result-object v0

    .line 57
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->create()Lorg/bson/BSONObject;

    move-result-object v0

    goto :goto_0
.end method

.method public createBSONCallback()Lorg/bson/BSONCallback;
    .locals 1

    .prologue
    .line 51
    new-instance v0, Lorg/bson/BasicBSONCallback;

    invoke-direct {v0}, Lorg/bson/BasicBSONCallback;-><init>()V

    return-object v0
.end method

.method protected createList()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 47
    new-instance v0, Lorg/bson/types/BasicBSONList;

    invoke-direct {v0}, Lorg/bson/types/BasicBSONList;-><init>()V

    return-object v0
.end method

.method protected cur()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/BSONObject;

    return-object v0
.end method

.method protected curName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_root:Ljava/lang/Object;

    return-object v0
.end method

.method public gotBinary(Ljava/lang/String;B[B)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "type"    # B
    .param p3, "data"    # [B

    .prologue
    .line 165
    if-eqz p2, :cond_0

    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 166
    :cond_0
    invoke-virtual {p0, p1, p3}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    :goto_0
    return-void

    .line 168
    :cond_1
    new-instance v0, Lorg/bson/types/Binary;

    invoke-direct {v0, p2, p3}, Lorg/bson/types/Binary;-><init>(B[B)V

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public gotBinaryArray(Ljava/lang/String;[B)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 161
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/bson/BasicBSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    .line 162
    return-void
.end method

.method public gotBoolean(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "v"    # Z

    .prologue
    .line 120
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    return-void
.end method

.method public gotCode(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;

    .prologue
    .line 176
    new-instance v0, Lorg/bson/types/Code;

    invoke-direct {v0, p2}, Lorg/bson/types/Code;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 177
    return-void
.end method

.method public gotCodeWScope(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/String;
    .param p3, "scope"    # Ljava/lang/Object;

    .prologue
    .line 180
    new-instance v0, Lorg/bson/types/CodeWScope;

    check-cast p3, Lorg/bson/BSONObject;

    .end local p3    # "scope":Ljava/lang/Object;
    invoke-direct {v0, p2, p3}, Lorg/bson/types/CodeWScope;-><init>(Ljava/lang/String;Lorg/bson/BSONObject;)V

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 181
    return-void
.end method

.method public gotDBRef(Ljava/lang/String;Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 156
    new-instance v0, Lorg/bson/BasicBSONObject;

    const-string/jumbo v1, "$ns"

    invoke-direct {v0, v1, p2}, Lorg/bson/BasicBSONObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    const-string/jumbo v1, "$id"

    invoke-virtual {v0, v1, p3}, Lorg/bson/BasicBSONObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lorg/bson/BasicBSONObject;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    return-void
.end method

.method public gotDate(Ljava/lang/String;J)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "millis"    # J

    .prologue
    .line 136
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p2, p3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 137
    return-void
.end method

.method public gotDouble(Ljava/lang/String;D)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "v"    # D

    .prologue
    .line 124
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    return-void
.end method

.method public gotInt(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "v"    # I

    .prologue
    .line 128
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    return-void
.end method

.method public gotLong(Ljava/lang/String;J)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "v"    # J

    .prologue
    .line 132
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    return-void
.end method

.method public gotMaxKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v0

    new-instance v1, Lorg/bson/types/MaxKey;

    invoke-direct {v1}, Lorg/bson/types/MaxKey;-><init>()V

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    return-void
.end method

.method public gotMinKey(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v0

    new-instance v1, Lorg/bson/types/MinKey;

    invoke-direct {v1}, Lorg/bson/types/MinKey;-><init>()V

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    return-void
.end method

.method public gotNull(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-virtual {p0}, Lorg/bson/BasicBSONCallback;->cur()Lorg/bson/BSONObject;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    return-void
.end method

.method public gotObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 153
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 154
    return-void
.end method

.method public gotRegex(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "flags"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-static {p3}, Lorg/bson/BSON;->regexFlags(Ljava/lang/String;)I

    move-result v0

    invoke-static {p2, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 140
    return-void
.end method

.method public gotString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/String;

    .prologue
    .line 143
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    return-void
.end method

.method public gotSymbol(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/String;

    .prologue
    .line 146
    invoke-virtual {p0, p1, p2}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 147
    return-void
.end method

.method public gotTimestamp(Ljava/lang/String;II)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "time"    # I
    .param p3, "inc"    # I

    .prologue
    .line 150
    new-instance v0, Lorg/bson/types/BSONTimestamp;

    invoke-direct {v0, p2, p3}, Lorg/bson/types/BSONTimestamp;-><init>(II)V

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 151
    return-void
.end method

.method public gotUUID(Ljava/lang/String;JJ)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "part1"    # J
    .param p4, "part2"    # J

    .prologue
    .line 172
    new-instance v0, Ljava/util/UUID;

    invoke-direct {v0, p2, p3, p4, p5}, Ljava/util/UUID;-><init>(JJ)V

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 173
    return-void
.end method

.method public gotUndefined(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 109
    return-void
.end method

.method protected isStackEmpty()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 204
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-ge v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public objectDone()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 84
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/BSONObject;

    .line 85
    .local v0, "o":Lorg/bson/BSONObject;
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 86
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    .line 90
    :cond_0
    invoke-static {}, Lorg/bson/BSON;->hasDecodeHooks()Z

    move-result v1

    if-nez v1, :cond_2

    .end local v0    # "o":Lorg/bson/BSONObject;
    :goto_0
    return-object v0

    .line 87
    .restart local v0    # "o":Lorg/bson/BSONObject;
    :cond_1
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 88
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "something is wrong"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 90
    :cond_2
    invoke-static {v0}, Lorg/bson/BSON;->applyDecodingHooks(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/BSONObject;

    move-object v0, v1

    goto :goto_0
.end method

.method public objectStart()V
    .locals 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 62
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "something is wrong"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/bson/BasicBSONCallback;->objectStart(Z)V

    .line 65
    return-void
.end method

.method public objectStart(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/bson/BasicBSONCallback;->objectStart(ZLjava/lang/String;)V

    .line 74
    return-void
.end method

.method public objectStart(Z)V
    .locals 2
    .param p1, "array"    # Z

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONCallback;->create(ZLjava/util/List;)Lorg/bson/BSONObject;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/BasicBSONCallback;->_root:Ljava/lang/Object;

    .line 69
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_root:Ljava/lang/Object;

    check-cast v0, Lorg/bson/BSONObject;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 70
    return-void
.end method

.method public objectStart(ZLjava/lang/String;)V
    .locals 2
    .param p1, "array"    # Z
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v1, p2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 78
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {p0, p1, v1}, Lorg/bson/BasicBSONCallback;->create(ZLjava/util/List;)Lorg/bson/BSONObject;

    move-result-object v0

    .line 79
    .local v0, "o":Lorg/bson/BSONObject;
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/BSONObject;

    invoke-interface {v1, p2, v0}, Lorg/bson/BSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    iget-object v1, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 81
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 208
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/BasicBSONCallback;->_root:Ljava/lang/Object;

    .line 209
    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_stack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 210
    iget-object v0, p0, Lorg/bson/BasicBSONCallback;->_nameStack:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 211
    return-void
.end method

.method protected setRoot(Ljava/lang/Object;)V
    .locals 0
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 200
    iput-object p1, p0, Lorg/bson/BasicBSONCallback;->_root:Ljava/lang/Object;

    .line 201
    return-void
.end method
