.class public Lcom/mongodb/io/ByteBufferOutputStream;
.super Ljava/io/OutputStream;
.source "ByteBufferOutputStream.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field static final _defaultFactory:Lcom/mongodb/io/ByteBufferFactory;


# instance fields
.field final _factory:Lcom/mongodb/io/ByteBufferFactory;

.field final _lst:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 98
    new-instance v0, Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;-><init>(I)V

    sput-object v0, Lcom/mongodb/io/ByteBufferOutputStream;->_defaultFactory:Lcom/mongodb/io/ByteBufferFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/mongodb/io/ByteBufferOutputStream;->_defaultFactory:Lcom/mongodb/io/ByteBufferFactory;

    invoke-direct {p0, v0}, Lcom/mongodb/io/ByteBufferOutputStream;-><init>(Lcom/mongodb/io/ByteBufferFactory;)V

    .line 34
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 37
    new-instance v0, Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;

    invoke-direct {v0, p1}, Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/mongodb/io/ByteBufferOutputStream;-><init>(Lcom/mongodb/io/ByteBufferFactory;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/io/ByteBufferFactory;)V
    .locals 1
    .param p1, "factory"    # Lcom/mongodb/io/ByteBufferFactory;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    .line 41
    iput-object p1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_factory:Lcom/mongodb/io/ByteBufferFactory;

    .line 42
    return-void
.end method

.method private _need(I)Ljava/nio/ByteBuffer;
    .locals 3
    .param p1, "space"    # I

    .prologue
    .line 82
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 83
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    iget-object v2, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_factory:Lcom/mongodb/io/ByteBufferFactory;

    invoke-interface {v2}, Lcom/mongodb/io/ByteBufferFactory;->get()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    .line 92
    :goto_0
    return-object v1

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    iget-object v2, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 88
    .local v0, "cur":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-gt p1, v1, :cond_1

    move-object v1, v0

    .line 89
    goto :goto_0

    .line 91
    :cond_1
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    iget-object v2, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_factory:Lcom/mongodb/io/ByteBufferFactory;

    invoke-interface {v2}, Lcom/mongodb/io/ByteBufferFactory;->get()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    iget-object v2, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/nio/ByteBuffer;

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 45
    return-void
.end method

.method public flush()V
    .locals 0

    .prologue
    .line 48
    return-void
.end method

.method public getBuffers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    return-object v0
.end method

.method public getBuffers(Z)Ljava/util/List;
    .locals 3
    .param p1, "flip"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    if-eqz p1, :cond_0

    .line 76
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 77
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    goto :goto_0

    .line 78
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferOutputStream;->_lst:Ljava/util/List;

    return-object v2
.end method

.method public write(I)V
    .locals 2
    .param p1, "b"    # I

    .prologue
    .line 67
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mongodb/io/ByteBufferOutputStream;->_need(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 68
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 51
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/mongodb/io/ByteBufferOutputStream;->write([BII)V

    .line 52
    return-void
.end method

.method public write([BII)V
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 55
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/mongodb/io/ByteBufferOutputStream;->_need(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 57
    .local v0, "cur":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 58
    .local v1, "toWrite":I
    invoke-virtual {v0, p1, p2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 60
    if-ne v1, p3, :cond_0

    .line 64
    :goto_0
    return-void

    .line 63
    :cond_0
    add-int v2, p2, v1

    sub-int v3, p3, v1

    invoke-virtual {p0, p1, v2, v3}, Lcom/mongodb/io/ByteBufferOutputStream;->write([BII)V

    goto :goto_0
.end method
