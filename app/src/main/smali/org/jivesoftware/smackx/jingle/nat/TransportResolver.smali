.class public abstract Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
.super Ljava/lang/Object;
.source "TransportResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;
    }
.end annotation


# static fields
.field public static final CHECK_TIMEOUT:I = 0xbb8

.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;


# instance fields
.field protected final candidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;",
            ">;"
        }
    .end annotation
.end field

.field private initialized:Z

.field private final listeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;",
            ">;"
        }
    .end annotation
.end field

.field private resolved:Z

.field private resolving:Z

.field public type:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->rawupd:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->type:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    .line 74
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->initialized:Z

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    .line 87
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolving:Z

    .line 88
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolved:Z

    .line 89
    return-void
.end method

.method private triggerResolveEnd()V
    .locals 4

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getListenersList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 244
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 245
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;

    .line 246
    .local v2, "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;
    instance-of v3, v2, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    if-eqz v3, :cond_0

    move-object v1, v2

    .line 247
    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    .line 248
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;
    invoke-interface {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;->end()V

    goto :goto_0

    .line 251
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;
    .end local v2    # "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;
    :cond_1
    return-void
.end method

.method private triggerResolveInit()V
    .locals 4

    .prologue
    .line 229
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getListenersList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 230
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 231
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;

    .line 232
    .local v2, "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;
    instance-of v3, v2, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    if-eqz v3, :cond_0

    move-object v1, v2

    .line 233
    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    .line 234
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;
    invoke-interface {v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;->init()V

    goto :goto_0

    .line 237
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;
    .end local v2    # "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;
    :cond_1
    return-void
.end method


# virtual methods
.method protected addCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 2
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 270
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    monitor-enter v1

    .line 271
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 272
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 273
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 276
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->triggerCandidateAdded(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 277
    return-void

    .line 273
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public addListener(Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;

    .prologue
    .line 181
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 182
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 183
    monitor-exit v1

    .line 184
    return-void

    .line 183
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public abstract cancel()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public clear()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->cancel()V

    .line 108
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 109
    return-void
.end method

.method protected clearCandidates()V
    .locals 2

    .prologue
    .line 259
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    monitor-enter v1

    .line 260
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 261
    monitor-exit v1

    .line 262
    return-void

    .line 261
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getCandidate(I)Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 3
    .param p1, "i"    # I

    .prologue
    .line 349
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    monitor-enter v2

    .line 350
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 351
    .local v0, "cand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    monitor-exit v2

    .line 352
    return-object v0

    .line 351
    .end local v0    # "cand":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCandidateCount()I
    .locals 2

    .prologue
    .line 321
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    monitor-enter v1

    .line 322
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 323
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getCandidates()Ljava/util/Iterator;
    .locals 3
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
    .line 285
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    monitor-enter v1

    .line 286
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 287
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getCandidatesList()Ljava/util/List;
    .locals 4
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
    .line 332
    const/4 v0, 0x0

    .line 334
    .local v0, "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    monitor-enter v3

    .line 335
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->candidates:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 338
    return-object v1

    .line 336
    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    .restart local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    :catchall_0
    move-exception v2

    :goto_0
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .end local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    .restart local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    :catchall_1
    move-exception v2

    move-object v0, v1

    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    .restart local v0    # "result":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    goto :goto_0
.end method

.method protected getFreePort()I
    .locals 12

    .prologue
    .line 380
    const/4 v1, 0x0

    .line 382
    .local v1, "freePort":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    const/16 v5, 0xa

    if-ge v3, v5, :cond_1

    .line 383
    const-wide/16 v6, 0x2710

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v8

    const-wide v10, 0x40c3880000000000L    # 10000.0

    mul-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->round(D)J

    move-result-wide v8

    add-long/2addr v6, v8

    long-to-int v1, v6

    .line 384
    rem-int/lit8 v5, v1, 0x2

    if-nez v5, :cond_0

    .line 386
    :goto_1
    :try_start_0
    new-instance v4, Ljava/net/ServerSocket;

    invoke-direct {v4, v1}, Ljava/net/ServerSocket;-><init>(I)V

    .line 387
    .local v4, "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 388
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v1

    .line 403
    .end local v1    # "freePort":I
    .end local v4    # "ss":Ljava/net/ServerSocket;
    .local v2, "freePort":I
    :goto_2
    return v2

    .line 384
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 391
    :catch_0
    move-exception v0

    .line 392
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 382
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 396
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    :try_start_1
    new-instance v4, Ljava/net/ServerSocket;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Ljava/net/ServerSocket;-><init>(I)V

    .line 397
    .restart local v4    # "ss":Ljava/net/ServerSocket;
    invoke-virtual {v4}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    .line 398
    invoke-virtual {v4}, Ljava/net/ServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v4    # "ss":Ljava/net/ServerSocket;
    :goto_3
    move v2, v1

    .line 403
    .end local v1    # "freePort":I
    .restart local v2    # "freePort":I
    goto :goto_2

    .line 400
    .end local v2    # "freePort":I
    .restart local v1    # "freePort":I
    :catch_1
    move-exception v0

    .line 401
    .restart local v0    # "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public getListenersList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 204
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 205
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getPreferredCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 7

    .prologue
    .line 296
    const/4 v2, 0x0

    .line 298
    .local v2, "result":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 299
    .local v0, "cands":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getCandidatesList()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 300
    .local v3, "tpcan":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    instance-of v4, v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v4, :cond_0

    .line 301
    check-cast v3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .end local v3    # "tpcan":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 305
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 306
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 308
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "result":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    check-cast v2, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 309
    .restart local v2    # "result":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    sget-object v4, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Result: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 312
    :cond_2
    return-object v2
.end method

.method public getType()Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;
    .locals 1

    .prologue
    .line 52
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->type:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    return-object v0
.end method

.method public abstract initialize()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public initializeAndWait()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 359
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->initialize()V

    .line 361
    :try_start_0
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "Initializing transport resolver..."

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 362
    :goto_0
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->isInitialized()Z

    move-result v1

    if-nez v1, :cond_0

    .line 363
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "Resolver init still pending"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 364
    const-wide/16 v2, 0x3e8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 368
    :catch_0
    move-exception v0

    .line 369
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 371
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 366
    :cond_0
    :try_start_1
    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "Transport resolved\n"

    invoke-virtual {v1, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method public declared-synchronized isInitialized()Z
    .locals 1

    .prologue
    .line 148
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->initialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isResolved()Z
    .locals 1

    .prologue
    .line 132
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolved:Z

    return v0
.end method

.method public isResolving()Z
    .locals 1

    .prologue
    .line 122
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolving:Z

    return v0
.end method

.method public removeListener(Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;)V
    .locals 2
    .param p1, "li"    # Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;

    .prologue
    .line 192
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    monitor-enter v1

    .line 193
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 194
    monitor-exit v1

    .line 195
    return-void

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public abstract resolve(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation
.end method

.method public declared-synchronized setInitialized()V
    .locals 1

    .prologue
    .line 139
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->initialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    monitor-exit p0

    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setResolveEnd()V
    .locals 1

    .prologue
    .line 167
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolved:Z

    .line 168
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolving:Z

    .line 170
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->triggerResolveEnd()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    monitor-exit p0

    return-void

    .line 167
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setResolveInit()V
    .locals 1

    .prologue
    .line 156
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolved:Z

    .line 157
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->resolving:Z

    .line 159
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->triggerResolveInit()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    monitor-exit p0

    return-void

    .line 156
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setType(Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    .prologue
    .line 56
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->type:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    .line 57
    return-void
.end method

.method protected triggerCandidateAdded(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 6
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 214
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->getListenersList()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 215
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 216
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;

    .line 217
    .local v2, "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;
    instance-of v3, v2, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    if-eqz v3, :cond_0

    move-object v1, v2

    .line 218
    check-cast v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;

    .line 219
    .local v1, "li":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;
    sget-object v3, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "triggerCandidateAdded : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getLocalIp()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 220
    invoke-interface {v1, p1}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;->candidateAdded(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    goto :goto_0

    .line 223
    .end local v1    # "li":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Resolver;
    .end local v2    # "trl":Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener;
    :cond_1
    return-void
.end method
