.class public Lcom/mongodb/io/ByteBufferInputStream;
.super Ljava/io/InputStream;
.source "ByteBufferInputStream.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
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

.field private _pos:I


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 32
    .local p1, "lst":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mongodb/io/ByteBufferInputStream;-><init>(Ljava/util/List;Z)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Z)V
    .locals 3
    .param p2, "flip"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 35
    .local p1, "lst":Ljava/util/List;, "Ljava/util/List<Ljava/nio/ByteBuffer;>;"
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 123
    const/4 v2, 0x0

    iput v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    .line 36
    iput-object p1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    .line 37
    if-eqz p2, :cond_0

    .line 38
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

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

    .line 39
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    goto :goto_0

    .line 40
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method


# virtual methods
.method public available()I
    .locals 3

    .prologue
    .line 43
    const/4 v0, 0x0

    .line 44
    .local v0, "avail":I
    iget v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 45
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    add-int/2addr v0, v2

    .line 44
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    :cond_0
    return v0
.end method

.method public close()V
    .locals 0

    .prologue
    .line 49
    return-void
.end method

.method public mark(I)V
    .locals 2
    .param p1, "readlimit"    # I

    .prologue
    .line 52
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "mark not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 3

    .prologue
    .line 64
    iget v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    iget-object v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v1, v2, :cond_0

    .line 65
    const/4 v1, -0x1

    .line 72
    :goto_0
    return v1

    .line 67
    :cond_0
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    iget v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 68
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    if-lez v1, :cond_1

    .line 69
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    goto :goto_0

    .line 71
    :cond_1
    iget v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    .line 72
    invoke-virtual {p0}, Lcom/mongodb/io/ByteBufferInputStream;->read()I

    move-result v1

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 76
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/mongodb/io/ByteBufferInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 80
    iget v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    iget-object v3, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v2, v3, :cond_1

    .line 81
    const/4 v1, -0x1

    .line 97
    :cond_0
    :goto_0
    return v1

    .line 83
    :cond_1
    iget-object v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    iget v3, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 85
    .local v0, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-nez v2, :cond_2

    .line 86
    iget v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    .line 87
    invoke-virtual {p0, p1, p2, p3}, Lcom/mongodb/io/ByteBufferInputStream;->read([BII)I

    move-result v1

    goto :goto_0

    .line 90
    :cond_2
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {p3, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 91
    .local v1, "toRead":I
    invoke-virtual {v0, p1, p2, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 93
    if-eq v1, p3, :cond_0

    iget v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 96
    iget v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    .line 97
    add-int v2, p2, v1

    sub-int v3, p3, v1

    invoke-virtual {p0, p1, v2, v3}, Lcom/mongodb/io/ByteBufferInputStream;->read([BII)I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 56
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "mark not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public skip(J)J
    .locals 9
    .param p1, "n"    # J

    .prologue
    .line 102
    const-wide/16 v2, 0x0

    .line 104
    .local v2, "skipped":J
    :goto_0
    const-wide/16 v6, 0x0

    cmp-long v1, p1, v6

    if-ltz v1, :cond_1

    iget v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    iget-object v6, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_1

    .line 105
    iget-object v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_lst:Ljava/util/List;

    iget v6, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 106
    .local v0, "b":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    int-to-long v6, v1

    cmp-long v1, v6, p1

    if-gez v1, :cond_0

    .line 107
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    int-to-long v6, v1

    add-long/2addr v2, v6

    .line 108
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    int-to-long v6, v1

    sub-long/2addr p1, v6

    .line 109
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 110
    iget v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/mongodb/io/ByteBufferInputStream;->_pos:I

    goto :goto_0

    .line 114
    :cond_0
    add-long/2addr v2, p1

    .line 115
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    int-to-long v6, v1

    add-long/2addr v6, p1

    long-to-int v1, v6

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-wide v4, v2

    .line 119
    .end local v0    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "skipped":J
    .local v4, "skipped":J
    :goto_1
    return-wide v4

    .end local v4    # "skipped":J
    .restart local v2    # "skipped":J
    :cond_1
    move-wide v4, v2

    .end local v2    # "skipped":J
    .restart local v4    # "skipped":J
    goto :goto_1
.end method
