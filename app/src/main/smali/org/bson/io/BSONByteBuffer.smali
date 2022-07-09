.class public Lorg/bson/io/BSONByteBuffer;
.super Ljava/lang/Object;
.source "BSONByteBuffer.java"


# instance fields
.field protected buf:Ljava/nio/ByteBuffer;


# direct methods
.method private constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    .line 35
    sget-object v0, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 36
    return-void
.end method

.method public static wrap([B)Lorg/bson/io/BSONByteBuffer;
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 43
    new-instance v0, Lorg/bson/io/BSONByteBuffer;

    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bson/io/BSONByteBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    return-object v0
.end method

.method public static wrap([BII)Lorg/bson/io/BSONByteBuffer;
    .locals 2
    .param p0, "bytes"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 39
    new-instance v0, Lorg/bson/io/BSONByteBuffer;

    invoke-static {p0, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/bson/io/BSONByteBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    return-object v0
.end method


# virtual methods
.method public array()[B
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 72
    if-ne p0, p1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return v1

    .line 73
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 75
    check-cast v0, Lorg/bson/io/BSONByteBuffer;

    .line 77
    .local v0, "that":Lorg/bson/io/BSONByteBuffer;
    iget-object v3, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    iget-object v4, v0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_4
    iget-object v3, v0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public get(I)B
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 47
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    return v0
.end method

.method public get([B)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "bytes"    # [B

    .prologue
    .line 55
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public get([BII)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 51
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getCString(I)Ljava/lang/String;
    .locals 4
    .param p1, "offset"    # I

    .prologue
    .line 116
    move v0, p1

    .line 117
    .local v0, "end":I
    :goto_0
    invoke-virtual {p0, v0}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v2

    if-eqz v2, :cond_0

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 120
    :cond_0
    sub-int v1, v0, p1

    .line 121
    .local v1, "len":I
    new-instance v2, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v3

    invoke-direct {v2, v3, p1, v1}, Ljava/lang/String;-><init>([BII)V

    return-object v2
.end method

.method public getInt(I)I
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 90
    invoke-virtual {p0, p1}, Lorg/bson/io/BSONByteBuffer;->getIntLE(I)I

    move-result v0

    return v0
.end method

.method public getIntBE(I)I
    .locals 3
    .param p1, "i"    # I

    .prologue
    .line 103
    const/4 v0, 0x0

    .line 104
    .local v0, "x":I
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 105
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 106
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 107
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x3

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x0

    or-int/2addr v0, v1

    .line 108
    return v0
.end method

.method public getIntLE(I)I
    .locals 3
    .param p1, "i"    # I

    .prologue
    .line 94
    const/4 v0, 0x0

    .line 95
    .local v0, "x":I
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x0

    or-int/2addr v0, v1

    .line 96
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    .line 97
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x2

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    .line 98
    iget-object v1, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    add-int/lit8 v2, p1, 0x3

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    .line 99
    return v0
.end method

.method public getLong(I)J
    .locals 2
    .param p1, "i"    # I

    .prologue
    .line 112
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getUTF8String(I)Ljava/lang/String;
    .locals 6
    .param p1, "valueOffset"    # I

    .prologue
    .line 125
    invoke-virtual {p0, p1}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .line 127
    .local v1, "size":I
    :try_start_0
    new-instance v2, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v3

    add-int/lit8 v4, p1, 0x4

    const-string/jumbo v5, "UTF-8"

    invoke-direct {v2, v3, v4, v1, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 128
    :catch_0
    move-exception v0

    .line 129
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lorg/bson/BSONException;

    const-string/jumbo v3, "Cannot decode string as UTF-8."

    invoke-direct {v2, v3}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hashCode()I

    move-result v0

    return v0
.end method

.method public position(I)Ljava/nio/Buffer;
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 134
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public reset()Ljava/nio/Buffer;
    .locals 1

    .prologue
    .line 138
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/bson/io/BSONByteBuffer;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
