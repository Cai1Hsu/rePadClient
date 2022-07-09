.class public Lorg/bson/BasicBSONDecoder$BSONInput;
.super Ljava/lang/Object;
.source "BasicBSONDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/BasicBSONDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "BSONInput"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field _max:I

.field final _raw:Ljava/io/InputStream;

.field _read:I

.field final synthetic this$0:Lorg/bson/BasicBSONDecoder;


# direct methods
.method public constructor <init>(Lorg/bson/BasicBSONDecoder;Ljava/io/InputStream;)V
    .locals 2
    .param p2, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x0

    .line 375
    iput-object p1, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 578
    const/4 v0, 0x4

    iput v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_max:I

    .line 376
    iput-object p2, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_raw:Ljava/io/InputStream;

    .line 377
    iput v1, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    .line 379
    iput v1, p1, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 380
    iput v1, p1, Lorg/bson/BasicBSONDecoder;->_len:I

    .line 381
    return-void
.end method


# virtual methods
.method protected _isAscii(B)Z
    .locals 1
    .param p1, "b"    # B

    .prologue
    .line 485
    if-ltz p1, :cond_0

    const/16 v0, 0x7f

    if-gt p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected _need(I)I
    .locals 8
    .param p1, "num"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 393
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v4, v4, Lorg/bson/BasicBSONDecoder;->_len:I

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v5, Lorg/bson/BasicBSONDecoder;->_pos:I

    sub-int/2addr v4, v5

    if-lt v4, p1, :cond_0

    .line 394
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v2, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 395
    .local v2, "ret":I
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    add-int/2addr v5, p1

    iput v5, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 396
    iget v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    add-int/2addr v4, p1

    iput v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    .line 424
    :goto_0
    return v2

    .line 400
    .end local v2    # "ret":I
    :cond_0
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v4

    array-length v4, v4

    if-lt p1, v4, :cond_1

    .line 401
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v5, "you can\'t need that much"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 403
    :cond_1
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v4, v4, Lorg/bson/BasicBSONDecoder;->_len:I

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v5, Lorg/bson/BasicBSONDecoder;->_pos:I

    sub-int v1, v4, v5

    .line 404
    .local v1, "remaining":I
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v4, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    if-lez v4, :cond_2

    .line 405
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v4

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v5, Lorg/bson/BasicBSONDecoder;->_pos:I

    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    invoke-static {v4, v5, v6, v7, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 407
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iput v7, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 408
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iput v1, v4, Lorg/bson/BasicBSONDecoder;->_len:I

    .line 412
    :cond_2
    iget v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_max:I

    iget v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    sub-int/2addr v4, v5

    sub-int/2addr v4, v1

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v5}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v5

    array-length v5, v5

    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v6, v6, Lorg/bson/BasicBSONDecoder;->_len:I

    sub-int/2addr v5, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 413
    .local v0, "maxToRead":I
    :goto_1
    if-lez v0, :cond_4

    .line 414
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_raw:Ljava/io/InputStream;

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v5}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v5

    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v6, v6, Lorg/bson/BasicBSONDecoder;->_len:I

    invoke-virtual {v4, v5, v6, v0}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 415
    .local v3, "x":I
    if-gtz v3, :cond_3

    .line 416
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "unexpected EOF"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 417
    :cond_3
    sub-int/2addr v0, v3

    .line 418
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v4, Lorg/bson/BasicBSONDecoder;->_len:I

    add-int/2addr v5, v3

    iput v5, v4, Lorg/bson/BasicBSONDecoder;->_len:I

    goto :goto_1

    .line 421
    .end local v3    # "x":I
    :cond_4
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v2, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 422
    .restart local v2    # "ret":I
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    add-int/2addr v5, p1

    iput v5, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 423
    iget v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    add-int/2addr v4, p1

    iput v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    goto/16 :goto_0
.end method

