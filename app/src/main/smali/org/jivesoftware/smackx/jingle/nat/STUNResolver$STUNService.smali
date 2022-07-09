.class public Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;
.super Ljava/lang/Object;
.source "STUNResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "STUNService"
.end annotation


# instance fields
.field private hostname:Ljava/lang/String;

.field private port:I

.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;)V
    .locals 2

    .prologue
    .line 431
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;-><init>(Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;Ljava/lang/String;I)V

    .line 432
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;Ljava/lang/String;I)V
    .locals 0
    .param p2, "hostname"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    .line 420
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->this$0:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    .line 421
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 423
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->hostname:Ljava/lang/String;

    .line 424
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->port:I

    .line 425
    return-void
.end method


# virtual methods
.method public checkBinding()Z
    .locals 6

    .prologue
    .line 495
    const/4 v2, 0x0

    .line 498
    .local v2, "result":Z
    :try_start_0
    new-instance v0, Lde/javawi/jstun/test/BindingLifetimeTest;

    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->hostname:Ljava/lang/String;

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->port:I

    invoke-direct {v0, v3, v4}, Lde/javawi/jstun/test/BindingLifetimeTest;-><init>(Ljava/lang/String;I)V

    .line 500
    .local v0, "binding":Lde/javawi/jstun/test/BindingLifetimeTest;
    invoke-virtual {v0}, Lde/javawi/jstun/test/BindingLifetimeTest;->test()V

    .line 503
    :cond_0
    const-wide/16 v4, 0x1388

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 504
    invoke-virtual {v0}, Lde/javawi/jstun/test/BindingLifetimeTest;->getLifetime()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    .line 505
    invoke-virtual {v0}, Lde/javawi/jstun/test/BindingLifetimeTest;->isCompleted()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    .line 506
    const/4 v2, 0x1

    .line 517
    .end local v0    # "binding":Lde/javawi/jstun/test/BindingLifetimeTest;
    .end local v2    # "result":Z
    :cond_1
    :goto_0
    return v2

    .line 513
    .restart local v2    # "result":Z
    :catch_0
    move-exception v1

    .line 514
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public getHostname()Ljava/lang/String;
    .locals 1

    .prologue
    .line 440
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->hostname:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 458
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->port:I

    return v0
.end method

.method public isNull()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 476
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->hostname:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 483
    :cond_0
    :goto_0
    return v0

    .line 478
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->hostname:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 480
    iget v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->port:I

    if-ltz v1, :cond_0

    .line 483
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setHostname(Ljava/lang/String;)V
    .locals 0
    .param p1, "hostname"    # Ljava/lang/String;

    .prologue
    .line 449
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->hostname:Ljava/lang/String;

    .line 450
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 467
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver$STUNService;->port:I

    .line 468
    return-void
.end method
