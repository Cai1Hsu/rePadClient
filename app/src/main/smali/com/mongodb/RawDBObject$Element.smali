.class Lcom/mongodb/RawDBObject$Element;
.super Ljava/lang/Object;
.source "RawDBObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/RawDBObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Element"
.end annotation


# instance fields
.field _cached:Ljava/lang/Object;

.field final _dataStart:I

.field final _name:Ljava/lang/String;

.field final _size:I

.field final _start:I

.field final _type:B

.field final synthetic this$0:Lcom/mongodb/RawDBObject;


# direct methods
.method constructor <init>(Lcom/mongodb/RawDBObject;I)V
    .locals 7
    .param p2, "start"    # I

    .prologue
    .line 216
    iput-object p1, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    iput p2, p0, Lcom/mongodb/RawDBObject$Element;->_start:I

    .line 218
    iget-object v4, p1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/mongodb/RawDBObject$Element;->_start:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v4

    iput-byte v4, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    .line 219
    const/4 v4, 0x1

    new-array v0, v4, [I

    .line 220
    .local v0, "end":[I
    invoke-virtual {p0}, Lcom/mongodb/RawDBObject$Element;->eoo()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string/jumbo v4, ""

    :goto_0
    iput-object v4, p0, Lcom/mongodb/RawDBObject$Element;->_name:Ljava/lang/String;

    .line 222
    const/4 v4, 0x0

    aget v4, v0, v4

    iget v5, p0, Lcom/mongodb/RawDBObject$Element;->_start:I

    sub-int/2addr v4, v5

    add-int/lit8 v3, v4, 0x1

    .line 223
    .local v3, "size":I
    iget v4, p0, Lcom/mongodb/RawDBObject$Element;->_start:I

    add-int/2addr v4, v3

    iput v4, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    .line 225
    iget-byte v4, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    sparse-switch v4, :sswitch_data_0

    .line 272
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "RawDBObject can\'t size type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-byte v6, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 220
    .end local v3    # "size":I
    :cond_0
    iget v4, p0, Lcom/mongodb/RawDBObject$Element;->_start:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p1, v4, v0}, Lcom/mongodb/RawDBObject;->_readCStr(I[I)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 233
    .restart local v3    # "size":I
    :sswitch_0
    add-int/lit8 v3, v3, 0x1

    .line 274
    :goto_1
    :sswitch_1
    iput v3, p0, Lcom/mongodb/RawDBObject$Element;->_size:I

    .line 275
    return-void

    .line 238
    :sswitch_2
    add-int/lit8 v3, v3, 0x8

    .line 239
    goto :goto_1

    .line 241
    :sswitch_3
    add-int/lit8 v3, v3, 0x4

    .line 242
    goto :goto_1

    .line 244
    :sswitch_4
    add-int/lit8 v3, v3, 0xc

    .line 245
    goto :goto_1

    .line 247
    :sswitch_5
    add-int/lit8 v3, v3, 0xc

    .line 248
    iget-object v4, p1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    add-int/2addr v3, v4

    .line 249
    goto :goto_1

    .line 253
    :sswitch_6
    iget-object v4, p1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    add-int/2addr v3, v4

    .line 254
    goto :goto_1

    .line 258
    :sswitch_7
    iget-object v4, p1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v4

    add-int/2addr v3, v4

    .line 259
    goto :goto_1

    .line 261
    :sswitch_8
    iget-object v4, p1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x4

    add-int/lit8 v4, v4, 0x1

    add-int/2addr v3, v4

    .line 262
    goto :goto_1

    .line 264
    :sswitch_9
    iget v4, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {p1, v4}, Lcom/mongodb/RawDBObject;->_cStrLength(I)I

    move-result v1

    .line 265
    .local v1, "first":I
    iget v4, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    add-int/2addr v4, v1

    invoke-virtual {p1, v4}, Lcom/mongodb/RawDBObject;->_cStrLength(I)I

    move-result v2

    .line 266
    .local v2, "second":I
    add-int v4, v1, v2

    add-int/2addr v3, v4

    .line 267
    goto :goto_1

    .line 269
    .end local v1    # "first":I
    .end local v2    # "second":I
    :sswitch_a
    add-int/lit8 v3, v3, 0x8

    .line 270
    goto :goto_1

    .line 225
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_1
        0x0 -> :sswitch_1
        0x1 -> :sswitch_2
        0x2 -> :sswitch_6
        0x3 -> :sswitch_7
        0x4 -> :sswitch_7
        0x5 -> :sswitch_8
        0x6 -> :sswitch_1
        0x7 -> :sswitch_4
        0x8 -> :sswitch_0
        0x9 -> :sswitch_2
        0xa -> :sswitch_1
        0xb -> :sswitch_9
        0xc -> :sswitch_5
        0xd -> :sswitch_6
        0xe -> :sswitch_6
        0xf -> :sswitch_7
        0x10 -> :sswitch_3
        0x11 -> :sswitch_a
        0x12 -> :sswitch_2
        0x7f -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method eoo()Z
    .locals 2

    .prologue
    .line 282
    iget-byte v0, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    if-eqz v0, :cond_0

    iget-byte v0, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    const/16 v1, 0x7f

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method fieldName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 278
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->_name:Ljava/lang/String;

    return-object v0
.end method

.method getObject()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 291
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->_cached:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 292
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->_cached:Ljava/lang/Object;

    .line 326
    :goto_0
    return-object v0

    .line 294
    :cond_0
    iget-byte v0, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    sparse-switch v0, :sswitch_data_0

    .line 328
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "can\'t decode type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-byte v2, p0, Lcom/mongodb/RawDBObject$Element;->_type:B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 296
    :sswitch_0
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v0, v0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getDouble(I)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0

    .line 298
    :sswitch_1
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v0, v0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 300
    :sswitch_2
    new-instance v0, Lorg/bson/types/ObjectId;

    iget-object v1, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v1, v1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v1

    iget-object v2, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v2, v2, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    add-int/lit8 v3, v3, 0x4

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v2

    iget-object v3, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v3, v3, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v4, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    add-int/lit8 v4, v4, 0x8

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lorg/bson/types/ObjectId;-><init>(III)V

    goto :goto_0

    .line 303
    :sswitch_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t handle code"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :sswitch_4
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget v1, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v0, v1}, Lcom/mongodb/RawDBObject;->_readJavaString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 308
    :sswitch_5
    new-instance v0, Ljava/util/Date;

    iget-object v1, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v1, v1, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->getLong(I)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    goto/16 :goto_0

    .line 313
    :sswitch_6
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t handle regex"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 315
    :sswitch_7
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t inspect binary in db"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 317
    :sswitch_8
    iget-object v0, p0, Lcom/mongodb/RawDBObject$Element;->this$0:Lcom/mongodb/RawDBObject;

    iget-object v0, v0, Lcom/mongodb/RawDBObject;->_buf:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/mongodb/RawDBObject$Element;->_dataStart:I

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 320
    :sswitch_9
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t handle emebdded objects"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 326
    :sswitch_a
    const/4 v0, 0x0

    goto/16 :goto_0

    .line 294
    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_a
        0x0 -> :sswitch_a
        0x1 -> :sswitch_0
        0x2 -> :sswitch_4
        0x3 -> :sswitch_9
        0x4 -> :sswitch_9
        0x5 -> :sswitch_7
        0x6 -> :sswitch_a
        0x7 -> :sswitch_2
        0x8 -> :sswitch_8
        0x9 -> :sswitch_5
        0xa -> :sswitch_a
        0xb -> :sswitch_6
        0xd -> :sswitch_3
        0xe -> :sswitch_4
        0xf -> :sswitch_3
        0x10 -> :sswitch_1
        0x7f -> :sswitch_a
    .end sparse-switch
.end method

.method size()I
    .locals 1

    .prologue
    .line 286
    iget v0, p0, Lcom/mongodb/RawDBObject$Element;->_size:I

    return v0
.end method
