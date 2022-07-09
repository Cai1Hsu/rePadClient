.class public Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;
.super Ljava/lang/Object;
.source "TransportCandidate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Channel"
.end annotation


# static fields
.field public static final MYRTCPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

.field public static final MYRTPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 536
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    const-string/jumbo v1, "myrtpvoice"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    .line 538
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    const-string/jumbo v1, "myrtcpvoice"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTCPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 542
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 543
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    .line 544
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 554
    if-nez p0, :cond_0

    .line 555
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    .line 563
    :goto_0
    return-object v0

    .line 557
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 558
    const-string/jumbo v0, "myrtpvoice"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 559
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    goto :goto_0

    .line 560
    :cond_1
    const-string/jumbo v0, "tcp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 561
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTCPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    goto :goto_0

    .line 563
    :cond_2
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->MYRTPVOICE:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 573
    if-ne p0, p1, :cond_1

    .line 590
    :cond_0
    :goto_0
    return v1

    .line 576
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 577
    goto :goto_0

    .line 579
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 580
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 582
    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;

    .line 583
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 584
    iget-object v3, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 585
    goto :goto_0

    .line 587
    :cond_4
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 588
    goto :goto_0
.end method

.method public isNull()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 599
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 604
    :cond_0
    :goto_0
    return v0

    .line 601
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 604
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 547
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Channel;->value:Ljava/lang/String;

    return-object v0
.end method
