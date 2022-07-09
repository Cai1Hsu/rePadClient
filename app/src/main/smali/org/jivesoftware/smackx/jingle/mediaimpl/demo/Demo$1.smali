.class Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$1;
.super Ljava/lang/Object;
.source "Demo.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/listeners/JingleSessionRequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)V
    .locals 0

    .prologue
    .line 92
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public sessionRequested(Lorg/jivesoftware/smackx/jingle/JingleSessionRequest;)V
    .locals 3
    .param p1, "request"    # Lorg/jivesoftware/smackx/jingle/JingleSessionRequest;

    .prologue
    .line 100
    :try_start_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/JingleSessionRequest;->accept()Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$002(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 103
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;

    invoke-static {v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;->access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/demo/Demo;)Lorg/jivesoftware/smackx/jingle/JingleSession;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/JingleSession;->startIncoming()V
    :try_end_0
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    :goto_0
    return-void

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/XMPPException;->printStackTrace()V

    goto :goto_0
.end method
