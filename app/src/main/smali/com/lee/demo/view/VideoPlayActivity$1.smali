.class Lcom/lee/demo/view/VideoPlayActivity$1;
.super Ljava/lang/Object;
.source "VideoPlayActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnBufferingUpdateListener;


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
    iput-object p1, p0, Lcom/lee/demo/view/VideoPlayActivity$1;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBufferingUpdate(Landroid/media/MediaPlayer;I)V
    .locals 2
    .param p1, "arg0"    # Landroid/media/MediaPlayer;
    .param p2, "percent"    # I

    .prologue
    .line 73
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$1;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v0}, Lcom/lee/demo/view/VideoPlayActivity;->access$0(Lcom/lee/demo/view/VideoPlayActivity;)Landroid/widget/SeekBar;

    move-result-object v0

    mul-int/lit8 v1, p2, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 74
    return-void
.end method
