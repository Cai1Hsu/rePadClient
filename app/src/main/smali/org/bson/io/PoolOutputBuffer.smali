.class public Lorg/bson/io/PoolOutputBuffer;
.super Lorg/bson/io/OutputBuffer;
.source "PoolOutputBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/io/PoolOutputBuffer$Position;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final BUF_SIZE:I = 0x4000

.field private static final DEFAULT_ENCODING_1:Ljava/lang/String; = "UTF-8"

.field private static final DEFAULT_ENCODING_2:Ljava/lang/String; = "UTF8"

.field private static _extra:Lorg/bson/util/SimplePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/bson/util/SimplePool",
            "<[B>;"
        }
    .end annotation
.end field


# instance fields
.field final _chars:[C

.field private final _cur:Lorg/bson/io/PoolOutputBuffer$Position;

.field final _encoding:Lorg/bson/io/UTF8Encoding;

.field private final _end:Lorg/bson/io/PoolOutputBuffer$Position;

.field final _fromPool:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<[B>;"
        }
    .end annotation
.end field

.field final _mine:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 264
    new-instance v0, Lorg/bson/io/PoolOutputBuffer$1;

    const/16 v1, 0x280

    invoke-direct {v0, v1}, Lorg/bson/io/PoolOutputBuffer$1;-><init>(I)V

    sput-object v0, Lorg/bson/io/PoolOutputBuffer;->_extra:Lorg/bson/util/SimplePool;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x4000

    .line 35
    invoke-direct {p0}, Lorg/bson/io/OutputBuffer;-><init>()V

    .line 253
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_mine:[B

    .line 254
    new-array v0, v1, [C

    iput-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_chars:[C

    .line 255
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    .line 256
    new-instance v0, Lorg/bson/io/UTF8Encoding;

    invoke-direct {v0}, Lorg/bson/io/UTF8Encoding;-><init>()V

    iput-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_encoding:Lorg/bson/io/UTF8Encoding;

    .line 261
    new-instance v0, Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-direct {v0}, Lorg/bson/io/PoolOutputBuffer$Position;-><init>()V

    iput-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    .line 262
    new-instance v0, Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-direct {v0}, Lorg/bson/io/PoolOutputBuffer$Position;-><init>()V

    iput-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    .line 36
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    .line 37
    return-void
.end method


# virtual methods
.method _afterWrite()V
    .locals 3

    .prologue
    const/16 v2, 0x4000

    .line 111
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer$Position;->pos()I

    move-result v0

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v1}, Lorg/bson/io/PoolOutputBuffer$Position;->pos()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 114
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    iget v0, v0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    if-ne v0, v2, :cond_0

    .line 115
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer$Position;->nextBuffer()V

    .line 127
    :cond_0
    :goto_0
    return-void

    .line 119
    :cond_1
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0, v1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset(Lorg/bson/io/PoolOutputBuffer$Position;)V

    .line 121
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    iget v0, v0, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    if-lt v0, v2, :cond_0

    .line 124
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    sget-object v1, Lorg/bson/io/PoolOutputBuffer;->_extra:Lorg/bson/util/SimplePool;

    invoke-virtual {v1}, Lorg/bson/util/SimplePool;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer$Position;->nextBuffer()V

    .line 126
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0, v1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset(Lorg/bson/io/PoolOutputBuffer$Position;)V

    goto :goto_0
.end method

.method _cur()[B
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    iget v0, v0, Lorg/bson/io/PoolOutputBuffer$Position;->x:I

    invoke-virtual {p0, v0}, Lorg/bson/io/PoolOutputBuffer;->_get(I)[B

    move-result-object v0

    return-object v0
.end method

.method _get(I)[B
    .locals 1
    .param p1, "z"    # I

    .prologue
    .line 134
    if-gez p1, :cond_0

    .line 135
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_mine:[B

    .line 136
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    goto :goto_0
.end method

.method public asAscii()Ljava/lang/String;
    .locals 5

    .prologue
    .line 219
    iget-object v3, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    .line 220
    invoke-super {p0}, Lorg/bson/io/OutputBuffer;->asString()Ljava/lang/String;

    move-result-object v3

    .line 228
    :goto_0
    return-object v3

    .line 222
    :cond_0
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->size()I

    move-result v2

    .line 223
    .local v2, "m":I
    iget-object v3, p0, Lorg/bson/io/PoolOutputBuffer;->_chars:[C

    array-length v3, v3

    if-ge v2, v3, :cond_1

    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_chars:[C

    .line 225
    .local v0, "c":[C
    :goto_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    if-ge v1, v2, :cond_2

    .line 226
    iget-object v3, p0, Lorg/bson/io/PoolOutputBuffer;->_mine:[B

    aget-byte v3, v3, v1

    int-to-char v3, v3

    aput-char v3, v0, v1

    .line 225
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 223
    .end local v0    # "c":[C
    .end local v1    # "i":I
    :cond_1
    new-array v0, v2, [C

    goto :goto_1

    .line 228
    .restart local v0    # "c":[C
    .restart local v1    # "i":I
    :cond_2
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public asString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 239
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 240
    invoke-super {p0, p1}, Lorg/bson/io/OutputBuffer;->asString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 250
    :goto_0
    return-object v0

    .line 242
    :cond_0
    const-string/jumbo v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "UTF8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 244
    :cond_1
    :try_start_0
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_encoding:Lorg/bson/io/UTF8Encoding;

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_mine:[B

    const/4 v2, 0x0

    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->size()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/bson/io/UTF8Encoding;->decode([BII)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    .line 246
    :catch_0
    move-exception v0

    .line 250
    :cond_2
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_mine:[B

    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->size()I

    move-result v2

    invoke-direct {v0, v1, v4, v2, p1}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    goto :goto_0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer$Position;->pos()I

    move-result v0

    return v0
.end method

.method public pipe(Ljava/io/OutputStream;)I
    .locals 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    if-nez p1, :cond_0

    .line 143
    new-instance v4, Ljava/lang/NullPointerException;

    const-string/jumbo v5, "out is null"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 145
    :cond_0
    const/4 v3, 0x0

    .line 147
    .local v3, "total":I
    const/4 v2, -0x1

    .local v2, "i":I
    :goto_0
    iget-object v4, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_1

    .line 148
    invoke-virtual {p0, v2}, Lorg/bson/io/PoolOutputBuffer;->_get(I)[B

    move-result-object v1

    .line 149
    .local v1, "b":[B
    iget-object v4, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v4, v2}, Lorg/bson/io/PoolOutputBuffer$Position;->len(I)I

    move-result v0

    .line 150
    .local v0, "amt":I
    if-nez v0, :cond_2

    .line 157
    .end local v0    # "amt":I
    .end local v1    # "b":[B
    :cond_1
    return v3

    .line 153
    .restart local v0    # "amt":I
    .restart local v1    # "b":[B
    :cond_2
    const/4 v4, 0x0

    invoke-virtual {p1, v1, v4, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 154
    add-int/2addr v3, v0

    .line 147
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public reset()V
    .locals 3

    .prologue
    .line 40
    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset()V

    .line 41
    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset()V

    .line 43
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 44
    sget-object v1, Lorg/bson/io/PoolOutputBuffer;->_extra:Lorg/bson/util/SimplePool;

    iget-object v2, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/bson/util/SimplePool;->done(Ljava/lang/Object;)V

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 45
    :cond_0
    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_fromPool:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 46
    return-void
.end method

.method public seekEnd()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0, v1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset(Lorg/bson/io/PoolOutputBuffer$Position;)V

    .line 66
    return-void
.end method

.method public seekStart()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer$Position;->reset()V

    .line 74
    return-void
.end method

.method public setPosition(I)V
    .locals 1
    .param p1, "position"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0, p1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset(I)V

    .line 58
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0}, Lorg/bson/io/PoolOutputBuffer$Position;->pos()I

    move-result v0

    return v0
.end method

.method public truncateToPosition(I)V
    .locals 2
    .param p1, "newPosition"    # I

    .prologue
    .line 105
    invoke-virtual {p0, p1}, Lorg/bson/io/PoolOutputBuffer;->setPosition(I)V

    .line 106
    iget-object v0, p0, Lorg/bson/io/PoolOutputBuffer;->_end:Lorg/bson/io/PoolOutputBuffer$Position;

    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v0, v1}, Lorg/bson/io/PoolOutputBuffer$Position;->reset(Lorg/bson/io/PoolOutputBuffer$Position;)V

    .line 107
    return-void
.end method

.method public write(I)V
    .locals 3
    .param p1, "b"    # I

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->_cur()[B

    move-result-object v0

    .line 99
    .local v0, "bs":[B
    iget-object v1, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v1}, Lorg/bson/io/PoolOutputBuffer$Position;->getAndInc()I

    move-result v1

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 100
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->_afterWrite()V

    .line 101
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 82
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/bson/io/PoolOutputBuffer;->write([BII)V

    .line 83
    return-void
.end method

.method public write([BII)V
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 86
    :goto_0
    if-lez p3, :cond_0

    .line 87
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->_cur()[B

    move-result-object v0

    .line 88
    .local v0, "bs":[B
    array-length v2, v0

    iget-object v3, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    iget v3, v3, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    sub-int/2addr v2, v3

    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 89
    .local v1, "space":I
    iget-object v2, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    iget v2, v2, Lorg/bson/io/PoolOutputBuffer$Position;->y:I

    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    iget-object v2, p0, Lorg/bson/io/PoolOutputBuffer;->_cur:Lorg/bson/io/PoolOutputBuffer$Position;

    invoke-virtual {v2, v1}, Lorg/bson/io/PoolOutputBuffer$Position;->inc(I)V

    .line 91
    sub-int/2addr p3, v1

    .line 92
    add-int/2addr p2, v1

    .line 93
    invoke-virtual {p0}, Lorg/bson/io/PoolOutputBuffer;->_afterWrite()V

    goto :goto_0

    .line 95
    .end local v0    # "bs":[B
    .end local v1    # "space":I
    :cond_0
    return-void
.end method
