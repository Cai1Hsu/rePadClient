.class Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;

.field private final synthetic val$packagename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;->this$3:Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;

    iput-object p2, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;->val$packagename:Ljava/lang/String;

    .line 1749
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1756
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 1758
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;->this$3:Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;)Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;)Lcom/edutech/appmanage/MainActivity$MyAdapter;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity;->access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;

    move-result-object v1

    .line 1759
    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 1760
    .local v0, "message":Landroid/os/Message;
    invoke-static {}, Lcom/edutech/appmanage/MainActivity;->access$14()I

    move-result v1

    iput v1, v0, Landroid/os/Message;->what:I

    .line 1761
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;->val$packagename:Ljava/lang/String;

    iput-object v1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1762
    iget-object v1, p0, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1$1;->this$3:Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter$5$1;)Lcom/edutech/appmanage/MainActivity$MyAdapter$5;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter$5;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter$5;)Lcom/edutech/appmanage/MainActivity$MyAdapter;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->access$0(Lcom/edutech/appmanage/MainActivity$MyAdapter;)Lcom/edutech/appmanage/MainActivity;

    move-result-object v1

    invoke-static {v1}, Lcom/edutech/appmanage/MainActivity;->access$21(Lcom/edutech/appmanage/MainActivity;)Landroid/os/Handler;

    move-result-object v1

    .line 1763
    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1784
    return-void
.end method
