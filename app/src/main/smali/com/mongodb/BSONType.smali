.class final enum Lcom/mongodb/BSONType;
.super Ljava/lang/Enum;
.source "BSONType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/mongodb/BSONType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/mongodb/BSONType;

.field public static final enum ARRAY:Lcom/mongodb/BSONType;

.field public static final enum BINARY:Lcom/mongodb/BSONType;

.field public static final enum BOOLEAN:Lcom/mongodb/BSONType;

.field public static final enum DATE_TIME:Lcom/mongodb/BSONType;

.field public static final enum DB_POINTER:Lcom/mongodb/BSONType;

.field public static final enum DOCUMENT:Lcom/mongodb/BSONType;

.field public static final enum DOUBLE:Lcom/mongodb/BSONType;

.field public static final enum END_OF_DOCUMENT:Lcom/mongodb/BSONType;

.field public static final enum INT32:Lcom/mongodb/BSONType;

.field public static final enum INT64:Lcom/mongodb/BSONType;

.field public static final enum JAVASCRIPT:Lcom/mongodb/BSONType;

.field public static final enum JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONType;

.field private static final LOOKUP_TABLE:[Lcom/mongodb/BSONType;

.field public static final enum MAX_KEY:Lcom/mongodb/BSONType;

.field public static final enum MIN_KEY:Lcom/mongodb/BSONType;

.field public static final enum NULL:Lcom/mongodb/BSONType;

.field public static final enum OBJECT_ID:Lcom/mongodb/BSONType;

.field public static final enum REGULAR_EXPRESSION:Lcom/mongodb/BSONType;

.field public static final enum STRING:Lcom/mongodb/BSONType;

.field public static final enum SYMBOL:Lcom/mongodb/BSONType;

.field public static final enum TIMESTAMP:Lcom/mongodb/BSONType;

.field public static final enum UNDEFINED:Lcom/mongodb/BSONType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 23
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "END_OF_DOCUMENT"

    invoke-direct {v4, v5, v8, v8}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->END_OF_DOCUMENT:Lcom/mongodb/BSONType;

    .line 27
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "DOUBLE"

    invoke-direct {v4, v5, v9, v9}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->DOUBLE:Lcom/mongodb/BSONType;

    .line 31
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "STRING"

    invoke-direct {v4, v5, v10, v10}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->STRING:Lcom/mongodb/BSONType;

    .line 35
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "DOCUMENT"

    invoke-direct {v4, v5, v11, v11}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->DOCUMENT:Lcom/mongodb/BSONType;

    .line 39
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "ARRAY"

    invoke-direct {v4, v5, v12, v12}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->ARRAY:Lcom/mongodb/BSONType;

    .line 43
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "BINARY"

    const/4 v6, 0x5

    const/4 v7, 0x5

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->BINARY:Lcom/mongodb/BSONType;

    .line 47
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "UNDEFINED"

    const/4 v6, 0x6

    const/4 v7, 0x6

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->UNDEFINED:Lcom/mongodb/BSONType;

    .line 51
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "OBJECT_ID"

    const/4 v6, 0x7

    const/4 v7, 0x7

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->OBJECT_ID:Lcom/mongodb/BSONType;

    .line 55
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "BOOLEAN"

    const/16 v6, 0x8

    const/16 v7, 0x8

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->BOOLEAN:Lcom/mongodb/BSONType;

    .line 59
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "DATE_TIME"

    const/16 v6, 0x9

    const/16 v7, 0x9

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->DATE_TIME:Lcom/mongodb/BSONType;

    .line 63
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "NULL"

    const/16 v6, 0xa

    const/16 v7, 0xa

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->NULL:Lcom/mongodb/BSONType;

    .line 67
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "REGULAR_EXPRESSION"

    const/16 v6, 0xb

    const/16 v7, 0xb

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->REGULAR_EXPRESSION:Lcom/mongodb/BSONType;

    .line 71
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "DB_POINTER"

    const/16 v6, 0xc

    const/16 v7, 0xc

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->DB_POINTER:Lcom/mongodb/BSONType;

    .line 75
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "JAVASCRIPT"

    const/16 v6, 0xd

    const/16 v7, 0xd

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->JAVASCRIPT:Lcom/mongodb/BSONType;

    .line 79
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "SYMBOL"

    const/16 v6, 0xe

    const/16 v7, 0xe

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->SYMBOL:Lcom/mongodb/BSONType;

    .line 83
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "JAVASCRIPT_WITH_SCOPE"

    const/16 v6, 0xf

    const/16 v7, 0xf

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONType;

    .line 87
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "INT32"

    const/16 v6, 0x10

    const/16 v7, 0x10

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->INT32:Lcom/mongodb/BSONType;

    .line 91
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "TIMESTAMP"

    const/16 v6, 0x11

    const/16 v7, 0x11

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->TIMESTAMP:Lcom/mongodb/BSONType;

    .line 95
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "INT64"

    const/16 v6, 0x12

    const/16 v7, 0x12

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->INT64:Lcom/mongodb/BSONType;

    .line 99
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "MIN_KEY"

    const/16 v6, 0x13

    const/16 v7, 0xff

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->MIN_KEY:Lcom/mongodb/BSONType;

    .line 103
    new-instance v4, Lcom/mongodb/BSONType;

    const-string/jumbo v5, "MAX_KEY"

    const/16 v6, 0x14

    const/16 v7, 0x7f

    invoke-direct {v4, v5, v6, v7}, Lcom/mongodb/BSONType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/mongodb/BSONType;->MAX_KEY:Lcom/mongodb/BSONType;

    .line 19
    const/16 v4, 0x15

    new-array v4, v4, [Lcom/mongodb/BSONType;

    sget-object v5, Lcom/mongodb/BSONType;->END_OF_DOCUMENT:Lcom/mongodb/BSONType;

    aput-object v5, v4, v8

    sget-object v5, Lcom/mongodb/BSONType;->DOUBLE:Lcom/mongodb/BSONType;

    aput-object v5, v4, v9

    sget-object v5, Lcom/mongodb/BSONType;->STRING:Lcom/mongodb/BSONType;

    aput-object v5, v4, v10

    sget-object v5, Lcom/mongodb/BSONType;->DOCUMENT:Lcom/mongodb/BSONType;

    aput-object v5, v4, v11

    sget-object v5, Lcom/mongodb/BSONType;->ARRAY:Lcom/mongodb/BSONType;

    aput-object v5, v4, v12

    const/4 v5, 0x5

    sget-object v6, Lcom/mongodb/BSONType;->BINARY:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    sget-object v6, Lcom/mongodb/BSONType;->UNDEFINED:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/4 v5, 0x7

    sget-object v6, Lcom/mongodb/BSONType;->OBJECT_ID:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x8

    sget-object v6, Lcom/mongodb/BSONType;->BOOLEAN:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x9

    sget-object v6, Lcom/mongodb/BSONType;->DATE_TIME:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0xa

    sget-object v6, Lcom/mongodb/BSONType;->NULL:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0xb

    sget-object v6, Lcom/mongodb/BSONType;->REGULAR_EXPRESSION:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0xc

    sget-object v6, Lcom/mongodb/BSONType;->DB_POINTER:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0xd

    sget-object v6, Lcom/mongodb/BSONType;->JAVASCRIPT:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0xe

    sget-object v6, Lcom/mongodb/BSONType;->SYMBOL:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0xf

    sget-object v6, Lcom/mongodb/BSONType;->JAVASCRIPT_WITH_SCOPE:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x10

    sget-object v6, Lcom/mongodb/BSONType;->INT32:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x11

    sget-object v6, Lcom/mongodb/BSONType;->TIMESTAMP:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x12

    sget-object v6, Lcom/mongodb/BSONType;->INT64:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x13

    sget-object v6, Lcom/mongodb/BSONType;->MIN_KEY:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    const/16 v5, 0x14

    sget-object v6, Lcom/mongodb/BSONType;->MAX_KEY:Lcom/mongodb/BSONType;

    aput-object v6, v4, v5

    sput-object v4, Lcom/mongodb/BSONType;->$VALUES:[Lcom/mongodb/BSONType;

    .line 105
    sget-object v4, Lcom/mongodb/BSONType;->MIN_KEY:Lcom/mongodb/BSONType;

    invoke-virtual {v4}, Lcom/mongodb/BSONType;->getValue()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    new-array v4, v4, [Lcom/mongodb/BSONType;

    sput-object v4, Lcom/mongodb/BSONType;->LOOKUP_TABLE:[Lcom/mongodb/BSONType;

    .line 110
    invoke-static {}, Lcom/mongodb/BSONType;->values()[Lcom/mongodb/BSONType;

    move-result-object v0

    .local v0, "arr$":[Lcom/mongodb/BSONType;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 111
    .local v1, "cur":Lcom/mongodb/BSONType;
    sget-object v4, Lcom/mongodb/BSONType;->LOOKUP_TABLE:[Lcom/mongodb/BSONType;

    invoke-virtual {v1}, Lcom/mongodb/BSONType;->getValue()I

    move-result v5

    aput-object v1, v4, v5

    .line 110
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 113
    .end local v1    # "cur":Lcom/mongodb/BSONType;
    :cond_0
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
    .line 115
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 116
    iput p3, p0, Lcom/mongodb/BSONType;->value:I

    .line 117
    return-void
.end method

.method public static findByValue(I)Lcom/mongodb/BSONType;
    .locals 2
    .param p0, "value"    # I

    .prologue
    .line 124
    sget-object v0, Lcom/mongodb/BSONType;->LOOKUP_TABLE:[Lcom/mongodb/BSONType;

    and-int/lit16 v1, p0, 0xff

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/mongodb/BSONType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/mongodb/BSONType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/mongodb/BSONType;

    return-object v0
.end method

.method public static values()[Lcom/mongodb/BSONType;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/mongodb/BSONType;->$VALUES:[Lcom/mongodb/BSONType;

    invoke-virtual {v0}, [Lcom/mongodb/BSONType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mongodb/BSONType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .prologue
    .line 120
    iget v0, p0, Lcom/mongodb/BSONType;->value:I

    return v0
.end method

.method public isContainer()Z
    .locals 1

    .prologue
    .line 128
    sget-object v0, Lcom/mongodb/BSONType;->DOCUMENT:Lcom/mongodb/BSONType;

    if-eq p0, v0, :cond_0

    sget-object v0, Lcom/mongodb/BSONType;->ARRAY:Lcom/mongodb/BSONType;

    if-ne p0, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
