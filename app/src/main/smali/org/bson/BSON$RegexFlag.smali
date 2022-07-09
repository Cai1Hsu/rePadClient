.class final enum Lorg/bson/BSON$RegexFlag;
.super Ljava/lang/Enum;
.source "BSON.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/BSON;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "RegexFlag"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/bson/BSON$RegexFlag;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/bson/BSON$RegexFlag;

.field public static final enum CANON_EQ:Lorg/bson/BSON$RegexFlag;

.field public static final enum CASE_INSENSITIVE:Lorg/bson/BSON$RegexFlag;

.field public static final enum COMMENTS:Lorg/bson/BSON$RegexFlag;

.field public static final enum DOTALL:Lorg/bson/BSON$RegexFlag;

.field public static final enum GLOBAL:Lorg/bson/BSON$RegexFlag;

.field public static final enum LITERAL:Lorg/bson/BSON$RegexFlag;

.field public static final enum MULTILINE:Lorg/bson/BSON$RegexFlag;

.field public static final enum UNICODE_CASE:Lorg/bson/BSON$RegexFlag;

.field public static final enum UNIX_LINES:Lorg/bson/BSON$RegexFlag;

.field private static final byCharacter:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Character;",
            "Lorg/bson/BSON$RegexFlag;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final flagChar:C

.field public final javaFlag:I

