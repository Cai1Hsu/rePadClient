.class final enum Lcom/mongodb/ServerConnectionState;
.super Ljava/lang/Enum;
.source "ServerConnectionState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/ServerConnectionState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/ServerConnectionState;

.field public static final enum Connected:Lcom/mongodb/ServerConnectionState;

.field public static final enum Connecting:Lcom/mongodb/ServerConnectionState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 23
    new-instance v0, Lcom/mongodb/ServerConnectionState;

    const-string/jumbo v1, "Connecting"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/ServerConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerConnectionState;->Connecting:Lcom/mongodb/ServerConnectionState;

    .line 28
    new-instance v0, Lcom/mongodb/ServerConnectionState;

    const-string/jumbo v1, "Connected"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/ServerConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/ServerConnectionState;->Connected:Lcom/mongodb/ServerConnectionState;

    .line 19
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/ServerConnectionState;

    sget-object v1, Lcom/mongodb/ServerConnectionState;->Connecting:Lcom/mongodb/ServerConnectionState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/ServerConnectionState;->Connected:Lcom/mongodb/ServerConnectionState;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mongodb/ServerConnectionState;->$VALUES:[Lcom/mongodb/ServerConnectionState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/ServerConnectionState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/mongodb/ServerConnectionState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ServerConnectionState;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/ServerConnectionState;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/mongodb/ServerConnectionState;->$VALUES:[Lcom/mongodb/ServerConnectionState;

    invoke-virtual {v0}, [Lcom/mongodb/ServerConnectionState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/ServerConnectionState;

    return-object v0
.end method
