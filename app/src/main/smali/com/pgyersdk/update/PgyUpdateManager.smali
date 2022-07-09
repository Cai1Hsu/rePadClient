.class public Lcom/pgyersdk/update/PgyUpdateManager;
.super Ljava/lang/Object;


# static fields
.field private static a:Lcom/pgyersdk/b/a;

.field private static b:Lcom/pgyersdk/update/UpdateManagerListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    sput-object v0, Lcom/pgyersdk/update/PgyUpdateManager;->b:Lcom/pgyersdk/update/UpdateManagerListener;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V
    .locals 3

    :try_start_0
    sput-object p2, Lcom/pgyersdk/a/a;->k:Ljava/lang/String;

    invoke-static {p2}, Lcom/pgyersdk/c/n;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object p3, Lcom/pgyersdk/update/PgyUpdateManager;->b:Lcom/pgyersdk/update/UpdateManagerListener;

    sget-object v1, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    invoke-virtual {v1}, Lcom/pgyersdk/b/a;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v1

    sget-object v2, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-ne v1, v2, :cond_1

    :cond_0
    new-instance v1, Lcom/pgyersdk/b/b;

    invoke-direct {v1, p0, p1, v0, p3}, Lcom/pgyersdk/b/b;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V

    sput-object v1, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    invoke-static {v1}, Lcom/pgyersdk/c/a;->a(Landroid/os/AsyncTask;)V

    :goto_0
    return-void

    :cond_1
    sget-object v0, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    invoke-virtual {v0, p0}, Lcom/pgyersdk/b/a;->a(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static register(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    const-string/jumbo v0, "http://www.pgyer.com/"

    const/4 v1, 0x0

    invoke-static {p0, v0, p1, v1}, Lcom/pgyersdk/update/PgyUpdateManager;->a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V

    return-void
.end method

.method public static register(Landroid/app/Activity;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/pgyersdk/update/UpdateManagerListener;

    .prologue
    const-string/jumbo v0, "http://www.pgyer.com/"

    invoke-static {p0, v0, p1, p2}, Lcom/pgyersdk/update/PgyUpdateManager;->a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V

    return-void
.end method

.method public static unregister()V
    .locals 3

    const/4 v2, 0x0

    sget-object v0, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/pgyersdk/b/a;->cancel(Z)Z

    sget-object v0, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    invoke-virtual {v0}, Lcom/pgyersdk/b/a;->a()V

    sput-object v2, Lcom/pgyersdk/update/PgyUpdateManager;->a:Lcom/pgyersdk/b/a;

    :cond_0
    sput-object v2, Lcom/pgyersdk/update/PgyUpdateManager;->b:Lcom/pgyersdk/update/UpdateManagerListener;

    return-void
.end method
