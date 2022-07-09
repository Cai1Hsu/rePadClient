.class Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1$1;
.super Lorg/jivesoftware/smack/AbstractConnectionListener;
.source "Socks5BytestreamManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1;->connectionCreated(Lorg/jivesoftware/smack/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1;

.field final synthetic val$manager:Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1;Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;)V
    .locals 0

    .prologue
    .line 97
    iput-object p1, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1$1;->this$0:Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1;

    iput-object p2, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1$1;->val$manager:Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;

    invoke-direct {p0}, Lorg/jivesoftware/smack/AbstractConnectionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager$1$1;->val$manager:Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/bytestreams/socks5/Socks5BytestreamManager;->disableService()V

    .line 101
    return-void
.end method
