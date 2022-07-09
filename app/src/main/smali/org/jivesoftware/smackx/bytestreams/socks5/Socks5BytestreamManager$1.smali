.class final Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1;
.super Ljava/lang/Object;
.source "Socks5BytestreamManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionCreationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 94
    invoke-static {p1}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;->getBytestreamManager(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;

    move-result-object v0

    .line 97
    .local v0, "manager":Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;
    new-instance v1, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1$1;

    invoke-direct {v1, p0, v0}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1$1;-><init>(Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1;Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;)V

    invoke-virtual {p1, v1}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 104
    return-void
.end method
