.class final enum Lcom/mongodb/WriteRequest$Type;
.super Ljava/lang/Enum;
.source "WriteRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/WriteRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/WriteRequest$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/WriteRequest$Type;

.field public static final enum INSERT:Lcom/mongodb/WriteRequest$Type;

.field public static final enum REMOVE:Lcom/mongodb/WriteRequest$Type;

.field public static final enum REPLACE:Lcom/mongodb/WriteRequest$Type;

.field public static final enum UPDATE:Lcom/mongodb/WriteRequest$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/mongodb/WriteRequest$Type;

    const-string/jumbo v1, "INSERT"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/WriteRequest$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    .line 24
    new-instance v0, Lcom/mongodb/WriteRequest$Type;

    const-string/jumbo v1, "UPDATE"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/WriteRequest$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    .line 25
    new-instance v0, Lcom/mongodb/WriteRequest$Type;

    const-string/jumbo v1, "REPLACE"

    invoke-direct {v0, v1, v4}, Lcom/mongodb/WriteRequest$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    .line 26
    new-instance v0, Lcom/mongodb/WriteRequest$Type;

    const-string/jumbo v1, "REMOVE"

    invoke-direct {v0, v1, v5}, Lcom/mongodb/WriteRequest$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    .line 22
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/mongodb/WriteRequest$Type;

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->INSERT:Lcom/mongodb/WriteRequest$Type;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->UPDATE:Lcom/mongodb/WriteRequest$Type;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REPLACE:Lcom/mongodb/WriteRequest$Type;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/WriteRequest$Type;->REMOVE:Lcom/mongodb/WriteRequest$Type;

    aput-object v1, v0, v5

    sput-object v0, Lcom/mongodb/WriteRequest$Type;->$VALUES:[Lcom/mongodb/WriteRequest$Type;

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

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/WriteRequest$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lcom/mongodb/WriteRequest$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/WriteRequest$Type;
    .locals 1

    .prologue
    .line 22
    sget-object v0, Lcom/mongodb/WriteRequest$Type;->$VALUES:[Lcom/mongodb/WriteRequest$Type;

    invoke-virtual {v0}, [Lcom/mongodb/WriteRequest$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/WriteRequest$Type;

    return-object v0
.end method
