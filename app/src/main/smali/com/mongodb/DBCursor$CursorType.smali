.class final enum Lcom/mongodb/DBCursor$CursorType;
.super Ljava/lang/Enum;
.source "DBCursor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBCursor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "CursorType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/DBCursor$CursorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/DBCursor$CursorType;

.field public static final enum ARRAY:Lcom/mongodb/DBCursor$CursorType;

.field public static final enum ITERATOR:Lcom/mongodb/DBCursor$CursorType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 148
    new-instance v0, Lcom/mongodb/DBCursor$CursorType;

    const-string/jumbo v1, "ITERATOR"

    invoke-direct {v0, v1, v2}, Lcom/mongodb/DBCursor$CursorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/DBCursor$CursorType;->ITERATOR:Lcom/mongodb/DBCursor$CursorType;

    new-instance v0, Lcom/mongodb/DBCursor$CursorType;

    const-string/jumbo v1, "ARRAY"

    invoke-direct {v0, v1, v3}, Lcom/mongodb/DBCursor$CursorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/mongodb/DBCursor$CursorType;->ARRAY:Lcom/mongodb/DBCursor$CursorType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/mongodb/DBCursor$CursorType;

    sget-object v1, Lcom/mongodb/DBCursor$CursorType;->ITERATOR:Lcom/mongodb/DBCursor$CursorType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/mongodb/DBCursor$CursorType;->ARRAY:Lcom/mongodb/DBCursor$CursorType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/mongodb/DBCursor$CursorType;->$VALUES:[Lcom/mongodb/DBCursor$CursorType;

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
    .line 148
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/DBCursor$CursorType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 148
    const-class v0, Lcom/mongodb/DBCursor$CursorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/DBCursor$CursorType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/DBCursor$CursorType;
    .locals 1

    .prologue
    .line 148
    sget-object v0, Lcom/mongodb/DBCursor$CursorType;->$VALUES:[Lcom/mongodb/DBCursor$CursorType;

    invoke-virtual {v0}, [Lcom/mongodb/DBCursor$CursorType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/DBCursor$CursorType;

    return-object v0
.end method
