.class public Lcom/lee/demo/view/CustomProgressDialog;
.super Landroid/app/Dialog;
.source "CustomProgressDialog.java"


# static fields
.field private static customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 17
    return-void
.end method

.method public static createDialog(Landroid/content/Context;)Lcom/lee/demo/view/CustomProgressDialog;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    new-instance v0, Lcom/lee/demo/view/CustomProgressDialog;

    .line 21
    const v1, 0x7f090003

    .line 20
    invoke-direct {v0, p0, v1}, Lcom/lee/demo/view/CustomProgressDialog;-><init>(Landroid/content/Context;I)V

    sput-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    .line 22
    sget-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    const v1, 0x7f03000f

    invoke-virtual {v0, v1}, Lcom/lee/demo/view/CustomProgressDialog;->setContentView(I)V

    .line 23
    sget-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    invoke-virtual {v0}, Lcom/lee/demo/view/CustomProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x11

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 24
    sget-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lee/demo/view/CustomProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 25
    sget-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    return-object v0
.end method


# virtual methods
.method public onWindowFocusChanged(Z)V
    .locals 4
    .param p1, "hasFocus"    # Z

    .prologue
    .line 30
    sget-object v2, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    if-nez v2, :cond_0

    .line 38
    :goto_0
    return-void

    .line 33
    :cond_0
    sget-object v2, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    .line 34
    const v3, 0x7f0a0036

    invoke-virtual {v2, v3}, Lcom/lee/demo/view/CustomProgressDialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 33
    check-cast v1, Landroid/widget/ImageView;

    .line 36
    .local v1, "imageView":Landroid/widget/ImageView;
    invoke-virtual {v1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 35
    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    .line 37
    .local v0, "animationDrawable":Landroid/graphics/drawable/AnimationDrawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    goto :goto_0
.end method

.method public setMessage(Ljava/lang/String;)Lcom/lee/demo/view/CustomProgressDialog;
    .locals 3
    .param p1, "strMessage"    # Ljava/lang/String;

    .prologue
    .line 45
    sget-object v1, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    .line 46
    const v2, 0x7f0a0037

    invoke-virtual {v1, v2}, Lcom/lee/demo/view/CustomProgressDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 45
    check-cast v0, Landroid/widget/TextView;

    .line 48
    .local v0, "tvMsg":Landroid/widget/TextView;
    if-eqz v0, :cond_0

    .line 49
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    :cond_0
    sget-object v1, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    return-object v1
.end method

.method public setTitile(Ljava/lang/String;)Lcom/lee/demo/view/CustomProgressDialog;
    .locals 1
    .param p1, "strTitle"    # Ljava/lang/String;

    .prologue
    .line 41
    sget-object v0, Lcom/lee/demo/view/CustomProgressDialog;->customProgressDialog:Lcom/lee/demo/view/CustomProgressDialog;

    return-object v0
.end method
