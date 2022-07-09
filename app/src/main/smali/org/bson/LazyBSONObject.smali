.class public Lorg/bson/LazyBSONObject;
.super Ljava/lang/Object;
.source "LazyBSONObject.java"

# interfaces
.implements Lorg/bson/BSONObject;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/bson/LazyBSONObject$ReadOnlySet;,
        Lorg/bson/LazyBSONObject$LazyBSONEntrySet;,
        Lorg/bson/LazyBSONObject$LazyBSONEntryIterator;,
        Lorg/bson/LazyBSONObject$LazyBSONKeySet;,
        Lorg/bson/LazyBSONObject$LazyBSONKeyIterator;,
        Lorg/bson/LazyBSONObject$ElementRecord;
    }
.end annotation


# static fields
.field static final FIRST_ELMT_OFFSET:I = 0x4

.field private static final log:Ljava/util/logging/Logger;


# instance fields
.field protected final _callback:Lorg/bson/LazyBSONCallback;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _doc_start_offset:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected final _input:Lorg/bson/io/BSONByteBuffer;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 744
    const-string/jumbo v0, "org.bson.LazyBSONObject"

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lorg/bson/LazyBSONObject;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V
    .locals 0
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p3, p0, Lorg/bson/LazyBSONObject;->_callback:Lorg/bson/LazyBSONCallback;

    .line 64
    iput-object p1, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    .line 65
    iput p2, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "buffer"    # Lorg/bson/io/BSONByteBuffer;
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    .line 60
    return-void
.end method

