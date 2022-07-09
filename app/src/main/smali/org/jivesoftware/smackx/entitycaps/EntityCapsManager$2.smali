.class Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;
.super Ljava/lang/Object;
.source "EntityCapsManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)V
    .locals 0

    .prologue
    .line 235
    iput-object p1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 2

    .prologue
    .line 238
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$202(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;Z)Z

    .line 239
    invoke-static {}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$400()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    invoke-static {v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$300(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;)Ljava/lang/ref/WeakReference;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 243
    iget-object v0, p0, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager$2;->this$0:Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;->access$202(Lorg/jivesoftware/smackx/entitycaps/EntityCapsManager;Z)Z

    .line 244
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 252
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 248
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 256
    return-void
.end method
