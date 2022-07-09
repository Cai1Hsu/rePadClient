.class public abstract Lcom/pgyersdk/update/UpdateManagerListener;
.super Lcom/pgyersdk/crash/h;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/pgyersdk/crash/h;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onNoUpdateAvailable()V
.end method

.method public abstract onUpdateAvailable()V
.end method

.method public onUpdateAvailable(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    invoke-virtual {p0}, Lcom/pgyersdk/update/UpdateManagerListener;->onUpdateAvailable()V

    return-void
.end method