.method public constructor <init>([BILorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 55
    array-length v0, p1

    sub-int/2addr v0, p2

    invoke-static {p1, p2, v0}, Lorg/bson/io/BSONByteBuffer;->wrap([BII)Lorg/bson/io/BSONByteBuffer;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;ILorg/bson/LazyBSONCallback;)V

    .line 56
    return-void
.end method

.method public constructor <init>([BLorg/bson/LazyBSONCallback;)V
    .locals 1
    .param p1, "data"    # [B
    .param p2, "callback"    # Lorg/bson/LazyBSONCallback;

    .prologue
    .line 51
    invoke-static {p1}, Lorg/bson/io/BSONByteBuffer;->wrap([B)Lorg/bson/io/BSONByteBuffer;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/bson/LazyBSONObject;-><init>(Lorg/bson/io/BSONByteBuffer;Lorg/bson/LazyBSONCallback;)V

    .line 52
    return-void
.end method

.method private getBSONSize(I)I
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 466
    iget-object v0, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v0

    return v0
.end method

.method private getElementFieldName(I)Ljava/lang/String;
    .locals 1
    .param p1, "offset"    # I

    .prologue
    .line 479
    iget-object v0, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private readBinary(I)Ljava/lang/Object;
    .locals 12
    .param p1, "valueOffset"    # I

    .prologue
    .line 642
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v9, p1}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v8

    .line 643
    .local v8, "totalLen":I
    add-int/lit8 p1, p1, 0x4

    .line 644
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v9, p1}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v0

    .line 645
    .local v0, "bType":B
    add-int/lit8 p1, p1, 0x1

    .line 648
    packed-switch v0, :pswitch_data_0

    .line 679
    :pswitch_0
    new-array v1, v8, [B

    .line 680
    .local v1, "bin":[B
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v8, :cond_2

    .line 681
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    add-int v10, p1, v3

    invoke-virtual {v9, v10}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v9

    aput-byte v9, v1, v3

    .line 680
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 650
    .end local v1    # "bin":[B
    .end local v3    # "n":I
    :pswitch_1
    new-array v1, v8, [B

    .line 651
    .restart local v1    # "bin":[B
    const/4 v3, 0x0

    .restart local v3    # "n":I
    :goto_1
    if-ge v3, v8, :cond_2

    .line 652
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    add-int v10, p1, v3

    invoke-virtual {v9, v10}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v9

    aput-byte v9, v1, v3

    .line 651
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 657
    .end local v1    # "bin":[B
    .end local v3    # "n":I
    :pswitch_2
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v9, p1}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v2

    .line 658
    .local v2, "len":I
    add-int/lit8 v9, v2, 0x4

    if-eq v9, v8, :cond_0

    .line 659
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Bad Data Size; Binary Subtype 2.  { actual len: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " expected totalLen: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, "}"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 662
    :cond_0
    add-int/lit8 p1, p1, 0x4

    .line 663
    new-array v1, v2, [B

    .line 664
    .restart local v1    # "bin":[B
    const/4 v3, 0x0

    .restart local v3    # "n":I
    :goto_2
    if-ge v3, v2, :cond_2

    .line 665
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    add-int v10, p1, v3

    invoke-virtual {v9, v10}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v9

    aput-byte v9, v1, v3

    .line 664
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 669
    .end local v1    # "bin":[B
    .end local v2    # "len":I
    .end local v3    # "n":I
    :pswitch_3
    const/16 v9, 0x10

    if-eq v8, v9, :cond_1

    .line 670
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "Bad Data Size; Binary Subtype 3 (UUID). { total length: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string/jumbo v11, " != 16"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 673
    :cond_1
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v9, p1}, Lorg/bson/io/BSONByteBuffer;->getLong(I)J

    move-result-wide v4

    .line 674
    .local v4, "part1":J
    add-int/lit8 p1, p1, 0x8

    .line 675
    iget-object v9, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v9, p1}, Lorg/bson/io/BSONByteBuffer;->getLong(I)J

    move-result-wide v6

    .line 676
    .local v6, "part2":J
    new-instance v1, Ljava/util/UUID;

    invoke-direct {v1, v4, v5, v6, v7}, Ljava/util/UUID;-><init>(JJ)V

    .line 683
    .end local v4    # "part1":J
    .end local v6    # "part2":J
    :cond_2
    return-object v1

    .line 648
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public containsField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 434
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 430
    invoke-virtual {p0, p1}, Lorg/bson/LazyBSONObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 450
    new-instance v0, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;

    invoke-direct {v0, p0}, Lorg/bson/LazyBSONObject$LazyBSONEntrySet;-><init>(Lorg/bson/LazyBSONObject;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 696
    if-ne p0, p1, :cond_0

    const/4 v1, 0x1

    .line 701
    :goto_0
    return v1

    .line 697
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 699
    check-cast v0, Lorg/bson/LazyBSONObject;

    .line 701
    .local v0, "that":Lorg/bson/LazyBSONObject;
    iget-object v1, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v1}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v1

    iget-object v2, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v2}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 366
    invoke-virtual {p0, p1}, Lorg/bson/LazyBSONObject;->getElement(Ljava/lang/String;)Lorg/bson/LazyBSONObject$ElementRecord;

    move-result-object v0

    .line 369
    .local v0, "element":Lorg/bson/LazyBSONObject$ElementRecord;
    if-nez v0, :cond_0

    .line 370
    const/4 v1, 0x0

    .line 373
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONObject;->getElementValue(Lorg/bson/LazyBSONObject$ElementRecord;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public getBSONSize()I
    .locals 1

    .prologue
    .line 470
    iget v0, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    invoke-direct {p0, v0}, Lorg/bson/LazyBSONObject;->getBSONSize(I)I

    move-result v0

    return v0
.end method

.method protected getBytes()[B
    .locals 1

    .prologue
    .line 691
    iget-object v0, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v0}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v0

    return-object v0
.end method

.method getElement(Ljava/lang/String;)Lorg/bson/LazyBSONObject$ElementRecord;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 383
    iget v4, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    add-int/lit8 v3, v4, 0x4

    .line 385
    .local v3, "offset":I
    :goto_0
    invoke-virtual {p0, v3}, Lorg/bson/LazyBSONObject;->isElementEmpty(I)Z

    move-result v4

    if-nez v4, :cond_1

    .line 386
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p0, v4}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v1

    .line 387
    .local v1, "fieldSize":I
    invoke-virtual {p0, v3}, Lorg/bson/LazyBSONObject;->getElementBSONSize(I)I

    move-result v0

    .line 388
    .local v0, "elementSize":I
    iget-object v4, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v4, v3}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v2

    .line 390
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 391
    new-instance v4, Lorg/bson/LazyBSONObject$ElementRecord;

    invoke-direct {v4, p0, v2, v3}, Lorg/bson/LazyBSONObject$ElementRecord;-><init>(Lorg/bson/LazyBSONObject;Ljava/lang/String;I)V

    .line 396
    .end local v0    # "elementSize":I
    .end local v1    # "fieldSize":I
    .end local v2    # "name":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 393
    .restart local v0    # "elementSize":I
    .restart local v1    # "fieldSize":I
    .restart local v2    # "name":Ljava/lang/String;
    :cond_0
    add-int v4, v1, v0

    add-int/2addr v3, v4

    .line 394
    goto :goto_0

    .line 396
    .end local v0    # "elementSize":I
    .end local v1    # "fieldSize":I
    .end local v2    # "name":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method protected getElementBSONSize(I)I
    .locals 10
    .param p1, "offset"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 495
    const/4 v6, 0x0

    .line 496
    .local v6, "x":I
    add-int/lit8 v1, p1, 0x1

    .end local p1    # "offset":I
    .local v1, "offset":I
    invoke-virtual {p0, p1}, Lorg/bson/LazyBSONObject;->getElementType(I)B

    move-result v4

    .line 497
    .local v4, "type":B
    invoke-virtual {p0, v1}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v0

    .line 498
    .local v0, "n":I
    add-int v5, v1, v0

    .line 499
    .local v5, "valueOffset":I
    sparse-switch v4, :sswitch_data_0

    .line 546
    new-instance v7, Lorg/bson/BSONException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "Invalid type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " for field "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-direct {p0, v1}, Lorg/bson/LazyBSONObject;->getElementFieldName(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 507
    :sswitch_0
    const/4 v6, 0x1

    .line 548
    :goto_0
    :sswitch_1
    return v6

    .line 510
    :sswitch_2
    const/4 v6, 0x4

    .line 511
    goto :goto_0

    .line 516
    :sswitch_3
    const/16 v6, 0x8

    .line 517
    goto :goto_0

    .line 519
    :sswitch_4
    const/16 v6, 0xc

    .line 520
    goto :goto_0

    .line 524
    :sswitch_5
    iget-object v7, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v7, v5}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v7

    add-int/lit8 v6, v7, 0x4

    .line 525
    goto :goto_0

    .line 527
    :sswitch_6
    iget-object v7, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v7, v5}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v6

    .line 528
    goto :goto_0

    .line 530
    :sswitch_7
    iget-object v7, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v7, v5}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x4

    add-int/lit8 v6, v7, 0xc

    .line 531
    goto :goto_0

    .line 534
    :sswitch_8
    iget-object v7, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v7, v5}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v6

    .line 535
    goto :goto_0

    .line 537
    :sswitch_9
    iget-object v7, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v7, v5}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x4

    add-int/lit8 v6, v7, 0x1

    .line 538
    goto :goto_0

    .line 541
    :sswitch_a
    invoke-virtual {p0, v5}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v2

    .line 542
    .local v2, "part1":I
    add-int v7, v5, v2

    invoke-virtual {p0, v7}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v3

    .line 543
    .local v3, "part2":I
    add-int v6, v2, v3

    .line 544
    goto :goto_0

    .line 499
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_1
        0x0 -> :sswitch_1
        0x1 -> :sswitch_3
        0x2 -> :sswitch_5
        0x3 -> :sswitch_8
        0x4 -> :sswitch_8
        0x5 -> :sswitch_9
        0x6 -> :sswitch_1
        0x7 -> :sswitch_4
        0x8 -> :sswitch_0
        0x9 -> :sswitch_3
        0xa -> :sswitch_1
        0xb -> :sswitch_a
        0xc -> :sswitch_7
        0xd -> :sswitch_5
        0xe -> :sswitch_5
        0xf -> :sswitch_6
        0x10 -> :sswitch_2
        0x11 -> :sswitch_3
        0x12 -> :sswitch_3
        0x7f -> :sswitch_1
    .end sparse-switch
