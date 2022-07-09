.class final enum Lcom/mongodb/ClusterType;
.super Ljava/lang/Enum;
.source "ClusterType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/ClusterType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/ClusterType;

.field public static final enum ReplicaSet:Lcom/mongodb/ClusterType;

.field public static final enum Sharded:Lcom/mongodb/ClusterType;

.field public static final enum StandAlone:Lcom/mongodb/ClusterType;

.field public static final enum Unknown:Lcom/mongodb/ClusterType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/mongodb/ClusterType;

    const-string/jumbo v1, "StandAlone"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/ClusterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ClusterType;->StandAlone:Lcom/mongodb/ClusterType;

    .line 31
    new-instance v0, Lcom/mongodb/ClusterType;

    const-string/jumbo v1, "ReplicaSet"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/ClusterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    .line 36
    new-instance v0, Lcom/mongodb/ClusterType;

    const-string/jumbo v1, "Sharded"

    invoke-direct {v0, v1, v4}, Lcom/mongodb/ClusterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    .line 41
    new-instance v0, Lcom/mongodb/ClusterType;

    const-string/jumbo v1, "Unknown"

    invoke-direct {v0, v1, v5}, Lcom/mongodb/ClusterType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    .line 22
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mongodb/ClusterType;

    sget-object v1, Lcom/mongodb/ClusterType;->StandAlone:Lcom/mongodb/ClusterType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/ClusterType;->ReplicaSet:Lcom/mongodb/ClusterType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mongodb/ClusterType;->Sharded:Lcom/mongodb/ClusterType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/ClusterType;->Unknown:Lcom/mongodb/ClusterType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/mongodb/ClusterType;->$VALUES:[Lcom/mongodb/ClusterType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/ClusterType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/mongodb/ClusterType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/ClusterType;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/mongodb/ClusterType;->$VALUES:[Lcom/mongodb/ClusterType;

    invoke-virtual {v0}, [Lcom/mongodb/ClusterType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/ClusterType;

    return-object v0
.end method
