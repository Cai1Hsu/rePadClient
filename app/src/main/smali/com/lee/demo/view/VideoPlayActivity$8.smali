.class Lcom/lee/demo/view/VideoPlayActivity$8;
.super Ljava/util/TimerTask;
.source "VideoPlayActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lee/demo/view/VideoPlayActivity;->playVideo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lee/demo/view/VideoPlayActivity;


# direct methods
.method constructor <init>(Lcom/lee/demo/view/VideoPlayActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/lee/demo/view/VideoPlayActivity$8;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    .line 193
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 197
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$8;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v0}, Lcom/lee/demo/view/VideoPlayActivity;->access$0(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity$8;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v2}, Lcom/lee/demo/view/VideoPlayActivity;->access$7(Lcom/lee/demo/view/VideoPlayActivity;)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    const v2, 0x4adbba00    # 7200000.0f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 202
    :cond_0
    return-void
.end method
