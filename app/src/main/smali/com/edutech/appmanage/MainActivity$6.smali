.class Lcom/edutech/appmanage/MainActivity$6;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/edutech/appmanage/MainActivity;
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$6;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 2314
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 2318
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$6;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-static {v0}, Lcom/edutech/appmanage/MainActivity;->access$12(Lcom/edutech/appmanage/MainActivity;)Lcom/edutech/appmanage/MainActivity$MyAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity$MyAdapter;->notifyDataSetChanged()V

    .line 2324
    return-void
.end method
