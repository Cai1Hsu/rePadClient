.class final enum Lcom/mongodb/OutMessage$OpCode;
.super Ljava/lang/Enum;
.source "OutMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/OutMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "OpCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/OutMessage$OpCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/OutMessage$OpCode;

.field public static final enum OP_DELETE:Lcom/mongodb/OutMessage$OpCode;

.field public static final enum OP_GETMORE:Lcom/mongodb/OutMessage$OpCode;

.field public static final enum OP_INSERT:Lcom/mongodb/OutMessage$OpCode;

.field public static final enum OP_KILL_CURSORS:Lcom/mongodb/OutMessage$OpCode;

.field public static final enum OP_QUERY:Lcom/mongodb/OutMessage$OpCode;

.field public static final enum OP_UPDATE:Lcom/mongodb/OutMessage$OpCode;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 30
    new-instance v0, Lcom/mongodb/OutMessage$OpCode;

    const-string/jumbo v1, "OP_UPDATE"

    const/16 v2, 0x7d1

    invoke-direct {v0, v1, v4, v2}, Lcom/mongodb/OutMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->OP_UPDATE:Lcom/mongodb/OutMessage$OpCode;

    .line 31
    new-instance v0, Lcom/mongodb/OutMessage$OpCode;

    const-string/jumbo v1, "OP_INSERT"

    const/16 v2, 0x7d2

    invoke-direct {v0, v1, v5, v2}, Lcom/mongodb/OutMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->OP_INSERT:Lcom/mongodb/OutMessage$OpCode;

    .line 32
    new-instance v0, Lcom/mongodb/OutMessage$OpCode;

    const-string/jumbo v1, "OP_QUERY"

    const/16 v2, 0x7d4

    invoke-direct {v0, v1, v6, v2}, Lcom/mongodb/OutMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->OP_QUERY:Lcom/mongodb/OutMessage$OpCode;

    .line 33
    new-instance v0, Lcom/mongodb/OutMessage$OpCode;

    const-string/jumbo v1, "OP_GETMORE"

    const/16 v2, 0x7d5

    invoke-direct {v0, v1, v7, v2}, Lcom/mongodb/OutMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->OP_GETMORE:Lcom/mongodb/OutMessage$OpCode;

    .line 34
    new-instance v0, Lcom/mongodb/OutMessage$OpCode;

    const-string/jumbo v1, "OP_DELETE"

    const/16 v2, 0x7d6

    invoke-direct {v0, v1, v8, v2}, Lcom/mongodb/OutMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->OP_DELETE:Lcom/mongodb/OutMessage$OpCode;

    .line 35
    new-instance v0, Lcom/mongodb/OutMessage$OpCode;

    const-string/jumbo v1, "OP_KILL_CURSORS"

    const/4 v2, 0x5

    const/16 v3, 0x7d7

    invoke-direct {v0, v1, v2, v3}, Lcom/mongodb/OutMessage$OpCode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->OP_KILL_CURSORS:Lcom/mongodb/OutMessage$OpCode;

    .line 29
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/mongodb/OutMessage$OpCode;

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_UPDATE:Lcom/mongodb/OutMessage$OpCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_INSERT:Lcom/mongodb/OutMessage$OpCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_QUERY:Lcom/mongodb/OutMessage$OpCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_GETMORE:Lcom/mongodb/OutMessage$OpCode;

    aput-object v1, v0, v7

    sget-object v1, Lcom/mongodb/OutMessage$OpCode;->OP_DELETE:Lcom/mongodb/OutMessage$OpCode;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lcom/mongodb/OutMessage$OpCode;->OP_KILL_CURSORS:Lcom/mongodb/OutMessage$OpCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/mongodb/OutMessage$OpCode;->$VALUES:[Lcom/mongodb/OutMessage$OpCode;

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
    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 38
    iput p3, p0, Lcom/mongodb/OutMessage$OpCode;->value:I

    .line 39
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/OutMessage$OpCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/mongodb/OutMessage$OpCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/OutMessage$OpCode;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/OutMessage$OpCode;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/mongodb/OutMessage$OpCode;->$VALUES:[Lcom/mongodb/OutMessage$OpCode;

    invoke-virtual {v0}, [Lcom/mongodb/OutMessage$OpCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/OutMessage$OpCode;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/mongodb/OutMessage$OpCode;->value:I

    return v0
.end method
