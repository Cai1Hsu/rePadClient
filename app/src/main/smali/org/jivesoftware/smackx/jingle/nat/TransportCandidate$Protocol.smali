.class public Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;
.super Ljava/lang/Object;
.source "TransportCandidate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Protocol"
.end annotation


# static fields
.field public static final SSLTCP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

.field public static final TCP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

.field public static final TCPACT:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

.field public static final TCPPASS:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

.field public static final UDP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 446
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    const-string/jumbo v1, "udp"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->UDP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 448
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    const-string/jumbo v1, "tcp"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->TCP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 450
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    const-string/jumbo v1, "tcp-act"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->TCPACT:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 452
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    const-string/jumbo v1, "tcp-pass"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->TCPPASS:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 454
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    const-string/jumbo v1, "ssltcp"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->SSLTCP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 458
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 459
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    .line 460
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 470
    if-nez p0, :cond_0

    .line 471
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->UDP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 485
    :goto_0
    return-object v0

    .line 473
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 474
    const-string/jumbo v0, "udp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 475
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->UDP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    goto :goto_0

    .line 476
    :cond_1
    const-string/jumbo v0, "tcp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 477
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->TCP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    goto :goto_0

    .line 478
    :cond_2
    const-string/jumbo v0, "tcp-act"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 479
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->TCPACT:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    goto :goto_0

    .line 480
    :cond_3
    const-string/jumbo v0, "tcp-pass"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 481
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->TCPPASS:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    goto :goto_0

    .line 482
    :cond_4
    const-string/jumbo v0, "ssltcp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 483
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->SSLTCP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    goto :goto_0

    .line 485
    :cond_5
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->UDP:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 495
    if-ne p0, p1, :cond_1

    .line 512
    :cond_0
    :goto_0
    return v1

    .line 498
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 499
    goto :goto_0

    .line 501
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 502
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 504
    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;

    .line 505
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 506
    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 507
    goto :goto_0

    .line 509
    :cond_4
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 510
    goto :goto_0
.end method

.method public isNull()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 521
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 526
    :cond_0
    :goto_0
    return v0

    .line 523
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 526
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 463
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Protocol;->value:Ljava/lang/String;

    return-object v0
.end method
