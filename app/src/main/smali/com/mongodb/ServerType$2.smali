.class final enum Lcom/mongodb/ServerType$2;
.super Lcom/mongodb/ServerType;
.source "ServerType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ServerType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 36
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mongodb/ServerType;-><init>(Ljava/lang/String;ILcom/mongodb/ServerType$1;)V

    return-void
.end method


# virtual methods
.method public getClusterType()Lcom/mongodb/ClusterType;
    .locals 1

    .prologue
    .line 39
    sget-object v0, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    return-object v0
.end method
