.class public Lorg/jivesoftware/smackx/jingle/nat/FixedTransportManager;
.super Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
.source "FixedTransportManager.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionListener;
.implements Lorg/jivesoftware/smackx/jingle/listeners/CreatedJingleSessionListener;


# instance fields
.field resolver:Lorg/jivesoftware/smackx/jingle/nat/FixedResolver;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/FixedResolver;)V
    .locals 0
    .param p1, "inResolver"    # Lorg/jivesoftware/smackx/jingle/nat/FixedResolver;

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;-><init>()V

    .line 39
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/FixedTransportManager;->resolver:Lorg/jivesoftware/smackx/jingle/nat/FixedResolver;

    .line 40
    return-void
.end method


# virtual methods
.method protected createResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/FixedTransportManager;->resolver:Lorg/jivesoftware/smackx/jingle/nat/FixedResolver;

    return-object v0
.end method

.method public sessionClosed(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 56
    return-void
.end method

.method public sessionClosedOnError(Lorg/jivesoftware/smack/XMPPException;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "e"    # Lorg/jivesoftware/smack/XMPPException;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 59
    return-void
.end method

.method public sessionCreated(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 66
    invoke-virtual {p1, p0}, Lorg/jivesoftware/smackx/jingle/JingleSession;->addListener(Lorg/jivesoftware/smackx/jingle/listeners/JingleListener;)V

    .line 67
    return-void
.end method

.method public sessionDeclined(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "reason"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 50
    return-void
.end method

.method public sessionEstablished(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "rc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "lc"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 47
    return-void
.end method

.method public sessionMediaReceived(Lorg/jivesoftware/smackx/jingle/JingleSession;Ljava/lang/String;)V
    .locals 0
    .param p1, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .param p2, "participant"    # Ljava/lang/String;

    .prologue
    .line 63
    return-void
.end method

.method public sessionRedirected(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 0
    .param p1, "redirection"    # Ljava/lang/String;
    .param p2, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 53
    return-void
.end method
