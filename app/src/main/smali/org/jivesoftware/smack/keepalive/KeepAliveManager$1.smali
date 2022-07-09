.class final Lorg/jivesoftware/smack/keepalive/KeepAliveManager$1;
.super Ljava/lang/Object;
.source "KeepAliveManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionCreationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/keepalive/KeepAliveManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionCreated(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 62
    new-instance v0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/keepalive/KeepAliveManager$1;)V

    .line 63
    return-void
.end method
