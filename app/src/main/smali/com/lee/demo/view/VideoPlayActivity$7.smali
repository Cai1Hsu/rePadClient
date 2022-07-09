.class Lcom/lee/demo/view/VideoPlayActivity$7;
.super Ljava/lang/Object;
.source "VideoPlayActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lee/demo/view/VideoPlayActivity;->initViews()V
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
    iput-object p1, p0, Lcom/lee/demo/view/VideoPlayActivity$7;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4
    .param p1, "seekBar"    # Landroid/widget/SeekBar;
    .param p2, "progress"    # I
    .param p3, "fromUser"    # Z

    .prologue
    .line 172
    if-eqz p3, :cond_0

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 173
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    iget-object v1, p0, Lcom/lee/demo/view/VideoPlayActivity$7;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v1}, Lcom/lee/demo/view/VideoPlayActivity;->access$7(Lcom/lee/demo/view/VideoPlayActivity;)I

    move-result v1

    int-to-float v1, v1

    int-to-float v2, p2

    const v3, 0x4adbba00    # 7200000.0f

    div-float/2addr v2, v3

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$7;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v1

    invoke-static {v0, v1}, Lcom/lee/demo/view/VideoPlayActivity;->access$2(Lcom/lee/demo/view/VideoPlayActivity;I)V

    .line 177
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$7;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v0}, Lcom/lee/demo/view/VideoPlayActivity;->access$3(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/widget/TextView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity$7;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/lee/demo/view/VideoPlayActivity;->getTime(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 178
    iget-object v2, p0, Lcom/lee/demo/view/VideoPlayActivity$7;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v3

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/lee/demo/view/VideoPlayActivity;->getTime(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 177
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 167
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .param p1, "seekBar"    # Landroid/widget/SeekBar;

    .prologue
    .line 163
    return-void
.end method