.end method

.method protected getElementType(I)B
    .locals 1
    .param p1, "offset"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 487
    iget-object v0, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v0, p1}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v0

    return v0
.end method

.method protected getElementValue(Lorg/bson/LazyBSONObject$ElementRecord;)Ljava/lang/Object;
    .locals 19
    .param p1, "record"    # Lorg/bson/LazyBSONObject$ElementRecord;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 577
    move-object/from16 v0, p1

    iget-byte v14, v0, Lorg/bson/LazyBSONObject$ElementRecord;->type:B

    sparse-switch v14, :sswitch_data_0

    .line 636
    new-instance v14, Lorg/bson/BSONException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Invalid type "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    iget-byte v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->type:B

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " for field "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->offset:I

    move/from16 v16, v0

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1}, Lorg/bson/LazyBSONObject;->getElementFieldName(I)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 581
    :sswitch_0
    const/4 v14, 0x0

    .line 634
    :goto_0
    return-object v14

    .line 583
    :sswitch_1
    new-instance v14, Lorg/bson/types/MaxKey;

    invoke-direct {v14}, Lorg/bson/types/MaxKey;-><init>()V

    goto :goto_0

    .line 585
    :sswitch_2
    new-instance v14, Lorg/bson/types/MinKey;

    invoke-direct {v14}, Lorg/bson/types/MinKey;-><init>()V

    goto :goto_0

    .line 587
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v14

    if-eqz v14, :cond_0

    const/4 v14, 0x1

    :goto_1
    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    goto :goto_0

    :cond_0
    const/4 v14, 0x0

    goto :goto_1

    .line 589
    :sswitch_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    goto :goto_0

    .line 591
    :sswitch_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v5

    .line 592
    .local v5, "inc":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    add-int/lit8 v15, v15, 0x4

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v13

    .line 593
    .local v13, "time":I
    new-instance v14, Lorg/bson/types/BSONTimestamp;

    invoke-direct {v14, v13, v5}, Lorg/bson/types/BSONTimestamp;-><init>(II)V

    goto :goto_0

    .line 595
    .end local v5    # "inc":I
    .end local v13    # "time":I
    :sswitch_6
    new-instance v14, Ljava/util/Date;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lorg/bson/io/BSONByteBuffer;->getLong(I)J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-direct {v14, v0, v1}, Ljava/util/Date;-><init>(J)V

    goto :goto_0

    .line 597
    :sswitch_7
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getLong(I)J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    goto :goto_0

    .line 599
    :sswitch_8
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getLong(I)J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    goto/16 :goto_0

    .line 601
    :sswitch_9
    new-instance v14, Lorg/bson/types/ObjectId;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lorg/bson/io/BSONByteBuffer;->getIntBE(I)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v16, v0

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x4

    invoke-virtual/range {v16 .. v17}, Lorg/bson/io/BSONByteBuffer;->getIntBE(I)I

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x8

    invoke-virtual/range {v17 .. v18}, Lorg/bson/io/BSONByteBuffer;->getIntBE(I)I

    move-result v17

    invoke-direct/range {v14 .. v17}, Lorg/bson/types/ObjectId;-><init>(III)V

    goto/16 :goto_0

    .line 605
    :sswitch_a
    new-instance v14, Lorg/bson/types/Symbol;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lorg/bson/io/BSONByteBuffer;->getUTF8String(I)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/bson/types/Symbol;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 607
    :sswitch_b
    new-instance v14, Lorg/bson/types/Code;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lorg/bson/io/BSONByteBuffer;->getUTF8String(I)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Lorg/bson/types/Code;-><init>(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 609
    :sswitch_c
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getUTF8String(I)Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_0

    .line 611
    :sswitch_d
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    add-int/lit8 v15, v15, 0x4

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v12

    .line 612
    .local v12, "strsize":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    add-int/lit8 v15, v15, 0x4

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getUTF8String(I)Ljava/lang/String;

    move-result-object v2

    .line 613
    .local v2, "code":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_callback:Lorg/bson/LazyBSONCallback;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v15}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v15

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    add-int/lit8 v16, v16, 0x4

    add-int/lit8 v16, v16, 0x4

    add-int v16, v16, v12

    invoke-virtual/range {v14 .. v16}, Lorg/bson/LazyBSONCallback;->createObject([BI)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/bson/BSONObject;

    .line 615
    .local v11, "scope":Lorg/bson/BSONObject;
    new-instance v14, Lorg/bson/types/CodeWScope;

    invoke-direct {v14, v2, v11}, Lorg/bson/types/CodeWScope;-><init>(Ljava/lang/String;Lorg/bson/BSONObject;)V

    goto/16 :goto_0

    .line 617
    .end local v2    # "code":Ljava/lang/String;
    .end local v11    # "scope":Lorg/bson/BSONObject;
    .end local v12    # "strsize":I
    :sswitch_e
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getInt(I)I

    move-result v3

    .line 618
    .local v3, "csize":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    add-int/lit8 v15, v15, 0x4

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v6

    .line 619
    .local v6, "ns":Ljava/lang/String;
    move-object/from16 v0, p1

    iget v14, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    add-int/2addr v14, v3

    add-int/lit8 v8, v14, 0x4

    .line 620
    .local v8, "oidOffset":I
    new-instance v7, Lorg/bson/types/ObjectId;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v14, v8}, Lorg/bson/io/BSONByteBuffer;->getIntBE(I)I

    move-result v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    add-int/lit8 v16, v8, 0x4

    invoke-virtual/range {v15 .. v16}, Lorg/bson/io/BSONByteBuffer;->getIntBE(I)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v16, v0

    add-int/lit8 v17, v8, 0x8

    invoke-virtual/range {v16 .. v17}, Lorg/bson/io/BSONByteBuffer;->getIntBE(I)I

    move-result v16

    move/from16 v0, v16

    invoke-direct {v7, v14, v15, v0}, Lorg/bson/types/ObjectId;-><init>(III)V

    .line 623
    .local v7, "oid":Lorg/bson/types/ObjectId;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_callback:Lorg/bson/LazyBSONCallback;

    invoke-virtual {v14, v6, v7}, Lorg/bson/LazyBSONCallback;->createDBRef(Ljava/lang/String;Lorg/bson/types/ObjectId;)Ljava/lang/Object;

    move-result-object v14

    goto/16 :goto_0

    .line 625
    .end local v3    # "csize":I
    .end local v6    # "ns":Ljava/lang/String;
    .end local v7    # "oid":Lorg/bson/types/ObjectId;
    .end local v8    # "oidOffset":I
    :sswitch_f
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_callback:Lorg/bson/LazyBSONCallback;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v15}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v15

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lorg/bson/LazyBSONCallback;->createObject([BI)Ljava/lang/Object;

    move-result-object v14

    goto/16 :goto_0

    .line 627
    :sswitch_10
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_callback:Lorg/bson/LazyBSONCallback;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v15}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v15

    move-object/from16 v0, p1

    iget v0, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move/from16 v16, v0

    invoke-virtual/range {v14 .. v16}, Lorg/bson/LazyBSONCallback;->createArray([BI)Ljava/util/List;

    move-result-object v14

    goto/16 :goto_0

    .line 629
    :sswitch_11
    move-object/from16 v0, p1

    iget v14, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/bson/LazyBSONObject;->readBinary(I)Ljava/lang/Object;

    move-result-object v14

    goto/16 :goto_0

    .line 631
    :sswitch_12
    move-object/from16 v0, p1

    iget v14, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v10

    .line 632
    .local v10, "patternCStringSize":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v9

    .line 633
    .local v9, "pattern":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    move-object/from16 v0, p1

    iget v15, v0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    add-int/2addr v15, v10

    invoke-virtual {v14, v15}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v4

    .line 634
    .local v4, "flags":Ljava/lang/String;
    invoke-static {v4}, Lorg/bson/BSON;->regexFlags(Ljava/lang/String;)I

    move-result v14

    invoke-static {v9, v14}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v14

    goto/16 :goto_0

    .line 577
    nop

    :sswitch_data_0
    .sparse-switch
        -0x1 -> :sswitch_2
        0x0 -> :sswitch_0
        0x1 -> :sswitch_8
        0x2 -> :sswitch_c
        0x3 -> :sswitch_f
        0x4 -> :sswitch_10
        0x5 -> :sswitch_11
        0x6 -> :sswitch_0
        0x7 -> :sswitch_9
        0x8 -> :sswitch_3
        0x9 -> :sswitch_6
        0xa -> :sswitch_0
        0xb -> :sswitch_12
        0xc -> :sswitch_e
        0xd -> :sswitch_b
        0xe -> :sswitch_a
        0xf -> :sswitch_d
        0x10 -> :sswitch_4
        0x11 -> :sswitch_5
        0x12 -> :sswitch_7
        0x7f -> :sswitch_1
    .end sparse-switch
.end method

.method getElements()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/bson/LazyBSONObject$ElementRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 405
    iget v6, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    add-int/lit8 v4, v6, 0x4

    .line 406
    .local v4, "offset":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 408
    .local v1, "elements":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/bson/LazyBSONObject$ElementRecord;>;"
    :goto_0
    invoke-virtual {p0, v4}, Lorg/bson/LazyBSONObject;->isElementEmpty(I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 409
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {p0, v6}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v2

    .line 410
    .local v2, "fieldSize":I
    invoke-virtual {p0, v4}, Lorg/bson/LazyBSONObject;->getElementBSONSize(I)I

    move-result v0

    .line 411
    .local v0, "elementSize":I
    iget-object v6, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v6, v4}, Lorg/bson/io/BSONByteBuffer;->getCString(I)Ljava/lang/String;

    move-result-object v3

    .line 412
    .local v3, "name":Ljava/lang/String;
    new-instance v5, Lorg/bson/LazyBSONObject$ElementRecord;

    invoke-direct {v5, p0, v3, v4}, Lorg/bson/LazyBSONObject$ElementRecord;-><init>(Lorg/bson/LazyBSONObject;Ljava/lang/String;I)V

    .line 413
    .local v5, "rec":Lorg/bson/LazyBSONObject$ElementRecord;
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 414
    add-int v6, v2, v0

    add-int/2addr v4, v6

    .line 415
    goto :goto_0

    .line 417
    .end local v0    # "elementSize":I
    .end local v2    # "fieldSize":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "rec":Lorg/bson/LazyBSONObject$ElementRecord;
    :cond_0
    return-object v1
.end method

.method protected getOffset()I
    .locals 1

    .prologue
    .line 687
    iget v0, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 706
    iget-object v0, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v0}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method protected isElementEmpty(I)Z
    .locals 1
    .param p1, "offset"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 458
    invoke-virtual {p0, p1}, Lorg/bson/LazyBSONObject;->getElementType(I)B

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 462
    iget v0, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lorg/bson/LazyBSONObject;->isElementEmpty(I)Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 442
    new-instance v0, Lorg/bson/LazyBSONObject$LazyBSONKeySet;

    invoke-direct {v0, p0}, Lorg/bson/LazyBSONObject$LazyBSONKeySet;-><init>(Lorg/bson/LazyBSONObject;)V

    return-object v0
