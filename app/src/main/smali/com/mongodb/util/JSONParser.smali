.class Lcom/mongodb/util/JSONParser;
.super Ljava/lang/Object;
.source "JSON.java"


# instance fields
.field _callback:Lorg/bson/BSONCallback;

.field pos:I

.field s:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mongodb/util/JSONParser;-><init>(Ljava/lang/String;Lorg/bson/BSONCallback;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/bson/BSONCallback;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "callback"    # Lorg/bson/BSONCallback;

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    const/4 v0, 0x0

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 151
    iput-object p1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    .line 152
    if-nez p2, :cond_0

    new-instance p2, Lcom/mongodb/util/JSONCallback;

    .end local p2    # "callback":Lorg/bson/BSONCallback;
    invoke-direct {p2}, Lcom/mongodb/util/JSONCallback;-><init>()V

    :cond_0
    iput-object p2, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    .line 153
    return-void
.end method


# virtual methods
.method public check(C)Z
    .locals 1
    .param p1, "ch"    # C

    .prologue
    .line 326
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected doCallback(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 265
    if-nez p2, :cond_1

    .line 266
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v0, p1}, Lorg/bson/BSONCallback;->gotNull(Ljava/lang/String;)V

    .line 278
    .end local p2    # "value":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 267
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 268
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-interface {v0, p1, p2}, Lorg/bson/BSONCallback;->gotString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 269
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 270
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONCallback;->gotBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 271
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_3
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_4

    .line 272
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    check-cast p2, Ljava/lang/Integer;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, p1, v1}, Lorg/bson/BSONCallback;->gotInt(Ljava/lang/String;I)V

    goto :goto_0

    .line 273
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_4
    instance-of v0, p2, Ljava/lang/Long;

    if-eqz v0, :cond_5

    .line 274
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    check-cast p2, Ljava/lang/Long;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, p1, v2, v3}, Lorg/bson/BSONCallback;->gotLong(Ljava/lang/String;J)V

    goto :goto_0

    .line 275
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_5
    instance-of v0, p2, Ljava/lang/Double;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    check-cast p2, Ljava/lang/Double;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-interface {v0, p1, v2, v3}, Lorg/bson/BSONCallback;->gotDouble(Ljava/lang/String;D)V

    goto :goto_0
.end method

.method public get()C
    .locals 2

    .prologue
    .line 345
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->skipWS()V

    .line 346
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 347
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 348
    :goto_0
    return v0

    :cond_0
    const v0, 0xffff

    goto :goto_0
.end method

