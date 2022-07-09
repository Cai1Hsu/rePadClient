.class public final Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;
.super Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
.source "TransportNegotiator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Ice"
.end annotation


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V
    .locals 0
    .param p1, "js"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "res"    # Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .param p3, "parentNegotiator"    # Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .prologue
    .line 864
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;-><init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;Lorg/jivesoftware/smackx/jingle/ContentNegotiator;)V

    .line 865
    return-void
.end method


# virtual methods
.method public acceptableTransportCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/util/List;)Z
    .locals 1
    .param p1, "tc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
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

    .prologue
    .line 912
    .local p2, "localCandidates":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    instance-of v0, p1, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    return v0
.end method

.method public getBestRemoteCandidate()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 9

    .prologue
    .line 884
    const/4 v5, 0x0

    .line 886
    .local v5, "result":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$Ice;->getValidRemoteCandidatesList()Ljava/util/ArrayList;

    move-result-object v0

    .line 887
    .local v0, "cands":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 888
    const/4 v2, -0x1

    .line 889
    .local v2, "highest":I
    const/4 v1, 0x0

    .line 890
    .local v1, "chose":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 891
    .local v6, "transportCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    instance-of v7, v6, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v7, :cond_0

    move-object v4, v6

    .line 892
    check-cast v4, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    .line 893
    .local v4, "icecandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v7

    if-le v7, v2, :cond_0

    .line 894
    move-object v1, v4

    .line 895
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPreference()I

    move-result v2

    goto :goto_0

    .line 899
    .end local v4    # "icecandidate":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    .end local v6    # "transportCandidate":Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    :cond_1
    move-object v5, v1

    .line 902
    .end local v1    # "chose":Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;
    .end local v2    # "highest":I
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v7

    const-string/jumbo v8, "relay"

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 903
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$900()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v7

    const-string/jumbo v8, "Relay Type"

    invoke-virtual {v7, v8}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 905
    :cond_3
    return-object v5
.end method

.method public getJingleTransport(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/packet/JingleTransport;
    .locals 2
    .param p1, "candidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 873
    new-instance v0, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice;-><init>()V

    .line 874
    .local v0, "jt":Lorg/jivesoftware/smackx/packet/JingleTransport$Ice;
    new-instance v1, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice$Candidate;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice$Candidate;-><init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/JingleTransport$Ice;->addCandidate(Lorg/jivesoftware/smackx/packet/JingleTransport$JingleTransportCandidate;)V

    .line 875
    return-object v0
.end method
