.class public abstract enum Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;
.super Ljava/lang/Enum;
.source "AbstractCopyOnWriteMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/util/AbstractCopyOnWriteMap$View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4409
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

.field public static final enum LIVE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

.field public static final enum STABLE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 572
    new-instance v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type$1;

    const-string/jumbo v1, "STABLE"

    invoke-direct {v0, v1, v2}, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->STABLE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    .line 578
    new-instance v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type$2;

    const-string/jumbo v1, "LIVE"

    invoke-direct {v0, v1, v3}, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->LIVE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    .line 571
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    sget-object v1, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->STABLE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    aput-object v1, v0, v2

    sget-object v1, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->LIVE:Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    aput-object v1, v0, v3

    sput-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->$VALUES:[Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

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
    .line 571
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILorg/bson/util/AbstractCopyOnWriteMap$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lorg/bson/util/AbstractCopyOnWriteMap$1;

    .prologue
    .line 571
    invoke-direct {p0, p1, p2}, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 571
    const-class v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    return-object v0
.end method

.method public static values()[Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;
    .locals 1

    .prologue
    .line 571
    sget-object v0, Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->$VALUES:[Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    invoke-virtual {v0}, [Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/bson/util/AbstractCopyOnWriteMap$View$Type;

    return-object v0
.end method


# virtual methods
.method abstract get(Lorg/bson/util/AbstractCopyOnWriteMap;)Lorg/bson/util/AbstractCopyOnWriteMap$View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            "M::",
            "Ljava/util/Map",
            "<TK;TV;>;>(",
            "Lorg/bson/util/AbstractCopyOnWriteMap",
            "<TK;TV;TM;>;)",
            "Lorg/bson/util/AbstractCopyOnWriteMap$View",
            "<TK;TV;>;"
        }
    .end annotation
.end method
