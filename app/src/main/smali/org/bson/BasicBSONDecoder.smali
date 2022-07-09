.class public Lorg/bson/BasicBSONDecoder;
.super Ljava/lang/Object;
.source "BasicBSONDecoder.java"

# interfaces
.implements Lorg/bson/BSONDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/BasicBSONDecoder$BSONInput;
    }
.end annotation


# static fields
.field private static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF-8"

.field private static final MAX_STRING:I = 0x2000000

.field static final ONE_BYTE_STRINGS:[Ljava/lang/String;


# instance fields
.field protected _callback:Lorg/bson/BSONCallback;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected _in:Lorg/bson/BasicBSONDecoder$BSONInput;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private _inputBuffer:[B

.field protected _len:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected _pos:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private _random:[B

.field private _stringBuffer:Lorg/bson/io/PoolOutputBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 623
    const/16 v0, 0x80

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lorg/bson/BasicBSONDecoder;->ONE_BYTE_STRINGS:[Ljava/lang/String;

    .line 633
    const/16 v0, 0x30

    const/16 v1, 0x39

    invoke-static {v0, v1}, Lorg/bson/BasicBSONDecoder;->_fillRange(BB)V

    .line 634
    const/16 v0, 0x61

    const/16 v1, 0x7a

    invoke-static {v0, v1}, Lorg/bson/BasicBSONDecoder;->_fillRange(BB)V

    .line 635
    const/16 v0, 0x41

    const/16 v1, 0x5a

    invoke-static {v0, v1}, Lorg/bson/BasicBSONDecoder;->_fillRange(BB)V

    .line 636
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x400

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 596
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/bson/BasicBSONDecoder;->_random:[B

    .line 597
    new-array v0, v1, [B

    iput-object v0, p0, Lorg/bson/BasicBSONDecoder;->_inputBuffer:[B

    .line 599
    new-instance v0, Lorg/bson/io/PoolOutputBuffer;

    invoke-direct {v0}, Lorg/bson/io/PoolOutputBuffer;-><init>()V

    iput-object v0, p0, Lorg/bson/BasicBSONDecoder;->_stringBuffer:Lorg/bson/io/PoolOutputBuffer;

    return-void
.end method

.method private _decode(Lorg/bson/BasicBSONDecoder$BSONInput;Lorg/bson/BSONCallback;)I
    .locals 5
    .param p1, "in"    # Lorg/bson/BasicBSONDecoder$BSONInput;
    .param p2, "callback"    # Lorg/bson/BSONCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 138
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    if-eqz v1, :cond_1

    .line 139
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "not ready"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 141
    :cond_1
    iput-object p1, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    .line 142
    iput-object p2, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 144
    invoke-virtual {p1}, Lorg/bson/BasicBSONDecoder$BSONInput;->numRead()I

    move-result v1

    if-eqz v1, :cond_2

    .line 145
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "i\'m confused"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 149
    :cond_2
    :try_start_0
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v0

    .line 151
    .local v0, "len":I
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v1, v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->setMax(I)V

    .line 153
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v1}, Lorg/bson/BSONCallback;->objectStart()V

    .line 154
    :cond_3
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder;->decodeElement()Z

    move-result v1

    if-nez v1, :cond_3

    .line 155
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v1}, Lorg/bson/BSONCallback;->objectDone()Ljava/lang/Object;

    .line 157
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v1}, Lorg/bson/BasicBSONDecoder$BSONInput;->numRead()I

    move-result v1

    if-eq v1, v0, :cond_4

    .line 158
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "bad data.  lengths don\'t match read:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v3}, Lorg/bson/BasicBSONDecoder$BSONInput;->numRead()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " != len:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    .end local v0    # "len":I
    :catchall_0
    move-exception v1

    iput-object v4, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    .line 164
    iput-object v4, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    throw v1

    .line 163
    .restart local v0    # "len":I
    :cond_4
    iput-object v4, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    .line 164
    iput-object v4, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    return v0
.end method

.method static _fillRange(BB)V
    .locals 3
    .param p0, "min"    # B
    .param p1, "max"    # B

    .prologue
    .line 625
    :goto_0
    if-ge p0, p1, :cond_0

    .line 626
    const-string/jumbo v0, ""

    .line 627
    .local v0, "s":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    int-to-char v2, p0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 628
    sget-object v1, Lorg/bson/BasicBSONDecoder;->ONE_BYTE_STRINGS:[Ljava/lang/String;

    aput-object v0, v1, p0

    .line 629
    add-int/lit8 v1, p0, 0x1

    int-to-byte p0, v1

    .line 630
    goto :goto_0

    .line 631
    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private static final _isAscii(B)Z
    .locals 1
    .param p0, "b"    # B

    .prologue
    .line 620
    if-ltz p0, :cond_0

    const/16 v0, 0x7f

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic access$000(Lorg/bson/BasicBSONDecoder;)[B
    .locals 1
    .param p0, "x0"    # Lorg/bson/BasicBSONDecoder;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_inputBuffer:[B

    return-object v0
.end method

.method static synthetic access$100(Lorg/bson/BasicBSONDecoder;)[B
    .locals 1
    .param p0, "x0"    # Lorg/bson/BasicBSONDecoder;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_random:[B

    return-object v0
.end method

.method static synthetic access$200(Lorg/bson/BasicBSONDecoder;)Lorg/bson/io/PoolOutputBuffer;
    .locals 1
    .param p0, "x0"    # Lorg/bson/BasicBSONDecoder;

    .prologue
    .line 104
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_stringBuffer:Lorg/bson/io/PoolOutputBuffer;

    return-object v0
.end method


# virtual methods
.method protected _binary(Ljava/lang/String;)V
    .locals 11
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 318
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v9

    .line 319
    .local v9, "totalLen":I
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    move-result v6

    .line 321
    .local v6, "bType":B
    packed-switch v6, :pswitch_data_0

    .line 347
    :pswitch_0
    new-array v7, v9, [B

    .line 348
    .local v7, "data":[B
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0, v7}, Lorg/bson/BasicBSONDecoder$BSONInput;->fill([B)V

    .line 350
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1, v6, v7}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    .line 351
    .end local v7    # "data":[B
    :goto_0
    return-void

    .line 323
    :pswitch_1
    new-array v7, v9, [B

    .line 324
    .restart local v7    # "data":[B
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0, v7}, Lorg/bson/BasicBSONDecoder$BSONInput;->fill([B)V

    .line 325
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1, v6, v7}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    goto :goto_0

    .line 329
    .end local v7    # "data":[B
    :pswitch_2
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v8

    .line 330
    .local v8, "len":I
    add-int/lit8 v0, v8, 0x4

    if-eq v0, v9, :cond_0

    .line 331
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "bad data size subtype 2 len: "

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v10, " totalLen: "

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 333
    :cond_0
    new-array v7, v8, [B

    .line 334
    .restart local v7    # "data":[B
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0, v7}, Lorg/bson/BasicBSONDecoder$BSONInput;->fill([B)V

    .line 335
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1, v6, v7}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    goto :goto_0

    .line 338
    .end local v7    # "data":[B
    .end local v8    # "len":I
    :pswitch_3
    const/16 v0, 0x10

    if-eq v9, v0, :cond_1

    .line 339
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "bad data size subtype 3 len: "

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v10, " != 16"

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 341
    :cond_1
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->readLong()J

    move-result-wide v2

    .line 342
    .local v2, "part1":J
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->readLong()J

    move-result-wide v4

    .line 343
    .local v4, "part2":J
    iget-object v0, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lorg/bson/BSONCallback;->gotUUID(Ljava/lang/String;JJ)V

    goto/16 :goto_0

    .line 321
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method _readBasicObject()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 355
    iget-object v2, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v2}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    .line 357
    iget-object v1, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 358
    .local v1, "save":Lorg/bson/BSONCallback;
    iget-object v2, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v2}, Lorg/bson/BSONCallback;->createBSONCallback()Lorg/bson/BSONCallback;

    move-result-object v0

    .line 359
    .local v0, "_basic":Lorg/bson/BSONCallback;
    iput-object v0, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 360
    invoke-interface {v0}, Lorg/bson/BSONCallback;->reset()V

    .line 361
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/bson/BSONCallback;->objectStart(Z)V

    .line 363
    :cond_0
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder;->decodeElement()Z

    move-result v2

    if-nez v2, :cond_0

    .line 364
    iput-object v1, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 365
    invoke-interface {v0}, Lorg/bson/BSONCallback;->get()Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method public decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I
    .locals 1
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "callback"    # Lorg/bson/BSONCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    new-instance v0, Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-direct {v0, p0, p1}, Lorg/bson/BasicBSONDecoder$BSONInput;-><init>(Lorg/bson/BasicBSONDecoder;Ljava/io/InputStream;)V

    invoke-direct {p0, v0, p2}, Lorg/bson/BasicBSONDecoder;->_decode(Lorg/bson/BasicBSONDecoder$BSONInput;Lorg/bson/BSONCallback;)I

    move-result v0

    return v0
.end method

.method decode(Z)I
    .locals 4
    .param p1, "first"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 171
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v3}, Lorg/bson/BasicBSONDecoder$BSONInput;->numRead()I

    move-result v2

    .line 173
    .local v2, "start":I
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v3}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v0

    .line 174
    .local v0, "len":I
    if-eqz p1, :cond_0

    .line 175
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v3, v0}, Lorg/bson/BasicBSONDecoder$BSONInput;->setMax(I)V

    .line 177
    :cond_0
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v3}, Lorg/bson/BSONCallback;->objectStart()V

    .line 178
    :cond_1
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder;->decodeElement()Z

    move-result v3

    if-nez v3, :cond_1

    .line 179
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v3}, Lorg/bson/BSONCallback;->objectDone()Ljava/lang/Object;

    .line 181
    iget-object v3, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v3}, Lorg/bson/BasicBSONDecoder$BSONInput;->numRead()I

    move-result v3

    sub-int v1, v3, v2

    .line 183
    .local v1, "read":I
    if-eq v1, v0, :cond_2

    .line 187
    :cond_2
    return v0
