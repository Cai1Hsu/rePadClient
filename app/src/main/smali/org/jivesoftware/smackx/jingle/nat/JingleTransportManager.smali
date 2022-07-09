.class public abstract Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
.super Ljava/lang/Object;
.source "JingleTransportManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method


# virtual methods
.method protected abstract createResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
.end method

.method public getResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    .locals 1
    .param p1, "session"    # Lorg/jivesoftware/smackx/jingle/JingleSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 58
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;->createResolver(Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;

    move-result-object v0

    .line 59
    .local v0, "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    if-nez v0, :cond_0

    .line 60
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;

    .end local v0    # "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    invoke-direct {v0}, Lorg/jivesoftware/smackx/jingle/nat/BasicResolver;-><init>()V

    .line 62
    .restart local v0    # "resolver":Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
    :cond_0
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;->initializeAndWait()V

    .line 64
    return-object v0
.end method
