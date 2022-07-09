.class final enum Lcom/mongodb/BSONContextType;
.super Ljava/lang/Enum;
.source "BSONContextType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/BSONContextType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/BSONContextType;

.field public static final enum ARRAY:Lcom/mongodb/BSONContextType;

.field public static final enum DOCUMENT:Lcom/mongodb/BSONContextType;

.field public static final enum JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONContextType;

.field public static final enum SCOPE_DOCUMENT:Lcom/mongodb/BSONContextType;

.field public static final enum TOP_LEVEL:Lcom/mongodb/BSONContextType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/mongodb/BSONContextType;

    const-string/jumbo v1, "TOP_LEVEL"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BSONContextType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONContextType;->TOP_LEVEL:Lcom/mongodb/BSONContextType;

    .line 28
    new-instance v0, Lcom/mongodb/BSONContextType;

    const-string/jumbo v1, "DOCUMENT"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/BSONContextType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONContextType;->DOCUMENT:Lcom/mongodb/BSONContextType;

    .line 33
    new-instance v0, Lcom/mongodb/BSONContextType;

    const-string/jumbo v1, "ARRAY"

    invoke-direct {v0, v1, v4}, Lcom/mongodb/BSONContextType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    .line 38
    new-instance v0, Lcom/mongodb/BSONContextType;

    const-string/jumbo v1, "JAVASCRIPT_WITH_SCOPE"

    invoke-direct {v0, v1, v5}, Lcom/mongodb/BSONContextType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONContextType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONContextType;

    .line 43
    new-instance v0, Lcom/mongodb/BSONContextType;

    const-string/jumbo v1, "SCOPE_DOCUMENT"

    invoke-direct {v0, v1, v6}, Lcom/mongodb/BSONContextType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONContextType;->SCOPE_DOCUMENT:Lcom/mongodb/BSONContextType;

    .line 19
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/mongodb/BSONContextType;

    sget-object v1, Lcom/mongodb/BSONContextType;->TOP_LEVEL:Lcom/mongodb/BSONContextType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/BSONContextType;->DOCUMENT:Lcom/mongodb/BSONContextType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mongodb/BSONContextType;->ARRAY:Lcom/mongodb/BSONContextType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/BSONContextType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONContextType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mongodb/BSONContextType;->SCOPE_DOCUMENT:Lcom/mongodb/BSONContextType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/mongodb/BSONContextType;->$VALUES:[Lcom/mongodb/BSONContextType;

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
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/BSONContextType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/mongodb/BSONContextType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BSONContextType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/BSONContextType;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/mongodb/BSONContextType;->$VALUES:[Lcom/mongodb/BSONContextType;

    invoke-virtual {v0}, [Lcom/mongodb/BSONContextType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/BSONContextType;

    return-object v0
.end method
