.class public Lorg/bson/io/BasicOutputBuffer;
.super Lorg/bson/io/OutputBuffer;
.source "BasicOutputBuffer.java"


# instance fields
.field private _buffer:[B

.field private _cur:I

.field private _size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/bson/io/OutputBuffer;-><init>()V

    .line 145
    const/16 v0, 0x200

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    return-void
.end method


# virtual methods
.method _ensure(I)V
    .locals 6
    .param p1, "more"    # I

    .prologue
    const/4 v5, 0x0

    .line 110
    iget v3, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    add-int v1, v3, p1

    .line 111
    .local v1, "need":I
    iget-object v3, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    array-length v3, v3

    if-ge v1, v3, :cond_0

    .line 121
    :goto_0
    return-void

    .line 114
    :cond_0
    iget-object v3, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    array-length v3, v3

    mul-int/lit8 v2, v3, 0x2

    .line 115
    .local v2, "newSize":I
    if-gt v2, v1, :cond_1

    .line 116
    add-int/lit16 v2, v1, 0x80

    .line 118
    :cond_1
    new-array v0, v2, [B

    .line 119
    .local v0, "n":[B
    iget-object v3, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    iget v4, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-static {v3, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    iput-object v0, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    goto :goto_0
.end method

.method public asString()Ljava/lang/String;
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 129
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    const/4 v2, 0x0

    iget v3, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([BII)V

    return-object v0
.end method

.method public asString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 139
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    const/4 v2, 0x0

    iget v3, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-direct {v0, v1, v2, v3, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    return v0
.end method

.method public pipe(Ljava/io/DataOutput;)I
    .locals 3
    .param p1, "out"    # Ljava/io/DataOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-interface {p1, v0, v1, v2}, Ljava/io/DataOutput;->write([BII)V

    .line 105
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    return v0
.end method

.method public pipe(Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    const/4 v1, 0x0

    iget v2, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 94
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    return v0
.end method

.method public seekEnd()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 67
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    iput v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    .line 68
    return-void
.end method

.method public seekStart()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 76
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    .line 77
    return-void
.end method

.method public setPosition(I)V
    .locals 0
    .param p1, "position"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 58
    iput p1, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    .line 59
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    return v0
.end method

.method public write(I)V
    .locals 3
    .param p1, "b"    # I

    .prologue
    .line 42
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/bson/io/BasicOutputBuffer;->_ensure(I)V

    .line 43
    iget-object v0, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    iget v1, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 44
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    iget v1, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    .line 45
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 30
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/bson/io/BasicOutputBuffer;->write([BII)V

    .line 31
    return-void
.end method

.method public write([BII)V
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 35
    invoke-virtual {p0, p3}, Lorg/bson/io/BasicOutputBuffer;->_ensure(I)V

    .line 36
    iget-object v0, p0, Lorg/bson/io/BasicOutputBuffer;->_buffer:[B

    iget v1, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    .line 38
    iget v0, p0, Lorg/bson/io/BasicOutputBuffer;->_cur:I

    iget v1, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/bson/io/BasicOutputBuffer;->_size:I

    .line 39
    return-void
.end method
