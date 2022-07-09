.class public abstract Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
.super Lorg/jivesoftware/smackx/jingle/JingleNegotiator;
.source "TransportNegotiator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$4;,
        Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;,
        Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$RawUdp;
    }
.end annotation


# static fields
.field public static final CANDIDATES_ACCEPT_PERIOD:I = 0xfa0

.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private acceptedLocalCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

.field private final acceptedRemoteCandidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation
.end field

.field private final offeredCandidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation
.end field

.field private parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

.field private final remoteCandidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation
.end field

.field private final resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

.field private resolverListener:Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

.field private resultThread:Ljava/lang/Thread;

.field private final validRemoteCandidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "transResolver"    # Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .param p3, "parentNegotiator"    # Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .prologue
    .line 97
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->remoteCandidates:Ljava/util/List;

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->validRemoteCandidates:Ljava/util/List;

    .line 77
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->acceptedRemoteCandidates:Ljava/util/List;

    .line 99
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    .line 100
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 102
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resultThread:Ljava/lang/Thread;

    .line 103
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->addValidRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->acceptedRemoteCandidates:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->isEstablished()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p2, "x2"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->triggerTransportEstablished(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    return-void
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->remoteCandidates:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$700(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object v0
.end method

.method static synthetic access$800(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->sendTransportCandidateOffer(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    return-void
.end method

.method static synthetic access$900()Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-object v0
.end method

.method private addOfferedCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 2
    .param p1, "rc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 235
    if-eqz p1, :cond_0

    .line 236
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    monitor-enter v1

    .line 237
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    monitor-exit v1

    .line 240
    :cond_0
    return-void

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private addRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 2
    .param p1, "rc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 216
    if-eqz p1, :cond_0

    .line 217
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    invoke-virtual {p0, p1, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->acceptableTransportCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 218
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->remoteCandidates:Ljava/util/List;

    monitor-enter v1

    .line 219
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->remoteCandidates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 223
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->checkRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 226
    :cond_0
    return-void

    .line 220
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private addRemoteCandidates(Ljava/util/List;)V
    .locals 3
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
    .line 475
    .local p1, "rc":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    if-eqz p1, :cond_0

    .line 476
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 477
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 478
    .local v0, "aRc":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->addRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_0

    .line 482
    .end local v0    # "aRc":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private addValidRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 4
    .param p1, "remoteCandidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 439
    if-eqz p1, :cond_0

    .line 440
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->validRemoteCandidates:Ljava/util/List;

    monitor-enter v1

    .line 441
    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Added valid candidate: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 442
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->validRemoteCandidates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 443
    monitor-exit v1

    .line 445
    :cond_0
    return-void

    .line 443
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private checkRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 1
    .param p1, "offeredCandidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 248
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->addListener(Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;)V

    .line 260
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidatesList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->check(Ljava/util/List;)V

    .line 261
    return-void
.end method

.method private delayedCheckBestCandidate(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)V
    .locals 3
    .param p1, "js"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "jin"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 292
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resultThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getRemoteCandidates()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 293
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;

    invoke-direct {v1, p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$2;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)V

    const-string/jumbo v2, "Waiting for all the transport candidates checks..."

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resultThread:Ljava/lang/Thread;

    .line 426
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resultThread:Ljava/lang/Thread;

    const-string/jumbo v1, "Transport Resolver Result"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 427
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resultThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 429
    :cond_0
    return-void
.end method

.method private getRemoteCandidates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 205
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->remoteCandidates:Ljava/util/List;

    return-object v0
.end method

.method private isEstablished()Z
    .locals 1

    .prologue
    .line 269
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getAcceptedLocalCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isOfferStarted()Z
    .locals 1

    .prologue
    .line 510
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->isResolving()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->isResolved()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private obtainCandidatesList(Lorg/jivesoftware/smackx/packet/Jingle;)Ljava/util/List;
    .locals 10
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smackx/packet/Jingle;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 490
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 492
    .local v6, "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    if-eqz p1, :cond_2

    .line 494
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/Jingle;->getContentsList()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/packet/JingleContent;

    .line 495
    .local v3, "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/JingleContent;->getName()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    invoke-virtual {v9}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 496
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/JingleContent;->getJingleTransportsList()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/JingleTransport;

    .line 497
    .local v4, "jingleTransport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/JingleTransport;->getCandidatesList()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;

    .line 498
    .local v5, "jingleTransportCandidate":Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;->getMediaTransport()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v7

    .line 499
    .local v7, "transCand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 506
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "jingleContent":Lorg/jivesoftware/smackx/packet/JingleContent;
    .end local v4    # "jingleTransport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    .end local v5    # "jingleTransportCandidate":Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
    .end local v7    # "transCand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_2
    return-object v6
.end method

.method private receiveContentAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 7
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 727
    const/4 v3, 0x0

    .line 730
    .local v3, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->obtainCandidatesList(Lorg/jivesoftware/smackx/packet/Jingle;)Ljava/util/List;

    move-result-object v0

    .line 731
    .local v0, "accepted":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 733
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 734
    .local v1, "cand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    sget-object v4, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Remote acccepted candidate addr: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 737
    .end local v1    # "cand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_0
    const/4 v4, 0x0

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 738
    .restart local v1    # "cand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setAcceptedLocalCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 740
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->isEstablished()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 741
    sget-object v4, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " is set active"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 745
    .end local v1    # "cand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    return-object v3
.end method

.method private receiveResult(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smackx/packet/Jingle;
    .locals 2
    .param p1, "iq"    # Lorg/jivesoftware/smack/packet/IQ;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 653
    const/4 v0, 0x0

    .line 655
    .local v0, "response":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->sendTransportCandidatesOffer()V

    .line 656
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 658
    return-object v0
.end method

.method private receiveSessionAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 3
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;

    .prologue
    .line 753
    const/4 v0, 0x0

    .line 755
    .local v0, "response":Lorg/jivesoftware/smack/packet/IQ;
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "Transport stabilished"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 760
    return-object v0
.end method

.method private receiveSessionInitiateAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 2
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 667
    const/4 v0, 0x0

    .line 673
    .local v0, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->sendTransportCandidatesOffer()V

    .line 677
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-direct {p0, v1, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->delayedCheckBestCandidate(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)V

    .line 680
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 682
    return-object v0
.end method

.method private receiveTransportInfoAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 2
    .param p1, "jingle"    # Lorg/jivesoftware/smackx/packet/Jingle;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 691
    const/4 v0, 0x0

    .line 707
    .local v0, "response":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->obtainCandidatesList(Lorg/jivesoftware/smackx/packet/Jingle;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->addRemoteCandidates(Ljava/util/List;)V

    .line 711
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-direct {p0, v1, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->delayedCheckBestCandidate(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/packet/Jingle;)V

    .line 713
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->createAck(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v0

    .line 715
    return-object v0
.end method

.method private declared-synchronized sendTransportCandidateOffer(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 3
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 519
    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->isNull()Z

    move-result v2

    if-nez v2, :cond_0

    .line 521
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->addOfferedCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 522
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->parentNegotiator:Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getJingleContent()Lorg/jivesoftware/smackx/packet/JingleContent;

    move-result-object v0

    .line 523
    .local v0, "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getJingleTransport(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    .line 524
    new-instance v1, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->TRANSPORT_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 525
    .local v1, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    .line 530
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendFormattedJingle(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smackx/packet/Jingle;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 532
    .end local v0    # "content":Lorg/jivesoftware/smackx/packet/JingleContent;
    .end local v1    # "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    :cond_0
    monitor-exit p0

    return-void

    .line 519
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private sendTransportCandidatesOffer()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 540
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidatesList()Ljava/util/List;

    move-result-object v2

    .line 542
    .local v2, "notOffered":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 545
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 546
    .local v0, "aNotOffered":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .end local v0    # "aNotOffered":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->sendTransportCandidateOffer(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_0

    .line 550
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolverListener:Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    if-nez v3, :cond_1

    .line 552
    new-instance v3, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$3;

    invoke-direct {v3, p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$3;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;)V

    iput-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolverListener:Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    .line 564
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolverListener:Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->addListener(Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;)V

    .line 567
    :cond_1
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->isResolving()Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->isResolved()Z

    move-result v3

    if-nez v3, :cond_2

    .line 569
    sget-object v3, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v4, "RESOLVER CALLED"

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 570
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->session:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolve(Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 572
    :cond_2
    return-void
.end method

.method private setAcceptedLocalCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 4
    .param p1, "bestLocalCandidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidateCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 139
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidate(I)Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidate(I)Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v1

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 141
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidate(I)Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->acceptedLocalCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 147
    :goto_1
    return-void

    .line 137
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 145
    :cond_1
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "BEST: ip="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " port="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " has not been offered."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private triggerTransportClosed(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 5
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 787
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getListenersList()Ljava/util/List;

    move-result-object v2

    .line 788
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

    .line 789
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 790
    check-cast v3, Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;

    .line 791
    .local v3, "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;
    invoke-interface {v3, p1}, Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;->transportClosed(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_0

    .line 794
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;
    :cond_1
    return-void
.end method

.method private triggerTransportEstablished(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 7
    .param p1, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 770
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getListenersList()Ljava/util/List;

    move-result-object v2

    .line 771
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

    .line 772
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;

    if-eqz v4, :cond_0

    move-object v3, v1

    .line 773
    check-cast v3, Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;

    .line 774
    .local v3, "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;
    sget-object v4, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "triggerTransportEstablished "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " <-> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 776
    invoke-interface {v3, p1, p2}, Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;->transportEstablished(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_0

    .line 779
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;
    .end local v3    # "mli":Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;
    :cond_1
    return-void
.end method


# virtual methods
.method public abstract acceptableTransportCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/util/List;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;)Z"
        }
    .end annotation
.end method

.method public close()V
    .locals 0

    .prologue
    .line 177
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/JingleNegotiator;->close()V

    .line 179
    return-void
.end method

.method public final dispatchIncomingPacket(Lorg/jivesoftware/smack/packet/IQ;Ljava/lang/String;)Ljava/util/List;
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
    .line 584
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 585
    .local v3, "responses":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/IQ;>;"
    const/4 v2, 0x0

    .line 587
    .local v2, "response":Lorg/jivesoftware/smack/packet/IQ;
    if-eqz p1, :cond_1

    .line 588
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 590
    sget-object v4, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->FAILED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V

    .line 591
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->triggerTransportClosed(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 593
    new-instance v4, Lorg/jivesoftware/smackx/jingle/JingleException;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jivesoftware/smack/packet/XMPPError;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jivesoftware/smackx/jingle/JingleException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 594
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getType()Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v4

    sget-object v5, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 596
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->isExpectedId(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 597
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->receiveResult(Lorg/jivesoftware/smack/packet/IQ;)Lorg/jivesoftware/smackx/packet/Jingle;

    move-result-object v2

    .line 598
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->removeExpectedId(Ljava/lang/String;)V

    .line 637
    :cond_1
    :goto_0
    :pswitch_0
    if-eqz v2, :cond_2

    .line 638
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/IQ;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->addExpectedId(Ljava/lang/String;)V

    .line 639
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 642
    :cond_2
    return-object v3

    .line 600
    :cond_3
    instance-of v4, p1, Lorg/jivesoftware/smackx/packet/Jingle;

    if-eqz v4, :cond_1

    move-object v1, p1

    .line 602
    check-cast v1, Lorg/jivesoftware/smackx/packet/Jingle;

    .line 603
    .local v1, "jingle":Lorg/jivesoftware/smackx/packet/Jingle;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/Jingle;->getAction()Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v0

    .line 605
    .local v0, "action":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    sget-object v4, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$4;->$SwitchMap$org$jivesoftware$smackx$jingle$JingleActionEnum:[I

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 607
    :pswitch_1
    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->receiveContentAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v2

    .line 608
    goto :goto_0

    .line 620
    :pswitch_2
    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->receiveSessionInitiateAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v2

    .line 621
    goto :goto_0

    .line 624
    :pswitch_3
    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->receiveSessionAcceptAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v2

    .line 625
    goto :goto_0

    .line 628
    :pswitch_4
    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->receiveTransportInfoAction(Lorg/jivesoftware/smackx/packet/Jingle;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v2

    .line 629
    goto :goto_0

    .line 605
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected doStart()V
    .locals 2

    .prologue
    .line 164
    :try_start_0
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->sendTransportCandidatesOffer()V

    .line 165
    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->setNegotiatorState(Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    :goto_0
    return-void

    .line 166
    :catch_0
    move-exception v0

    .line 168
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method

.method public getAcceptedLocalCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->acceptedLocalCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    return-object v0
.end method

.method public final getBestLocalCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->resolver:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getPreferredCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    return-object v0
.end method

.method public abstract getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.end method

.method public getJingleTransport()Lorg/jivesoftware/smackx/packet/JingleTransport;
    .locals 1

    .prologue
    .line 185
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getJingleTransport(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/packet/JingleTransport;

    move-result-object v0

    return-object v0
.end method

.method public abstract getJingleTransport(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/packet/JingleTransport;
.end method

.method public getOfferedCandidates()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 189
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->offeredCandidates:Ljava/util/List;

    return-object v0
.end method

.method public final getValidRemoteCandidates()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 465
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getRemoteCandidates()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method final getValidRemoteCandidatesList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation

    .prologue
    .line 453
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->validRemoteCandidates:Ljava/util/List;

    monitor-enter v1

    .line 454
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->validRemoteCandidates:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 455
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final isFullyEstablished()Z
    .locals 2

    .prologue
    .line 278
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->isEstablished()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

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
