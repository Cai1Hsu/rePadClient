.class Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;
.super Ljava/lang/Object;
.source "ServiceDiscoveryManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)V
    .locals 0

    .prologue
    .line 189
    iput-object p1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 2

    .prologue
    .line 192
    invoke-static {}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$100()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/ServiceDiscoveryManager$2;->this$0:Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->access$000(Lorg/jivesoftware/smackx/ServiceDiscoveryManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 197
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 205
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 201
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 209
    return-void
.end method
