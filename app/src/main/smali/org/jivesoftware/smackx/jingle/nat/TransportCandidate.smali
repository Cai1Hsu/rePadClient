.class public abstract Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.super Ljava/lang/Object;
.source "TransportCandidate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;,
        Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;,
        Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;,
        Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field private candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private echoThread:Ljava/lang/Thread;

.field private generation:I

.field private ip:Ljava/lang/String;

.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;",
            ">;"
        }
    .end annotation
.end field

.field private localIp:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field protected password:Ljava/lang/String;

.field private port:I

.field private sessionId:Ljava/lang/String;

.field private symmetric:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, v0, v1, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>(Ljava/lang/String;II)V

    .line 200
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    .line 209
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;-><init>(Ljava/lang/String;II)V

    .line 210
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1
    .param p1, "ip"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "generation"    # I

    .prologue
    const/4 v0, 0x0

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    .line 70
    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->echoThread:Ljava/lang/Thread;

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->listeners:Ljava/util/List;

    .line 220
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->ip:Ljava/lang/String;

    .line 221
    iput p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->port:I

    .line 222
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->generation:I

    .line 223
    return-void
.end method

.method static synthetic access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-object v0
.end method


# virtual methods
.method public addCandidateEcho(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 2
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    invoke-direct {v0, p0, p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    .line 77
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->echoThread:Ljava/lang/Thread;

    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->echoThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 79
    return-void
.end method

.method public addListener(Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;

    .prologue
    .line 405
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 406
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    monitor-exit v1

    .line 408
    return-void

    .line 407
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public check(Ljava/util/List;)V
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
    .line 353
    .local p1, "localCandidates":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$1;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    const-string/jumbo v2, "Transport candidate check"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 372
    .local v0, "checkThread":Ljava/lang/Thread;
    const-string/jumbo v1, "Transport candidate test"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 373
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 374
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 303
    if-ne p0, p1, :cond_1

    .line 338
    :cond_0
    :goto_0
    return v1

    .line 306
    :cond_1
    if-nez p1, :cond_2

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

    .line 312
    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 313
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    iget v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->generation:I

    iget v4, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->generation:I

    if-eq v3, v4, :cond_4

    move v1, v2

    .line 314
    goto :goto_0

    .line 316
    :cond_4
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    .line 317
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    move v1, v2

    .line 318
    goto :goto_0

    .line 320
    :cond_5
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    .line 321
    goto :goto_0

    .line 324
    :cond_6
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v4

    if-eq v3, v4, :cond_7

    move v1, v2

    .line 325
    goto :goto_0

    .line 328
    :cond_7
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getName()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_8

    .line 329
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9

    move v1, v2

    .line 330
    goto :goto_0

    .line 332
    :cond_8
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    move v1, v2

    .line 333
    goto :goto_0

    .line 335
    :cond_9
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v4

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 336
    goto :goto_0
.end method

.method public getCandidateEcho()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    return-object v0
.end method

.method public getConnection()Lorg/jivesoftware/smack/Connection;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method public getGeneration()I
    .locals 1

    .prologue
    .line 266
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->generation:I

    return v0
.end method

.method public getIp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->ip:Ljava/lang/String;

    return-object v0
.end method

.method public getListenersList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;",
            ">;"
        }
    .end annotation

    .prologue
    .line 394
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 395
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->listeners:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 396
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getLocalIp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->localIp:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->ip:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->localIp:Ljava/lang/String;

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 248
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->port:I

    return v0
.end method

.method public getSessionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->sessionId:Ljava/lang/String;

    return-object v0
.end method

.method public getSymmetric()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->symmetric:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    return-object v0
.end method

.method public isNull()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 231
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->ip:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 238
    :cond_0
    :goto_0
    return v0

    .line 233
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->ip:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 235
    iget v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->port:I

    if-ltz v1, :cond_0

    .line 238
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public removeCandidateEcho()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;->cancel()V

    .line 84
    :cond_0
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->candidateEcho:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$CandidateEcho;

    .line 85
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->echoThread:Ljava/lang/Thread;

    .line 86
    return-void
.end method

.method public setConnection(Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 174
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->connection:Lorg/jivesoftware/smack/Connection;

    .line 175
    return-void
.end method

.method public setGeneration(I)V
    .locals 0
    .param p1, "generation"    # I

    .prologue
    .line 275
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->generation:I

    .line 276
    return-void
.end method

.method public setIp(Ljava/lang/String;)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->ip:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setLocalIp(Ljava/lang/String;)V
    .locals 0
    .param p1, "localIp"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->localIp:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 294
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->name:Ljava/lang/String;

    .line 295
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 156
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->password:Ljava/lang/String;

    .line 157
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 257
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->port:I

    .line 258
    return-void
.end method

.method public setSessionId(Ljava/lang/String;)V
    .locals 0
    .param p1, "sessionId"    # Ljava/lang/String;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->sessionId:Ljava/lang/String;

    .line 193
    return-void
.end method

.method public setSymmetric(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p1, "symetric"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 138
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->symmetric:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 139
    return-void
.end method

.method triggerCandidateChecked(Z)V
    .locals 3
    .param p1, "result"    # Z

    .prologue
    .line 383
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getListenersList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;

    .line 384
    .local v1, "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;
    invoke-interface {v1, p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;->candidateChecked(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Z)V

    goto :goto_0

    .line 386
    .end local v1    # "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;
    :cond_0
    return-void
.end method
