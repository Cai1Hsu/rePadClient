.class final Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;
.super Ljava/lang/Object;
.source "MultiServerCluster.java"

# interfaces
.implements Lcom/mongodb/ChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MultiServerCluster;
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
.field final synthetic this$0:Lcom/mongodb/MultiServerCluster;


# direct methods
.method private constructor <init>(Lcom/mongodb/MultiServerCluster;)V
    .locals 0

    .prologue
    .line 109
    iput-object p1, p0, Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;->this$0:Lcom/mongodb/MultiServerCluster;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/MultiServerCluster;Lcom/mongodb/MultiServerCluster$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/MultiServerCluster;
    .param p2, "x1"    # Lcom/mongodb/MultiServerCluster$1;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;-><init>(Lcom/mongodb/MultiServerCluster;)V

    return-void
.end method


# virtual methods
.method public stateChanged(Lcom/mongodb/ChangeEvent;)V
    .locals 1
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
    .line 111
    .local p1, "event":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<Lcom/mongodb/ServerDescription;>;"
    iget-object v0, p0, Lcom/mongodb/MultiServerCluster$DefaultServerStateListener;->this$0:Lcom/mongodb/MultiServerCluster;

    invoke-static {v0, p1}, Lcom/mongodb/MultiServerCluster;->access$100(Lcom/mongodb/MultiServerCluster;Lcom/mongodb/ChangeEvent;)V

    .line 112
    return-void
.end method
