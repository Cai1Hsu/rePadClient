.class public final Lcom/pgyersdk/b/b;
.super Lcom/pgyersdk/b/a;


# instance fields
.field protected d:Z

.field protected e:Ljava/lang/String;

.field private f:Landroid/app/Activity;

.field private g:Landroid/app/AlertDialog;

.field private h:Ljava/lang/String;

.field private i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/pgyersdk/b/a;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lcom/pgyersdk/update/UpdateManagerListener;)V

    iput-object v0, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    iput-object v0, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/pgyersdk/b/b;->d:Z

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/pgyersdk/b/b;->e:Ljava/lang/String;

    iput-object p1, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/pgyersdk/b/b;->d:Z

    return-void
.end method

.method static synthetic a(Lcom/pgyersdk/b/b;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/b/b;->i:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b(Lcom/pgyersdk/b/b;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/b/b;->h:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic c(Lcom/pgyersdk/b/b;)Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 2

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/pgyersdk/b/a;->a()V

    iput-object v1, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    iget-object v0, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    iput-object v1, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method protected final a(Ljava/lang/String;)V
    .locals 7

    const/16 v6, 0x14

    invoke-static {p1}, Lcom/pgyersdk/c/m;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/pgyersdk/b/b;->d:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    const/16 v1, 0x202

    invoke-static {v0, v1}, Lcom/pgyersdk/a/b;->a(Lcom/pgyersdk/crash/h;I)Ljava/lang/String;

    move-result-object v0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "0"

    const-string/jumbo v3, "code"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "data"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "lastBuild"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string/jumbo v2, "lastBuild"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/pgyersdk/b/b;->i:Ljava/lang/String;

    iget-object v2, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    const-string/jumbo v3, "buildNo"

    invoke-static {v2, v3}, Lcom/pgyersdk/c/k;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/pgyersdk/c/m;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v1, "buildNo"

    iget-object v2, p0, Lcom/pgyersdk/b/b;->i:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/pgyersdk/c/k;->a(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string/jumbo v2, "lastBuild buildNO"

    new-instance v3, Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/pgyersdk/b/b;->i:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    const-string/jumbo v5, "buildNo"

    invoke-static {v4, v5}, Lcom/pgyersdk/c/k;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const-string/jumbo v2, "releaseNote"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string/jumbo v2, "releaseNote"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "appUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, "appUrl"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/pgyersdk/b/b;->h:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    :goto_1
    iget-object v1, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    const/16 v3, 0x201

    invoke-static {v2, v3}, Lcom/pgyersdk/a/b;->a(Lcom/pgyersdk/crash/h;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string/jumbo v3, "\u66f4\u65b0\u63d0\u9192"

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    const-string/jumbo v3, "#56bc94"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/16 v3, 0x1e

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v6, v4, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    const-string/jumbo v3, "#56bc94"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setBackgroundColor(I)V

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    const/16 v2, 0x203

    invoke-static {v0, v2}, Lcom/pgyersdk/a/b;->a(Lcom/pgyersdk/crash/h;I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/pgyersdk/b/c;

    invoke-direct {v2, p0}, Lcom/pgyersdk/b/c;-><init>(Lcom/pgyersdk/b/b;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    const/16 v2, 0x204

    invoke-static {v0, v2}, Lcom/pgyersdk/a/b;->a(Lcom/pgyersdk/crash/h;I)Ljava/lang/String;

    move-result-object v0

    new-instance v2, Lcom/pgyersdk/b/d;

    invoke-direct {v2, p0}, Lcom/pgyersdk/b/d;-><init>(Lcom/pgyersdk/b/b;)V

    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    iget-object v0, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    iget-object v0, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    invoke-virtual {v0}, Lcom/pgyersdk/update/UpdateManagerListener;->onUpdateAvailable()V

    goto/16 :goto_0

    :cond_4
    :try_start_1
    iget-object v1, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/pgyersdk/b/b;->c:Lcom/pgyersdk/update/UpdateManagerListener;

    invoke-virtual {v1}, Lcom/pgyersdk/update/UpdateManagerListener;->onNoUpdateAvailable()V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1
.end method

.method protected final b()V
    .locals 1

    const/4 v0, 0x0

    invoke-super {p0}, Lcom/pgyersdk/b/a;->b()V

    iput-object v0, p0, Lcom/pgyersdk/b/b;->f:Landroid/app/Activity;

    iput-object v0, p0, Lcom/pgyersdk/b/b;->g:Landroid/app/AlertDialog;

    return-void
.end method
