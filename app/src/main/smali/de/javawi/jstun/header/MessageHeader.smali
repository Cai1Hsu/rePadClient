.class public Lde/javawi/jstun/header/MessageHeader;
.super Ljava/lang/Object;
.source "MessageHeader.java"

# interfaces
.implements Lde/javawi/jstun/header/MessageHeaderInterface;


# static fields
.field private static final LOGGER:Lorg/apache/commons/logging/Log;


# instance fields
.field id:[B

.field ma:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;",
            "Lde/javawi/jstun/attribute/MessageAttribute;",
            ">;"
        }
    .end annotation
.end field

.field type:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 41
    const-class v0, Lde/javawi/jstun/header/MessageHeader;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    .line 45
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    .line 49
    return-void
.end method

.method public constructor <init>(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V
    .locals 1
    .param p1, "type"    # Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    .line 45
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    .line 53
    invoke-virtual {p0, p1}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    .line 54
    return-void
.end method

.method public static parseHeader([B)Lde/javawi/jstun/header/MessageHeader;
    .locals 7
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/header/MessageHeaderParsingException;
        }
    .end annotation

    .prologue
    .line 167
    :try_start_0
    new-instance v0, Lde/javawi/jstun/header/MessageHeader;

    invoke-direct {v0}, Lde/javawi/jstun/header/MessageHeader;-><init>()V

    .line 168
    .local v0, "mh":Lde/javawi/jstun/header/MessageHeader;
    const/4 v4, 0x2

    new-array v2, v4, [B

    .line 169
    .local v2, "typeArray":[B
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x2

    invoke-static {p0, v4, v2, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 170
    invoke-static {v2}, Lde/javawi/jstun/util/Utility;->twoBytesToInteger([B)I

    move-result v1

    .line 171
    .local v1, "type":I
    sparse-switch v1, :sswitch_data_0

    .line 178
    new-instance v4, Lde/javawi/jstun/header/MessageHeaderParsingException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "Message type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "is not supported"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lde/javawi/jstun/header/MessageHeaderParsingException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 181
    .end local v0    # "mh":Lde/javawi/jstun/header/MessageHeader;
    .end local v1    # "type":I
    .end local v2    # "typeArray":[B
    :catch_0
    move-exception v3

    .line 182
    .local v3, "ue":Lde/javawi/jstun/util/UtilityException;
    new-instance v4, Lde/javawi/jstun/header/MessageHeaderParsingException;

    const-string/jumbo v5, "Parsing error"

    invoke-direct {v4, v5}, Lde/javawi/jstun/header/MessageHeaderParsingException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 172
    .end local v3    # "ue":Lde/javawi/jstun/util/UtilityException;
    .restart local v0    # "mh":Lde/javawi/jstun/header/MessageHeader;
    .restart local v1    # "type":I
    .restart local v2    # "typeArray":[B
    :sswitch_0
    :try_start_1
    sget-object v4, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-virtual {v0, v4}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    sget-object v4, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Binding Request received."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 180
    :goto_0
    return-object v0

    .line 173
    :sswitch_1
    sget-object v4, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-virtual {v0, v4}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    sget-object v4, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Binding Response received."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_0

    .line 174
    :sswitch_2
    sget-object v4, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingErrorResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-virtual {v0, v4}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    sget-object v4, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Binding Error Response received."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_0

    .line 175
    :sswitch_3
    sget-object v4, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->SharedSecretRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-virtual {v0, v4}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    sget-object v4, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Shared Secret Request received."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_0

    .line 176
    :sswitch_4
    sget-object v4, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->SharedSecretResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-virtual {v0, v4}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    sget-object v4, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Shared Secret Response received."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_0

    .line 177
    :sswitch_5
    sget-object v4, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->SharedSecretErrorResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-virtual {v0, v4}, Lde/javawi/jstun/header/MessageHeader;->setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V

    sget-object v4, Lde/javawi/jstun/header/MessageHeader;->LOGGER:Lorg/apache/commons/logging/Log;

    const-string/jumbo v5, "Shared Secret Error Response received."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_1
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 171
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_3
        0x101 -> :sswitch_1
        0x102 -> :sswitch_4
        0x111 -> :sswitch_2
        0x112 -> :sswitch_5
    .end sparse-switch
.end method

.method public static typeToInteger(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)I
    .locals 1
    .param p0, "type"    # Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    .prologue
    .line 65
    sget-object v0, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    .line 71
    :goto_0
    return v0

    .line 66
    :cond_0
    sget-object v0, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    if-ne p0, v0, :cond_1

    const/16 v0, 0x101

    goto :goto_0

    .line 67
    :cond_1
    sget-object v0, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->BindingErrorResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    if-ne p0, v0, :cond_2

    const/16 v0, 0x111

    goto :goto_0

    .line 68
    :cond_2
    sget-object v0, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->SharedSecretRequest:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    if-ne p0, v0, :cond_3

    const/4 v0, 0x2

    goto :goto_0

    .line 69
    :cond_3
    sget-object v0, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->SharedSecretResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    if-ne p0, v0, :cond_4

    const/16 v0, 0x102

    goto :goto_0

    .line 70
    :cond_4
    sget-object v0, Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;->SharedSecretErrorResponse:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    if-ne p0, v0, :cond_5

    const/16 v0, 0x112

    goto :goto_0

    .line 71
    :cond_5
    const/4 v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V
    .locals 2
    .param p1, "attri"    # Lde/javawi/jstun/attribute/MessageAttribute;

    .prologue
    .line 109
    iget-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lde/javawi/jstun/attribute/MessageAttribute;->getType()Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    return-void
.end method

.method public equalTransactionID(Lde/javawi/jstun/header/MessageHeader;)Z
    .locals 8
    .param p1, "header"    # Lde/javawi/jstun/header/MessageHeader;

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 96
    invoke-virtual {p1}, Lde/javawi/jstun/header/MessageHeader;->getTransactionID()[B

    move-result-object v0

    .line 97
    .local v0, "idHeader":[B
    array-length v3, v0

    const/16 v4, 0x10

    if-eq v3, v4, :cond_1

    .line 104
    :cond_0
    :goto_0
    return v1

    .line 98
    :cond_1
    aget-byte v3, v0, v1

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    aget-byte v4, v4, v1

    if-ne v3, v4, :cond_0

    aget-byte v3, v0, v2

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    aget-byte v4, v4, v2

    if-ne v3, v4, :cond_0

    aget-byte v3, v0, v5

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    aget-byte v3, v0, v6

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    aget-byte v4, v4, v6

    if-ne v3, v4, :cond_0

    aget-byte v3, v0, v7

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    aget-byte v4, v4, v7

    if-ne v3, v4, :cond_0

    const/4 v3, 0x5

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v5, 0x5

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/4 v3, 0x6

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v5, 0x6

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/4 v3, 0x7

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v5, 0x7

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0x8

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0x8

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0x9

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0x9

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0xa

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0xa

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0xb

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0xb

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0xc

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0xc

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0xd

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0xd

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0xe

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0xe

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    const/16 v3, 0xf

    aget-byte v3, v0, v3

    iget-object v4, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v5, 0xf

    aget-byte v4, v4, v5

    if-ne v3, v4, :cond_0

    move v1, v2

    .line 102
    goto/16 :goto_0
.end method

.method public generateTransactionID()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    const-wide/high16 v6, 0x40f0000000000000L    # 65536.0

    const/4 v4, 0x2

    const/4 v3, 0x0

    .line 79
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    invoke-static {v0, v3, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 80
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    invoke-static {v0, v3, v1, v4, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 81
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v2, 0x4

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v2, 0x6

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v2, 0x8

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v2, 0xa

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 85
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v2, 0xc

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 86
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    mul-double/2addr v0, v6

    double-to-int v0, v0

    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v0

    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v2, 0xe

    invoke-static {v0, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    return-void
.end method

.method public getBytes()[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v8, 0x0

    .line 117
    const/16 v2, 0x14

    .line 118
    .local v2, "length":I
    iget-object v5, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 119
    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 120
    iget-object v5, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/javawi/jstun/attribute/MessageAttribute;

    .line 121
    .local v0, "attri":Lde/javawi/jstun/attribute/MessageAttribute;
    invoke-virtual {v0}, Lde/javawi/jstun/attribute/MessageAttribute;->getLength()I

    move-result v5

    add-int/2addr v2, v5

    .line 122
    goto :goto_0

    .line 124
    .end local v0    # "attri":Lde/javawi/jstun/attribute/MessageAttribute;
    :cond_0
    new-array v4, v2, [B

    .line 125
    .local v4, "result":[B
    iget-object v5, p0, Lde/javawi/jstun/header/MessageHeader;->type:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    invoke-static {v5}, Lde/javawi/jstun/header/MessageHeader;->typeToInteger(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)I

    move-result v5

    invoke-static {v5}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v5

    invoke-static {v5, v8, v4, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    add-int/lit8 v5, v2, -0x14

    invoke-static {v5}, Lde/javawi/jstun/util/Utility;->integerToTwoBytes(I)[B

    move-result-object v5

    invoke-static {v5, v8, v4, v7, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    iget-object v5, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v6, 0x4

    const/16 v7, 0x10

    invoke-static {v5, v8, v4, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 130
    const/16 v3, 0x14

    .line 131
    .local v3, "offset":I
    iget-object v5, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    invoke-virtual {v5}, Ljava/util/TreeMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 132
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 133
    iget-object v5, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/javawi/jstun/attribute/MessageAttribute;

    .line 134
    .restart local v0    # "attri":Lde/javawi/jstun/attribute/MessageAttribute;
    invoke-virtual {v0}, Lde/javawi/jstun/attribute/MessageAttribute;->getBytes()[B

    move-result-object v5

    invoke-virtual {v0}, Lde/javawi/jstun/attribute/MessageAttribute;->getLength()I

    move-result v6

    invoke-static {v5, v8, v4, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    invoke-virtual {v0}, Lde/javawi/jstun/attribute/MessageAttribute;->getLength()I

    move-result v5

    add-int/2addr v3, v5

    .line 136
    goto :goto_1

    .line 137
    .end local v0    # "attri":Lde/javawi/jstun/attribute/MessageAttribute;
    :cond_1
    return-object v4
.end method

.method public getLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 141
    invoke-virtual {p0}, Lde/javawi/jstun/header/MessageHeader;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getMessageAttribute(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)Lde/javawi/jstun/attribute/MessageAttribute;
    .locals 1
    .param p1, "type"    # Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    .prologue
    .line 113
    iget-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->ma:Ljava/util/TreeMap;

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/javawi/jstun/attribute/MessageAttribute;

    return-object v0
.end method

.method public getTransactionID()[B
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 90
    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    array-length v1, v1

    new-array v0, v1, [B

    .line 91
    .local v0, "idCopy":[B
    iget-object v1, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    iget-object v2, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    return-object v0
.end method

.method public getType()Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->type:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    return-object v0
.end method

.method public parseAttributes([B)V
    .locals 10
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;
        }
    .end annotation

    .prologue
    .line 146
    const/4 v6, 0x2

    :try_start_0
    new-array v2, v6, [B

    .line 147
    .local v2, "lengthArray":[B
    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x2

    invoke-static {p1, v6, v2, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    invoke-static {v2}, Lde/javawi/jstun/util/Utility;->twoBytesToInteger([B)I

    move-result v1

    .line 149
    .local v1, "length":I
    const/4 v6, 0x4

    iget-object v7, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/4 v8, 0x0

    const/16 v9, 0x10

    invoke-static {p1, v6, v7, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    const/16 v4, 0x14

    .line 152
    .local v4, "offset":I
    :goto_0
    if-lez v1, :cond_0

    .line 153
    new-array v0, v1, [B

    .line 154
    .local v0, "cuttedData":[B
    const/4 v6, 0x0

    invoke-static {p1, v4, v0, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 155
    invoke-static {v0}, Lde/javawi/jstun/attribute/MessageAttribute;->parseCommonHeader([B)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v3

    .line 156
    .local v3, "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    invoke-virtual {p0, v3}, Lde/javawi/jstun/header/MessageHeader;->addMessageAttribute(Lde/javawi/jstun/attribute/MessageAttribute;)V

    .line 157
    invoke-virtual {v3}, Lde/javawi/jstun/attribute/MessageAttribute;->getLength()I

    move-result v6

    sub-int/2addr v1, v6

    .line 158
    invoke-virtual {v3}, Lde/javawi/jstun/attribute/MessageAttribute;->getLength()I
    :try_end_0
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    add-int/2addr v4, v6

    .line 159
    goto :goto_0

    .line 160
    .end local v0    # "cuttedData":[B
    .end local v1    # "length":I
    .end local v2    # "lengthArray":[B
    .end local v3    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    .end local v4    # "offset":I
    :catch_0
    move-exception v5

    .line 161
    .local v5, "ue":Lde/javawi/jstun/util/UtilityException;
    new-instance v6, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v7, "Parsing error"

    invoke-direct {v6, v7}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 163
    .end local v5    # "ue":Lde/javawi/jstun/util/UtilityException;
    .restart local v1    # "length":I
    .restart local v2    # "lengthArray":[B
    .restart local v4    # "offset":I
    :cond_0
    return-void
.end method

.method public setTransactionID([B)V
    .locals 3
    .param p1, "id"    # [B

    .prologue
    const/4 v2, 0x0

    .line 75
    iget-object v0, p0, Lde/javawi/jstun/header/MessageHeader;->id:[B

    const/16 v1, 0x10

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    return-void
.end method

.method public setType(Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;)V
    .locals 0
    .param p1, "type"    # Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    .prologue
    .line 57
    iput-object p1, p0, Lde/javawi/jstun/header/MessageHeader;->type:Lde/javawi/jstun/header/MessageHeaderInterface$MessageHeaderType;

    .line 58
    return-void
.end method
