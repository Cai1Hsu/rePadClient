.class final enum Lcom/mongodb/MongoAuthority$Type;
.super Ljava/lang/Enum;
.source "MongoAuthority.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MongoAuthority;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/MongoAuthority$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/MongoAuthority$Type;

.field public static final enum Direct:Lcom/mongodb/MongoAuthority$Type;

.field public static final enum Set:Lcom/mongodb/MongoAuthority$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 44
    new-instance v0, Lcom/mongodb/MongoAuthority$Type;

    const-string/jumbo v1, "Direct"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/MongoAuthority$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/MongoAuthority$Type;->Direct:Lcom/mongodb/MongoAuthority$Type;

    .line 45
    new-instance v0, Lcom/mongodb/MongoAuthority$Type;

    const-string/jumbo v1, "Set"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/MongoAuthority$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/MongoAuthority$Type;->Set:Lcom/mongodb/MongoAuthority$Type;

    .line 43
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/MongoAuthority$Type;

    sget-object v1, Lcom/mongodb/MongoAuthority$Type;->Direct:Lcom/mongodb/MongoAuthority$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/MongoAuthority$Type;->Set:Lcom/mongodb/MongoAuthority$Type;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mongodb/MongoAuthority$Type;->$VALUES:[Lcom/mongodb/MongoAuthority$Type;

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
    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/MongoAuthority$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    const-class v0, Lcom/mongodb/MongoAuthority$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/MongoAuthority$Type;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/MongoAuthority$Type;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/mongodb/MongoAuthority$Type;->$VALUES:[Lcom/mongodb/MongoAuthority$Type;

    invoke-virtual {v0}, [Lcom/mongodb/MongoAuthority$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/MongoAuthority$Type;

    return-object v0
.end method
