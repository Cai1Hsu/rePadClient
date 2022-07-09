.class Lcom/edutech/idauthentication/MainActivity$7;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/idauthentication/MainActivity;->userLicenseAgreementDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/edutech/idauthentication/MainActivity;


# direct methods
.method constructor <init>(Lcom/edutech/idauthentication/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity$7;->this$0:Lcom/edutech/idauthentication/MainActivity;

    .line 1258
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1265
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity$7;->this$0:Lcom/edutech/idauthentication/MainActivity;

    iget-object v0, v0, Lcom/edutech/idauthentication/MainActivity;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 1266
    return-void
.end method
