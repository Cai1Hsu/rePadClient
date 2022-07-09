.class Lcom/lee/demo/view/VideoPlayActivity$6;
.super Ljava/lang/Object;
.source "VideoPlayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Lcom/lee/demo/view/VideoPlayActivity$6;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 147
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 148
    invoke-static {}, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->getMedia()Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$6;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v0}, Lcom/lee/demo/view/VideoPlayActivity;->access$1(Lcom/lee/demo/view/VideoPlayActivity;)V

    .line 154
    :cond_0
    :goto_0
    return-void

    .line 151
    :cond_1
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$6;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v0}, Lcom/lee/demo/view/VideoPlayActivity;->access$4(Lcom/lee/demo/view/VideoPlayActivity;)V

    goto :goto_0
.end method
