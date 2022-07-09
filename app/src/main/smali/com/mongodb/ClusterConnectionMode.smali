.class final enum Lcom/mongodb/ClusterConnectionMode;
.super Ljava/lang/Enum;
.source "ClusterConnectionMode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/ClusterConnectionMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/ClusterConnectionMode;

.field public static final enum Multiple:Lcom/mongodb/ClusterConnectionMode;

.field public static final enum Single:Lcom/mongodb/ClusterConnectionMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/mongodb/ClusterConnectionMode;

    const-string/jumbo v1, "Single"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/ClusterConnectionMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    .line 31
    new-instance v0, Lcom/mongodb/ClusterConnectionMode;

    const-string/jumbo v1, "Multiple"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/ClusterConnectionMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    .line 22
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/ClusterConnectionMode;

    sget-object v1, Lcom/mongodb/ClusterConnectionMode;->Single:Lcom/mongodb/ClusterConnectionMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/ClusterConnectionMode;->Multiple:Lcom/mongodb/ClusterConnectionMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mongodb/ClusterConnectionMode;->$VALUES:[Lcom/mongodb/ClusterConnectionMode;

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

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/ClusterConnectionMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/mongodb/ClusterConnectionMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ClusterConnectionMode;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/ClusterConnectionMode;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/mongodb/ClusterConnectionMode;->$VALUES:[Lcom/mongodb/ClusterConnectionMode;

    invoke-virtual {v0}, [Lcom/mongodb/ClusterConnectionMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/ClusterConnectionMode;

    return-object v0
.end method
