.class final Lcom/mongodb/DefaultServer$DefaultServerStateListener;
.super Ljava/lang/Object;
.source "DefaultServer.java"

# interfaces
.implements Lcom/mongodb/ChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DefaultServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DefaultServerStateListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mongodb/ChangeListener",
        "<",
        "Lcom/mongodb/ServerDescription;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/DefaultServer;


# direct methods
.method private constructor <init>(Lcom/mongodb/DefaultServer;)V
    .locals 0

    .prologue
    .line 100
    iput-object p1, p0, Lcom/mongodb/DefaultServer$DefaultServerStateListener;->this$0:Lcom/mongodb/DefaultServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/DefaultServer;Lcom/mongodb/DefaultServer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/DefaultServer;
    .param p2, "x1"    # Lcom/mongodb/DefaultServer$1;

    .prologue
    .line 100
    invoke-direct {p0, p1}, Lcom/mongodb/DefaultServer$DefaultServerStateListener;-><init>(Lcom/mongodb/DefaultServer;)V

    return-void
.end method


# virtual methods
.method public stateChanged(Lcom/mongodb/ChangeEvent;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ChangeEvent",
            "<",
            "Lcom/mongodb/ServerDescription;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, "event":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<Lcom/mongodb/ServerDescription;>;"
    iget-object v3, p0, Lcom/mongodb/DefaultServer$DefaultServerStateListener;->this$0:Lcom/mongodb/DefaultServer;

    invoke-virtual {p1}, Lcom/mongodb/ChangeEvent;->getNewValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mongodb/ServerDescription;

    invoke-static {v3, v2}, Lcom/mongodb/DefaultServer;->access$102(Lcom/mongodb/DefaultServer;Lcom/mongodb/ServerDescription;)Lcom/mongodb/ServerDescription;

    .line 104
    iget-object v2, p0, Lcom/mongodb/DefaultServer$DefaultServerStateListener;->this$0:Lcom/mongodb/DefaultServer;

    invoke-static {v2}, Lcom/mongodb/DefaultServer;->access$200(Lcom/mongodb/DefaultServer;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ChangeListener;

    .line 105
    .local v1, "listener":Lcom/mongodb/ChangeListener;, "Lcom/mongodb/ChangeListener<Lcom/mongodb/ServerDescription;>;"
    invoke-interface {v1, p1}, Lcom/mongodb/ChangeListener;->stateChanged(Lcom/mongodb/ChangeEvent;)V

    goto :goto_0

    .line 107
    .end local v1    # "listener":Lcom/mongodb/ChangeListener;, "Lcom/mongodb/ChangeListener<Lcom/mongodb/ServerDescription;>;"
    :cond_0
    return-void
.end method
