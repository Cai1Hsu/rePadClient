.class public final enum Lcom/mongodb/AggregationOptions$OutputMode;
.super Ljava/lang/Enum;
.source "AggregationOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/AggregationOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OutputMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/AggregationOptions$OutputMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/AggregationOptions$OutputMode;

.field public static final enum CURSOR:Lcom/mongodb/AggregationOptions$OutputMode;

.field public static final enum INLINE:Lcom/mongodb/AggregationOptions$OutputMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 40
    new-instance v0, Lcom/mongodb/AggregationOptions$OutputMode;

    const-string/jumbo v1, "INLINE"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/AggregationOptions$OutputMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/AggregationOptions$OutputMode;->INLINE:Lcom/mongodb/AggregationOptions$OutputMode;

    .line 45
    new-instance v0, Lcom/mongodb/AggregationOptions$OutputMode;

    const-string/jumbo v1, "CURSOR"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/AggregationOptions$OutputMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/AggregationOptions$OutputMode;->CURSOR:Lcom/mongodb/AggregationOptions$OutputMode;

    .line 36
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/AggregationOptions$OutputMode;

    sget-object v1, Lcom/mongodb/AggregationOptions$OutputMode;->INLINE:Lcom/mongodb/AggregationOptions$OutputMode;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/AggregationOptions$OutputMode;->CURSOR:Lcom/mongodb/AggregationOptions$OutputMode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mongodb/AggregationOptions$OutputMode;->$VALUES:[Lcom/mongodb/AggregationOptions$OutputMode;

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
    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/AggregationOptions$OutputMode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    const-class v0, Lcom/mongodb/AggregationOptions$OutputMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/AggregationOptions$OutputMode;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/AggregationOptions$OutputMode;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/mongodb/AggregationOptions$OutputMode;->$VALUES:[Lcom/mongodb/AggregationOptions$OutputMode;

    invoke-virtual {v0}, [Lcom/mongodb/AggregationOptions$OutputMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/AggregationOptions$OutputMode;

    return-object v0
.end method
