.class final enum Lcom/mongodb/BSONWriter$State;
.super Ljava/lang/Enum;
.source "BSONWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/BSONWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/BSONWriter$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/BSONWriter$State;

.field public static final enum CLOSED:Lcom/mongodb/BSONWriter$State;

.field public static final enum DONE:Lcom/mongodb/BSONWriter$State;

.field public static final enum INITIAL:Lcom/mongodb/BSONWriter$State;

.field public static final enum NAME:Lcom/mongodb/BSONWriter$State;

.field public static final enum SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

.field public static final enum VALUE:Lcom/mongodb/BSONWriter$State;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 526
    new-instance v0, Lcom/mongodb/BSONWriter$State;

    const-string/jumbo v1, "INITIAL"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/BSONWriter$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONWriter$State;->INITIAL:Lcom/mongodb/BSONWriter$State;

    .line 531
    new-instance v0, Lcom/mongodb/BSONWriter$State;

    const-string/jumbo v1, "NAME"

    invoke-direct {v0, v1, v4}, Lcom/mongodb/BSONWriter$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    .line 536
    new-instance v0, Lcom/mongodb/BSONWriter$State;

    const-string/jumbo v1, "VALUE"

    invoke-direct {v0, v1, v5}, Lcom/mongodb/BSONWriter$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    .line 541
    new-instance v0, Lcom/mongodb/BSONWriter$State;

    const-string/jumbo v1, "SCOPE_DOCUMENT"

    invoke-direct {v0, v1, v6}, Lcom/mongodb/BSONWriter$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONWriter$State;->SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

    .line 546
    new-instance v0, Lcom/mongodb/BSONWriter$State;

    const-string/jumbo v1, "DONE"

    invoke-direct {v0, v1, v7}, Lcom/mongodb/BSONWriter$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONWriter$State;->DONE:Lcom/mongodb/BSONWriter$State;

    .line 551
    new-instance v0, Lcom/mongodb/BSONWriter$State;

    const-string/jumbo v1, "CLOSED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BSONWriter$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/BSONWriter$State;->CLOSED:Lcom/mongodb/BSONWriter$State;

    .line 522
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/mongodb/BSONWriter$State;

    sget-object v1, Lcom/mongodb/BSONWriter$State;->INITIAL:Lcom/mongodb/BSONWriter$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/mongodb/BSONWriter$State;->NAME:Lcom/mongodb/BSONWriter$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/BSONWriter$State;->VALUE:Lcom/mongodb/BSONWriter$State;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mongodb/BSONWriter$State;->SCOPE_DOCUMENT:Lcom/mongodb/BSONWriter$State;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mongodb/BSONWriter$State;->DONE:Lcom/mongodb/BSONWriter$State;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/mongodb/BSONWriter$State;->CLOSED:Lcom/mongodb/BSONWriter$State;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mongodb/BSONWriter$State;->$VALUES:[Lcom/mongodb/BSONWriter$State;

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
    .line 522
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/BSONWriter$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 522
    const-class v0, Lcom/mongodb/BSONWriter$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BSONWriter$State;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/BSONWriter$State;
    .locals 1

    .prologue
    .line 522
    sget-object v0, Lcom/mongodb/BSONWriter$State;->$VALUES:[Lcom/mongodb/BSONWriter$State;

    invoke-virtual {v0}, [Lcom/mongodb/BSONWriter$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/BSONWriter$State;

    return-object v0
.end method
