.class Lcom/mongodb/ClusterDescription$4;
.super Ljava/lang/Object;
.source "ClusterDescription.java"

# interfaces
.implements Lcom/mongodb/ClusterDescription$Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/ClusterDescription;->getSecondaries(Lcom/mongodb/Tags;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/ClusterDescription;

.field final synthetic val$tags:Lcom/mongodb/Tags;


# direct methods
.method constructor <init>(Lcom/mongodb/ClusterDescription;Lcom/mongodb/Tags;)V
    .locals 0

    .prologue
    .line 119
    iput-object p1, p0, Lcom/mongodb/ClusterDescription$4;->this$0:Lcom/mongodb/ClusterDescription;

    iput-object p2, p0, Lcom/mongodb/ClusterDescription$4;->val$tags:Lcom/mongodb/Tags;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/mongodb/ServerDescription;)Z
    .locals 1
    .param p1, "serverDescription"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 121
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->isSecondary()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mongodb/ClusterDescription$4;->val$tags:Lcom/mongodb/Tags;

    invoke-virtual {p1, v0}, Lcom/mongodb/ServerDescription;->hasTags(Lcom/mongodb/Tags;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
