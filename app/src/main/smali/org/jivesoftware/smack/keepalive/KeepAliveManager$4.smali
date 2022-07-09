.class Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;
.super Ljava/lang/Object;
.source "KeepAliveManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->init()V
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
    .line 146
    iput-object p1, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$300(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    .line 151
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$400(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$500(Lorg/jivesoftware/smack/Connection;)V

    .line 152
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "arg0"    # Ljava/lang/Exception;

    .prologue
    .line 156
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$300(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    .line 157
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$400(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$500(Lorg/jivesoftware/smack/Connection;)V

    .line 158
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 168
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 172
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$600(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    .line 163
    iget-object v0, p0, Lorg/jivesoftware/smack/keepalive/KeepAliveManager$4;->this$0:Lorg/jivesoftware/smack/keepalive/KeepAliveManager;

    invoke-static {v0}, Lorg/jivesoftware/smack/keepalive/KeepAliveManager;->access$200(Lorg/jivesoftware/smack/keepalive/KeepAliveManager;)V

    .line 164
    return-void
.end method
