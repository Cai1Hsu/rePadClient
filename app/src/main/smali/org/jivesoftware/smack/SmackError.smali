.class public final enum Lorg/jivesoftware/smack/SmackError;
.super Ljava/lang/Enum;
.source "SmackError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/jivesoftware/smack/SmackError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/jivesoftware/smack/SmackError;

.field public static final enum NO_RESPONSE_FROM_SERVER:Lorg/jivesoftware/smack/SmackError;


# instance fields
.field private message:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 4
    new-instance v0, Lorg/jivesoftware/smack/SmackError;

    const-string/jumbo v1, "NO_RESPONSE_FROM_SERVER"

    const-string/jumbo v2, "No response from server."

    invoke-direct {v0, v1, v3, v2}, Lorg/jivesoftware/smack/SmackError;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smack/SmackError;->NO_RESPONSE_FROM_SERVER:Lorg/jivesoftware/smack/SmackError;

    .line 3
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/jivesoftware/smack/SmackError;

    sget-object v1, Lorg/jivesoftware/smack/SmackError;->NO_RESPONSE_FROM_SERVER:Lorg/jivesoftware/smack/SmackError;

    aput-object v1, v0, v3

    sput-object v0, Lorg/jivesoftware/smack/SmackError;->$VALUES:[Lorg/jivesoftware/smack/SmackError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "errMessage"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 9
    iput-object p3, p0, Lorg/jivesoftware/smack/SmackError;->message:Ljava/lang/String;

    .line 10
    return-void
.end method

.method public static getErrorCode(Ljava/lang/String;)Lorg/jivesoftware/smack/SmackError;
    .locals 5
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-static {}, Lorg/jivesoftware/smack/SmackError;->values()[Lorg/jivesoftware/smack/SmackError;

    move-result-object v0

    .local v0, "arr$":[Lorg/jivesoftware/smack/SmackError;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 18
    .local v1, "code":Lorg/jivesoftware/smack/SmackError;
    iget-object v4, v1, Lorg/jivesoftware/smack/SmackError;->message:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 22
    .end local v1    # "code":Lorg/jivesoftware/smack/SmackError;
    :goto_1
    return-object v1

    .line 17
    .restart local v1    # "code":Lorg/jivesoftware/smack/SmackError;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 22
    .end local v1    # "code":Lorg/jivesoftware/smack/SmackError;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/SmackError;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 3
    const-class v0, Lorg/jivesoftware/smack/SmackError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/SmackError;

    return-object v0
.end method

.method public static values()[Lorg/jivesoftware/smack/SmackError;
    .locals 1

    .prologue
    .line 3
    sget-object v0, Lorg/jivesoftware/smack/SmackError;->$VALUES:[Lorg/jivesoftware/smack/SmackError;

    invoke-virtual {v0}, [Lorg/jivesoftware/smack/SmackError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/jivesoftware/smack/SmackError;

    return-object v0
.end method


# virtual methods
.method public getErrorMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lorg/jivesoftware/smack/SmackError;->message:Ljava/lang/String;

    return-object v0
.end method