.end method

.method public decode([BLorg/bson/BSONCallback;)I
    .locals 3
    .param p1, "b"    # [B
    .param p2, "callback"    # Lorg/bson/BSONCallback;

    .prologue
    .line 123
    :try_start_0
    new-instance v1, Lorg/bson/BasicBSONDecoder$BSONInput;

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v1, p0, v2}, Lorg/bson/BasicBSONDecoder$BSONInput;-><init>(Lorg/bson/BasicBSONDecoder;Ljava/io/InputStream;)V

    invoke-direct {p0, v1, p2}, Lorg/bson/BasicBSONDecoder;->_decode(Lorg/bson/BasicBSONDecoder$BSONInput;Lorg/bson/BSONCallback;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    return v1

    .line 125
    :catch_0
    move-exception v0

    .line 126
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/bson/BSONException;

    const-string/jumbo v2, "should be impossible"

    invoke-direct {v1, v2, v0}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method decodeElement()Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 193
    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    move-result v5

    .line 195
    .local v5, "type":B
    if-nez v5, :cond_0

    .line 304
    :goto_0
    return v6

    .line 198
    :cond_0
    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readCStr()Ljava/lang/String;

    move-result-object v1

    .line 200
    .local v1, "name":Ljava/lang/String;
    sparse-switch v5, :sswitch_data_0

    .line 301
    new-instance v6, Ljava/lang/UnsupportedOperationException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "BSONDecoder doesn\'t understand type : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " name: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 202
    :sswitch_0
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1}, Lorg/bson/BSONCallback;->gotNull(Ljava/lang/String;)V

    :goto_1
    move v6, v7

    .line 304
    goto :goto_0

    .line 206
    :sswitch_1
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1}, Lorg/bson/BSONCallback;->gotUndefined(Ljava/lang/String;)V

    goto :goto_1

    .line 210
    :sswitch_2
    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v9, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v9}, Lorg/bson/BasicBSONDecoder$BSONInput;->read()B

    move-result v9

    if-lez v9, :cond_1

    move v6, v7

    :cond_1
    invoke-interface {v8, v1, v6}, Lorg/bson/BSONCallback;->gotBoolean(Ljava/lang/String;Z)V

    goto :goto_1

    .line 214
    :sswitch_3
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readDouble()D

    move-result-wide v8

    invoke-interface {v6, v1, v8, v9}, Lorg/bson/BSONCallback;->gotDouble(Ljava/lang/String;D)V

    goto :goto_1

    .line 218
    :sswitch_4
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v8

    invoke-interface {v6, v1, v8}, Lorg/bson/BSONCallback;->gotInt(Ljava/lang/String;I)V

    goto :goto_1

    .line 222
    :sswitch_5
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readLong()J

    move-result-wide v8

    invoke-interface {v6, v1, v8, v9}, Lorg/bson/BSONCallback;->gotLong(Ljava/lang/String;J)V

    goto :goto_1

    .line 226
    :sswitch_6
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readUTF8String()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v1, v8}, Lorg/bson/BSONCallback;->gotSymbol(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 230
    :sswitch_7
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readUTF8String()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v1, v8}, Lorg/bson/BSONCallback;->gotString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 235
    :sswitch_8
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    new-instance v8, Lorg/bson/types/ObjectId;

    iget-object v9, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v9}, Lorg/bson/BasicBSONDecoder$BSONInput;->readIntBE()I

    move-result v9

    iget-object v10, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v10}, Lorg/bson/BasicBSONDecoder$BSONInput;->readIntBE()I

    move-result v10

    iget-object v11, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v11}, Lorg/bson/BasicBSONDecoder$BSONInput;->readIntBE()I

    move-result v11

    invoke-direct {v8, v9, v10, v11}, Lorg/bson/types/ObjectId;-><init>(III)V

    invoke-interface {v6, v1, v8}, Lorg/bson/BSONCallback;->gotObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)V

    goto :goto_1

    .line 239
    :sswitch_9
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    .line 240
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readCStr()Ljava/lang/String;

    move-result-object v2

    .line 241
    .local v2, "ns":Ljava/lang/String;
    new-instance v3, Lorg/bson/types/ObjectId;

    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v6

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v8

    iget-object v9, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v9}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v9

    invoke-direct {v3, v6, v8, v9}, Lorg/bson/types/ObjectId;-><init>(III)V

    .line 242
    .local v3, "theOID":Lorg/bson/types/ObjectId;
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1, v2, v3}, Lorg/bson/BSONCallback;->gotDBRef(Ljava/lang/String;Ljava/lang/String;Lorg/bson/types/ObjectId;)V

    goto/16 :goto_1

    .line 246
    .end local v2    # "ns":Ljava/lang/String;
    .end local v3    # "theOID":Lorg/bson/types/ObjectId;
    :sswitch_a
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readLong()J

    move-result-wide v8

    invoke-interface {v6, v1, v8, v9}, Lorg/bson/BSONCallback;->gotDate(Ljava/lang/String;J)V

    goto/16 :goto_1

    .line 250
    :sswitch_b
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readCStr()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v9}, Lorg/bson/BasicBSONDecoder$BSONInput;->readCStr()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v6, v1, v8, v9}, Lorg/bson/BSONCallback;->gotRegex(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 254
    :sswitch_c
    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder;->_binary(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 258
    :sswitch_d
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readUTF8String()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v1, v8}, Lorg/bson/BSONCallback;->gotCode(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 262
    :sswitch_e
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    .line 263
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v8, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v8}, Lorg/bson/BasicBSONDecoder$BSONInput;->readUTF8String()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder;->_readBasicObject()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v6, v1, v8, v9}, Lorg/bson/BSONCallback;->gotCodeWScope(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 268
    :sswitch_f
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    .line 270
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1}, Lorg/bson/BSONCallback;->arrayStart(Ljava/lang/String;)V

    .line 271
    :cond_2
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder;->decodeElement()Z

    move-result v6

    if-nez v6, :cond_2

    .line 272
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6}, Lorg/bson/BSONCallback;->arrayDone()Ljava/lang/Object;

    goto/16 :goto_1

    .line 278
    :sswitch_10
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    .line 280
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1}, Lorg/bson/BSONCallback;->objectStart(Ljava/lang/String;)V

    .line 281
    :cond_3
    invoke-virtual {p0}, Lorg/bson/BasicBSONDecoder;->decodeElement()Z

    move-result v6

    if-nez v6, :cond_3

    .line 282
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6}, Lorg/bson/BSONCallback;->objectDone()Ljava/lang/Object;

    goto/16 :goto_1

    .line 287
    :sswitch_11
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v0

    .line 288
    .local v0, "i":I
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_in:Lorg/bson/BasicBSONDecoder$BSONInput;

    invoke-virtual {v6}, Lorg/bson/BasicBSONDecoder$BSONInput;->readInt()I

    move-result v4

    .line 289
    .local v4, "time":I
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1, v4, v0}, Lorg/bson/BSONCallback;->gotTimestamp(Ljava/lang/String;II)V

    goto/16 :goto_1

    .line 293
    .end local v0    # "i":I
    .end local v4    # "time":I
    :sswitch_12
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1}, Lorg/bson/BSONCallback;->gotMinKey(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 297
    :sswitch_13
    iget-object v6, p0, Lorg/bson/BasicBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v6, v1}, Lorg/bson/BSONCallback;->gotMaxKey(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 200
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_12
        0x1 -> :sswitch_3
        0x2 -> :sswitch_7
        0x3 -> :sswitch_10
        0x4 -> :sswitch_f
        0x5 -> :sswitch_c
        0x6 -> :sswitch_1
        0x7 -> :sswitch_8
        0x8 -> :sswitch_2
        0x9 -> :sswitch_a
        0xa -> :sswitch_0
        0xb -> :sswitch_b
        0xc -> :sswitch_9
        0xd -> :sswitch_d
        0xe -> :sswitch_6
        0xf -> :sswitch_e
        0x10 -> :sswitch_4
        0x11 -> :sswitch_11
        0x12 -> :sswitch_5
        0x7f -> :sswitch_13
    .end sparse-switch
.end method

.method public readObject(Ljava/io/InputStream;)Lorg/bson/BSONObject;
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    new-instance v0, Lorg/bson/BasicBSONCallback;

    invoke-direct {v0}, Lorg/bson/BasicBSONCallback;-><init>()V

    .line 117
    .local v0, "c":Lorg/bson/BasicBSONCallback;
    invoke-virtual {p0, p1, v0}, Lorg/bson/BasicBSONDecoder;->decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I

    .line 118
    invoke-virtual {v0}, Lorg/bson/BasicBSONCallback;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/BSONObject;

    return-object v1
.end method

.method public readObject([B)Lorg/bson/BSONObject;
    .locals 3
    .param p1, "b"    # [B

    .prologue
    .line 107
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-virtual {p0, v1}, Lorg/bson/BasicBSONDecoder;->readObject(Ljava/io/InputStream;)Lorg/bson/BSONObject;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    .line 109
    :catch_0
    move-exception v0

    .line 110
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/bson/BSONException;

    const-string/jumbo v2, "should be impossible"

    invoke-direct {v1, v2, v0}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
