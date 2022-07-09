.class public final enum Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
.super Ljava/lang/Enum;
.source "JingleActionEnum.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jivesoftware/smackx/jingle/JingleActionEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum CONTENT_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum CONTENT_ADD:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum CONTENT_MODIFY:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum CONTENT_REMOVE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum SESSION_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum SESSION_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum SESSION_INITIATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum SESSION_TERMINATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum TRANSPORT_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

.field public static final enum UNKNOWN:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;


# instance fields
.field private actionCode:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 29
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "UNKNOWN"

    const-string/jumbo v2, "unknown"

    invoke-direct {v0, v1, v4, v2}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->UNKNOWN:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 30
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "CONTENT_ACCEPT"

    const-string/jumbo v2, "content-accept"

    invoke-direct {v0, v1, v5, v2}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 31
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "CONTENT_ADD"

    const-string/jumbo v2, "content-add"

    invoke-direct {v0, v1, v6, v2}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ADD:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 32
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "CONTENT_MODIFY"

    const-string/jumbo v2, "content-modify"

    invoke-direct {v0, v1, v7, v2}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_MODIFY:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 33
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "CONTENT_REMOVE"

    const-string/jumbo v2, "content-remove"

    invoke-direct {v0, v1, v8, v2}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_REMOVE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 34
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "SESSION_ACCEPT"

    const/4 v2, 0x5

    const-string/jumbo v3, "session-accept"

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 35
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "SESSION_INFO"

    const/4 v2, 0x6

    const-string/jumbo v3, "session-info"

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 36
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "SESSION_INITIATE"

    const/4 v2, 0x7

    const-string/jumbo v3, "session-initiate"

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_INITIATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 37
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "SESSION_TERMINATE"

    const/16 v2, 0x8

    const-string/jumbo v3, "session-terminate"

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_TERMINATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 38
    new-instance v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    const-string/jumbo v1, "TRANSPORT_INFO"

    const/16 v2, 0x9

    const-string/jumbo v3, "transport-info"

    invoke-direct {v0, v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->TRANSPORT_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    .line 27
    const/16 v0, 0xa

    new-array v0, v0, [Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->UNKNOWN:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v1, v0, v4

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v1, v0, v5

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_ADD:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v1, v0, v6

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_MODIFY:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v1, v0, v7

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->CONTENT_REMOVE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_ACCEPT:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_INITIATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->SESSION_TERMINATE:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->TRANSPORT_INFO:Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    aput-object v2, v0, v1

    sput-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->$VALUES:[Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "inActionCode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 43
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->actionCode:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public static getAction(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    .locals 5
    .param p0, "inActionCode"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->values()[Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    move-result-object v0

    .local v0, "arr$":[Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v2, v0, v1

    .line 59
    .local v2, "jingleAction":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    iget-object v4, v2, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->actionCode:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 63
    .end local v2    # "jingleAction":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    :goto_1
    return-object v2

    .line 58
    .restart local v2    # "jingleAction":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 63
    .end local v2    # "jingleAction":Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    return-object v0
.end method

.method public static values()[Lorg/jivesoftware/smackx/jingle/JingleActionEnum;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->$VALUES:[Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    invoke-virtual {v0}, [Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jivesoftware/smackx/jingle/JingleActionEnum;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/JingleActionEnum;->actionCode:Ljava/lang/String;

    return-object v0
.end method