.end method

.method public pipe(Ljava/io/OutputStream;)I
    .locals 3
    .param p1, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 474
    iget-object v0, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v0}, Lorg/bson/io/BSONByteBuffer;->array()[B

    move-result-object v0

    iget v1, p0, Lorg/bson/LazyBSONObject;->_doc_start_offset:I

    invoke-virtual {p0}, Lorg/bson/LazyBSONObject;->getBSONSize()I

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 475
    invoke-virtual {p0}, Lorg/bson/LazyBSONObject;->getBSONSize()I

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 353
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Object is read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 361
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Object is read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 2
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 357
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Object is read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 425
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Object is read only"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected sizeCString(I)I
    .locals 3
    .param p1, "offset"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 561
    move v1, p1

    .line 563
    .local v1, "end":I
    :goto_0
    iget-object v2, p0, Lorg/bson/LazyBSONObject;->_input:Lorg/bson/io/BSONByteBuffer;

    invoke-virtual {v2, v1}, Lorg/bson/io/BSONByteBuffer;->get(I)B

    move-result v0

    .line 564
    .local v0, "b":B
    if-nez v0, :cond_0

    .line 569
    sub-int v2, v1, p1

    add-int/lit8 v2, v2, 0x1

    return v2

    .line 567
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 568
    goto :goto_0
.end method

.method public toMap()Ljava/util/Map;
    .locals 2

    .prologue
    .line 421
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string/jumbo v1, "Not Supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 715
    invoke-static {p0}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
