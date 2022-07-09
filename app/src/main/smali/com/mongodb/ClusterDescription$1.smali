.class Lcom/mongodb/ClusterDescription$1;
.super Ljava/lang/Object;
.source "ClusterDescription.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mongodb/ClusterDescription;-><init>(Lcom/mongodb/ClusterConnectionMode;Lcom/mongodb/ClusterType;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/mongodb/ServerDescription;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/ClusterDescription;


# direct methods
.method constructor <init>(Lcom/mongodb/ClusterDescription;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/mongodb/ClusterDescription$1;->this$0:Lcom/mongodb/ClusterDescription;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)I
    .locals 2
    .param p1, "o1"    # Lcom/mongodb/ServerDescription;
    .param p2, "o2"    # Lcom/mongodb/ServerDescription;

    .prologue
    .line 48
    invoke-virtual {p1}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/mongodb/ServerDescription;->getAddress()Lcom/mongodb/ServerAddress;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mongodb/ServerAddress;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 46
    check-cast p1, Lcom/mongodb/ServerDescription;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/mongodb/ServerDescription;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/ClusterDescription$1;->compare(Lcom/mongodb/ServerDescription;Lcom/mongodb/ServerDescription;)I

    move-result v0

    return v0
.end method