.method public parse()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 163
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mongodb/util/JSONParser;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x65

    const/16 v5, 0x61

    const/16 v2, 0x4e

    const/4 v4, 0x1

    const/16 v3, 0x6c

    .line 173
    const/4 v1, 0x0

    .line 174
    .local v1, "value":Ljava/lang/Object;
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    .line 176
    .local v0, "current":C
    sparse-switch v0, :sswitch_data_0

    .line 216
    new-instance v2, Lcom/mongodb/util/JSONParseException;

    iget-object v3, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v4, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-direct {v2, v3, v4}, Lcom/mongodb/util/JSONParseException;-><init>(Ljava/lang/String;I)V

    throw v2

    .line 179
    :sswitch_0
    const/16 v2, 0x6e

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    const/16 v2, 0x75

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 180
    const/4 v1, 0x0

    .line 218
    .end local v1    # "value":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 184
    .restart local v1    # "value":Ljava/lang/Object;
    :sswitch_1
    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 185
    const-wide/high16 v2, 0x7ff8000000000000L    # Double.NaN

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 186
    .local v1, "value":Ljava/lang/Double;
    goto :goto_0

    .line 189
    .local v1, "value":Ljava/lang/Object;
    :sswitch_2
    const/16 v2, 0x74

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    const/16 v2, 0x72

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    const/16 v2, 0x75

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v6}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 190
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 191
    .local v1, "value":Ljava/lang/Boolean;
    goto :goto_0

    .line 194
    .local v1, "value":Ljava/lang/Object;
    :sswitch_3
    const/16 v2, 0x66

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    const/16 v2, 0x73

    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->read(C)V

    invoke-virtual {p0, v6}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 195
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 196
    .local v1, "value":Ljava/lang/Boolean;
    goto :goto_0

    .line 200
    .local v1, "value":Ljava/lang/Object;
    :sswitch_4
    invoke-virtual {p0, v4}, Lcom/mongodb/util/JSONParser;->parseString(Z)Ljava/lang/String;

    move-result-object v1

    .line 201
    .local v1, "value":Ljava/lang/String;
    goto :goto_0

    .line 205
    .local v1, "value":Ljava/lang/Object;
    :sswitch_5
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->parseNumber()Ljava/lang/Number;

    move-result-object v1

    .line 206
    .local v1, "value":Ljava/lang/Number;
    goto :goto_0

    .line 209
    .local v1, "value":Ljava/lang/Object;
    :sswitch_6
    invoke-virtual {p0, p1}, Lcom/mongodb/util/JSONParser;->parseArray(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 210
    goto :goto_0

    .line 213
    :sswitch_7
    invoke-virtual {p0, p1}, Lcom/mongodb/util/JSONParser;->parseObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 214
    goto :goto_0

    .line 176
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_4
        0x27 -> :sswitch_4
        0x2b -> :sswitch_5
        0x2d -> :sswitch_5
        0x30 -> :sswitch_5
        0x31 -> :sswitch_5
        0x32 -> :sswitch_5
        0x33 -> :sswitch_5
        0x34 -> :sswitch_5
        0x35 -> :sswitch_5
        0x36 -> :sswitch_5
        0x37 -> :sswitch_5
        0x38 -> :sswitch_5
        0x39 -> :sswitch_5
        0x4e -> :sswitch_1
        0x5b -> :sswitch_6
        0x66 -> :sswitch_3
        0x6e -> :sswitch_0
        0x74 -> :sswitch_2
        0x7b -> :sswitch_7
    .end sparse-switch
.end method

.method public parseArray()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 535
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mongodb/util/JSONParser;->parseArray(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected parseArray(Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v7, 0x2c

    const/16 v6, 0x5d

    .line 545
    if-eqz p1, :cond_0

    .line 546
    iget-object v5, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v5, p1}, Lorg/bson/BSONCallback;->arrayStart(Ljava/lang/String;)V

    .line 551
    :goto_0
    const/16 v5, 0x5b

    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 553
    const/4 v3, 0x0

    .line 554
    .local v3, "i":I
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    .local v0, "current":C
    move v4, v3

    .line 555
    .end local v3    # "i":I
    .local v4, "i":I
    :goto_1
    if-eq v0, v6, :cond_3

    .line 556
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "i":I
    .restart local v3    # "i":I
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 557
    .local v2, "elemName":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/mongodb/util/JSONParser;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 558
    .local v1, "elem":Ljava/lang/Object;
    invoke-virtual {p0, v2, v1}, Lcom/mongodb/util/JSONParser;->doCallback(Ljava/lang/String;Ljava/lang/Object;)V

    .line 560
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    if-ne v0, v7, :cond_1

    .line 561
    invoke-virtual {p0, v7}, Lcom/mongodb/util/JSONParser;->read(C)V

    move v4, v3

    .line 569
    .end local v3    # "i":I
    .restart local v4    # "i":I
    goto :goto_1

    .line 548
    .end local v0    # "current":C
    .end local v1    # "elem":Ljava/lang/Object;
    .end local v2    # "elemName":Ljava/lang/String;
    .end local v4    # "i":I
    :cond_0
    iget-object v5, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v5}, Lorg/bson/BSONCallback;->arrayStart()V

    goto :goto_0

    .line 563
    .restart local v0    # "current":C
    .restart local v1    # "elem":Ljava/lang/Object;
    .restart local v2    # "elemName":Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_1
    if-ne v0, v6, :cond_2

    .line 571
    .end local v1    # "elem":Ljava/lang/Object;
    .end local v2    # "elemName":Ljava/lang/String;
    :goto_2
    invoke-virtual {p0, v6}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 573
    iget-object v5, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v5}, Lorg/bson/BSONCallback;->arrayDone()Ljava/lang/Object;

    move-result-object v5

    return-object v5

    .line 567
    .restart local v1    # "elem":Ljava/lang/Object;
    .restart local v2    # "elemName":Ljava/lang/String;
    :cond_2
    new-instance v5, Lcom/mongodb/util/JSONParseException;

    iget-object v6, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v7, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-direct {v5, v6, v7}, Lcom/mongodb/util/JSONParseException;-><init>(Ljava/lang/String;I)V

    throw v5

    .end local v1    # "elem":Ljava/lang/Object;
    .end local v2    # "elemName":Ljava/lang/String;
    .end local v3    # "i":I
    .restart local v4    # "i":I
    :cond_3
    move v3, v4

    .end local v4    # "i":I
    .restart local v3    # "i":I
    goto :goto_2
