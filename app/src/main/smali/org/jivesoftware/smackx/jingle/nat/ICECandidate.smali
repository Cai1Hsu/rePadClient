.class public Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
.super Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.source "ICECandidate.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private channel:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

.field private id:Ljava/lang/String;

.field private network:I

.field private preference:I

.field private proto:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

.field private type:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

.field private username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>()V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "generation"    # I
    .param p3, "network"    # I
    .param p4, "password"    # Ljava/lang/String;
    .param p5, "port"    # I
    .param p6, "username"    # Ljava/lang/String;
    .param p7, "preference"    # I
    .param p8, "type"    # Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    .prologue
    .line 77
    invoke-direct {p0, p1, p5, p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>(Ljava/lang/String;II)V

    .line 79
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->UDP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->proto:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 80
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->channel:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    .line 82
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->network:I

    .line 83
    iput-object p4, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->password:Ljava/lang/String;

    .line 84
    iput-object p6, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->username:Ljava/lang/String;

    .line 85
    iput p7, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->preference:I

    .line 86
    iput-object p8, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->type:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    .line 87
    return-void
.end method

.method static synthetic access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-object v0
.end method


# virtual methods
.method public check(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 227
    .local p1, "localCandidates":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    move-object v1, p0

    .line 229
    .local v1, "checkingCandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;

    invoke-direct {v2, p0, v1, p1}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;Ljava/util/List;)V

    const-string/jumbo v3, "Transport candidate check"

    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 293
    .local v0, "checkThread":Ljava/lang/Thread;
    const-string/jumbo v2, "Transport candidate test"

    invoke-virtual {v0, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 294
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 295
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 34
    check-cast p1, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->compareTo(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;)I
    .locals 2
    .param p1, "arg"    # Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .prologue
    .line 408
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 409
    const/4 v0, -0x1

    .line 413
    :goto_0
    return v0

    .line 410
    :cond_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v1

    if-le v0, v1, :cond_1

    .line 411
    const/4 v0, 0x1

    goto :goto_0

    .line 413
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 303
    if-ne p0, p1, :cond_1

    .line 383
    :cond_0
    :goto_0
    return v1

    .line 306
    :cond_1
    invoke-super {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    move v1, v2

    .line 307
    goto :goto_0

    .line 309
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 310
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 313
    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 314
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getChannel()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    move-result-object v3

    if-nez v3, :cond_4

    .line 315
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getChannel()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    move-result-object v3

    if-eqz v3, :cond_5

    move v1, v2

    .line 316
    goto :goto_0

    .line 319
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getChannel()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getChannel()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 320
    goto :goto_0

    .line 322
    :cond_5
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_6

    .line 323
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getId()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    move v1, v2

    .line 324
    goto :goto_0

    .line 327
    :cond_6
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    move v1, v2

    .line 328
    goto :goto_0

    .line 330
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getNetwork()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getNetwork()I

    move-result v4

    if-eq v3, v4, :cond_8

    move v1, v2

    .line 331
    goto :goto_0

    .line 333
    :cond_8
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPassword()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_9

    .line 334
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPassword()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_a

    move v1, v2

    .line 335
    goto :goto_0

    .line 338
    :cond_9
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPassword()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->password:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    move v1, v2

    .line 339
    goto :goto_0

    .line 341
    :cond_a
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v4

    if-eq v3, v4, :cond_b

    move v1, v2

    .line 342
    goto/16 :goto_0

    .line 344
    :cond_b
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getProto()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    move-result-object v3

    if-nez v3, :cond_c

    .line 345
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getProto()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    move-result-object v3

    if-eqz v3, :cond_d

    move v1, v2

    .line 346
    goto/16 :goto_0

    .line 349
    :cond_c
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getProto()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getProto()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_d

    move v1, v2

    .line 350
    goto/16 :goto_0

    .line 352
    :cond_d
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getUsername()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_e

    .line 353
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getUsername()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_f

    move v1, v2

    .line 354
    goto/16 :goto_0

    .line 357
    :cond_e
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getUsername()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getUsername()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    move v1, v2

    .line 358
    goto/16 :goto_0

    .line 361
    :cond_f
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_10

    .line 362
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_11

    move v1, v2

    .line 363
    goto/16 :goto_0

    .line 366
    :cond_10
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getIp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    move v1, v2

    .line 367
    goto/16 :goto_0

    .line 370
    :cond_11
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPort()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPort()I

    move-result v4

    if-eq v3, v4, :cond_12

    move v1, v2

    .line 371
    goto/16 :goto_0

    .line 374
    :cond_12
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v3

    if-nez v3, :cond_13

    .line 375
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v3

    if-eqz v3, :cond_0

    move v1, v2

    .line 376
    goto/16 :goto_0

    .line 379
    :cond_13
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 380
    goto/16 :goto_0
.end method

.method public getChannel()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->channel:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getNetwork()I
    .locals 1

    .prologue
    .line 131
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->network:I

    return v0
.end method

.method public getPreference()I
    .locals 1

    .prologue
    .line 185
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->preference:I

    return v0
.end method

.method public getProto()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->proto:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    return-object v0
.end method

.method public getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->type:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->username:Ljava/lang/String;

    return-object v0
.end method

.method public isNull()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 387
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->isNull()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 396
    :cond_0
    :goto_0
    return v0

    .line 390
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getProto()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->isNull()Z

    move-result v1

    if-nez v1, :cond_0

    .line 393
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getChannel()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->isNull()Z

    move-result v1

    if-nez v1, :cond_0

    .line 396
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setChannel(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;)V
    .locals 0
    .param p1, "channel"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    .prologue
    .line 167
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->channel:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    .line 168
    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 104
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->id:Ljava/lang/String;

    .line 105
    return-void
.end method

.method public setNetwork(I)V
    .locals 0
    .param p1, "network"    # I

    .prologue
    .line 140
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->network:I

    .line 141
    return-void
.end method

.method public setPreference(I)V
    .locals 0
    .param p1, "preference"    # I

    .prologue
    .line 195
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->preference:I

    .line 196
    return-void
.end method

.method public setProto(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;)V
    .locals 0
    .param p1, "proto"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->proto:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 123
    return-void
.end method

.method public setType(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    .prologue
    .line 213
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->type:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    .line 214
    return-void
.end method

.method public setUsername(Ljava/lang/String;)V
    .locals 0
    .param p1, "username"    # Ljava/lang/String;

    .prologue
    .line 176
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->username:Ljava/lang/String;

    .line 177
    return-void
.end method
