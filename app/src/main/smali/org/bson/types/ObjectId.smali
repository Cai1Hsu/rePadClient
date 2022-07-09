.class public Lorg/bson/types/ObjectId;
.super Ljava/lang/Object;
.source "ObjectId.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/bson/types/ObjectId;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final LOGGER:Ljava/util/logging/Logger;

.field private static final _genmachine:I

.field private static _nextInc:Ljava/util/concurrent/atomic/AtomicInteger; = null

.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# instance fields
.field final _inc:I

.field final _machine:I

.field _new:Z

.field final _time:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .prologue
    .line 48
    const-string/jumbo v9, "org.bson.ObjectId"

    invoke-static {v9}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v9

    sput-object v9, Lorg/bson/types/ObjectId;->LOGGER:Ljava/util/logging/Logger;

    .line 537
    new-instance v9, Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v10, Ljava/util/Random;

    invoke-direct {v10}, Ljava/util/Random;-><init>()V

    invoke-virtual {v10}, Ljava/util/Random;->nextInt()I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v9, Lorg/bson/types/ObjectId;->_nextInc:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 547
    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 548
    .local v8, "sb":Ljava/lang/StringBuilder;
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v1

    .line 549
    .local v1, "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 550
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/net/NetworkInterface;

    .line 551
    .local v5, "ni":Ljava/net/NetworkInterface;
    invoke-virtual {v5}, Ljava/net/NetworkInterface;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 554
    .end local v1    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .end local v5    # "ni":Ljava/net/NetworkInterface;
    :catch_0
    move-exception v0

    .line 556
    .local v0, "e":Ljava/lang/Throwable;
    :try_start_1
    sget-object v9, Lorg/bson/types/ObjectId;->LOGGER:Ljava/util/logging/Logger;

    sget-object v10, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 557
    new-instance v9, Ljava/util/Random;

    invoke-direct {v9}, Ljava/util/Random;-><init>()V

    invoke-virtual {v9}, Ljava/util/Random;->nextInt()I

    move-result v9

    shl-int/lit8 v4, v9, 0x10

    .line 559
    .end local v0    # "e":Ljava/lang/Throwable;
    .local v4, "machinePiece":I
    :goto_1
    sget-object v9, Lorg/bson/types/ObjectId;->LOGGER:Ljava/util/logging/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "machine piece post: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 566
    new-instance v9, Ljava/util/Random;

    invoke-direct {v9}, Ljava/util/Random;-><init>()V

    invoke-virtual {v9}, Ljava/util/Random;->nextInt()I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result v6

    .line 568
    .local v6, "processId":I
    :try_start_2
    invoke-static {}, Ljava/lang/management/ManagementFactory;->getRuntimeMXBean()Ljava/lang/management/RuntimeMXBean;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/management/RuntimeMXBean;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-result v6

    .line 573
    :goto_2
    :try_start_3
    const-class v9, Lorg/bson/types/ObjectId;

    invoke-virtual {v9}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    .line 574
    .local v2, "loader":Ljava/lang/ClassLoader;
    if-eqz v2, :cond_1

    invoke-static {v2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    .line 576
    .local v3, "loaderId":I
    :goto_3
    new-instance v8, Ljava/lang/StringBuilder;

    .end local v8    # "sb":Ljava/lang/StringBuilder;
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 577
    .restart local v8    # "sb":Ljava/lang/StringBuilder;
    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v9

    const v10, 0xffff

    and-int v7, v9, v10

    .line 580
    .local v7, "processPiece":I
    sget-object v9, Lorg/bson/types/ObjectId;->LOGGER:Ljava/util/logging/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "process piece: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 583
    or-int v9, v4, v7

    sput v9, Lorg/bson/types/ObjectId;->_genmachine:I

    .line 584
    sget-object v9, Lorg/bson/types/ObjectId;->LOGGER:Ljava/util/logging/Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v11, "machine : "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget v11, Lorg/bson/types/ObjectId;->_genmachine:I

    invoke-static {v11}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 590
    return-void

    .line 553
    .end local v2    # "loader":Ljava/lang/ClassLoader;
    .end local v3    # "loaderId":I
    .end local v4    # "machinePiece":I
    .end local v6    # "processId":I
    .end local v7    # "processPiece":I
    .restart local v1    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    :cond_0
    :try_start_4
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    move-result v9

    shl-int/lit8 v4, v9, 0x10

    .restart local v4    # "machinePiece":I
    goto/16 :goto_1

    .line 574
    .end local v1    # "e":Ljava/util/Enumeration;, "Ljava/util/Enumeration<Ljava/net/NetworkInterface;>;"
    .restart local v2    # "loader":Ljava/lang/ClassLoader;
    .restart local v6    # "processId":I
    :cond_1
    const/4 v3, 0x0

    goto :goto_3

    .line 586
    .restart local v3    # "loaderId":I
    :catch_1
    move-exception v0

    .line 587
    .local v0, "e":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/RuntimeException;

    invoke-direct {v9, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v9

    .line 570
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "loader":Ljava/lang/ClassLoader;
    .end local v3    # "loaderId":I
    :catch_2
    move-exception v9

    goto/16 :goto_2
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    iput v0, p0, Lorg/bson/types/ObjectId;->_time:I

    .line 240
    sget v0, Lorg/bson/types/ObjectId;->_genmachine:I

    iput v0, p0, Lorg/bson/types/ObjectId;->_machine:I

    .line 241
    sget-object v0, Lorg/bson/types/ObjectId;->_nextInc:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    iput v0, p0, Lorg/bson/types/ObjectId;->_inc:I

    .line 242
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/bson/types/ObjectId;->_new:Z

    .line 243
    return-void
.end method

.method public constructor <init>(III)V
    .locals 1
    .param p1, "time"    # I
    .param p2, "machine"    # I
    .param p3, "inc"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    iput p1, p0, Lorg/bson/types/ObjectId;->_time:I

    .line 231
    iput p2, p0, Lorg/bson/types/ObjectId;->_machine:I

    .line 232
    iput p3, p0, Lorg/bson/types/ObjectId;->_inc:I

    .line 233
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/bson/types/ObjectId;->_new:Z

    .line 234
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 167
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/bson/types/ObjectId;-><init>(Ljava/lang/String;Z)V

    .line 168
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "babble"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    invoke-static {p1}, Lorg/bson/types/ObjectId;->isValid(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 181
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "invalid ObjectId ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 183
    :cond_0
    if-eqz p2, :cond_1

    .line 184
    invoke-static {p1}, Lorg/bson/types/ObjectId;->babbleToMongod(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 186
    :cond_1
    const/16 v3, 0xc

    new-array v0, v3, [B

    .line 187
    .local v0, "b":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v0

    if-ge v2, v3, :cond_2

    .line 188
    mul-int/lit8 v3, v2, 0x2

    mul-int/lit8 v4, v2, 0x2

    add-int/lit8 v4, v4, 0x2

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v0, v2

    .line 187
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 190
    :cond_2
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 191
    .local v1, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    iput v3, p0, Lorg/bson/types/ObjectId;->_time:I

    .line 192
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    iput v3, p0, Lorg/bson/types/ObjectId;->_machine:I

    .line 193
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v3

    iput v3, p0, Lorg/bson/types/ObjectId;->_inc:I

    .line 194
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/bson/types/ObjectId;->_new:Z

    .line 195
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 2
    .param p1, "time"    # Ljava/util/Date;

    .prologue
    .line 133
    sget v0, Lorg/bson/types/ObjectId;->_genmachine:I

    sget-object v1, Lorg/bson/types/ObjectId;->_nextInc:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Lorg/bson/types/ObjectId;-><init>(Ljava/util/Date;II)V

    .line 134
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;I)V
    .locals 1
    .param p1, "time"    # Ljava/util/Date;
    .param p2, "inc"    # I

    .prologue
    .line 137
    sget v0, Lorg/bson/types/ObjectId;->_genmachine:I

    invoke-direct {p0, p1, v0, p2}, Lorg/bson/types/ObjectId;-><init>(Ljava/util/Date;II)V

    .line 138
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;II)V
    .locals 4
    .param p1, "time"    # Ljava/util/Date;
    .param p2, "machine"    # I
    .param p3, "inc"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    iput v0, p0, Lorg/bson/types/ObjectId;->_time:I

    .line 157
    iput p2, p0, Lorg/bson/types/ObjectId;->_machine:I

    .line 158
    iput p3, p0, Lorg/bson/types/ObjectId;->_inc:I

    .line 159
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/bson/types/ObjectId;->_new:Z

    .line 160
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3
    .param p1, "b"    # [B

    .prologue
    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    array-length v1, p1

    const/16 v2, 0xc

    if-eq v1, v2, :cond_0

    .line 203
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "need 12 bytes"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 204
    :cond_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 205
    .local v0, "bb":Ljava/nio/ByteBuffer;
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/bson/types/ObjectId;->_time:I

    .line 206
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/bson/types/ObjectId;->_machine:I

    .line 207
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    iput v1, p0, Lorg/bson/types/ObjectId;->_inc:I

    .line 208
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/bson/types/ObjectId;->_new:Z

    .line 209
    return-void
.end method

.method public static _flip(I)I
    .locals 3
    .param p0, "x"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 529
    const/4 v0, 0x0

    .line 530
    .local v0, "z":I
    shl-int/lit8 v1, p0, 0x18

    const/high16 v2, -0x1000000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    .line 531
    shl-int/lit8 v1, p0, 0x8

    const/high16 v2, 0xff0000

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    .line 532
    shr-int/lit8 v1, p0, 0x8

    const v2, 0xff00

    and-int/2addr v1, v2

    or-int/2addr v0, v1

    .line 533
    shr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    .line 534
    return v0
.end method

.method static _pos(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "p"    # I

    .prologue
    .line 323
    mul-int/lit8 v0, p1, 0x2

    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v1, v1, 0x2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static babbleToMongod(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "b"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 331
    invoke-static {p0}, Lorg/bson/types/ObjectId;->isValid(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 332
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "invalid object id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 334
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x18

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 335
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/4 v1, 0x7

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 336
    invoke-static {p0, v1}, Lorg/bson/types/ObjectId;->_pos(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 335
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 337
    :cond_1
    const/16 v1, 0xb

    :goto_1
    const/16 v2, 0x8

    if-lt v1, v2, :cond_2

    .line 338
    invoke-static {p0, v1}, Lorg/bson/types/ObjectId;->_pos(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 337
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 340
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static createFromLegacyFormat(III)Lorg/bson/types/ObjectId;
    .locals 1
    .param p0, "time"    # I
    .param p1, "machine"    # I
    .param p2, "inc"    # I

    .prologue
    .line 77
    new-instance v0, Lorg/bson/types/ObjectId;

    invoke-direct {v0, p0, p1, p2}, Lorg/bson/types/ObjectId;-><init>(III)V

    return-object v0
.end method

.method public static get()Lorg/bson/types/ObjectId;
    .locals 1

    .prologue
    .line 54
    new-instance v0, Lorg/bson/types/ObjectId;

    invoke-direct {v0}, Lorg/bson/types/ObjectId;-><init>()V

    return-object v0
.end method

.method public static getCurrentCounter()I
    .locals 1

    .prologue
    .line 505
    sget-object v0, Lorg/bson/types/ObjectId;->_nextInc:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public static getCurrentInc()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 515
    sget-object v0, Lorg/bson/types/ObjectId;->_nextInc:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public static getGenMachineId()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 498
    sget v0, Lorg/bson/types/ObjectId;->_genmachine:I

    return v0
.end method

.method public static isValid(Ljava/lang/String;)Z
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 85
    if-nez p0, :cond_1

    .line 104
    :cond_0
    :goto_0
    return v3

    .line 88
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 89
    .local v2, "len":I
    const/16 v4, 0x18

    if-ne v2, v4, :cond_0

    .line 92
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_5

    .line 93
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 94
    .local v0, "c":C
    const/16 v4, 0x30

    if-lt v0, v4, :cond_3

    const/16 v4, 0x39

    if-gt v0, v4, :cond_3

    .line 92
    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 96
    :cond_3
    const/16 v4, 0x61

    if-lt v0, v4, :cond_4

    const/16 v4, 0x66

    if-le v0, v4, :cond_2

    .line 98
    :cond_4
    const/16 v4, 0x41

    if-lt v0, v4, :cond_0

    const/16 v4, 0x46

    if-gt v0, v4, :cond_0

    goto :goto_2

    .line 104
    .end local v0    # "c":C
    :cond_5
    const/4 v3, 0x1

    goto :goto_0
.end method

.method public static massageToObjectId(Ljava/lang/Object;)Lorg/bson/types/ObjectId;
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 117
    if-nez p0, :cond_0

    move-object p0, v1

    .line 129
    .end local p0    # "o":Ljava/lang/Object;
    .local v0, "s":Ljava/lang/String;
    :goto_0
    return-object p0

    .line 120
    .end local v0    # "s":Ljava/lang/String;
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Lorg/bson/types/ObjectId;

    if-eqz v2, :cond_1

    .line 121
    check-cast p0, Lorg/bson/types/ObjectId;

    goto :goto_0

    .line 123
    :cond_1
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 124
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 125
    .restart local v0    # "s":Ljava/lang/String;
    invoke-static {v0}, Lorg/bson/types/ObjectId;->isValid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 126
    new-instance p0, Lorg/bson/types/ObjectId;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lorg/bson/types/ObjectId;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .end local v0    # "s":Ljava/lang/String;
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_2
    move-object p0, v1

    .line 129
    goto :goto_0
.end method


# virtual methods
.method _compareUnsigned(II)I
    .locals 8
    .param p1, "i"    # I
    .param p2, "j"    # I

    .prologue
    .line 348
    const-wide v2, 0xffffffffL

    .line 349
    .local v2, "li":J
    int-to-long v6, p1

    and-long/2addr v2, v6

    .line 350
    const-wide v4, 0xffffffffL

    .line 351
    .local v4, "lj":J
    int-to-long v6, p2

    and-long/2addr v4, v6

    .line 352
    sub-long v0, v2, v4

    .line 353
    .local v0, "diff":J
    const-wide/32 v6, -0x80000000

    cmp-long v6, v0, v6

    if-gez v6, :cond_0

    .line 354
    const/high16 v6, -0x80000000

    .line 357
    :goto_0
    return v6

    .line 355
    :cond_0
    const-wide/32 v6, 0x7fffffff

    cmp-long v6, v0, v6

    if-lez v6, :cond_1

    .line 356
    const v6, 0x7fffffff

    goto :goto_0

    .line 357
    :cond_1
    long-to-int v6, v0

    goto :goto_0
.end method

.method public _inc()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 468
    iget v0, p0, Lorg/bson/types/ObjectId;->_inc:I

    return v0
.end method

.method public _machine()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 456
    iget v0, p0, Lorg/bson/types/ObjectId;->_machine:I

    return v0
.end method

.method public _time()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 432
    iget v0, p0, Lorg/bson/types/ObjectId;->_time:I

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 44
    check-cast p1, Lorg/bson/types/ObjectId;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/bson/types/ObjectId;->compareTo(Lorg/bson/types/ObjectId;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/bson/types/ObjectId;)I
    .locals 3
    .param p1, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 361
    if-nez p1, :cond_1

    .line 362
    const/4 v0, -0x1

    .line 372
    :cond_0
    :goto_0
    return v0

    .line 364
    :cond_1
    iget v1, p0, Lorg/bson/types/ObjectId;->_time:I

    iget v2, p1, Lorg/bson/types/ObjectId;->_time:I

    invoke-virtual {p0, v1, v2}, Lorg/bson/types/ObjectId;->_compareUnsigned(II)I

    move-result v0

    .line 365
    .local v0, "x":I
    if-nez v0, :cond_0

    .line 368
    iget v1, p0, Lorg/bson/types/ObjectId;->_machine:I

    iget v2, p1, Lorg/bson/types/ObjectId;->_machine:I

    invoke-virtual {p0, v1, v2}, Lorg/bson/types/ObjectId;->_compareUnsigned(II)I

    move-result v0

    .line 369
    if-nez v0, :cond_0

    .line 372
    iget v1, p0, Lorg/bson/types/ObjectId;->_inc:I

    iget v2, p1, Lorg/bson/types/ObjectId;->_inc:I

    invoke-virtual {p0, v1, v2}, Lorg/bson/types/ObjectId;->_compareUnsigned(II)I

    move-result v0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 254
    if-ne p0, p1, :cond_1

    .line 261
    :cond_0
    :goto_0
    return v1

    .line 257
    :cond_1
    invoke-static {p1}, Lorg/bson/types/ObjectId;->massageToObjectId(Ljava/lang/Object;)Lorg/bson/types/ObjectId;

    move-result-object v0

    .line 258
    .local v0, "other":Lorg/bson/types/ObjectId;
    if-nez v0, :cond_2

    move v1, v2

    .line 259
    goto :goto_0

    .line 261
    :cond_2
    iget v3, p0, Lorg/bson/types/ObjectId;->_time:I

    iget v4, v0, Lorg/bson/types/ObjectId;->_time:I

    if-ne v3, v4, :cond_3

    iget v3, p0, Lorg/bson/types/ObjectId;->_machine:I

    iget v4, v0, Lorg/bson/types/ObjectId;->_machine:I

    if-ne v3, v4, :cond_3

    iget v3, p0, Lorg/bson/types/ObjectId;->_inc:I

    iget v4, v0, Lorg/bson/types/ObjectId;->_inc:I

    if-eq v3, v4, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public getDate()Ljava/util/Date;
    .locals 6

    .prologue
    .line 390
    new-instance v0, Ljava/util/Date;

    iget v1, p0, Lorg/bson/types/ObjectId;->_time:I

    int-to-long v2, v1

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getInc()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 421
    iget v0, p0, Lorg/bson/types/ObjectId;->_inc:I

    return v0
.end method

.method public getMachine()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 444
    iget v0, p0, Lorg/bson/types/ObjectId;->_machine:I

    return v0
.end method

.method public getTime()J
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 400
    iget v0, p0, Lorg/bson/types/ObjectId;->_time:I

    int-to-long v0, v0

    const-wide/16 v2, 0x3e8

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method public getTimeSecond()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 409
    iget v0, p0, Lorg/bson/types/ObjectId;->_time:I

    return v0
.end method

.method public getTimestamp()I
    .locals 1

    .prologue
    .line 381
    iget v0, p0, Lorg/bson/types/ObjectId;->_time:I

    return v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 246
    iget v0, p0, Lorg/bson/types/ObjectId;->_time:I

    .line 247
    .local v0, "x":I
    iget v1, p0, Lorg/bson/types/ObjectId;->_machine:I

    mul-int/lit8 v1, v1, 0x6f

    add-int/2addr v0, v1

    .line 248
    iget v1, p0, Lorg/bson/types/ObjectId;->_inc:I

    mul-int/lit8 v1, v1, 0x11

    add-int/2addr v0, v1

    .line 249
    return v0
.end method

.method public isNew()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 477
    iget-boolean v0, p0, Lorg/bson/types/ObjectId;->_new:Z

    return v0
.end method

.method public notNew()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 486
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/bson/types/ObjectId;->_new:Z

    .line 487
    return-void
.end method

.method public toByteArray()[B
    .locals 3

    .prologue
    .line 313
    const/16 v2, 0xc

    new-array v0, v2, [B

    .line 314
    .local v0, "b":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 316
    .local v1, "bb":Ljava/nio/ByteBuffer;
    iget v2, p0, Lorg/bson/types/ObjectId;->_time:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 317
    iget v2, p0, Lorg/bson/types/ObjectId;->_machine:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 318
    iget v2, p0, Lorg/bson/types/ObjectId;->_inc:I

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 319
    return-object v0
.end method

.method public toHexString()Ljava/lang/String;
    .locals 9

    .prologue
    .line 281
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v5, 0x18

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 283
    .local v2, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/bson/types/ObjectId;->toByteArray()[B

    move-result-object v0

    .local v0, "arr$":[B
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_0

    aget-byte v1, v0, v3

    .line 284
    .local v1, "b":B
    const-string/jumbo v5, "%02x"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    and-int/lit16 v8, v1, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 287
    .end local v1    # "b":B
    :cond_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 344
    invoke-virtual {p0}, Lorg/bson/types/ObjectId;->toStringMongod()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringBabble()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 272
    invoke-virtual {p0}, Lorg/bson/types/ObjectId;->toStringMongod()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/bson/types/ObjectId;->babbleToMongod(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMongod()Ljava/lang/String;
    .locals 7
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 297
    invoke-virtual {p0}, Lorg/bson/types/ObjectId;->toByteArray()[B

    move-result-object v0

    .line 299
    .local v0, "b":[B
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v5, 0x18

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 301
    .local v1, "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v0

    if-ge v2, v5, :cond_1

    .line 302
    aget-byte v5, v0, v2

    and-int/lit16 v4, v5, 0xff

    .line 303
    .local v4, "x":I
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 304
    .local v3, "s":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 305
    const-string/jumbo v5, "0"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    :cond_0
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 309
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "x":I
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
