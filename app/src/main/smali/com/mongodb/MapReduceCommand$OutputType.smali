.class public final enum Lcom/mongodb/MapReduceCommand$OutputType;
.super Ljava/lang/Enum;
.source "MapReduceCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MapReduceCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OutputType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/MapReduceCommand$OutputType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/MapReduceCommand$OutputType;

.field public static final enum INLINE:Lcom/mongodb/MapReduceCommand$OutputType;

.field public static final enum MERGE:Lcom/mongodb/MapReduceCommand$OutputType;

.field public static final enum REDUCE:Lcom/mongodb/MapReduceCommand$OutputType;

.field public static final enum REPLACE:Lcom/mongodb/MapReduceCommand$OutputType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 41
    new-instance v0, Lcom/mongodb/MapReduceCommand$OutputType;

    const-string/jumbo v1, "REPLACE"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/MapReduceCommand$OutputType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/MapReduceCommand$OutputType;->REPLACE:Lcom/mongodb/MapReduceCommand$OutputType;

    .line 45
    new-instance v0, Lcom/mongodb/MapReduceCommand$OutputType;

    const-string/jumbo v1, "MERGE"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/MapReduceCommand$OutputType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/MapReduceCommand$OutputType;->MERGE:Lcom/mongodb/MapReduceCommand$OutputType;

    .line 49
    new-instance v0, Lcom/mongodb/MapReduceCommand$OutputType;

    const-string/jumbo v1, "REDUCE"

    invoke-direct {v0, v1, v4}, Lcom/mongodb/MapReduceCommand$OutputType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/MapReduceCommand$OutputType;->REDUCE:Lcom/mongodb/MapReduceCommand$OutputType;

    .line 53
    new-instance v0, Lcom/mongodb/MapReduceCommand$OutputType;

    const-string/jumbo v1, "INLINE"

    invoke-direct {v0, v1, v5}, Lcom/mongodb/MapReduceCommand$OutputType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/MapReduceCommand$OutputType;->INLINE:Lcom/mongodb/MapReduceCommand$OutputType;

    .line 37
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mongodb/MapReduceCommand$OutputType;

    sget-object v1, Lcom/mongodb/MapReduceCommand$OutputType;->REPLACE:Lcom/mongodb/MapReduceCommand$OutputType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/MapReduceCommand$OutputType;->MERGE:Lcom/mongodb/MapReduceCommand$OutputType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mongodb/MapReduceCommand$OutputType;->REDUCE:Lcom/mongodb/MapReduceCommand$OutputType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/MapReduceCommand$OutputType;->INLINE:Lcom/mongodb/MapReduceCommand$OutputType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/mongodb/MapReduceCommand$OutputType;->$VALUES:[Lcom/mongodb/MapReduceCommand$OutputType;

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
    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/MapReduceCommand$OutputType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 37
    const-class v0, Lcom/mongodb/MapReduceCommand$OutputType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MapReduceCommand$OutputType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/MapReduceCommand$OutputType;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/mongodb/MapReduceCommand$OutputType;->$VALUES:[Lcom/mongodb/MapReduceCommand$OutputType;

    invoke-virtual {v0}, [Lcom/mongodb/MapReduceCommand$OutputType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/MapReduceCommand$OutputType;

    return-object v0
.end method
