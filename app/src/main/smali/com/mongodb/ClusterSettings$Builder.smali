.class final Lcom/mongodb/ClusterSettings$Builder;
.super Ljava/lang/Object;
.source "ClusterSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ClusterSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private hosts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;"
        }
    .end annotation
.end field

.field private mode:Lcom/mongodb/ClusterConnectionMode;

.field private requiredClusterType:Lcom/mongodb/ClusterType;

.field private requiredReplicaSetName:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    sget-object v0, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    iput-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->mode:Lcom/mongodb/ClusterConnectionMode;

    .line 49
    sget-object v0, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    iput-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->requiredClusterType:Lcom/mongodb/ClusterType;

    .line 53
    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/ClusterSettings$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/ClusterSettings$1;

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/mongodb/ClusterSettings$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/mongodb/ClusterSettings$Builder;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ClusterSettings$Builder;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->hosts:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterType;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ClusterSettings$Builder;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->requiredClusterType:Lcom/mongodb/ClusterType;

    return-object v0
.end method

.method static synthetic access$302(Lcom/mongodb/ClusterSettings$Builder;Lcom/mongodb/ClusterType;)Lcom/mongodb/ClusterType;
    .locals 0
    .param p0, "x0"    # Lcom/mongodb/ClusterSettings$Builder;
    .param p1, "x1"    # Lcom/mongodb/ClusterType;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/mongodb/ClusterSettings$Builder;->requiredClusterType:Lcom/mongodb/ClusterType;

    return-object p1
.end method

.method static synthetic access$400(Lcom/mongodb/ClusterSettings$Builder;)Lcom/mongodb/ClusterConnectionMode;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ClusterSettings$Builder;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->mode:Lcom/mongodb/ClusterConnectionMode;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mongodb/ClusterSettings$Builder;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/ClusterSettings$Builder;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->requiredReplicaSetName:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public build()Lcom/mongodb/ClusterSettings;
    .locals 2

    .prologue
    .line 111
    new-instance v0, Lcom/mongodb/ClusterSettings;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mongodb/ClusterSettings;-><init>(Lcom/mongodb/ClusterSettings$Builder;Lcom/mongodb/ClusterSettings$1;)V

    return-object v0
.end method

.method public hosts(Ljava/util/List;)Lcom/mongodb/ClusterSettings$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/ServerAddress;",
            ">;)",
            "Lcom/mongodb/ClusterSettings$Builder;"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "hosts":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/ServerAddress;>;"
    const-string/jumbo v0, "hosts"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 66
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "hosts list may not be empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1, p1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->hosts:Ljava/util/List;

    .line 69
    return-object p0
.end method

.method public mode(Lcom/mongodb/ClusterConnectionMode;)Lcom/mongodb/ClusterSettings$Builder;
    .locals 1
    .param p1, "mode"    # Lcom/mongodb/ClusterConnectionMode;

    .prologue
    .line 79
    const-string/jumbo v0, "mode"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterConnectionMode;

    iput-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->mode:Lcom/mongodb/ClusterConnectionMode;

    .line 80
    return-object p0
.end method

.method public requiredClusterType(Lcom/mongodb/ClusterType;)Lcom/mongodb/ClusterSettings$Builder;
    .locals 1
    .param p1, "requiredClusterType"    # Lcom/mongodb/ClusterType;

    .prologue
    .line 101
    const-string/jumbo v0, "requiredClusterType"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterType;

    iput-object v0, p0, Lcom/mongodb/ClusterSettings$Builder;->requiredClusterType:Lcom/mongodb/ClusterType;

    .line 102
    return-object p0
.end method

.method public requiredReplicaSetName(Ljava/lang/String;)Lcom/mongodb/ClusterSettings$Builder;
    .locals 0
    .param p1, "requiredReplicaSetName"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/mongodb/ClusterSettings$Builder;->requiredReplicaSetName:Ljava/lang/String;

    .line 91
    return-object p0
.end method
