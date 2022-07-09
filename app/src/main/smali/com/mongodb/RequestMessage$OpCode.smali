.class final enum Lcom/mongodb/RequestMessage$OpCode;
.super Ljava/lang/Enum;
.source "RequestMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/RequestMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "OpCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/RequestMessage$OpCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_DELETE:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_GETMORE:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_INSERT:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_KILL_CURSORS:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_MSG:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_QUERY:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_REPLY:Lcom/mongodb/RequestMessage$OpCode;

.field public static final enum OP_UPDATE:Lcom/mongodb/RequestMessage$OpCode;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 83
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_REPLY"

    invoke-direct {v0, v1, v5, v4}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_REPLY:Lcom/mongodb/RequestMessage$OpCode;

    .line 84
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_MSG"

    const/16 v2, 0x3e8

    invoke-direct {v0, v1, v4, v2}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_MSG:Lcom/mongodb/RequestMessage$OpCode;

    .line 85
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_UPDATE"

    const/16 v2, 0x7d1

    invoke-direct {v0, v1, v6, v2}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_UPDATE:Lcom/mongodb/RequestMessage$OpCode;

    .line 86
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_INSERT"

    const/16 v2, 0x7d2

    invoke-direct {v0, v1, v7, v2}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_INSERT:Lcom/mongodb/RequestMessage$OpCode;

    .line 87
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_QUERY"

    const/16 v2, 0x7d4

    invoke-direct {v0, v1, v8, v2}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_QUERY:Lcom/mongodb/RequestMessage$OpCode;

    .line 88
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_GETMORE"

    const/4 v2, 0x5

    const/16 v3, 0x7d5

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_GETMORE:Lcom/mongodb/RequestMessage$OpCode;

    .line 89
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_DELETE"

    const/4 v2, 0x6

    const/16 v3, 0x7d6

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_DELETE:Lcom/mongodb/RequestMessage$OpCode;

    .line 90
    new-instance v0, Lcom/mongodb/RequestMessage$OpCode;

    const-string/jumbo v1, "OP_KILL_CURSORS"

    const/4 v2, 0x7

    const/16 v3, 0x7d7

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/RequestMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->OP_KILL_CURSORS:Lcom/mongodb/RequestMessage$OpCode;

    .line 82
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/mongodb/RequestMessage$OpCode;

    sget-object v1, Lcom/mongodb/RequestMessage$OpCode;->OP_REPLY:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mongodb/RequestMessage$OpCode;->OP_MSG:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/RequestMessage$OpCode;->OP_UPDATE:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mongodb/RequestMessage$OpCode;->OP_INSERT:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mongodb/RequestMessage$OpCode;->OP_QUERY:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/mongodb/RequestMessage$OpCode;->OP_GETMORE:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/mongodb/RequestMessage$OpCode;->OP_DELETE:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/mongodb/RequestMessage$OpCode;->OP_KILL_CURSORS:Lcom/mongodb/RequestMessage$OpCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mongodb/RequestMessage$OpCode;->$VALUES:[Lcom/mongodb/RequestMessage$OpCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 93
    iput p3, p0, Lcom/mongodb/RequestMessage$OpCode;->value:I

    .line 94
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/RequestMessage$OpCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 82
    const-class v0, Lcom/mongodb/RequestMessage$OpCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/RequestMessage$OpCode;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/RequestMessage$OpCode;
    .locals 1

    .prologue
    .line 82
    sget-object v0, Lcom/mongodb/RequestMessage$OpCode;->$VALUES:[Lcom/mongodb/RequestMessage$OpCode;

    invoke-virtual {v0}, [Lcom/mongodb/RequestMessage$OpCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/RequestMessage$OpCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 99
    iget v0, p0, Lcom/mongodb/RequestMessage$OpCode;->value:I

    return v0
.end method