.end method

.method public parseExponent()V
    .locals 2

    .prologue
    .line 509
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 511
    const/16 v0, 0x2d

    invoke-virtual {p0, v0}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x2b

    invoke-virtual {p0, v0}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 512
    :cond_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 516
    :cond_1
    :goto_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 517
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 526
    :cond_2
    return-void

    .line 520
    :pswitch_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    goto :goto_0

    .line 517
    nop

    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public parseFraction()V
    .locals 2

    .prologue
    .line 486
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 489
    :goto_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 490
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 502
    :cond_0
    return-void

    .line 493
    :sswitch_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    goto :goto_0

    .line 496
    :sswitch_1
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->parseExponent()V

    goto :goto_0

    .line 490
    nop

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x31 -> :sswitch_0
        0x32 -> :sswitch_0
        0x33 -> :sswitch_0
        0x34 -> :sswitch_0
        0x35 -> :sswitch_0
        0x36 -> :sswitch_0
        0x37 -> :sswitch_0
        0x38 -> :sswitch_0
        0x39 -> :sswitch_0
        0x45 -> :sswitch_1
        0x65 -> :sswitch_1
    .end sparse-switch
.end method

.method public parseNumber()Ljava/lang/Number;
    .locals 10

    .prologue
    .line 440
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    .line 441
    .local v0, "current":C
    iget v3, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 442
    .local v3, "start":I
    const/4 v2, 0x0

    .line 444
    .local v2, "isDouble":Z
    const/16 v5, 0x2d

    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v5

    if-nez v5, :cond_0

    const/16 v5, 0x2b

    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 445
    :cond_0
    iget v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 449
    :cond_1
    :goto_0
    iget v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v6, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 450
    iget-object v5, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v6, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    sparse-switch v5, :sswitch_data_0

    .line 469
    :cond_2
    if-eqz v2, :cond_4

    .line 470
    :try_start_0
    iget-object v5, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v6, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 475
    :cond_3
    :goto_1
    return-object v4

    .line 453
    :sswitch_0
    iget v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    goto :goto_0

    .line 456
    :sswitch_1
    const/4 v2, 0x1

    .line 457
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->parseFraction()V

    goto :goto_0

    .line 460
    :sswitch_2
    const/4 v2, 0x1

    .line 461
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->parseExponent()V

    goto :goto_0

    .line 472
    :cond_4
    :try_start_1
    iget-object v5, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v6, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v5, v3, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    .line 473
    .local v4, "val":Ljava/lang/Long;
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/32 v8, 0x7fffffff

    cmp-long v5, v6, v8

    if-gtz v5, :cond_3

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    const-wide/32 v8, -0x80000000

    cmp-long v5, v6, v8

    if-ltz v5, :cond_3

    .line 474
    invoke-virtual {v4}, Ljava/lang/Long;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_1

    .line 476
    .end local v4    # "val":Ljava/lang/Long;
    :catch_0
    move-exception v1

    .line 477
    .local v1, "e":Ljava/lang/NumberFormatException;
    new-instance v5, Lcom/mongodb/util/JSONParseException;

    iget-object v6, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-direct {v5, v6, v3, v1}, Lcom/mongodb/util/JSONParseException;-><init>(Ljava/lang/String;ILjava/lang/Throwable;)V

    throw v5

    .line 450
    :sswitch_data_0
    .sparse-switch
        0x2e -> :sswitch_1
        0x30 -> :sswitch_0
        0x31 -> :sswitch_0
        0x32 -> :sswitch_0
        0x33 -> :sswitch_0
        0x34 -> :sswitch_0
        0x35 -> :sswitch_0
        0x36 -> :sswitch_0
        0x37 -> :sswitch_0
        0x38 -> :sswitch_0
        0x39 -> :sswitch_0
        0x45 -> :sswitch_2
        0x65 -> :sswitch_2
    .end sparse-switch
