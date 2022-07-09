.class Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession$1;
.super Ljava/awt/event/WindowAdapter;
.source "ScreenShareSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;

    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public windowClosed(Ljava/awt/event/WindowEvent;)V
    .locals 1
    .param p1, "e"    # Ljava/awt/event/WindowEvent;

    .prologue
    .line 103
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession$1;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->access$000(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;)Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageReceiver;->stop()V

    .line 104
    return-void
.end method
