.class Lcom/lee/demo/view/VideoPlayActivity$2;
.super Ljava/lang/Object;
.source "VideoPlayActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


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
    iput-object p1, p0, Lcom/lee/demo/view/VideoPlayActivity$2;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1
    .param p1, "arg0"    # Landroid/media/MediaPlayer;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/lee/demo/view/VideoPlayActivity$2;->this$0:Lcom/lee/demo/view/VideoPlayActivity;

    invoke-static {v0}, Lcom/lee/demo/view/VideoPlayActivity;->access$1(Lcom/lee/demo/view/VideoPlayActivity;)V

    .line 82
    return-void
.end method
