.class Lorg/jivesoftware/smack/keepalive/KeepAliveManager$3;
.super Ljava/lang/Object;
.source "KeepAliveManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->handleConnect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V
    .locals 0

    .prologue
    .line 134
    iput-object p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$3;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$3;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$102(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;J)J

    .line 140
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$3;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$200(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    .line 141
    return-void
.end method
