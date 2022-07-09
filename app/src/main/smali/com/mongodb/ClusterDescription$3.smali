.class Lcom/mongodb/ClusterDescription$3;
.super Ljava/lang/Object;
.source "ClusterDescription.java"

# interfaces
.implements Lcom/mongodb/ClusterDescription$Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/ClusterDescription;->getSecondaries()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/ClusterDescription;


# direct methods
.method constructor <init>(Lcom/mongodb/ClusterDescription;)V
    .locals 0

    .prologue
    .line 111
    iput-object p1, p0, Lcom/mongodb/ClusterDescription$3;->this$0:Lcom/mongodb/ClusterDescription;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/mongodb/ServerDescription;)Z
    .locals 1
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 113
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isSecondary()Z

    move-result v0

    return v0
.end method
