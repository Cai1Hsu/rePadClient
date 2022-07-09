.class Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;
.super Ljava/lang/Object;
.source "AudioChannel.java"

# interfaces
.implements Ljavax/media/ControllerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;)V
    .locals 0

    .prologue
    .line 486
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public controllerUpdate(Ljavax/media/ControllerEvent;)V
    .locals 2
    .param p1, "ce"    # Ljavax/media/ControllerEvent;

    .prologue
    .line 492
    instance-of v0, p1, Ljavax/media/ControllerClosedEvent;

    if-eqz v0, :cond_0

    .line 493
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->setFailed()V

    .line 497
    :cond_0
    if-eqz p1, :cond_1

    .line 498
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->getStateLock()Ljava/lang/Integer;

    move-result-object v1

    monitor-enter v1

    .line 499
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel$StateListener;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioChannel;->getStateLock()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 500
    monitor-exit v1

    .line 502
    :cond_1
    return-void

    .line 500
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
