.class public Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;
.super Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
.source "ICETransportManager.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
.implements Lorg/jivesoftware/smackx/jingle/listeners/CreatedJingleSessionListener;


# instance fields
.field iceResolver:Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;I)V
    .locals 2
    .param p1, "xmppConnection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "server"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;-><init>()V

    .line 31
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;->iceResolver:Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    .line 34
    new-instance v1, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    invoke-direct {v1, p1, p2, p3}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;-><init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;I)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;->iceResolver:Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    .line 36
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;->iceResolver:Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->initializeAndWait()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v0

    .line 39
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method protected createResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .locals 2
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 45
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;->iceResolver:Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;->resolve(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    :goto_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICETransportManager;->iceResolver:Lorg/jivesoftware/smackx/jingle/nat/ICEResolver;

    return-object v1

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method

.method public sessionClosed(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 70
    return-void
.end method

.method public sessionClosedOnError(Lorg/jivesoftware/smack/XMPPException;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "e"    # Lorg/jivesoftware/smack/XMPPException;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 73
    return-void
.end method

.method public sessionCreated(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 82
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    .line 83
    return-void
.end method

.method public sessionDeclined(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 64
    return-void
.end method

.method public sessionEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 3
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "rc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "lc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 56
    instance-of v0, p3, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    if-eqz v0, :cond_0

    move-object v0, p3

    .line 57
    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getType()Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;

    move-result-object v0

    const-string/jumbo v1, "relay"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getSessionId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPassword()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, p2, p3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->relaySession(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    .line 61
    :cond_0
    return-void
.end method

.method public sessionMediaReceived(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;)V
    .locals 0
    .param p1, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "participant"    # Ljava/lang/String;

    .prologue
    .line 77
    return-void
.end method

.method public sessionRedirected(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "redirection"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 67
    return-void
.end method
