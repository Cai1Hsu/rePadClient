.class public final enum Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;
.super Ljava/lang/Enum;
.source "TransportResolver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

.field public static final enum ice:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

.field public static final enum rawupd:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 46
    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    const-string/jumbo v1, "rawupd"

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->rawupd:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    new-instance v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    const-string/jumbo v1, "ice"

    invoke-direct {v0, v1, v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->ice:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    .line 44
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->rawupd:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    aput-object v1, v0, v2

    sget-object v1, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->ice:Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    aput-object v1, v0, v3

    sput-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->$VALUES:[Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

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
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 44
    const-class v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    return-object v0
.end method

.method public static values()[Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->$VALUES:[Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    invoke-virtual {v0}, [Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jivesoftware/smackx/jingle/nat/TransportResolver$Type;

    return-object v0
.end method
