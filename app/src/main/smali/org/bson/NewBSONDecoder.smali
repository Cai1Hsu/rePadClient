.class public Lorg/bson/NewBSONDecoder;
.super Ljava/lang/Object;
.source "NewBSONDecoder.java"

# interfaces
.implements Lorg/bson/BSONDecoder;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final DEFAULT_ENCODING:Ljava/lang/String; = "UTF-8"

.field private static final MAX_STRING:I = 0x2000000


# instance fields
.field private _callback:Lorg/bson/BSONCallback;

.field private _data:[B

.field private _length:I

.field private _pos:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 328
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    return-void
.end method

.method private final _binary(Ljava/lang/String;)V
    .locals 11
    .param p1, "pName"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    .line 157
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v9

    .line 158
    .local v9, "totalLen":I
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 160
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    aget-byte v6, v0, v1

    .line 161
    .local v6, "bType":B
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 163
    packed-switch v6, :pswitch_data_0

    .line 203
    :pswitch_0
    new-array v7, v9, [B

    .line 204
    .local v7, "data":[B
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1, v7, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 205
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/2addr v0, v9

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 207
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1, v6, v7}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    .line 208
    .end local v7    # "data":[B
    :goto_0
    return-void

    .line 165
    :pswitch_1
    new-array v7, v9, [B

    .line 167
    .restart local v7    # "data":[B
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1, v7, v10, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/2addr v0, v9

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 170
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1, v6, v7}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    goto :goto_0

    .line 175
    .end local v7    # "data":[B
    :pswitch_2
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v8

    .line 176
    .local v8, "len":I
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v0, v0, 0x4

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 178
    add-int/lit8 v0, v8, 0x4

    if-eq v0, v9, :cond_0

    .line 179
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

    .line 181
    :cond_0
    new-array v7, v8, [B

    .line 182
    .restart local v7    # "data":[B
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1, v7, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 183
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/2addr v0, v8

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 184
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1, v6, v7}, Lorg/bson/BSONCallback;->gotBinary(Ljava/lang/String;B[B)V

    goto :goto_0

    .line 189
    .end local v7    # "data":[B
    .end local v8    # "len":I
    :pswitch_3
    const/16 v0, 0x10

    if-eq v9, v0, :cond_1

    .line 190
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

    .line 192
    :cond_1
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v2

    .line 193
    .local v2, "part1":J
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 195
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v0, v1}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v4

    .line 196
    .local v4, "part2":J
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v0, v0, 0x8

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 198
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    move-object v1, p1

    invoke-interface/range {v0 .. v5}, Lorg/bson/BSONCallback;->gotUUID(Ljava/lang/String;JJ)V

    goto/16 :goto_0

    .line 163
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private final _decode()V
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0}, Lorg/bson/BSONCallback;->objectStart()V

    .line 108
    :cond_0
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->decodeElement()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0}, Lorg/bson/BSONCallback;->objectDone()Ljava/lang/Object;

    .line 110
    return-void
.end method

