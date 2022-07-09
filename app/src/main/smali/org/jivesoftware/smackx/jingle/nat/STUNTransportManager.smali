.class public Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;
.super Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;
.source "STUNTransportManager.java"


# instance fields
.field stunResolver:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;-><init>()V

    .line 31
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;->stunResolver:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    .line 34
    new-instance v1, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager$1;

    invoke-direct {v1, p0}, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager$1;-><init>(Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;)V

    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;->stunResolver:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    .line 37
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;->stunResolver:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->initializeAndWait()V
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
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;->stunResolver:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    invoke-virtual {v1, p1}, Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;->resolve(Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    :goto_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/STUNTransportManager;->stunResolver:Lorg/jivesoftware/smackx/jingle/nat/STUNResolver;

    return-object v1

    .line 46
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method
