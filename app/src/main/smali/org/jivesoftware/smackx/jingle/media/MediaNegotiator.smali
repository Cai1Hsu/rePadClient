.class public Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;
.super Lorg/jivesoftware/smackx/jingle/JingleNegotiator;
.source "MediaNegotiator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator$1;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

.field private final localAudioPts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation
.end field

.field private final mediaManager:Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

.field private parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

.field private final remoteAudioPts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;Ljava/util/List;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "mediaManager"    # Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .param p4, "parentNegotiator"    # Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smackx/jingle/JingleSession;",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;",
            "Lorg/jivesoftware/smackx/jingle/ContentNegotiator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    .local p3, "pts":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->localAudioPts:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    .line 79
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->mediaManager:Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 80
    iput-object p4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 82
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 84
    if-eqz p3, :cond_0

    .line 85
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 86
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->localAudioPts:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 89
    :cond_0
    return-void
.end method

.method private calculateBestCommonAudioPt(Ljava/util/List;)Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;)",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;"
        }
    .end annotation

    .prologue
    .line 362
    .local p1, "remoteAudioPts":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 363
    .local v2, "commonAudioPtsHere":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 364
    .local v3, "commonAudioPtsThere":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    const/4 v7, 0x0

    .line 366
    .local v7, "result":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 367
    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->localAudioPts:Ljava/util/List;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 368
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->retainAll(Ljava/util/Collection;)Z

    .line 370
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 371
    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->localAudioPts:Ljava/util/List;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->retainAll(Ljava/util/Collection;)Z

    .line 373
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3

    .line 375
    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v8}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getInitiator()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v9

    invoke-virtual {v9}, Lorg/jivesoftware/smack/Connection;->getUser()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 376
    const/4 v0, 0x0

    .line 378
    .local v0, "bestPtHere":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->mediaManager:Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    invoke-virtual {v8}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v5

    .line 380
    .local v5, "payload":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    if-eqz v5, :cond_0

    instance-of v8, v5, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    if-eqz v8, :cond_0

    .line 381
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    move-object v0, v5

    .line 382
    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 384
    :cond_0
    if-nez v0, :cond_2

    .line 385
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 386
    .local v6, "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    instance-of v8, v6, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    if-eqz v8, :cond_1

    move-object v0, v6

    .line 387
    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 391
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v6    # "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :cond_2
    move-object v7, v0

    .line 405
    .end local v0    # "bestPtHere":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    .end local v5    # "payload":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :cond_3
    :goto_0
    return-object v7

    .line 393
    :cond_4
    const/4 v1, 0x0

    .line 394
    .local v1, "bestPtThere":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 395
    .restart local v6    # "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    instance-of v8, v6, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    if-eqz v8, :cond_5

    move-object v1, v6

    .line 396
    check-cast v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 400
    .end local v6    # "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :cond_6
    move-object v7, v1

    goto :goto_0
.end method

.method private createAudioPayloadTypesOffer()Lorg/jivesoftware/smackx/packet/Jingle;
    .locals 5

    .prologue
    .line 429
    new-instance v2, Lorg/jivesoftware/smackx/packet/JingleContent;

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getCreator()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/jivesoftware/smackx/packet/JingleContent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    .local v2, "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    new-instance v0, Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;-><init>()V

    .line 435
    .local v0, "audioDescr":Lorg/jivesoftware/smackx/packet/JingleDescription;
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->localAudioPts:Ljava/util/List;

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/packet/JingleDescription;->addAudioPayloadTypes(Ljava/util/List;)V

    .line 436
    invoke-virtual {v2, v0}, Lorg/jivesoftware/smackx/packet/JingleContent;->setDescription(Lorg/jivesoftware/smackx/packet/JingleDescription;)V

    .line 438
    new-instance v1, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v3, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v1, v3}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 439
    .local v1, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    .line 441
    return-object v1
.end method

