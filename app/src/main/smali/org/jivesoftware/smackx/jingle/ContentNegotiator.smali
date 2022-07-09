.class public Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
.super Lorg/jivesoftware/smackx/jingle/JingleNegotiator;
.source "ContentNegotiator.java"


# static fields
.field public static final INITIATOR:Ljava/lang/String; = "initiator"

.field public static final RESPONDER:Ljava/lang/String; = "responder"


# instance fields
.field private creator:Ljava/lang/String;

.field private jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

.field private jingleTransportManager:Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

.field private mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

.field private name:Ljava/lang/String;

.field private transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

.field private transportNegotiators:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "inCreator"    # Ljava/lang/String;
    .param p3, "inName"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .line 55
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->creator:Ljava/lang/String;

    .line 56
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->name:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transportNegotiators:Ljava/util/List;

    .line 58
    return-void
.end method

.method private triggerContentEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 10
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "rc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "lc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 273
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getSession()Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v5

    .line 274
    .local v5, "session":Lorg/jivesoftware/smackx/jingle/JingleSession;
    if-eqz v5, :cond_1

    .line 275
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getListenersList()Ljava/util/List;

    move-result-object v3

    .line 276
    .local v3, "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;

    .line 277
    .local v2, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v7, v2, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    if-eqz v7, :cond_0

    move-object v6, v2

    .line 278
    check-cast v6, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;

    .line 279
    .local v6, "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    invoke-interface {v6, p1, p2, p3, v5}, Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;->sessionEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    goto :goto_0

    .line 285
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "listeners":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;>;"
    .end local v6    # "sli":Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
    :cond_1
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getMediaManager()Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 286
    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->removeCandidateEcho()V

    .line 287
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->removeCandidateEcho()V

    .line 289
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getMediaManager()Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    move-result-object v7

    invoke-virtual {v7, p1, p2, p3, v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->createMediaSession(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    move-result-object v7

    iput-object v7, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    .line 290
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-virtual {v7, v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->addMediaReceivedListener(Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;)V

    .line 291
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    if-eqz v7, :cond_2

    .line 293
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->startTrasmit()V

    .line 294
    iget-object v7, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->startReceive()V

    .line 296
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getOfferedCandidates()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 297
    .local v0, "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->removeCandidateEcho()V

    goto :goto_1

    .line 299
    .end local v0    # "candidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getMediaManager()Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    move-result-object v4

    .line 300
    .local v4, "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getSession()Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v7

    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getName()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-virtual {v7, v8, v9}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addJingleMediaSession(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;)V

    .line 303
    .end local v4    # "mediaManager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    :cond_3
    return-void
.end method


# virtual methods
.method public addTransportNegotiator(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V
    .locals 1
    .param p1, "transportNegotiator"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transportNegotiators:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    return-void
.end method

.method public close()V
    .locals 0

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->destroyMediaNegotiator()V

    .line 154
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->destroyTransportNegotiator()V

    .line 155
    return-void
.end method

.method protected destroyMediaNegotiator()V
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->close()V

    .line 183
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    .line 185
    :cond_0
    return-void
.end method

.method protected destroyTransportNegotiator()V
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    if-eqz v0, :cond_0

    .line 212
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->close()V

    .line 213
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .line 215
    :cond_0
    return-void
.end method

.method public dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;
    .locals 6
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
    .line 61
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .local v3, "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 96
    :cond_0
    :goto_0
    return-object v3

    .line 70
    :cond_1
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 72
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->isExpectedId(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 73
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->removeExpectedId(Ljava/lang/String;)V

    goto :goto_0

    .line 75
    :cond_2
    instance-of v4, p1, Lorg/jivesoftware/smackx/packet/Jingle;

    if-eqz v4, :cond_0

    move-object v1, p1

    .line 76
    check-cast v1, Lorg/jivesoftware/smackx/packet/Jingle;

    .line 82
    .local v1, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/Jingle;->getContentsList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/JingleContent;

    .line 83
    .local v2, "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/JingleContent;->getName()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 84
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    if-eqz v4, :cond_4

    .line 85
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v4, p1, p2}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 88
    :cond_4
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    if-eqz v4, :cond_3

    .line 89
    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v4, p1, p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1
.end method

.method protected doStart()V
    .locals 3

    .prologue
    .line 138
    new-instance v0, Lorg/jivesoftware/smackx/packet/JingleContent;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->creator:Ljava/lang/String;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/packet/JingleContent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .local v0, "result":Lorg/jivesoftware/smackx/packet/JingleContent;
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->start()V

    .line 146
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->start()V

    .line 147
    return-void
.end method

.method public getCreator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->creator:Ljava/lang/String;

    return-object v0
.end method

.method public getJingleContent()Lorg/jivesoftware/smackx/packet/JingleContent;
    .locals 3

    .prologue
    .line 237
    new-instance v0, Lorg/jivesoftware/smackx/packet/JingleContent;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->creator:Ljava/lang/String;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/packet/JingleContent;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .local v0, "result":Lorg/jivesoftware/smackx/packet/JingleContent;
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    if-eqz v1, :cond_0

    .line 248
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getJingleDescription()Lorg/jivesoftware/smackx/packet/JingleDescription;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/JingleContent;->setDescription(Lorg/jivesoftware/smackx/packet/JingleDescription;)V

    .line 250
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    if-eqz v1, :cond_1

    .line 251
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getJingleTransport()Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    .line 254
    :cond_1
    return-object v0
.end method

.method public getJingleMediaSession()Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    return-object v0
.end method

.method public getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;
    .locals 1

    .prologue
    .line 163
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;
    .locals 3

    .prologue
    .line 321
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .line 323
    .local v0, "result":Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    if-eqz v1, :cond_3

    .line 325
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-ne v1, v2, :cond_1

    .line 327
    :cond_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .line 329
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-eq v1, v2, :cond_2

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-ne v1, v2, :cond_3

    .line 331
    :cond_2
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    .line 335
    :cond_3
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 337
    return-object v0
.end method

.method public getTransportManager()Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleTransportManager:Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    return-object v0
.end method

.method public getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    return-object v0
.end method

.method public isFullyEstablished()Z
    .locals 4

    .prologue
    .line 221
    const/4 v1, 0x1

    .line 223
    .local v1, "result":Z
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v0

    .line 224
    .local v0, "mediaNeg":Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->isFullyEstablished()Z

    move-result v3

    if-nez v3, :cond_1

    .line 225
    :cond_0
    const/4 v1, 0x0

    .line 228
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v2

    .line 229
    .local v2, "transNeg":Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    if-eqz v2, :cond_2

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->isFullyEstablished()Z

    move-result v3

    if-nez v3, :cond_3

    .line 230
    :cond_2
    const/4 v1, 0x0

    .line 233
    :cond_3
    return v1
.end method

.method public setJingleTransportManager(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 0
    .param p1, "jingleTransportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    .line 124
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleTransportManager:Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .line 125
    return-void
.end method

.method protected setMediaNegotiator(Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;)V
    .locals 0
    .param p1, "mediaNeg"    # Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    .prologue
    .line 173
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->destroyMediaNegotiator()V

    .line 174
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->mediaNeg:Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    .line 175
    return-void
.end method

.method protected setTransportNegotiator(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V
    .locals 0
    .param p1, "transNeg"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 203
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->destroyTransportNegotiator()V

    .line 204
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->transNeg:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .line 205
    return-void
.end method

.method public stopJingleMediaSession()V
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->stopTrasmit()V

    .line 312
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->jingleMediaSession:Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->stopReceive()V

    .line 314
    :cond_0
    return-void
.end method

.method public triggerContentEstablished()V
    .locals 4

    .prologue
    .line 259
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getMediaNegotiator()Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/media/MediaNegotiator;->getBestCommonAudioPt()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v1

    .line 260
    .local v1, "bestCommonAudioPt":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v2

    .line 261
    .local v2, "bestRemoteCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getTransportNegotiator()Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getAcceptedLocalCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    .line 264
    .local v0, "acceptedLocalCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-direct {p0, v1, v2, v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->triggerContentEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 265
    return-void
.end method
