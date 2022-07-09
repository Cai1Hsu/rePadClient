.class public abstract Lde/javawi/jstun/attribute/MessageAttribute;
.super Ljava/lang/Object;
.source "MessageAttribute.java"

# interfaces
.implements Lde/javawi/jstun/attribute/MessageAttributeInterface;


# static fields
.field private static final LOGGER:Lorg/apache/commons/logging/Log;


# instance fields
.field type:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const-class v0, Lde/javawi/jstun/attribute/MessageAttribute;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lde/javawi/jstun/attribute/MessageAttribute;->LOGGER:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    return-void
.end method

.method public constructor <init>(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)V
    .locals 0
    .param p1, "type"    # Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-virtual {p0, p1}, Lde/javawi/jstun/attribute/MessageAttribute;->setType(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)V

    .line 30
    return-void
.end method

.method public static intToType(J)Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;
    .locals 2
    .param p0, "type"    # J

    .prologue
    .line 57
    const-wide/16 v0, 0x1

    cmp-long v0, p0, v0

    if-nez v0, :cond_0

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->MappedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    .line 69
    :goto_0
    return-object v0

    .line 58
    :cond_0
    const-wide/16 v0, 0x2

    cmp-long v0, p0, v0

    if-nez v0, :cond_1

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ResponseAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 59
    :cond_1
    const-wide/16 v0, 0x3

    cmp-long v0, p0, v0

    if-nez v0, :cond_2

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ChangeRequest:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 60
    :cond_2
    const-wide/16 v0, 0x4

    cmp-long v0, p0, v0

    if-nez v0, :cond_3

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->SourceAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 61
    :cond_3
    const-wide/16 v0, 0x5

    cmp-long v0, p0, v0

    if-nez v0, :cond_4

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ChangedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 62
    :cond_4
    const-wide/16 v0, 0x6

    cmp-long v0, p0, v0

    if-nez v0, :cond_5

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->Username:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 63
    :cond_5
    const-wide/16 v0, 0x7

    cmp-long v0, p0, v0

    if-nez v0, :cond_6

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->Password:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 64
    :cond_6
    const-wide/16 v0, 0x8

    cmp-long v0, p0, v0

    if-nez v0, :cond_7

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->MessageIntegrity:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 65
    :cond_7
    const-wide/16 v0, 0x9

    cmp-long v0, p0, v0

    if-nez v0, :cond_8

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 66
    :cond_8
    const-wide/16 v0, 0xa

    cmp-long v0, p0, v0

    if-nez v0, :cond_9

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->UnknownAttribute:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 67
    :cond_9
    const-wide/16 v0, 0xb

    cmp-long v0, p0, v0

    if-nez v0, :cond_a

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ReflectedFrom:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 68
    :cond_a
    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-nez v0, :cond_b

    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->Dummy:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    goto :goto_0

    .line 69
    :cond_b
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static parseCommonHeader([B)Lde/javawi/jstun/attribute/MessageAttribute;
    .locals 12
    .param p0, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/attribute/MessageAttributeParsingException;
        }
    .end annotation

    .prologue
    .line 82
    const/4 v7, 0x2

    :try_start_0
    new-array v4, v7, [B

    .line 83
    .local v4, "typeArray":[B
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x2

    invoke-static {p0, v7, v4, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    invoke-static {v4}, Lde/javawi/jstun/util/Utility;->twoBytesToInteger([B)I

    move-result v3

    .line 85
    .local v3, "type":I
    const/4 v7, 0x2

    new-array v0, v7, [B

    .line 86
    .local v0, "lengthArray":[B
    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x2

    invoke-static {p0, v7, v0, v8, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    invoke-static {v0}, Lde/javawi/jstun/util/Utility;->twoBytesToInteger([B)I

    move-result v1

    .line 88
    .local v1, "lengthValue":I
    new-array v6, v1, [B

    .line 89
    .local v6, "valueArray":[B
    const/4 v7, 0x4

    const/4 v8, 0x0

    invoke-static {p0, v7, v6, v8, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    packed-switch v3, :pswitch_data_0

    .line 104
    const/16 v7, 0x7fff

    if-gt v3, v7, :cond_0

    .line 105
    new-instance v7, Lde/javawi/jstun/attribute/UnknownMessageAttributeException;

    const-string/jumbo v8, "Unkown mandatory message attribute"

    int-to-long v10, v3

    invoke-static {v10, v11}, Lde/javawi/jstun/attribute/MessageAttribute;->intToType(J)Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lde/javawi/jstun/attribute/UnknownMessageAttributeException;-><init>(Ljava/lang/String;Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)V

    throw v7
    :try_end_0
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .end local v0    # "lengthArray":[B
    .end local v1    # "lengthValue":I
    .end local v3    # "type":I
    .end local v4    # "typeArray":[B
    .end local v6    # "valueArray":[B
    :catch_0
    move-exception v5

    .line 114
    .local v5, "ue":Lde/javawi/jstun/util/UtilityException;
    new-instance v7, Lde/javawi/jstun/attribute/MessageAttributeParsingException;

    const-string/jumbo v8, "Parsing error"

    invoke-direct {v7, v8}, Lde/javawi/jstun/attribute/MessageAttributeParsingException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 92
    .end local v5    # "ue":Lde/javawi/jstun/util/UtilityException;
    .restart local v0    # "lengthArray":[B
    .restart local v1    # "lengthValue":I
    .restart local v3    # "type":I
    .restart local v4    # "typeArray":[B
    .restart local v6    # "valueArray":[B
    :pswitch_0
    :try_start_1
    invoke-static {v6}, Lde/javawi/jstun/attribute/MappedAddress;->parse([B)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    .line 112
    .local v2, "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :goto_0
    return-object v2

    .line 93
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_1
    invoke-static {v6}, Lde/javawi/jstun/attribute/ResponseAddress;->parse([B)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 94
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_2
    invoke-static {v6}, Lde/javawi/jstun/attribute/ChangeRequest;->parse([B)Lde/javawi/jstun/attribute/ChangeRequest;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 95
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_3
    invoke-static {v6}, Lde/javawi/jstun/attribute/SourceAddress;->parse([B)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 96
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_4
    invoke-static {v6}, Lde/javawi/jstun/attribute/ChangedAddress;->parse([B)Lde/javawi/jstun/attribute/MessageAttribute;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 97
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_5
    invoke-static {v6}, Lde/javawi/jstun/attribute/Username;->parse([B)Lde/javawi/jstun/attribute/Username;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 98
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_6
    invoke-static {v6}, Lde/javawi/jstun/attribute/Password;->parse([B)Lde/javawi/jstun/attribute/Password;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 99
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_7
    invoke-static {v6}, Lde/javawi/jstun/attribute/MessageIntegrity;->parse([B)Lde/javawi/jstun/attribute/MessageIntegrity;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 100
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_8
    invoke-static {v6}, Lde/javawi/jstun/attribute/ErrorCode;->parse([B)Lde/javawi/jstun/attribute/ErrorCode;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 101
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_9
    invoke-static {v6}, Lde/javawi/jstun/attribute/UnknownAttribute;->parse([B)Lde/javawi/jstun/attribute/UnknownAttribute;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 102
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :pswitch_a
    invoke-static {v6}, Lde/javawi/jstun/attribute/ReflectedFrom;->parse([B)Lde/javawi/jstun/attribute/ReflectedFrom;

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 107
    .end local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    :cond_0
    sget-object v7, Lde/javawi/jstun/attribute/MessageAttribute;->LOGGER:Lorg/apache/commons/logging/Log;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "MessageAttribute with type "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, " unkown."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 108
    invoke-static {v6}, Lde/javawi/jstun/attribute/Dummy;->parse([B)Lde/javawi/jstun/attribute/Dummy;
    :try_end_1
    .catch Lde/javawi/jstun/util/UtilityException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .restart local v2    # "ma":Lde/javawi/jstun/attribute/MessageAttribute;
    goto :goto_0

    .line 91
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public static typeToInteger(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)I
    .locals 1
    .param p0, "type"    # Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    .prologue
    .line 41
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->MappedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    .line 53
    :goto_0
    return v0

    .line 42
    :cond_0
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ResponseAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    .line 43
    :cond_1
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ChangeRequest:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_2

    const/4 v0, 0x3

    goto :goto_0

    .line 44
    :cond_2
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->SourceAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_3

    const/4 v0, 0x4

    goto :goto_0

    .line 45
    :cond_3
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ChangedAddress:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_4

    const/4 v0, 0x5

    goto :goto_0

    .line 46
    :cond_4
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->Username:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_5

    const/4 v0, 0x6

    goto :goto_0

    .line 47
    :cond_5
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->Password:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_6

    const/4 v0, 0x7

    goto :goto_0

    .line 48
    :cond_6
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->MessageIntegrity:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_7

    const/16 v0, 0x8

    goto :goto_0

    .line 49
    :cond_7
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ErrorCode:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_8

    const/16 v0, 0x9

    goto :goto_0

    .line 50
    :cond_8
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->UnknownAttribute:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_9

    const/16 v0, 0xa

    goto :goto_0

    .line 51
    :cond_9
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->ReflectedFrom:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_a

    const/16 v0, 0xb

    goto :goto_0

    .line 52
    :cond_a
    sget-object v0, Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;->Dummy:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    if-ne p0, v0, :cond_b

    const/4 v0, 0x0

    goto :goto_0

    .line 53
    :cond_b
    const/4 v0, -0x1

    goto :goto_0
.end method


# virtual methods
.method public abstract getBytes()[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation
.end method

.method public getLength()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-virtual {p0}, Lde/javawi/jstun/attribute/MessageAttribute;->getBytes()[B

    move-result-object v1

    array-length v0, v1

    .line 77
    .local v0, "length":I
    return v0
.end method

.method public getType()Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;
    .locals 1

    .prologue
    .line 37
    iget-object v0, p0, Lde/javawi/jstun/attribute/MessageAttribute;->type:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    return-object v0
.end method

.method public setType(Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;)V
    .locals 0
    .param p1, "type"    # Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    .prologue
    .line 33
    iput-object p1, p0, Lde/javawi/jstun/attribute/MessageAttribute;->type:Lde/javawi/jstun/attribute/MessageAttributeInterface$MessageAttributeType;

    .line 34
    return-void
.end method
