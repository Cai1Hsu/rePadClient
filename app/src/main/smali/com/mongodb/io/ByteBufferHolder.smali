.class public Lcom/mongodb/io/ByteBufferHolder;
.super Ljava/lang/Object;
.source "ByteBufferHolder.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final _bufSize:I = 0x1000


# instance fields
.field _buffers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field final _max:I

.field _pos:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const/high16 v0, 0x40000000    # 2.0f

    invoke-direct {p0, v0}, Lcom/mongodb/io/ByteBufferHolder;-><init>(I)V

    .line 33
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "max"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    .line 127
    const/4 v0, 0x0

    iput v0, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    .line 36
    iput p1, p0, Lcom/mongodb/io/ByteBufferHolder;->_max:I

    .line 37
    return-void
.end method

.method private _addBucket()V
    .locals 3

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/mongodb/io/ByteBufferHolder;->capacity()I

    move-result v0

    add-int/lit16 v0, v0, 0x1000

    iget v1, p0, Lcom/mongodb/io/ByteBufferHolder;->_max:I

    if-le v0, v1, :cond_0

    .line 110
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "too big current:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mongodb/io/ByteBufferHolder;->capacity()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    const/16 v1, 0x1000

    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    return-void
.end method


# virtual methods
.method public capacity()I
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit16 v0, v0, 0x1000

    return v0
.end method

.method public get(I)B
    .locals 4
    .param p1, "i"    # I

    .prologue
    .line 40
    iget v2, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    if-lt p1, v2, :cond_0

    .line 41
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "out of bounds"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 43
    :cond_0
    div-int/lit16 v0, p1, 0x1000

    .line 44
    .local v0, "num":I
    rem-int/lit16 v1, p1, 0x1000

    .line 46
    .local v1, "pos":I
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v2

    return v2
.end method

.method public get(I[B)V
    .locals 2
    .param p1, "pos"    # I
    .param p2, "b"    # [B

    .prologue
    .line 50
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 51
    add-int v1, v0, p1

    invoke-virtual {p0, v1}, Lcom/mongodb/io/ByteBufferHolder;->get(I)B

    move-result v1

    aput-byte v1, p2, v0

    .line 50
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 52
    :cond_0
    return-void
.end method

.method public position()I
    .locals 1

    .prologue
    .line 65
    iget v0, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    return v0
.end method

.method public position(I)V
    .locals 6
    .param p1, "p"    # I

    .prologue
    .line 69
    iput p1, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    .line 70
    iget v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    div-int/lit16 v2, v4, 0x1000

    .line 71
    .local v2, "num":I
    iget v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    rem-int/lit16 v3, v4, 0x1000

    .line 73
    .local v3, "pos":I
    :goto_0
    iget-object v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-gt v4, v2, :cond_0

    .line 74
    invoke-direct {p0}, Lcom/mongodb/io/ByteBufferHolder;->_addBucket()V

    goto :goto_0

    .line 76
    :cond_0
    iget-object v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 77
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 78
    add-int/lit8 v1, v2, 0x1

    .local v1, "i":I
    :goto_1
    iget-object v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 79
    iget-object v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 78
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 80
    :cond_1
    return-void
.end method

.method public put(IB)V
    .locals 4
    .param p1, "i"    # I
    .param p2, "val"    # B

    .prologue
    .line 55
    iget v2, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    if-lt p1, v2, :cond_0

    .line 56
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "out of bounds"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 58
    :cond_0
    div-int/lit16 v0, p1, 0x1000

    .line 59
    .local v0, "num":I
    rem-int/lit16 v1, p1, 0x1000

    .line 61
    .local v1, "pos":I
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v1, p2}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    .line 62
    return-void
.end method

.method public put(Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "in"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 87
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 88
    iget v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    div-int/lit16 v2, v4, 0x1000

    .line 89
    .local v2, "num":I
    iget-object v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lt v2, v4, :cond_0

    .line 90
    invoke-direct {p0}, Lcom/mongodb/io/ByteBufferHolder;->_addBucket()V

    .line 92
    :cond_0
    iget-object v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 94
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 96
    .local v1, "canRead":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    .line 97
    .local v3, "oldLimit":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    add-int/2addr v4, v1

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 99
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 101
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 103
    iget v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    goto :goto_0

    .line 106
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    .end local v1    # "canRead":I
    .end local v2    # "num":I
    .end local v3    # "oldLimit":I
    :cond_1
    return-void
.end method

.method public remaining()I
    .locals 1

    .prologue
    .line 83
    const v0, 0x7fffffff

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .prologue
    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .local v1, "buf":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "{ ByteBufferHolder pos:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mongodb/io/ByteBufferHolder;->_pos:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    iget-object v3, p0, Lcom/mongodb/io/ByteBufferHolder;->_buffers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 122
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 123
    .end local v0    # "bb":Ljava/nio/ByteBuffer;
    :cond_0
    const-string/jumbo v3, "}"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
