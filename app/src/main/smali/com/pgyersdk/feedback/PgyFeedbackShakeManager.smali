.class public Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;
.super Ljava/lang/Object;


# static fields
.field private static a:Ljava/lang/String;

.field private static b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;


# instance fields
.field private c:Lcom/pgyersdk/feedback/l;

.field private d:Landroid/media/MediaPlayer;

.field private e:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string/jumbo v0, "PgyFeedbackShake"

    sput-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c:Lcom/pgyersdk/feedback/l;

    iput-object v0, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->d:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->e:Ljava/lang/Boolean;

    return-void
.end method

.method private static a()Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;
    .locals 1

    sget-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    invoke-direct {v0}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;-><init>()V

    sput-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    :cond_0
    sget-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    return-object v0
.end method

.method static synthetic a(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Lcom/pgyersdk/feedback/l;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c:Lcom/pgyersdk/feedback/l;

    return-object v0
.end method

.method static synthetic a(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;Landroid/media/MediaPlayer;)V
    .locals 0

    iput-object p1, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->d:Landroid/media/MediaPlayer;

    return-void
.end method

.method static synthetic b(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Landroid/media/MediaPlayer;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->d:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic c(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;)Ljava/lang/Boolean;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->e:Ljava/lang/Boolean;

    return-object v0
.end method

.method public static register(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    :try_start_0
    sput-object p1, Lcom/pgyersdk/a/a;->k:Ljava/lang/String;

    invoke-static {}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a()Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    move-result-object v0

    new-instance v1, Lcom/pgyersdk/feedback/l;

    invoke-direct {v1, p0}, Lcom/pgyersdk/feedback/l;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c:Lcom/pgyersdk/feedback/l;

    iget-object v1, v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c:Lcom/pgyersdk/feedback/l;

    new-instance v2, Lcom/pgyersdk/feedback/j;

    invoke-direct {v2, v0, p0}, Lcom/pgyersdk/feedback/j;-><init>(Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;Landroid/content/Context;)V

    invoke-virtual {v1, v2}, Lcom/pgyersdk/feedback/l;->a(Lcom/pgyersdk/feedback/m;)V

    invoke-static {p0}, Lcom/pgyersdk/a/a;->a(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static setGLSurface(Z)Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;
    .locals 2
    .param p0, "glSurface"    # Z

    .prologue
    invoke-static {}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a()Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->e:Ljava/lang/Boolean;

    sget-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    return-object v0
.end method

.method public static unregister()V
    .locals 2

    :try_start_0
    invoke-static {}, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->a()Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;

    move-result-object v0

    iget-object v1, v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c:Lcom/pgyersdk/feedback/l;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->c:Lcom/pgyersdk/feedback/l;

    invoke-virtual {v0}, Lcom/pgyersdk/feedback/l;->b()V

    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;->b:Lcom/pgyersdk/feedback/PgyFeedbackShakeManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
