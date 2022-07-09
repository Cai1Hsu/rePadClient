.class Lorg/jivesoftware/smackx/jingle/JingleSession$1;
.super Ljava/lang/Object;
.source "JingleSession.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/JingleSession;->installConnectionListeners(Lorg/jivesoftware/smack/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

.field final synthetic val$connection:Lorg/jivesoftware/smack/Connection;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smack/Connection;)V
    .locals 0

    .prologue
    .line 627
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;->val$connection:Lorg/jivesoftware/smack/Connection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 2

    .prologue
    .line 629
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;->val$connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$000(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smack/Connection;)V

    .line 630
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 633
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;->this$0:Lorg/jivesoftware/smackx/jingle/JingleSession;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/JingleSession$1;->val$connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->access$000(Lorg/jivesoftware/smackx/jingle/JingleSession;Lorg/jivesoftware/smack/Connection;)V

    .line 634
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "i"    # I

    .prologue
    .line 637
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 643
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 640
    return-void
.end method
