.class public Lde/javawi/jstun/attribute/ErrorCode;
.super Lde/javawi/jstun/attribute/MessageAttribute;
.source "ErrorCode.java"


# instance fields
.field reason:Ljava/lang/String;

.field responseCode:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-direct {p0, v0}, Lde/javawi/jstun/attribute/MessageAttribute;-><init>(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)V

    .line 33
    return-void
.end method

.method public static parse([B)Lde/javawi/jstun/attribute/ErrorCode;
    .locals 10
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    .line 85
    :try_start_0
    array-length v8, p0

    if-ge v8, v9, :cond_0

    .line 86
    new-instance v8, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v9, "Data array too short"

    invoke-direct {v8, v9}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 98
    :catch_0
    move-exception v7

    .line 99
    .local v7, "ue":Lde/javawi/jstun/util/UtilityException;
    new-instance v8, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v9, "Parsing error"

    invoke-direct {v8, v9}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 88
    .end local v7    # "ue":Lde/javawi/jstun/util/UtilityException;
    :cond_0
    const/4 v8, 0x3

    :try_start_1
    aget-byte v1, p0, v8

    .line 89
    .local v1, "classHeaderByte":B
    invoke-static {v1}, Lde/javawi/jstun/util/Utility;->oneByteToInteger(B)I

    move-result v0

    .line 90
    .local v0, "classHeader":I
    const/4 v8, 0x1

    if-lt v0, v8, :cond_1

    const/4 v8, 0x6

    if-le v0, v8, :cond_2

    :cond_1
    new-instance v8, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v9, "Class parsing error"

    invoke-direct {v8, v9}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_1
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_1 .. :try_end_1} :catch_1

    .line 100
    .end local v0    # "classHeader":I
    .end local v1    # "classHeaderByte":B
    :catch_1
    move-exception v2

    .line 101
    .local v2, "mae":Lde/javawi/jstun/attribute/MessageAttributeException;
    new-instance v8, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v9, "Parsing error"

    invoke-direct {v8, v9}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 91
    .end local v2    # "mae":Lde/javawi/jstun/attribute/MessageAttributeException;
    .restart local v0    # "classHeader":I
    .restart local v1    # "classHeaderByte":B
    :cond_2
    const/4 v8, 0x4

    :try_start_2
    aget-byte v4, p0, v8

    .line 92
    .local v4, "numberByte":B
    invoke-static {v4}, Lde/javawi/jstun/util/Utility;->oneByteToInteger(B)I

    move-result v3

    .line 93
    .local v3, "number":I
    if-ltz v3, :cond_3

    const/16 v8, 0x63

    if-le v3, v8, :cond_4

    :cond_3
    new-instance v8, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v9, "Number parsing error"

    invoke-direct {v8, v9}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 94
    :cond_4
    mul-int/lit8 v8, v0, 0x64

    add-int v5, v8, v3

    .line 95
    .local v5, "responseCode":I
    new-instance v6, Lde/javawi/jstun/attribute/ErrorCode;

    invoke-direct {v6}, Lde/javawi/jstun/attribute/ErrorCode;-><init>()V

    .line 96
    .local v6, "result":Lde/javawi/jstun/attribute/ErrorCode;
    invoke-virtual {v6, v5}, Lde/javawi/jstun/attribute/ErrorCode;->setResponseCode(I)V
    :try_end_2
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lde/javawi/jstun/attribute/MessageAttributeException; {:try_start_2 .. :try_end_2} :catch_1

    .line 97
    return-object v6
.end method


# virtual methods
.method public getBytes()[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v8, 0x0

    .line 60
    iget-object v4, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v1

    .line 62
    .local v1, "length":I
    rem-int/lit8 v4, v1, 0x4

    if-eqz v4, :cond_0

    .line 63
    rem-int/lit8 v4, v1, 0x4

    rsub-int/lit8 v4, v4, 0x4

    add-int/2addr v1, v4

    .line 66
    :cond_0
    add-int/lit8 v1, v1, 0x4

    .line 67
    new-array v3, v1, [B

    .line 70
    .local v3, "result":[B
    iget-object v4, p0, Lde/javawi/jstun/attribute/ErrorCode;->type:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    invoke-static {v4}, Lde/javawi/jstun/attribute/ErrorCode;->typeToInteger(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)I

    move-result v4

    invoke-static {v4}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v4

    invoke-static {v4, v8, v3, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 72
    add-int/lit8 v4, v1, -0x4

    invoke-static {v4}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v4

    invoke-static {v4, v8, v3, v5, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    iget v4, p0, Lde/javawi/jstun/attribute/ErrorCode;->responseCode:I

    int-to-double v4, v4

    const-wide/high16 v6, 0x4059000000000000L    # 100.0

    div-double/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v0, v4

    .line 76
    .local v0, "classHeader":I
    const/4 v4, 0x6

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToOneByte(I)B

    move-result v5

    aput-byte v5, v3, v4

    .line 77
    const/4 v4, 0x7

    iget v5, p0, Lde/javawi/jstun/attribute/ErrorCode;->responseCode:I

    rem-int/lit8 v5, v5, 0x64

    invoke-static {v5}, Lde/javawi/jstun/util/Utility;->integerToOneByte(I)B

    move-result v5

    aput-byte v5, v3, v4

    .line 78
    iget-object v4, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    .line 79
    .local v2, "reasonArray":[B
    const/16 v4, 0x8

    array-length v5, v2

    invoke-static {v2, v8, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    return-object v3
.end method

.method public getReason()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseCode()I
    .locals 1

    .prologue
    .line 52
    iget v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->responseCode:I

    return v0
.end method

.method public setResponseCode(I)V
    .locals 2
    .param p1, "responseCode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/attribute/MessageAttributeException;
        }
    .end annotation

    .prologue
    .line 36
    sparse-switch p1, :sswitch_data_0

    .line 46
    new-instance v0, Lde/javawi/jstun/attribute/MessageAttributeException;

    const-string/jumbo v1, "Response Code is not valid"

    invoke-direct {v0, v1}, Lde/javawi/jstun/attribute/MessageAttributeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :sswitch_0
    const-string/jumbo v0, "Bad Request"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    .line 48
    :goto_0
    iput p1, p0, Lde/javawi/jstun/attribute/ErrorCode;->responseCode:I

    .line 49
    return-void

    .line 38
    :sswitch_1
    const-string/jumbo v0, "Unauthorized"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 39
    :sswitch_2
    const-string/jumbo v0, "Unkown Attribute"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 40
    :sswitch_3
    const-string/jumbo v0, "Stale Credentials"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 41
    :sswitch_4
    const-string/jumbo v0, "Integrity Check Failure"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 42
    :sswitch_5
    const-string/jumbo v0, "Missing Username"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 43
    :sswitch_6
    const-string/jumbo v0, "Use TLS"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 44
    :sswitch_7
    const-string/jumbo v0, "Server Error"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 45
    :sswitch_8
    const-string/jumbo v0, "Global Failure"

    iput-object v0, p0, Lde/javawi/jstun/attribute/ErrorCode;->reason:Ljava/lang/String;

    goto :goto_0

    .line 36
    :sswitch_data_0
    .sparse-switch
        0x190 -> :sswitch_0
        0x191 -> :sswitch_1
        0x1a4 -> :sswitch_2
        0x1ae -> :sswitch_3
        0x1af -> :sswitch_4
        0x1b0 -> :sswitch_5
        0x1b1 -> :sswitch_6
        0x1f4 -> :sswitch_7
        0x258 -> :sswitch_8
    .end sparse-switch
.end method
