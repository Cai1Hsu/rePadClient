.class public Lcom/mongodb/util/JSONCallback;
.super Lorg/bson/BasicBSONCallback;
.source "JSONCallback.java"


# static fields
.field public static final _msDateFormat:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

.field public static final _secDateFormat:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"


# instance fields
.field private _lastArray:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/bson/BasicBSONCallback;-><init>()V

    .line 130
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mongodb/util/JSONCallback;->_lastArray:Z

    return-void
.end method


# virtual methods
.method public create()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 48
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    return-object v0
.end method

.method protected createList()Lorg/bson/BSONObject;
    .locals 1

    .prologue
    .line 53
    new-instance v0, Lcom/mongodb/BasicDBList;

    invoke-direct {v0}, Lcom/mongodb/BasicDBList;-><init>()V

    return-object v0
.end method

.method public objectDone()Ljava/lang/Object;
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 62
    invoke-virtual {p0}, Lcom/mongodb/util/JSONCallback;->curName()Ljava/lang/String;

    move-result-object v4

    .line 63
    .local v4, "name":Ljava/lang/String;
    invoke-super {p0}, Lorg/bson/BasicBSONCallback;->objectDone()Ljava/lang/Object;

    move-result-object v5

    .line 64
    .local v5, "o":Ljava/lang/Object;
    iget-boolean v9, p0, Lcom/mongodb/util/JSONCallback;->_lastArray:Z

    if-eqz v9, :cond_0

    .line 127
    .end local v5    # "o":Ljava/lang/Object;
    :goto_0
    return-object v5

    .restart local v5    # "o":Ljava/lang/Object;
    :cond_0
    move-object v0, v5

    .line 67
    check-cast v0, Lorg/bson/BSONObject;

    .line 70
    .local v0, "b":Lorg/bson/BSONObject;
    const-string/jumbo v9, "$oid"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 71
    new-instance v5, Lorg/bson/types/ObjectId;

    .end local v5    # "o":Ljava/lang/Object;
    const-string/jumbo v9, "$oid"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v5, v9}, Lorg/bson/types/ObjectId;-><init>(Ljava/lang/String;)V

    .line 121
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/mongodb/util/JSONCallback;->isStackEmpty()Z

    move-result v9

    if-nez v9, :cond_f

    .line 122
    invoke-virtual {p0, v4, v5}, Lcom/mongodb/util/JSONCallback;->_put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 72
    .restart local v5    # "o":Ljava/lang/Object;
    :cond_2
    const-string/jumbo v9, "$date"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 73
    const-string/jumbo v9, "$date"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    instance-of v9, v9, Ljava/lang/Number;

    if-eqz v9, :cond_3

    .line 74
    new-instance v5, Ljava/util/Date;

    .end local v5    # "o":Ljava/lang/Object;
    const-string/jumbo v9, "$date"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->longValue()J

    move-result-wide v10

    invoke-direct {v5, v10, v11}, Ljava/util/Date;-><init>(J)V

    .local v5, "o":Ljava/util/Date;
    goto :goto_1

    .line 76
    .local v5, "o":Ljava/lang/Object;
    :cond_3
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string/jumbo v9, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v2, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 77
    .local v2, "format":Ljava/text/SimpleDateFormat;
    new-instance v9, Ljava/util/GregorianCalendar;

    new-instance v10, Ljava/util/SimpleTimeZone;

    const-string/jumbo v11, "GMT"

    invoke-direct {v10, v12, v11}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-direct {v9, v10}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    invoke-virtual {v2, v9}, Ljava/text/SimpleDateFormat;->setCalendar(Ljava/util/Calendar;)V

    .line 78
    const-string/jumbo v9, "$date"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/text/ParsePosition;

    invoke-direct {v10, v12}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v2, v9, v10}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v5

    .line 80
    .local v5, "o":Ljava/util/Date;
    if-nez v5, :cond_1

    .line 82
    new-instance v2, Ljava/text/SimpleDateFormat;

    .end local v2    # "format":Ljava/text/SimpleDateFormat;
    const-string/jumbo v9, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v2, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 83
    .restart local v2    # "format":Ljava/text/SimpleDateFormat;
    new-instance v9, Ljava/util/GregorianCalendar;

    new-instance v10, Ljava/util/SimpleTimeZone;

    const-string/jumbo v11, "GMT"

    invoke-direct {v10, v12, v11}, Ljava/util/SimpleTimeZone;-><init>(ILjava/lang/String;)V

    invoke-direct {v9, v10}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    invoke-virtual {v2, v9}, Ljava/text/SimpleDateFormat;->setCalendar(Ljava/util/Calendar;)V

    .line 84
    const-string/jumbo v9, "$date"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/text/ParsePosition;

    invoke-direct {v10, v12}, Ljava/text/ParsePosition;-><init>(I)V

    invoke-virtual {v2, v9, v10}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;

    move-result-object v5

    goto/16 :goto_1

    .line 87
    .end local v2    # "format":Ljava/text/SimpleDateFormat;
    .local v5, "o":Ljava/lang/Object;
    :cond_4
    const-string/jumbo v9, "$regex"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 88
    const-string/jumbo v9, "$regex"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string/jumbo v10, "$options"

    invoke-interface {v0, v10}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Lorg/bson/BSON;->regexFlags(Ljava/lang/String;)I

    move-result v10

    invoke-static {v9, v10}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    .local v5, "o":Ljava/util/regex/Pattern;
    goto/16 :goto_1

    .line 90
    .local v5, "o":Ljava/lang/Object;
    :cond_5
    const-string/jumbo v9, "$ts"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 91
    const-string/jumbo v9, "$ts"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 92
    .local v6, "ts":Ljava/lang/Integer;
    const-string/jumbo v9, "$inc"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 93
    .local v3, "inc":Ljava/lang/Integer;
    new-instance v5, Lorg/bson/types/BSONTimestamp;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-direct {v5, v9, v10}, Lorg/bson/types/BSONTimestamp;-><init>(II)V

    .line 94
    .local v5, "o":Lorg/bson/types/BSONTimestamp;
    goto/16 :goto_1

    .end local v3    # "inc":Ljava/lang/Integer;
    .end local v6    # "ts":Ljava/lang/Integer;
    .local v5, "o":Ljava/lang/Object;
    :cond_6
    const-string/jumbo v9, "$timestamp"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 95
    const-string/jumbo v9, "$timestamp"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/bson/BSONObject;

    .line 96
    .local v7, "tsObject":Lorg/bson/BSONObject;
    const-string/jumbo v9, "t"

    invoke-interface {v7, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 97
    .restart local v6    # "ts":Ljava/lang/Integer;
    const-string/jumbo v9, "i"

    invoke-interface {v7, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Number;

    invoke-virtual {v9}, Ljava/lang/Number;->intValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 98
    .restart local v3    # "inc":Ljava/lang/Integer;
    new-instance v5, Lorg/bson/types/BSONTimestamp;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v10

    invoke-direct {v5, v9, v10}, Lorg/bson/types/BSONTimestamp;-><init>(II)V

    .line 99
    .local v5, "o":Lorg/bson/types/BSONTimestamp;
    goto/16 :goto_1

    .end local v3    # "inc":Ljava/lang/Integer;
    .end local v6    # "ts":Ljava/lang/Integer;
    .end local v7    # "tsObject":Lorg/bson/BSONObject;
    .local v5, "o":Ljava/lang/Object;
    :cond_7
    const-string/jumbo v9, "$code"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 100
    const-string/jumbo v9, "$scope"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 101
    new-instance v5, Lorg/bson/types/CodeWScope;

    .end local v5    # "o":Ljava/lang/Object;
    const-string/jumbo v9, "$code"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string/jumbo v10, "$scope"

    invoke-interface {v0, v10}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mongodb/DBObject;

    invoke-direct {v5, v9, v10}, Lorg/bson/types/CodeWScope;-><init>(Ljava/lang/String;Lorg/bson/BSONObject;)V

    .local v5, "o":Lorg/bson/types/CodeWScope;
    goto/16 :goto_1

    .line 103
    .local v5, "o":Ljava/lang/Object;
    :cond_8
    new-instance v5, Lorg/bson/types/Code;

    .end local v5    # "o":Ljava/lang/Object;
    const-string/jumbo v9, "$code"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-direct {v5, v9}, Lorg/bson/types/Code;-><init>(Ljava/lang/String;)V

    .local v5, "o":Lorg/bson/types/Code;
    goto/16 :goto_1

    .line 105
    .local v5, "o":Ljava/lang/Object;
    :cond_9
    const-string/jumbo v9, "$ref"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 106
    new-instance v5, Lcom/mongodb/DBRef;

    .end local v5    # "o":Ljava/lang/Object;
    const/4 v10, 0x0

    const-string/jumbo v9, "$ref"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    const-string/jumbo v11, "$id"

    invoke-interface {v0, v11}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-direct {v5, v10, v9, v11}, Lcom/mongodb/DBRef;-><init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V

    .local v5, "o":Lcom/mongodb/DBRef;
    goto/16 :goto_1

    .line 107
    .local v5, "o":Ljava/lang/Object;
    :cond_a
    const-string/jumbo v9, "$minKey"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 108
    new-instance v5, Lorg/bson/types/MinKey;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-direct {v5}, Lorg/bson/types/MinKey;-><init>()V

    .local v5, "o":Lorg/bson/types/MinKey;
    goto/16 :goto_1

    .line 109
    .local v5, "o":Ljava/lang/Object;
    :cond_b
    const-string/jumbo v9, "$maxKey"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_c

    .line 110
    new-instance v5, Lorg/bson/types/MaxKey;

    .end local v5    # "o":Ljava/lang/Object;
    invoke-direct {v5}, Lorg/bson/types/MaxKey;-><init>()V

    .local v5, "o":Lorg/bson/types/MaxKey;
    goto/16 :goto_1

    .line 111
    .local v5, "o":Ljava/lang/Object;
    :cond_c
    const-string/jumbo v9, "$uuid"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_d

    .line 112
    const-string/jumbo v9, "$uuid"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v5

    .local v5, "o":Ljava/util/UUID;
    goto/16 :goto_1

    .line 113
    .local v5, "o":Ljava/lang/Object;
    :cond_d
    const-string/jumbo v9, "$binary"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_e

    .line 114
    const-string/jumbo v9, "$type"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v8

    .line 115
    .local v8, "type":I
    new-instance v10, Lcom/mongodb/util/Base64Codec;

    invoke-direct {v10}, Lcom/mongodb/util/Base64Codec;-><init>()V

    const-string/jumbo v9, "$binary"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v10, v9}, Lcom/mongodb/util/Base64Codec;->decode(Ljava/lang/String;)[B

    move-result-object v1

    .line 116
    .local v1, "bytes":[B
    new-instance v5, Lorg/bson/types/Binary;

    .end local v5    # "o":Ljava/lang/Object;
    int-to-byte v9, v8

    invoke-direct {v5, v9, v1}, Lorg/bson/types/Binary;-><init>(B[B)V

    .line 117
    .local v5, "o":Lorg/bson/types/Binary;
    goto/16 :goto_1

    .end local v1    # "bytes":[B
    .end local v8    # "type":I
    .local v5, "o":Ljava/lang/Object;
    :cond_e
    const-string/jumbo v9, "$numberLong"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->containsField(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 118
    const-string/jumbo v9, "$numberLong"

    invoke-interface {v0, v9}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v9}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v5

    .local v5, "o":Ljava/lang/Long;
    goto/16 :goto_1

    .line 124
    .end local v5    # "o":Ljava/lang/Long;
    :cond_f
    invoke-static {}, Lorg/bson/BSON;->hasDecodeHooks()Z

    move-result v9

    if-nez v9, :cond_10

    .line 125
    .local v5, "o":Ljava/lang/Object;
    :goto_2
    invoke-virtual {p0, v5}, Lcom/mongodb/util/JSONCallback;->setRoot(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 124
    .end local v5    # "o":Ljava/lang/Object;
    :cond_10
    invoke-static {v5}, Lorg/bson/BSON;->applyDecodingHooks(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    goto :goto_2
.end method

.method public objectStart(ZLjava/lang/String;)V
    .locals 0
    .param p1, "array"    # Z
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/mongodb/util/JSONCallback;->_lastArray:Z

    .line 58
    invoke-super {p0, p1, p2}, Lorg/bson/BasicBSONCallback;->objectStart(ZLjava/lang/String;)V

    .line 59
    return-void
.end method
