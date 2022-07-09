.class final Lorg/jivesoftware/smackx/muc/MultiUserChat$1;
.super Ljava/lang/Object;
.source "MultiUserChat.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionCreationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/muc/MultiUserChat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 115
    invoke-static {p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    const-string/jumbo v1, "http://jabber.org/protocol/muc"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 118
    invoke-static {p1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    const-string/jumbo v1, "http://jabber.org/protocol/muc#rooms"

    new-instance v2, Lorg/jivesoftware/smackx/muc/MultiUserChat$1$1;

    invoke-direct {v2, p0, p1}, Lorg/jivesoftware/smackx/muc/MultiUserChat$1$1;-><init>(Lorg/jivesoftware/smackx/muc/MultiUserChat$1;Lorg/jivesoftware/smack/Connection;)V

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->setNodeInformationProvider(Ljava/lang/String;Lorg/jivesoftware/smackx/NodeInformationProvider;)V

    .line 143
    return-void
.end method