.method private final _readBasicObject()Ljava/lang/Object;
    .locals 3

    .prologue
    .line 142
    iget v2, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v2, v2, 0x4

    iput v2, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 144
    iget-object v1, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 145
    .local v1, "save":Lorg/bson/BSONCallback;
    iget-object v2, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v2}, Lorg/bson/BSONCallback;->createBSONCallback()Lorg/bson/BSONCallback;

    move-result-object v0

    .line 146
    .local v0, "_basic":Lorg/bson/BSONCallback;
    iput-object v0, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 147
    invoke-interface {v0}, Lorg/bson/BSONCallback;->reset()V

    .line 148
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/bson/BSONCallback;->objectStart(Z)V

    .line 150
    :cond_0
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->decodeElement()Z

    move-result v2

    if-nez v2, :cond_0

    .line 151
    iput-object v1, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 152
    invoke-interface {v0}, Lorg/bson/BSONCallback;->get()Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private final decodeElement()Z
    .locals 13

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 212
    iget-object v10, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v11, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    aget-byte v7, v10, v11

    .line 213
    .local v7, "type":B
    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v10, v10, 0x1

    iput v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 215
    if-nez v7, :cond_0

    move v9, v8

    .line 317
    :goto_0
    return v9

    .line 217
    :cond_0
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readCstr()Ljava/lang/String;

    move-result-object v1

    .line 219
    .local v1, "name":Ljava/lang/String;
    sparse-switch v7, :sswitch_data_0

    .line 319
    new-instance v8, Ljava/lang/UnsupportedOperationException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v10, "BSONDecoder doesn\'t understand type : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, " name: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 220
    :sswitch_0
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1}, Lorg/bson/BSONCallback;->gotNull(Ljava/lang/String;)V

    goto :goto_0

    .line 222
    :sswitch_1
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1}, Lorg/bson/BSONCallback;->gotUndefined(Ljava/lang/String;)V

    goto :goto_0

    .line 224
    :sswitch_2
    iget-object v10, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v11, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v12, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    aget-byte v11, v11, v12

    if-lez v11, :cond_1

    move v8, v9

    :cond_1
    invoke-interface {v10, v1, v8}, Lorg/bson/BSONCallback;->gotBoolean(Ljava/lang/String;Z)V

    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    goto :goto_0

    .line 226
    :sswitch_3
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v10, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v11, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v10, v11}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v10

    invoke-interface {v8, v1, v10, v11}, Lorg/bson/BSONCallback;->gotDouble(Ljava/lang/String;D)V

    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x8

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    goto :goto_0

    .line 228
    :sswitch_4
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v10, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v11, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v10, v11}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v10

    invoke-interface {v8, v1, v10}, Lorg/bson/BSONCallback;->gotInt(Ljava/lang/String;I)V

    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    goto :goto_0

    .line 231
    :sswitch_5
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v10, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v11, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v10, v11}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v10

    invoke-interface {v8, v1, v10, v11}, Lorg/bson/BSONCallback;->gotLong(Ljava/lang/String;J)V

    .line 232
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x8

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    goto/16 :goto_0

    .line 236
    :sswitch_6
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readUtf8Str()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v1, v10}, Lorg/bson/BSONCallback;->gotSymbol(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 237
    :sswitch_7
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readUtf8Str()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v1, v10}, Lorg/bson/BSONCallback;->gotString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 242
    :sswitch_8
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readIntBE([BI)I

    move-result v3

    .line 243
    .local v3, "p1":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 245
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readIntBE([BI)I

    move-result v4

    .line 246
    .local v4, "p2":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 248
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readIntBE([BI)I

    move-result v5

    .line 249
    .local v5, "p3":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 251
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    new-instance v10, Lorg/bson/types/ObjectId;

    invoke-direct {v10, v3, v4, v5}, Lorg/bson/types/ObjectId;-><init>(III)V

    invoke-interface {v8, v1, v10}, Lorg/bson/BSONCallback;->gotObjectId(Ljava/lang/String;Lorg/bson/types/ObjectId;)V

    goto/16 :goto_0

    .line 256
    .end local v3    # "p1":I
    .end local v4    # "p2":I
    .end local v5    # "p3":I
    :sswitch_9
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 258
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readCstr()Ljava/lang/String;

    move-result-object v2

    .line 260
    .local v2, "ns":Ljava/lang/String;
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v3

    .line 261
    .restart local v3    # "p1":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 263
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v4

    .line 264
    .restart local v4    # "p2":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 266
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v5

    .line 267
    .restart local v5    # "p3":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 269
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    new-instance v10, Lorg/bson/types/ObjectId;

    invoke-direct {v10, v3, v4, v5}, Lorg/bson/types/ObjectId;-><init>(III)V

    invoke-interface {v8, v1, v2, v10}, Lorg/bson/BSONCallback;->gotDBRef(Ljava/lang/String;Ljava/lang/String;Lorg/bson/types/ObjectId;)V

    goto/16 :goto_0

    .line 274
    .end local v2    # "ns":Ljava/lang/String;
    .end local v3    # "p1":I
    .end local v4    # "p2":I
    .end local v5    # "p3":I
    :sswitch_a
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    iget-object v10, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v11, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v10, v11}, Lorg/bson/io/Bits;->readLong([BI)J

    move-result-wide v10

    invoke-interface {v8, v1, v10, v11}, Lorg/bson/BSONCallback;->gotDate(Ljava/lang/String;J)V

    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x8

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    goto/16 :goto_0

    .line 278
    :sswitch_b
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readCstr()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readCstr()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v8, v1, v10, v11}, Lorg/bson/BSONCallback;->gotRegex(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 282
    :sswitch_c
    invoke-direct {p0, v1}, Lorg/bson/NewBSONDecoder;->_binary(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 284
    :sswitch_d
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readUtf8Str()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v1, v10}, Lorg/bson/BSONCallback;->gotCode(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 287
    :sswitch_e
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 288
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->readUtf8Str()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->_readBasicObject()Ljava/lang/Object;

    move-result-object v11

    invoke-interface {v8, v1, v10, v11}, Lorg/bson/BSONCallback;->gotCodeWScope(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 293
    :sswitch_f
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 294
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1}, Lorg/bson/BSONCallback;->arrayStart(Ljava/lang/String;)V

    .line 295
    :cond_2
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->decodeElement()Z

    move-result v8

    if-nez v8, :cond_2

    .line 296
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8}, Lorg/bson/BSONCallback;->arrayDone()Ljava/lang/Object;

    goto/16 :goto_0

    .line 300
    :sswitch_10
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 301
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1}, Lorg/bson/BSONCallback;->objectStart(Ljava/lang/String;)V

    .line 302
    :cond_3
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->decodeElement()Z

    move-result v8

    if-nez v8, :cond_3

    .line 303
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8}, Lorg/bson/BSONCallback;->objectDone()Ljava/lang/Object;

    goto/16 :goto_0

    .line 307
    :sswitch_11
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v0

    .line 308
    .local v0, "i":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 310
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v10, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v8, v10}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v6

    .line 311
    .local v6, "time":I
    iget v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v8, v8, 0x4

    iput v8, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 313
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1, v6, v0}, Lorg/bson/BSONCallback;->gotTimestamp(Ljava/lang/String;II)V

    goto/16 :goto_0

    .line 316
    .end local v0    # "i":I
    .end local v6    # "time":I
    :sswitch_12
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1}, Lorg/bson/BSONCallback;->gotMinKey(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 317
    :sswitch_13
    iget-object v8, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v8, v1}, Lorg/bson/BSONCallback;->gotMaxKey(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 219
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

.method private final readCstr()Ljava/lang/String;
    .locals 6

    .prologue
    .line 113
    const/4 v0, 0x0

    .line 114
    .local v0, "length":I
    iget v1, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 116
    .local v1, "offset":I
    :goto_0
    iget-object v3, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v4, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    aget-byte v3, v3, v4

    if-eqz v3, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 119
    :cond_0
    :try_start_0
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    const-string/jumbo v5, "UTF-8"

    invoke-direct {v3, v4, v1, v0, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    :goto_1
    return-object v3

    .line 120
    :catch_0
    move-exception v2

    .line 121
    .local v2, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    invoke-direct {v3, v4, v1, v0}, Ljava/lang/String;-><init>([BII)V

    goto :goto_1
.end method

.method private final readUtf8Str()Ljava/lang/String;
    .locals 7

    .prologue
    .line 126
    iget-object v3, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v4, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    invoke-static {v3, v4}, Lorg/bson/io/Bits;->readInt([BI)I

    move-result v0

    .line 127
    .local v0, "length":I
    iget v3, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v3, v3, 0x4

    iput v3, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 129
    if-lez v0, :cond_0

    const/high16 v3, 0x2000000

    if-le v0, v3, :cond_1

    :cond_0
    new-instance v3, Lorg/bson/BSONException;

    const-string/jumbo v4, "String invalid - corruption"

    invoke-direct {v3, v4}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 132
    :cond_1
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v3, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    iget v4, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/lit8 v5, v0, -0x1

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v1, v3, v4, v5, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 133
    .local v1, "str":Ljava/lang/String;
    iget v3, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    add-int/2addr v3, v0

    iput v3, p0, Lorg/bson/NewBSONDecoder;->_pos:I
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 134
    return-object v1

    .line 136
    .end local v1    # "str":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 137
    .local v2, "uee":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/bson/BSONException;

    const-string/jumbo v4, "What is in the db"

    invoke-direct {v3, v4, v2}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public decode(Ljava/io/InputStream;Lorg/bson/BSONCallback;)I
    .locals 4
    .param p1, "pIn"    # Ljava/io/InputStream;
    .param p2, "pCallback"    # Lorg/bson/BSONCallback;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    invoke-static {p1}, Lorg/bson/io/Bits;->readInt(Ljava/io/InputStream;)I

    move-result v0

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_length:I

    .line 97
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    array-length v0, v0

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_length:I

    if-ge v0, v1, :cond_1

    .line 98
    :cond_0
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_length:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    .line 101
    :cond_1
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iget-object v1, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    const/4 v2, 0x4

    iget v3, p0, Lorg/bson/NewBSONDecoder;->_length:I

    add-int/lit8 v3, v3, -0x4

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 103
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    invoke-virtual {p0, v0, p2}, Lorg/bson/NewBSONDecoder;->decode([BLorg/bson/BSONCallback;)I

    move-result v0

    return v0
.end method

.method public decode([BLorg/bson/BSONCallback;)I
    .locals 1
    .param p1, "pData"    # [B
    .param p2, "pCallback"    # Lorg/bson/BSONCallback;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    .line 87
    const/4 v0, 0x4

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_pos:I

    .line 88
    iput-object p2, p0, Lorg/bson/NewBSONDecoder;->_callback:Lorg/bson/BSONCallback;

    .line 89
    invoke-direct {p0}, Lorg/bson/NewBSONDecoder;->_decode()V

    .line 90
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_length:I

    return v0
.end method

.method public readObject(Ljava/io/InputStream;)Lorg/bson/BSONObject;
    .locals 4
    .param p1, "pIn"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    invoke-static {p1}, Lorg/bson/io/Bits;->readInt(Ljava/io/InputStream;)I

    move-result v0

    iput v0, p0, Lorg/bson/NewBSONDecoder;->_length:I

    .line 75
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    array-length v0, v0

    iget v1, p0, Lorg/bson/NewBSONDecoder;->_length:I

    if-ge v0, v1, :cond_1

    .line 76
    :cond_0
    iget v0, p0, Lorg/bson/NewBSONDecoder;->_length:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    .line 79
    :cond_1
    new-instance v0, Ljava/io/DataInputStream;

    invoke-direct {v0, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iget-object v1, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    const/4 v2, 0x4

    iget v3, p0, Lorg/bson/NewBSONDecoder;->_length:I

    add-int/lit8 v3, v3, -0x4

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 81
    iget-object v0, p0, Lorg/bson/NewBSONDecoder;->_data:[B

    invoke-virtual {p0, v0}, Lorg/bson/NewBSONDecoder;->readObject([B)Lorg/bson/BSONObject;

    move-result-object v0

    return-object v0
.end method

.method public readObject([B)Lorg/bson/BSONObject;
    .locals 2
    .param p1, "pData"    # [B

    .prologue
    .line 64
    array-length v1, p1

    iput v1, p0, Lorg/bson/NewBSONDecoder;->_length:I

    .line 65
    new-instance v0, Lorg/bson/BasicBSONCallback;

    invoke-direct {v0}, Lorg/bson/BasicBSONCallback;-><init>()V

    .line 66
    .local v0, "c":Lorg/bson/BasicBSONCallback;
    invoke-virtual {p0, p1, v0}, Lorg/bson/NewBSONDecoder;->decode([BLorg/bson/BSONCallback;)I

    .line 67
    invoke-virtual {v0}, Lorg/bson/BasicBSONCallback;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/bson/BSONObject;

    return-object v1
.end method
