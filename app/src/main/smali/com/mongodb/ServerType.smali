.class abstract enum Lcom/mongodb/ServerType;
.super Ljava/lang/Enum;
.source "ServerType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/ServerType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/ServerType;

.field public static final enum ReplicaSetArbiter:Lcom/mongodb/ServerType;

.field public static final enum ReplicaSetGhost:Lcom/mongodb/ServerType;

.field public static final enum ReplicaSetOther:Lcom/mongodb/ServerType;

.field public static final enum ReplicaSetPrimary:Lcom/mongodb/ServerType;

.field public static final enum ReplicaSetSecondary:Lcom/mongodb/ServerType;

.field public static final enum ShardRouter:Lcom/mongodb/ServerType;

.field public static final enum StandAlone:Lcom/mongodb/ServerType;

.field public static final enum Unknown:Lcom/mongodb/ServerType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 26
    new-instance v0, Lcom/mongodb/ServerType$1;

    const-string/jumbo v1, "StandAlone"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/ServerType$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    .line 36
    new-instance v0, Lcom/mongodb/ServerType$2;

    const-string/jumbo v1, "ReplicaSetPrimary"

    invoke-direct {v0, v1, v4}, Lcom/mongodb/ServerType$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->ReplicaSetPrimary:Lcom/mongodb/ServerType;

    .line 46
    new-instance v0, Lcom/mongodb/ServerType$3;

    const-string/jumbo v1, "ReplicaSetSecondary"

    invoke-direct {v0, v1, v5}, Lcom/mongodb/ServerType$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->ReplicaSetSecondary:Lcom/mongodb/ServerType;

    .line 56
    new-instance v0, Lcom/mongodb/ServerType$4;

    const-string/jumbo v1, "ReplicaSetArbiter"

    invoke-direct {v0, v1, v6}, Lcom/mongodb/ServerType$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->ReplicaSetArbiter:Lcom/mongodb/ServerType;

    .line 66
    new-instance v0, Lcom/mongodb/ServerType$5;

    const-string/jumbo v1, "ReplicaSetOther"

    invoke-direct {v0, v1, v7}, Lcom/mongodb/ServerType$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->ReplicaSetOther:Lcom/mongodb/ServerType;

    .line 76
    new-instance v0, Lcom/mongodb/ServerType$6;

    const-string/jumbo v1, "ReplicaSetGhost"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/mongodb/ServerType$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->ReplicaSetGhost:Lcom/mongodb/ServerType;

    .line 86
    new-instance v0, Lcom/mongodb/ServerType$7;

    const-string/jumbo v1, "ShardRouter"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/mongodb/ServerType$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    .line 96
    new-instance v0, Lcom/mongodb/ServerType$8;

    const-string/jumbo v1, "Unknown"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/mongodb/ServerType$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerType;->Unknown:Lcom/mongodb/ServerType;

    .line 22
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/mongodb/ServerType;

    sget-object v1, Lcom/mongodb/ServerType;->StandAlone:Lcom/mongodb/ServerType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetPrimary:Lcom/mongodb/ServerType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetSecondary:Lcom/mongodb/ServerType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetArbiter:Lcom/mongodb/ServerType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mongodb/ServerType;->ReplicaSetOther:Lcom/mongodb/ServerType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/mongodb/ServerType;->ReplicaSetGhost:Lcom/mongodb/ServerType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mongodb/ServerType;->ShardRouter:Lcom/mongodb/ServerType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mongodb/ServerType;->Unknown:Lcom/mongodb/ServerType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mongodb/ServerType;->$VALUES:[Lcom/mongodb/ServerType;

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

.method synthetic constructor <init>(Ljava/lang/String;ILcom/mongodb/ServerType$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/mongodb/ServerType$1;

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/mongodb/ServerType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/ServerType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/mongodb/ServerType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/ServerType;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/mongodb/ServerType;->$VALUES:[Lcom/mongodb/ServerType;

    invoke-virtual {v0}, [Lcom/mongodb/ServerType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/ServerType;

    return-object v0
.end method


# virtual methods
.method public abstract getClusterType()Lcom/mongodb/ClusterType;
.end method
