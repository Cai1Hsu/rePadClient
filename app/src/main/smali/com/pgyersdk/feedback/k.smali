.class final Lcom/pgyersdk/feedback/k;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/pgyersdk/feedback/a;


# instance fields
.field final synthetic a:Lcom/pgyersdk/feedback/j;

.field private final synthetic b:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/pgyersdk/feedback/j;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iput-object p2, p0, Lcom/pgyersdk/feedback/k;->b:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Lcom/pgyersdk/feedback/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pgyersdk/feedback/l;->b()V

    :try_start_0
    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    iget-object v1, p0, Lcom/pgyersdk/feedback/k;->b:Landroid/content/Context;

    const-string/jumbo v2, "file:///system/media/audio/ui/camera_click.ogg"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;Landroid/media/MediaPlayer;)V

    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Landroid/media/MediaPlayer;

    move-result-object v1

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Landroid/media/MediaPlayer;

    move-result-object v0

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x41200000    # 10.0f

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaPlayer;->setVolume(FF)V

    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public final b()V
    .locals 2

    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;Landroid/media/MediaPlayer;)V

    :cond_0
    iget-object v0, p0, Lcom/pgyersdk/feedback/k;->a:Lcom/pgyersdk/feedback/j;

    iget-object v0, v0, Lcom/pgyersdk/feedback/j;->a:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-static {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Lcom/pgyersdk/feedback/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/pgyersdk/feedback/l;->a()V

    return-void
.end method
