.class public Lorg/jivesoftware/smackx/jingle/nat/BridgedTransportManager;
.super Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
.source "BridgedTransportManager.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
.implements Lorg/jivesoftware/smackx/jingle/listeners/CreatedJingleSessionListener;


# instance fields
.field xmppConnection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 0
    .param p1, "xmppConnection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/BridgedTransportManager;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    .line 43
    return-void
.end method


# virtual methods
.method protected createResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .locals 2
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 52
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/BridgedResolver;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/BridgedTransportManager;->xmppConnection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/BridgedResolver;-><init>(Lorg/jivesoftware/smack/Connection;)V

    .line 53
    .local v0, "bridgedResolver":Lorg/jivesoftware/smackx/jingle/nat/BridgedResolver;
    return-object v0
.end method

.method public sessionClosed(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 69
    return-void
.end method

.method public sessionClosedOnError(Lorg/jivesoftware/smack/XMPPException;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "e"    # Lorg/jivesoftware/smack/XMPPException;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 72
    return-void
.end method

.method public sessionCreated(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 81
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    .line 82
    return-void
.end method

.method public sessionDeclined(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 63
    return-void
.end method

.method public sessionEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 4
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "rc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "lc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 59
    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getConnection()Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getSessionId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, p2, p3}, Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;->relaySession(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;

    move-result-object v0

    .line 60
    .local v0, "rtpBridge":Lorg/jivesoftware/smackx/jingle/nat/RTPBridge;
    return-void
.end method

.method public sessionMediaReceived(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;)V
    .locals 0
    .param p1, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "participant"    # Ljava/lang/String;

    .prologue
    .line 76
    return-void
.end method

.method public sessionRedirected(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "redirection"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 66
    return-void
.end method