.method private receiveContentAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 5
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p2, "description"    # Lorg/jivesoftware/smackx/packet/JingleDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 207
    const/4 v1, 0x0

    .line 208
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 210
    .local v0, "offeredPayloads":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getAudioPayloadTypesList()Ljava/util/List;

    move-result-object v0

    .line 211
    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->calculateBestCommonAudioPt(Ljava/util/List;)Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 213
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-nez v2, :cond_0

    .line 215
    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 216
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    sget-object v3, Lorg/jivesoftware/smackx/packet/JingleError;->NEGOTIATION_ERROR:Lorg/jivesoftware/smackx/packet/JingleError;

    invoke-virtual {v2, p1, v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createJingleError(Lorg/jivesoftware/smack/packet/IQ;Lorg/jivesoftware/smackx/packet/JingleError;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v1

    .line 227
    :goto_0
    return-object v1

    .line 220
    :cond_0
    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 221
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->triggerMediaEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 222
    sget-object v2, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Media choice:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 224
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v2, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v1

    goto :goto_0
.end method

.method private receiveResult(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smackx/packet/Jingle;
    .locals 1
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 180
    const/4 v0, 0x0

    .line 193
    .local v0, "response":Lorg/jivesoftware/smackx/packet/Jingle;
    return-object v0
.end method

.method private receiveSessionAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 5
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p2, "description"    # Lorg/jivesoftware/smackx/packet/JingleDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smackx/jingle/JingleException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 311
    const/4 v2, 0x0

    .line 313
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 315
    .local v1, "offeredPayloads":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-nez v3, :cond_0

    .line 317
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    invoke-direct {p0, v3}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->calculateBestCommonAudioPt(Ljava/util/List;)Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v3

    iput-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 321
    :cond_0
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getAudioPayloadTypesList()Ljava/util/List;

    move-result-object v1

    .line 322
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    .line 323
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v4, :cond_1

    .line 324
    const/4 v3, 0x0

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 325
    .local v0, "agreedCommonAudioPt":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v3, :cond_2

    .line 328
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 329
    new-instance v3, Lorg/jivesoftware/smackx/jingle/JingleException;

    sget-object v4, Lorg/jivesoftware/smackx/packet/JingleError;->NEGOTIATION_ERROR:Lorg/jivesoftware/smackx/packet/JingleError;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smackx/jingle/JingleException;-><init>(Lorg/jivesoftware/smackx/packet/JingleError;)V

    throw v3

    .line 333
    .end local v0    # "agreedCommonAudioPt":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-le v3, v4, :cond_2

    .line 334
    new-instance v3, Lorg/jivesoftware/smackx/jingle/JingleException;

    sget-object v4, Lorg/jivesoftware/smackx/packet/JingleError;->MALFORMED_STANZA:Lorg/jivesoftware/smackx/packet/JingleError;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smackx/jingle/JingleException;-><init>(Lorg/jivesoftware/smackx/packet/JingleError;)V

    throw v3

    .line 338
    :cond_2
    return-object v2
.end method

.method private receiveSessionInfoAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 6
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p2, "description"    # Lorg/jivesoftware/smackx/packet/JingleDescription;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smackx/jingle/JingleException;
        }
    .end annotation

    .prologue
    .line 271
    const/4 v3, 0x0

    .line 272
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 274
    .local v1, "oldBestCommonAudioPt":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    const/4 v2, 0x0

    .line 276
    .local v2, "ptChange":Z
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getAudioPayloadTypesList()Ljava/util/List;

    move-result-object v0

    .line 277
    .local v0, "offeredPayloads":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 279
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    monitor-enter v5

    .line 280
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->clear()V

    .line 281
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 282
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 285
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->calculateBestCommonAudioPt(Ljava/util/List;)Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v4

    iput-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 286
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v4, :cond_2

    .line 288
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v4, v1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v2, 0x1

    .line 289
    :goto_0
    if-eqz v1, :cond_0

    if-eqz v2, :cond_0

    .line 298
    :cond_0
    return-object v3

    .line 282
    :catchall_0
    move-exception v4

    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v4

    .line 288
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 293
    :cond_2
    new-instance v4, Lorg/jivesoftware/smackx/jingle/JingleException;

    sget-object v5, Lorg/jivesoftware/smackx/packet/JingleError;->NO_COMMON_PAYLOAD:Lorg/jivesoftware/smackx/packet/JingleError;

    invoke-direct {v4, v5}, Lorg/jivesoftware/smackx/jingle/JingleException;-><init>(Lorg/jivesoftware/smackx/packet/JingleError;)V

    throw v4
.end method

.method private receiveSessionInitiateAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 4
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .param p2, "description"    # Lorg/jivesoftware/smackx/packet/JingleDescription;

    .prologue
    .line 237
    const/4 v1, 0x0

    .line 239
    .local v1, "response":Lorg/jivesoftware/smack/packet/IQ;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 241
    .local v0, "offeredPayloads":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getAudioPayloadTypesList()Ljava/util/List;

    move-result-object v0

    .line 242
    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->calculateBestCommonAudioPt(Ljava/util/List;)Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v2

    iput-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 244
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    monitor-enter v3

    .line 245
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 246
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v2, :cond_0

    .line 252
    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 258
    :goto_0
    return-object v1

    .line 246
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 255
    :cond_0
    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    goto :goto_0
.end method


# virtual methods
.method public addRemoteAudioPayloadType(Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;)V
    .locals 2
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .prologue
    .line 415
    if-eqz p1, :cond_0

    .line 416
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    monitor-enter v1

    .line 417
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->remoteAudioPts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 418
    monitor-exit v1

    .line 420
    :cond_0
    return-void

    .line 418
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 518
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->close()V

    .line 519
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->triggerMediaClosed(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 520
    return-void
.end method

.method public dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;
    .locals 9
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .param p2, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/packet/IQ;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/IQ;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 109
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .local v6, "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    const/4 v5, 0x0

    .line 112
    .local v5, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v7

    sget-object v8, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 114
    sget-object v7, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 115
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->triggerMediaClosed(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 117
    new-instance v7, Lorg/jivesoftware/smackx/jingle/JingleException;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v8

    invoke-virtual {v8}, Lorg/jivesoftware/smack/packet/XMPPError;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/jivesoftware/smackx/jingle/JingleException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 118
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v7

    sget-object v8, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 120
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->isExpectedId(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 121
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->receiveResult(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smackx/packet/Jingle;

    .line 122
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->removeExpectedId(Ljava/lang/String;)V

    .line 168
    :cond_1
    if-eqz v5, :cond_2

    .line 169
    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->addExpectedId(Ljava/lang/String;)V

    .line 170
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    :cond_2
    return-object v6

    .line 124
    :cond_3
    instance-of v7, p1, Lorg/jivesoftware/smackx/packet/Jingle;

    if-eqz v7, :cond_1

    move-object v3, p1

    .line 125
    check-cast v3, Lorg/jivesoftware/smackx/packet/Jingle;

    .line 126
    .local v3, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/Jingle;->getAction()Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v0

    .line 129
    .local v0, "action":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/Jingle;->getContentsList()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_0
    :pswitch_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/JingleContent;

    .line 130
    .local v4, "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/JingleContent;->getName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    invoke-virtual {v8}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 132
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/JingleContent;->getDescription()Lorg/jivesoftware/smackx/packet/JingleDescription;

    move-result-object v1

    .line 134
    .local v1, "description":Lorg/jivesoftware/smackx/packet/JingleDescription;
    if-eqz v1, :cond_4

    .line 136
    sget-object v7, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator$1;->$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum:[I

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    goto :goto_0

    .line 138
    :pswitch_1
    invoke-direct {p0, v3, v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->receiveContentAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v5

    .line 139
    goto :goto_0

    .line 148
    :pswitch_2
    invoke-direct {p0, v3, v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->receiveSessionInfoAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v5

    .line 149
    goto :goto_0

    .line 152
    :pswitch_3
    invoke-direct {p0, v3, v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->receiveSessionInitiateAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v5

    .line 153
    goto :goto_0

    .line 156
    :pswitch_4
    invoke-direct {p0, v3, v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->receiveSessionAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;Lorg/jivesoftware/smackx/packet/JingleDescription;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v5

    .line 157
    goto :goto_0

    .line 136
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected doStart()V
    .locals 0

    .prologue
    .line 512
    return-void
.end method

.method public getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 1

    .prologue
    .line 469
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->bestCommonAudioPt:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    return-object v0
.end method

.method public getJingleDescription()Lorg/jivesoftware/smackx/packet/JingleDescription;
    .locals 3

    .prologue
    .line 526
    const/4 v1, 0x0

    .line 527
    .local v1, "result":Lorg/jivesoftware/smackx/packet/JingleDescription;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v0

    .line 528
    .local v0, "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    if-eqz v0, :cond_0

    .line 529
    new-instance v1, Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;

    .end local v1    # "result":Lorg/jivesoftware/smackx/packet/JingleDescription;
    invoke-direct {v1, v0}, Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 535
    .restart local v1    # "result":Lorg/jivesoftware/smackx/packet/JingleDescription;
    :goto_0
    return-object v1

    .line 532
    :cond_0
    new-instance v1, Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;

    .end local v1    # "result":Lorg/jivesoftware/smackx/packet/JingleDescription;
    invoke-direct {v1}, Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;-><init>()V

    .line 533
    .restart local v1    # "result":Lorg/jivesoftware/smackx/packet/JingleDescription;
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->localAudioPts:Ljava/util/List;

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/packet/JingleDescription;->addAudioPayloadTypes(Ljava/util/List;)V

    goto :goto_0
.end method

.method public getMediaManager()Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->mediaManager:Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    return-object v0
.end method

.method public isEstablished()Z
    .locals 1

    .prologue
    .line 347
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFullyEstablished()Z
    .locals 2

    .prologue
    .line 356
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->isEstablished()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected triggerMediaClosed(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 5
    .param p1, "currPt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 497
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getListenersList()Ljava/util/List;

    move-result-object v2

    .line 498
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .line 499
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 500
    check-cast v3, Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;

    .line 501
    .local v3, "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;
    invoke-interface {v3, p1}, Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;->mediaClosed(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    goto :goto_0

    .line 504
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;
    :cond_1
    return-void
.end method

.method protected triggerMediaEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 5
    .param p1, "bestPt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 481
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getListenersList()Ljava/util/List;

    move-result-object v2

    .line 482
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .line 483
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 484
    check-cast v3, Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;

    .line 485
    .local v3, "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;
    invoke-interface {v3, p1}, Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;->mediaEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    goto :goto_0

    .line 488
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleMediaListener;
    :cond_1
    return-void
.end method
