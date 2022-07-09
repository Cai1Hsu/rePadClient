.class final enum Lcom/mongodb/tools/ConnectionPoolStat$Position;
.super Ljava/lang/Enum;
.source "ConnectionPoolStat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/tools/ConnectionPoolStat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Position"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/tools/ConnectionPoolStat$Position;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/tools/ConnectionPoolStat$Position;

.field public static final enum LAST:Lcom/mongodb/tools/ConnectionPoolStat$Position;

.field public static final enum REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$Position;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 311
    new-instance v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;

    const-string/jumbo v1, "REGULAR"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/tools/ConnectionPoolStat$Position;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    new-instance v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;

    const-string/jumbo v1, "LAST"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/tools/ConnectionPoolStat$Position;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;->LAST:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/tools/ConnectionPoolStat$Position;

    sget-object v1, Lcom/mongodb/tools/ConnectionPoolStat$Position;->REGULAR:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/tools/ConnectionPoolStat$Position;->LAST:Lcom/mongodb/tools/ConnectionPoolStat$Position;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;->$VALUES:[Lcom/mongodb/tools/ConnectionPoolStat$Position;

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
    .line 311
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/tools/ConnectionPoolStat$Position;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 311
    const-class v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/tools/ConnectionPoolStat$Position;
    .locals 1

    .prologue
    .line 311
    sget-object v0, Lcom/mongodb/tools/ConnectionPoolStat$Position;->$VALUES:[Lcom/mongodb/tools/ConnectionPoolStat$Position;

    invoke-virtual {v0}, [Lcom/mongodb/tools/ConnectionPoolStat$Position;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/tools/ConnectionPoolStat$Position;

    return-object v0
.end method
