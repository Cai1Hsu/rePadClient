.class Lorg/jivesoftware/smackx/jingle/JingleSession$5;
.super Ljava/lang/Object;
.source "JingleSession.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/listeners/JingleTransportListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/JingleSession;->setupListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0

    .prologue
    .line 825
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transportClosed(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 855
    return-void
.end method

.method public transportClosedOnError(Lorg/jivesoftware/smack/XMPPException;)V
    .locals 0
    .param p1, "e"    # Lorg/jivesoftware/smack/XMPPException;

    .prologue
    .line 858
    return-void
.end method

.method public transportEstablished(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 5
    .param p1, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 828
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->isFullyEstablished()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 831
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStateActive;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->setSessionState(Lorg/jivesoftware/smackx/jingle/JingleSessionState;)V

    .line 833
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$200(Lorg/jivesoftware/smackx/jingle/JingleSession;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 834
    .local v0, "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-ne v3, v4, :cond_0

    .line 835
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->triggerContentEstablished()V

    goto :goto_0

    .line 838
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_1
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->getSessionState()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v3

    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleSessionStatePending;->getInstance()Lorg/jivesoftware/smackx/jingle/JingleSessionState;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 840
    new-instance v2, Lorg/jivesoftware/smackx/packet/Jingle;

    sget-object v3, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/packet/Jingle;-><init>(Lorg/jivesoftware/smackx/jingle/JingleActionEnum;)V

    .line 843
    .local v2, "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-static {v3}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$200(Lorg/jivesoftware/smackx/jingle/JingleSession;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;

    .line 844
    .restart local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->SUCCEEDED:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-ne v3, v4, :cond_2

    .line 845
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/ContentNegotiator;->getJingleContent()Lorg/jivesoftware/smackx/packet/JingleContent;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/packet/Jingle;->addContent(Lorg/jivesoftware/smackx/packet/JingleContent;)V

    goto :goto_1

    .line 848
    .end local v0    # "contentNegotiator":Lorg/jivesoftware/smackx/jingle/ContentNegotiator;
    :cond_3
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/Jingle;->getPacketID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addExpectedId(Ljava/lang/String;)V

    .line 849
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$5;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/jingle/JingleSession;->sendPacket(Lorg/jivesoftware/smack/packet/IQ;)V

    .line 852
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "jout":Lorg/jivesoftware/smackx/packet/Jingle;
    :cond_4
    return-void
.end method
