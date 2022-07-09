.class public Lorg/jivesoftware/smackx/packet/JingleTransport$RawUdp$Candidate;
.super Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;
.source "JingleTransport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/JingleTransport$RawUdp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Candidate"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 395
    invoke-direct {p0}, Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;-><init>()V

    .line 396
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p1, "tc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 402
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 403
    return-void
.end method


# virtual methods
.method protected getChildElements()Ljava/lang/String;
    .locals 5

    .prologue
    .line 409
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 411
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleTransport$RawUdp$Candidate;->transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleTransport$RawUdp$Candidate;->transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    instance-of v3, v3, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;

    if-eqz v3, :cond_0

    .line 412
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleTransport$RawUdp$Candidate;->transportCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    check-cast v2, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;

    .line 414
    .local v2, "tcf":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;
    const-string/jumbo v3, " generation=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;->getGeneration()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    const-string/jumbo v3, " ip=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;->getIp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    const-string/jumbo v3, " port=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;->getPort()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;->getName()Ljava/lang/String;

    move-result-object v1

    .line 420
    .local v1, "name":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 421
    const-string/jumbo v3, " name=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "tcf":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$Fixed;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
