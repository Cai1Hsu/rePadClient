.class Lcom/lee/demo/view/VideoPlayActivity$5;
.super Ljava/lang/Object;
.source "VideoPlayActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lee/demo/view/VideoPlayActivity;->mpInitialize()V
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
    iput-object p1, p0, Lcom/lee/demo/view/VideoPlayActivity$5;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 6
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .prologue
    .line 111
    iget-object v4, p0, Lcom/lee/demo/view/VideoPlayActivity$5;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v4}, Lcom/lee/demo/view/VideoPlayActivity;->access$5(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/view/SurfaceView;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/SurfaceView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 112
    .local v1, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v4

    int-to-float v4, v4

    .line 113
    iget-object v5, p0, Lcom/lee/demo/view/VideoPlayActivity$5;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v5}, Lcom/lee/demo/view/VideoPlayActivity;->access$6(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v5, v5

    .line 112
    div-float v3, v4, v5

    .line 114
    .local v3, "w":F
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v4

    int-to-float v4, v4

    .line 115
    iget-object v5, p0, Lcom/lee/demo/view/VideoPlayActivity$5;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v5}, Lcom/lee/demo/view/VideoPlayActivity;->access$6(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v5, v5

    .line 114
    div-float v0, v4, v5

    .line 117
    .local v0, "h":F
    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    .line 119
    .local v2, "m":F
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->getVideoWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v2

    float-to-int v4, v4

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 120
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/MediaPlayer;->getVideoHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v2

    float-to-int v4, v4

    iput v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 122
    iget-object v4, p0, Lcom/lee/demo/view/VideoPlayActivity$5;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v4}, Lcom/lee/demo/view/VideoPlayActivity;->access$5(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/view/SurfaceView;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/view/SurfaceView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 123
    return-void
.end method
