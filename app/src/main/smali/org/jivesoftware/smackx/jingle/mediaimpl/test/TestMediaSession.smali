.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
.source "TestMediaSession.java"


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 6
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "locator"    # Ljava/lang/String;
    .param p5, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 44
    const-string/jumbo v4, "Test"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 45
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;->initialize()V

    .line 46
    return-void
.end method


# virtual methods
.method public initialize()V
    .locals 0

    .prologue
    .line 53
    return-void
.end method

.method public setTrasmit(Z)V
    .locals 0
    .param p1, "active"    # Z

    .prologue
    .line 70
    return-void
.end method

.method public startReceive()V
    .locals 0

    .prologue
    .line 77
    return-void
.end method

.method public startTrasmit()V
    .locals 0

    .prologue
    .line 60
    return-void
.end method

.method public stopReceive()V
    .locals 0

    .prologue
    .line 91
    return-void
.end method

.method public stopTrasmit()V
    .locals 0

    .prologue
    .line 84
    return-void
.end method