.field public final unsupported:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .prologue
    const/16 v14, 0x8

    const/4 v13, 0x4

    const/4 v12, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 134
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "CANON_EQ"

    const/4 v2, 0x0

    const/16 v3, 0x80

    const/16 v4, 0x63

    const-string/jumbo v5, "Pattern.CANON_EQ"

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->CANON_EQ:Lorg/bson/BSON$RegexFlag;

    .line 135
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "UNIX_LINES"

    const/16 v4, 0x64

    const-string/jumbo v5, "Pattern.UNIX_LINES"

    move v2, v11

    move v3, v11

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->UNIX_LINES:Lorg/bson/BSON$RegexFlag;

    .line 136
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "GLOBAL"

    const/16 v3, 0x100

    const/16 v4, 0x67

    move v2, v12

    move-object v5, v10

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->GLOBAL:Lorg/bson/BSON$RegexFlag;

    .line 137
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "CASE_INSENSITIVE"

    const/4 v2, 0x3

    const/16 v4, 0x69

    move v3, v12

    move-object v5, v10

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->CASE_INSENSITIVE:Lorg/bson/BSON$RegexFlag;

    .line 138
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "MULTILINE"

    const/16 v4, 0x6d

    move v2, v13

    move v3, v14

    move-object v5, v10

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->MULTILINE:Lorg/bson/BSON$RegexFlag;

    .line 139
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "DOTALL"

    const/4 v2, 0x5

    const/16 v3, 0x20

    const/16 v4, 0x73

    const-string/jumbo v5, "Pattern.DOTALL"

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->DOTALL:Lorg/bson/BSON$RegexFlag;

    .line 140
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "LITERAL"

    const/4 v2, 0x6

    const/16 v3, 0x10

    const/16 v4, 0x74

    const-string/jumbo v5, "Pattern.LITERAL"

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->LITERAL:Lorg/bson/BSON$RegexFlag;

    .line 141
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "UNICODE_CASE"

    const/4 v2, 0x7

    const/16 v3, 0x40

    const/16 v4, 0x75

    const-string/jumbo v5, "Pattern.UNICODE_CASE"

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->UNICODE_CASE:Lorg/bson/BSON$RegexFlag;

    .line 142
    new-instance v0, Lorg/bson/BSON$RegexFlag;

    const-string/jumbo v1, "COMMENTS"

    const/16 v4, 0x78

    move v2, v14

    move v3, v13

    move-object v5, v10

    invoke-direct/range {v0 .. v5}, Lorg/bson/BSON$RegexFlag;-><init>(Ljava/lang/String;IICLjava/lang/String;)V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->COMMENTS:Lorg/bson/BSON$RegexFlag;

    .line 133
    const/16 v0, 0x9

    new-array v0, v0, [Lorg/bson/BSON$RegexFlag;

    const/4 v1, 0x0

    sget-object v2, Lorg/bson/BSON$RegexFlag;->CANON_EQ:Lorg/bson/BSON$RegexFlag;

    aput-object v2, v0, v1

    sget-object v1, Lorg/bson/BSON$RegexFlag;->UNIX_LINES:Lorg/bson/BSON$RegexFlag;

    aput-object v1, v0, v11

    sget-object v1, Lorg/bson/BSON$RegexFlag;->GLOBAL:Lorg/bson/BSON$RegexFlag;

    aput-object v1, v0, v12

    const/4 v1, 0x3

    sget-object v2, Lorg/bson/BSON$RegexFlag;->CASE_INSENSITIVE:Lorg/bson/BSON$RegexFlag;

    aput-object v2, v0, v1

    sget-object v1, Lorg/bson/BSON$RegexFlag;->MULTILINE:Lorg/bson/BSON$RegexFlag;

    aput-object v1, v0, v13

    const/4 v1, 0x5

    sget-object v2, Lorg/bson/BSON$RegexFlag;->DOTALL:Lorg/bson/BSON$RegexFlag;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/bson/BSON$RegexFlag;->LITERAL:Lorg/bson/BSON$RegexFlag;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lorg/bson/BSON$RegexFlag;->UNICODE_CASE:Lorg/bson/BSON$RegexFlag;

    aput-object v2, v0, v1

    sget-object v1, Lorg/bson/BSON$RegexFlag;->COMMENTS:Lorg/bson/BSON$RegexFlag;

    aput-object v1, v0, v14

    sput-object v0, Lorg/bson/BSON$RegexFlag;->$VALUES:[Lorg/bson/BSON$RegexFlag;

    .line 144
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/bson/BSON$RegexFlag;->byCharacter:Ljava/util/Map;

    .line 147
    invoke-static {}, Lorg/bson/BSON$RegexFlag;->values()[Lorg/bson/BSON$RegexFlag;

    move-result-object v6

    .local v6, "arr$":[Lorg/bson/BSON$RegexFlag;
    array-length v9, v6

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_0
    if-ge v8, v9, :cond_0

    aget-object v7, v6, v8

    .line 148
    .local v7, "flag":Lorg/bson/BSON$RegexFlag;
    sget-object v0, Lorg/bson/BSON$RegexFlag;->byCharacter:Ljava/util/Map;

    iget-char v1, v7, Lorg/bson/BSON$RegexFlag;->flagChar:C

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {v0, v1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 150
    .end local v7    # "flag":Lorg/bson/BSON$RegexFlag;
    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IICLjava/lang/String;)V
    .locals 0
    .param p3, "f"    # I
    .param p4, "ch"    # C
    .param p5, "u"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IC",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 159
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 160
    iput p3, p0, Lorg/bson/BSON$RegexFlag;->javaFlag:I

    .line 161
    iput-char p4, p0, Lorg/bson/BSON$RegexFlag;->flagChar:C

    .line 162
    iput-object p5, p0, Lorg/bson/BSON$RegexFlag;->unsupported:Ljava/lang/String;

    .line 163
    return-void
.end method

.method public static getByCharacter(C)Lorg/bson/BSON$RegexFlag;
    .locals 2
    .param p0, "ch"    # C

    .prologue
    .line 153
    sget-object v0, Lorg/bson/BSON$RegexFlag;->byCharacter:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/bson/BSON$RegexFlag;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/bson/BSON$RegexFlag;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    const-class v0, Lorg/bson/BSON$RegexFlag;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/bson/BSON$RegexFlag;

    return-object v0
.end method

.method public static values()[Lorg/bson/BSON$RegexFlag;
    .locals 1

    .prologue
    .line 133
    sget-object v0, Lorg/bson/BSON$RegexFlag;->$VALUES:[Lorg/bson/BSON$RegexFlag;

    invoke-virtual {v0}, [Lorg/bson/BSON$RegexFlag;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/bson/BSON$RegexFlag;

    return-object v0
.end method
