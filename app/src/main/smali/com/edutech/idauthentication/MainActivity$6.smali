.class Lcom/edutech/idauthentication/MainActivity$6;
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

.field private final synthetic val$dialog:Landroid/app/AlertDialog;


# direct methods
.method constructor <init>(Lcom/edutech/idauthentication/MainActivity;Landroid/app/AlertDialog;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/idauthentication/MainActivity$6;->this$0:Lcom/edutech/idauthentication/MainActivity;

    iput-object p2, p0, Lcom/edutech/idauthentication/MainActivity$6;->val$dialog:Landroid/app/AlertDialog;

    .line 1247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1252
    invoke-static {}, Lcom/edutech/idauthentication/MainActivity;->access$3()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/edutech/idauthentication/FileInOutHelper;->setupOrOpenFile(Ljava/lang/String;)Ljava/io/File;

    .line 1255
    iget-object v0, p0, Lcom/edutech/idauthentication/MainActivity$6;->val$dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 1256
    return-void
.end method