.method public fill([B)V
    .locals 1
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 458
    array-length v0, p1

    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->fill([BI)V

    .line 459
    return-void
.end method

.method public fill([BI)V
    .locals 7
    .param p1, "b"    # [B
    .param p2, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 464
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v4, v4, Lorg/bson/BasicBSONDecoder;->_len:I

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v5, Lorg/bson/BasicBSONDecoder;->_pos:I

    sub-int v0, v4, v5

    .line 465
    .local v0, "have":I
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 466
    .local v2, "tocopy":I
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v4

    iget-object v5, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v5, Lorg/bson/BasicBSONDecoder;->_pos:I

    const/4 v6, 0x0

    invoke-static {v4, v5, p1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 468
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v5, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    add-int/2addr v5, v2

    iput v5, v4, Lorg/bson/BasicBSONDecoder;->_pos:I

    .line 469
    iget v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    add-int/2addr v4, v2

    iput v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    .line 471
    sub-int/2addr p2, v2

    .line 473
    move v1, v2

    .line 474
    .local v1, "off":I
    :goto_0
    if-lez p2, :cond_1

    .line 475
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_raw:Ljava/io/InputStream;

    invoke-virtual {v4, p1, v1, p2}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 476
    .local v3, "x":I
    if-gtz v3, :cond_0

    .line 477
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v5, "unexpected EOF"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 478
    :cond_0
    iget v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    add-int/2addr v4, v3

    iput v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    .line 479
    add-int/2addr v1, v3

    .line 480
    sub-int/2addr p2, v3

    .line 481
    goto :goto_0

    .line 482
    .end local v3    # "x":I
    :cond_1
    return-void
.end method

.method public getMax()I
    .locals 1

    .prologue
    .line 568
    iget v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_max:I

    return v0
.end method

.method public getPos()I
    .locals 1

    .prologue
    .line 564
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v0, v0, Lorg/bson/BasicBSONDecoder;->_pos:I

    return v0
.end method

.method public numRead()I
    .locals 1

    .prologue
    .line 560
    iget v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    return v0
.end method

.method public read()B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 449
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v0, v0, Lorg/bson/BasicBSONDecoder;->_pos:I

    iget-object v1, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v1, v1, Lorg/bson/BasicBSONDecoder;->_len:I

    if-ge v0, v1, :cond_0

    .line 450
    iget v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_read:I

    .line 451
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v0}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v0

    iget-object v1, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    iget v2, v1, Lorg/bson/BasicBSONDecoder;->_pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, v1, Lorg/bson/BasicBSONDecoder;->_pos:I

    aget-byte v0, v0, v2

    .line 453
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v0}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->_need(I)I

    move-result v1

    aget-byte v0, v0, v1

    goto :goto_0
.end method

.method public readCStr()Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 490
    const/4 v2, 0x1

    .line 493
    .local v2, "isAscii":Z
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    move-result v7

    aput-byte v7, v6, v5

    .line 494
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    aget-byte v6, v6, v5

    if-nez v6, :cond_1

    .line 495
    const-string/jumbo v3, ""

    .line 528
    :cond_0
    :goto_0
    return-object v3

    .line 498
    :cond_1
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    move-result v7

    aput-byte v7, v6, v4

    .line 499
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    aget-byte v6, v6, v4

    if-nez v6, :cond_2

    .line 500
    sget-object v6, Lorg/bson/BasicBSONDecoder;->ONE_BYTE_STRINGS:[Ljava/lang/String;

    iget-object v7, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v7}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v7

    aget-byte v7, v7, v5

    aget-object v3, v6, v7

    .line 501
    .local v3, "out":Ljava/lang/String;
    if-nez v3, :cond_0

    new-instance v3, Ljava/lang/String;

    .end local v3    # "out":Ljava/lang/String;
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v3, v6, v5, v4, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    goto :goto_0

    .line 504
    :cond_2
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;

    move-result-object v6

    invoke-virtual {v6}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    .line 505
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v7}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v7

    const/4 v8, 0x2

    invoke-virtual {v6, v7, v5, v8}, Lorg/bson/io/PoolOutputBuffer;->write([BII)V

    .line 507
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    aget-byte v6, v6, v5

    invoke-virtual {p0, v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->_isAscii(B)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v6

    aget-byte v6, v6, v4

    invoke-virtual {p0, v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->_isAscii(B)Z

    move-result v6

    if-eqz v6, :cond_3

    move v2, v4

    .line 510
    :goto_1
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    move-result v0

    .local v0, "b":B
    if-eqz v0, :cond_5

    .line 511
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v6}, Lorg/bson/BasicBSONDecoder;->access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/bson/io/PoolOutputBuffer;->write(I)V

    .line 512
    if-eqz v2, :cond_4

    invoke-virtual {p0, v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->_isAscii(B)Z

    move-result v6

    if-eqz v6, :cond_4

    move v2, v4

    :goto_2
    goto :goto_1

    .end local v0    # "b":B
    :cond_3
    move v2, v5

    .line 507
    goto :goto_1

    .restart local v0    # "b":B
    :cond_4
    move v2, v5

    .line 512
    goto :goto_2

    .line 515
    :cond_5
    const/4 v3, 0x0

    .line 516
    .restart local v3    # "out":Ljava/lang/String;
    if-eqz v2, :cond_6

    .line 517
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;

    move-result-object v4

    invoke-virtual {v4}, Lorg/bson/io/PoolOutputBuffer;->asAscii()Ljava/lang/String;

    move-result-object v3

    .line 527
    :goto_3
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;

    move-result-object v4

    invoke-virtual {v4}, Lorg/bson/io/PoolOutputBuffer;->reset()V

    goto/16 :goto_0

    .line 521
    :cond_6
    :try_start_0
    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;

    move-result-object v4

    const-string/jumbo v5, "UTF-8"

    invoke-virtual {v4, v5}, Lorg/bson/io/PoolOutputBuffer;->asString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_3

    .line 523
    :catch_0
    move-exception v1

    .line 524
    .local v1, "e":Ljava/lang/UnsupportedOperationException;
    new-instance v4, Lorg/bson/BSONException;

    const-string/jumbo v5, "impossible"

    invoke-direct {v4, v5, v1}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 444
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder$BSONInput;->readLong()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readInt()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 429
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v0}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->_need(I)I

    move-result v1

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v0

    return v0
.end method

.method public readIntBE()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 434
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v0}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->_need(I)I

    move-result v1

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readIntBE([BI)I

    move-result v0

    return v0
.end method

.method public readLong()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 439
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v0}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->_need(I)I

    move-result v1

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v0

    return-wide v0
.end method

.method public readUTF8String()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 533
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v1

    .line 535
    .local v1, "size":I
    if-lez v1, :cond_0

    const/high16 v3, 0x2000000

    if-le v1, v3, :cond_1

    .line 536
    :cond_0
    new-instance v3, Lorg/bson/BSONException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "bad string size: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 538
    :cond_1
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v3}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v3

    array-length v3, v3

    div-int/lit8 v3, v3, 0x2

    if-ge v1, v3, :cond_3

    .line 539
    const/4 v3, 0x1

    if-ne v1, v3, :cond_2

    .line 540
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    .line 541
    const-string/jumbo v3, ""

    .line 552
    :goto_0
    return-object v3

    .line 544
    :cond_2
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v4}, Lorg/bson/BasicBSONDecoder;->access$000(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v4

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->_need(I)I

    move-result v5

    add-int/lit8 v6, v1, -0x1

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v3, v4, v5, v6, v7}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    goto :goto_0

    .line 547
    :cond_3
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v3}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v3

    array-length v3, v3

    if-ge v1, v3, :cond_4

    iget-object v3, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->this$0:Lorg/bson/BasicBSONDecoder;

    invoke-static {v3}, Lorg/bson/BasicBSONDecoder;->access$100(Lorg/bson/BasicBSONDecoder;)[B

    move-result-object v0

    .line 549
    .local v0, "b":[B
    :goto_1
    invoke-virtual {p0, v0, v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->fill([BI)V

    .line 552
    :try_start_0
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    add-int/lit8 v5, v1, -0x1

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v3, v0, v4, v5, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 554
    :catch_0
    move-exception v2

    .line 555
    .local v2, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/bson/BSONException;

    const-string/jumbo v4, "impossible"

    invoke-direct {v3, v4, v2}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 547
    .end local v0    # "b":[B
    .end local v2    # "uee":Ljava/io/UnsupportedEncodingException;
    :cond_4
    new-array v0, v1, [B

    goto :goto_1
.end method

.method public setMax(I)V
    .locals 0
    .param p1, "_max"    # I

    .prologue
    .line 572
    iput p1, p0, Lorg/bson/BasicBSONDecoder$BSONInput;->_max:I

    .line 573
    return-void
.end method
