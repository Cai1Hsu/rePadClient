.class final enum Lcom/mongodb/BSONBinarySubType;
.super Ljava/lang/Enum;
.source "BSONBinarySubType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/BSONBinarySubType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/BSONBinarySubType;

.field public static final enum Binary:Lcom/mongodb/BSONBinarySubType;

.field public static final enum Function:Lcom/mongodb/BSONBinarySubType;

.field public static final enum MD5:Lcom/mongodb/BSONBinarySubType;

.field public static final enum OldBinary:Lcom/mongodb/BSONBinarySubType;

.field public static final enum UserDefined:Lcom/mongodb/BSONBinarySubType;

.field public static final enum UuidLegacy:Lcom/mongodb/BSONBinarySubType;

.field public static final enum UuidStandard:Lcom/mongodb/BSONBinarySubType;


# instance fields
.field private final value:B


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 23
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "Binary"

    invoke-direct {v0, v1, v4, v4}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->Binary:Lcom/mongodb/BSONBinarySubType;

    .line 28
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "Function"

    invoke-direct {v0, v1, v5, v5}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->Function:Lcom/mongodb/BSONBinarySubType;

    .line 33
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "OldBinary"

    invoke-direct {v0, v1, v6, v6}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->OldBinary:Lcom/mongodb/BSONBinarySubType;

    .line 38
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "UuidLegacy"

    invoke-direct {v0, v1, v7, v7}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->UuidLegacy:Lcom/mongodb/BSONBinarySubType;

    .line 43
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "UuidStandard"

    invoke-direct {v0, v1, v8, v8}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->UuidStandard:Lcom/mongodb/BSONBinarySubType;

    .line 48
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "MD5"

    const/4 v2, 0x5

    const/4 v3, 0x5

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->MD5:Lcom/mongodb/BSONBinarySubType;

    .line 53
    new-instance v0, Lcom/mongodb/BSONBinarySubType;

    const-string/jumbo v1, "UserDefined"

    const/4 v2, 0x6

    const/16 v3, -0x80

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/BSONBinarySubType;-><init>(Ljava/lang/String;IB)V

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->UserDefined:Lcom/mongodb/BSONBinarySubType;

    .line 19
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/mongodb/BSONBinarySubType;

    sget-object v1, Lcom/mongodb/BSONBinarySubType;->Binary:Lcom/mongodb/BSONBinarySubType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/BSONBinarySubType;->Function:Lcom/mongodb/BSONBinarySubType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mongodb/BSONBinarySubType;->OldBinary:Lcom/mongodb/BSONBinarySubType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mongodb/BSONBinarySubType;->UuidLegacy:Lcom/mongodb/BSONBinarySubType;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mongodb/BSONBinarySubType;->UuidStandard:Lcom/mongodb/BSONBinarySubType;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/mongodb/BSONBinarySubType;->MD5:Lcom/mongodb/BSONBinarySubType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mongodb/BSONBinarySubType;->UserDefined:Lcom/mongodb/BSONBinarySubType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mongodb/BSONBinarySubType;->$VALUES:[Lcom/mongodb/BSONBinarySubType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IB)V
    .locals 0
    .param p3, "value"    # B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(B)V"
        }
    .end annotation

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 58
    iput-byte p3, p0, Lcom/mongodb/BSONBinarySubType;->value:B

    .line 59
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/BSONBinarySubType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/mongodb/BSONBinarySubType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BSONBinarySubType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/BSONBinarySubType;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/mongodb/BSONBinarySubType;->$VALUES:[Lcom/mongodb/BSONBinarySubType;

    invoke-virtual {v0}, [Lcom/mongodb/BSONBinarySubType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/BSONBinarySubType;

    return-object v0
.end method


# virtual methods
.method public getValue()B
    .locals 1

    .prologue
    .line 62
    iget-byte v0, p0, Lcom/mongodb/BSONBinarySubType;->value:B

    return v0
.end method