.end method

.method public parseObject()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 228
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mongodb/util/JSONParser;->parseObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected parseObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x7d

    const/16 v4, 0x2c

    .line 238
    if-eqz p1, :cond_0

    .line 239
    iget-object v3, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v3, p1}, Lorg/bson/BSONCallback;->objectStart(Ljava/lang/String;)V

    .line 244
    :goto_0
    const/16 v3, 0x7b

    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 245
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    .line 246
    .local v0, "current":C
    :goto_1
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v3

    if-eq v3, v5, :cond_1

    .line 247
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->parseString(Z)Ljava/lang/String;

    move-result-object v1

    .line 248
    .local v1, "key":Ljava/lang/String;
    const/16 v3, 0x3a

    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 249
    invoke-virtual {p0, v1}, Lcom/mongodb/util/JSONParser;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 250
    .local v2, "value":Ljava/lang/Object;
    invoke-virtual {p0, v1, v2}, Lcom/mongodb/util/JSONParser;->doCallback(Ljava/lang/String;Ljava/lang/Object;)V

    .line 252
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v0

    if-ne v0, v4, :cond_1

    .line 253
    invoke-virtual {p0, v4}, Lcom/mongodb/util/JSONParser;->read(C)V

    goto :goto_1

    .line 241
    .end local v0    # "current":C
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/Object;
    :cond_0
    iget-object v3, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v3}, Lorg/bson/BSONCallback;->objectStart()V

    goto :goto_0

    .line 259
    .restart local v0    # "current":C
    :cond_1
    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 261
    iget-object v3, p0, Lcom/mongodb/util/JSONParser;->_callback:Lorg/bson/BSONCallback;

    invoke-interface {v3}, Lorg/bson/BSONCallback;->objectDone()Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public parseString(Z)Ljava/lang/String;
    .locals 11
    .param p1, "needQuote"    # Z

    .prologue
    .line 358
    const/4 v3, 0x0

    .line 359
    .local v3, "quot":C
    const/16 v8, 0x27

    invoke-virtual {p0, v8}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 360
    const/16 v3, 0x27

    .line 368
    :cond_0
    :goto_0
    if-lez v3, :cond_1

    .line 369
    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 370
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 371
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 372
    .local v5, "start":I
    :goto_1
    iget v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v9, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v8, v9, :cond_2

    .line 373
    iget-object v8, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v9, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v8, v9}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 374
    .local v2, "current":C
    if-lez v3, :cond_6

    .line 375
    if-ne v2, v3, :cond_7

    .line 426
    .end local v2    # "current":C
    :cond_2
    iget-object v8, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v9, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v8, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    if-lez v3, :cond_3

    .line 428
    invoke-virtual {p0, v3}, Lcom/mongodb/util/JSONParser;->read(C)V

    .line 429
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8

    .line 361
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v5    # "start":I
    :cond_4
    const/16 v8, 0x22

    invoke-virtual {p0, v8}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 362
    const/16 v3, 0x22

    goto :goto_0

    .line 363
    :cond_5
    if-eqz p1, :cond_0

    .line 364
    new-instance v8, Lcom/mongodb/util/JSONParseException;

    iget-object v9, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v10, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-direct {v8, v9, v10}, Lcom/mongodb/util/JSONParseException;-><init>(Ljava/lang/String;I)V

    throw v8

    .line 378
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    .restart local v2    # "current":C
    .restart local v5    # "start":I
    :cond_6
    const/16 v8, 0x3a

    if-eq v2, v8, :cond_2

    const/16 v8, 0x20

    if-eq v2, v8, :cond_2

    .line 382
    :cond_7
    const/16 v8, 0x5c

    if-ne v2, v8, :cond_9

    .line 383
    iget v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 385
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->get()C

    move-result v7

    .line 387
    .local v7, "x":C
    const/4 v4, 0x0

    .line 389
    .local v4, "special":C
    sparse-switch v7, :sswitch_data_0

    .line 416
    :goto_2
    iget-object v8, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v9, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 417
    if-eqz v4, :cond_8

    .line 418
    iget v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 419
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 421
    :cond_8
    iget v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 422
    goto :goto_1

    .line 393
    :sswitch_0
    iget-object v8, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v9, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {v8, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    iget v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 395
    iget v6, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 397
    .local v6, "tempPos":I
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->readHex()V

    .line 398
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->readHex()V

    .line 399
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->readHex()V

    .line 400
    invoke-virtual {p0}, Lcom/mongodb/util/JSONParser;->readHex()V

    .line 402
    iget-object v8, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    add-int/lit8 v9, v6, 0x4

    invoke-virtual {v8, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x10

    invoke-static {v8, v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    .line 403
    .local v1, "codePoint":I
    int-to-char v8, v1

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 405
    iget v5, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 406
    goto/16 :goto_1

    .line 408
    .end local v1    # "codePoint":I
    .end local v6    # "tempPos":I
    :sswitch_1
    const/16 v4, 0xa

    goto :goto_2

    .line 409
    :sswitch_2
    const/16 v4, 0xd

    goto :goto_2

    .line 410
    :sswitch_3
    const/16 v4, 0x9

    goto :goto_2

    .line 411
    :sswitch_4
    const/16 v4, 0x8

    goto :goto_2

    .line 412
    :sswitch_5
    const/16 v4, 0x22

    goto :goto_2

    .line 413
    :sswitch_6
    const/16 v4, 0x5c

    goto :goto_2

    .line 424
    .end local v4    # "special":C
    .end local v7    # "x":C
    :cond_9
    iget v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/mongodb/util/JSONParser;->pos:I

    goto/16 :goto_1

    .line 389
    nop

    :sswitch_data_0
    .sparse-switch
        0x22 -> :sswitch_5
        0x5c -> :sswitch_6
        0x62 -> :sswitch_4
        0x6e -> :sswitch_1
        0x72 -> :sswitch_2
        0x74 -> :sswitch_3
        0x75 -> :sswitch_0
    .end sparse-switch
.end method

.method public read()C
    .locals 3

    .prologue
    .line 296
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 297
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "string done"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 298
    :cond_0
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public read(C)V
    .locals 3
    .param p1, "ch"    # C

    .prologue
    .line 289
    invoke-virtual {p0, p1}, Lcom/mongodb/util/JSONParser;->check(C)Z

    move-result v0

    if-nez v0, :cond_0

    .line 290
    new-instance v0, Lcom/mongodb/util/JSONParseException;

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v2, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-direct {v0, v1, v2}, Lcom/mongodb/util/JSONParseException;-><init>(Ljava/lang/String;I)V

    throw v0

    .line 292
    :cond_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 293
    return-void
.end method

.method public readHex()V
    .locals 3

    .prologue
    .line 307
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_3

    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x39

    if-le v0, v1, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x41

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x46

    if-le v0, v1, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_3

    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x66

    if-gt v0, v1, :cond_3

    .line 311
    :cond_2
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    .line 316
    return-void

    .line 314
    :cond_3
    new-instance v0, Lcom/mongodb/util/JSONParseException;

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v2, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-direct {v0, v1, v2}, Lcom/mongodb/util/JSONParseException;-><init>(Ljava/lang/String;I)V

    throw v0
.end method

.method public skipWS()V
    .locals 2

    .prologue
    .line 333
    :goto_0
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    iget-object v1, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/mongodb/util/JSONParser;->s:Ljava/lang/String;

    iget v1, p0, Lcom/mongodb/util/JSONParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 334
    iget v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/mongodb/util/JSONParser;->pos:I

    goto :goto_0

    .line 336
    :cond_0
    return-void
.end method
