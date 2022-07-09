.class final Lcom/mongodb/MultiServerCluster$ServerTuple;
.super Ljava/lang/Object;
.source "MultiServerCluster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MultiServerCluster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ServerTuple"
.end annotation


# instance fields
.field private description:Lcom/mongodb/ServerDescription;

.field private final server:Lcom/mongodb/ClusterableServer;


# direct methods
.method private constructor <init>(Lcom/mongodb/ClusterableServer;Lcom/mongodb/ServerDescription;)V
    .locals 0
    .param p1, "server"    # Lcom/mongodb/ClusterableServer;
    .param p2, "description"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/mongodb/MultiServerCluster$ServerTuple;->server:Lcom/mongodb/ClusterableServer;

    .line 54
    iput-object p2, p0, Lcom/mongodb/MultiServerCluster$ServerTuple;->description:Lcom/mongodb/ServerDescription;

    .line 55
    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/ClusterableServer;Lcom/mongodb/ServerDescription;Lcom/mongodb/MultiServerCluster$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/ClusterableServer;
    .param p2, "x1"    # Lcom/mongodb/ServerDescription;
    .param p3, "x2"    # Lcom/mongodb/MultiServerCluster$1;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/mongodb/MultiServerCluster$ServerTuple;-><init>(Lcom/mongodb/ClusterableServer;Lcom/mongodb/ServerDescription;)V

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ClusterableServer;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MultiServerCluster$ServerTuple;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/MultiServerCluster$ServerTuple;->server:Lcom/mongodb/ClusterableServer;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mongodb/MultiServerCluster$ServerTuple;)Lcom/mongodb/ServerDescription;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MultiServerCluster$ServerTuple;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/mongodb/MultiServerCluster$ServerTuple;->description:Lcom/mongodb/ServerDescription;

    return-object v0
.end method

.method static synthetic access$202(Lcom/mongodb/MultiServerCluster$ServerTuple;Lcom/mongodb/ServerDescription;)Lcom/mongodb/ServerDescription;
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/MultiServerCluster$ServerTuple;
    .param p1, "x1"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/mongodb/MultiServerCluster$ServerTuple;->description:Lcom/mongodb/ServerDescription;

    return-object p1
.end method
