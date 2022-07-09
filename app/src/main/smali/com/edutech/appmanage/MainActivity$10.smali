.class Lcom/edutech/appmanage/MainActivity$10;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity;->findview()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/appmanage/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 272
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 277
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$22(Lcom/edutech/appmanage/MainActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 279
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 280
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 281
    const v2, 0x7f080197

    .line 280
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 278
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 282
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 309
    :goto_0
    return-void

    .line 285
    :cond_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$23(Lcom/edutech/appmanage/MainActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 287
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 288
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 289
    const v2, 0x7f080198

    .line 288
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 286
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 290
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 293
    :cond_1
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$8(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 294
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$9(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 295
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0, v3}, Lcom/edutech/appmanage/MainActivity;->access$24(Lcom/edutech/appmanage/MainActivity;Z)V

    .line 297
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->getApplication()Landroid/app/Application;

    move-result-object v0

    .line 298
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v1}, Lcom/edutech/appmanage/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 299
    const v2, 0x7f08003d

    .line 298
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 296
    invoke-static {v0, v1, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 300
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 308
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$10;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$25(Lcom/edutech/appmanage/MainActivity;)V

    goto :goto_0
.end method
