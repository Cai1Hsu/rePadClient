.class Lcom/edutech/appmanage/MainActivity$16;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/edutech/appmanage/MainActivity;->onResume()V
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
    iput-object p1, p0, Lcom/edutech/appmanage/MainActivity$16;->this$0:Lcom/edutech/appmanage/MainActivity;

    .line 1255
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized run()V
    .locals 1

    .prologue
    .line 1273
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/edutech/appmanage/MainActivity$16;->this$0:Lcom/edutech/appmanage/MainActivity;

    invoke-virtual {v0}, Lcom/edutech/appmanage/MainActivity;->parse_json()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1276
    monitor-exit p0

    return-void

    .line 1273
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
