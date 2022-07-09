.class Lorg/jivesoftware/smack/PrivacyListManager$2;
.super Ljava/lang/Object;
.source "PrivacyListManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/PrivacyListManager;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/PrivacyListManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/PrivacyListManager;)V
    .locals 0

    .prologue
    .line 91
    iput-object p1, p0, Lorg/jivesoftware/smack/PrivacyListManager$2;->this$0:Lorg/jivesoftware/smack/PrivacyListManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 2

    .prologue
    .line 94
    invoke-static {}, Lorg/jivesoftware/smack/PrivacyListManager;->access$200()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smack/PrivacyListManager$2;->this$0:Lorg/jivesoftware/smack/PrivacyListManager;

    invoke-static {v1}, Lorg/jivesoftware/smack/PrivacyListManager;->access$100(Lorg/jivesoftware/smack/PrivacyListManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 99
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 107
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 103
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 111
    return-void
.end method
