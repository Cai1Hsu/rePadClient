.class public Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;
.super Ljava/lang/Object;
.source "CustomAlertDialog.java"


# instance fields
.field ad:Landroid/app/AlertDialog;

.field buttonLayout:Landroid/widget/LinearLayout;

.field context:Landroid/content/Context;

.field messageView:Landroid/widget/TextView;

.field titleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->context:Landroid/content/Context;

    .line 30
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->ad:Landroid/app/AlertDialog;

    .line 31
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 33
    iget-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 34
    .local v0, "window":Landroid/view/Window;
    const v1, 0x7f030049

    invoke-virtual {v0, v1}, Landroid/view/Window;->setContentView(I)V

    .line 35
    const v1, 0x7f0a014e

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->titleView:Landroid/widget/TextView;

    .line 36
    const v1, 0x7f0a014f

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->messageView:Landroid/widget/TextView;

    .line 37
    const v1, 0x7f0a0150

    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->buttonLayout:Landroid/widget/LinearLayout;

    .line 38
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->ad:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 116
    return-void
.end method

.method public setMessage(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 47
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->messageView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 48
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->messageView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    return-void
.end method

.method public setNegativeButton(Ljava/lang/String;Landroid/view/View$OnClickListener;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 94
    new-instance v0, Landroid/widget/Button;

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 97
    .local v0, "button":Landroid/widget/Button;
    sget v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mWidth:I

    const/16 v3, 0x500

    if-ne v2, v3, :cond_0

    .line 98
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x82

    const/16 v3, 0x32

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 103
    .local v1, "params":Landroid/widget/LinearLayout$LayoutParams;
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 104
    const v2, 0x7f02010c

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 105
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 106
    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 107
    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 108
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->buttonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 110
    return-void

    .line 101
    .end local v1    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x64

    const/16 v3, 0x28

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .restart local v1    # "params":Landroid/widget/LinearLayout$LayoutParams;
    goto :goto_0
.end method

.method public setPositiveButton(Ljava/lang/String;Landroid/view/View$OnClickListener;)V
    .locals 5
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "listener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v4, 0x0

    .line 61
    new-instance v0, Landroid/widget/Button;

    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 64
    .local v0, "button":Landroid/widget/Button;
    sget v2, Lcom/edutech/mobilestudyclient/activity/CloudClientActivity;->mWidth:I

    const/16 v3, 0x500

    if-ne v2, v3, :cond_0

    .line 65
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x82

    const/16 v3, 0x32

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 70
    .local v1, "params":Landroid/widget/LinearLayout$LayoutParams;
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    const v2, 0x7f02010d

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setBackgroundResource(I)V

    .line 72
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 73
    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextColor(I)V

    .line 74
    const/high16 v2, 0x41a00000    # 20.0f

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setTextSize(F)V

    .line 75
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->buttonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-lez v2, :cond_1

    .line 78
    const/16 v2, 0x14

    invoke-virtual {v1, v2, v4, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->buttonLayout:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 85
    :goto_1
    return-void

    .line 68
    .end local v1    # "params":Landroid/widget/LinearLayout$LayoutParams;
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x64

    const/16 v3, 0x28

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .restart local v1    # "params":Landroid/widget/LinearLayout$LayoutParams;
    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    iget-object v2, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->buttonLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_1
.end method

.method public setTitle(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 41
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 42
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/view/CustomAlertDialog;->titleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    return-void
.end method
