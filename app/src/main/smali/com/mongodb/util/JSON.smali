.class public Lcom/mongodb/util/JSON;
.super Ljava/lang/Object;
.source "JSON.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parse(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 79
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/mongodb/util/JSON;->parse(Ljava/lang/String;Lorg/bson/BSONCallback;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Lorg/bson/BSONCallback;)Ljava/lang/Object;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "c"    # Lorg/bson/BSONCallback;

    .prologue
    .line 94
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string/jumbo v1, ""

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 95
    :cond_0
    const/4 v1, 0x0

    check-cast v1, Lcom/mongodb/DBObject;

    .line 99
    :goto_0
    return-object v1

    .line 98
    :cond_1
    new-instance v0, Lcom/mongodb/util/JSONParser;

    invoke-direct {v0, p0, p1}, Lcom/mongodb/util/JSONParser;-><init>(Ljava/lang/String;Lorg/bson/BSONCallback;)V

    .line 99
    .local v0, "p":Lcom/mongodb/util/JSONParser;
    invoke-virtual {v0}, Lcom/mongodb/util/JSONParser;->parse()Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public static serialize(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-static {p0, v0}, Lcom/mongodb/util/JSON;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 55
    invoke-static {}, Lcom/mongodb/util/JSONSerializers;->getLegacy()Lcom/mongodb/util/ObjectSerializer;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 56
    return-void
.end method

.method static string(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 3
    .param p0, "a"    # Ljava/lang/StringBuilder;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 103
    const-string/jumbo v2, "\""

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 105
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 106
    .local v0, "c":C
    const/16 v2, 0x5c

    if-ne v0, v2, :cond_1

    .line 107
    const-string/jumbo v2, "\\\\"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 108
    :cond_1
    const/16 v2, 0x22

    if-ne v0, v2, :cond_2

    .line 109
    const-string/jumbo v2, "\\\""

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 110
    :cond_2
    const/16 v2, 0xa

    if-ne v0, v2, :cond_3

    .line 111
    const-string/jumbo v2, "\\n"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 112
    :cond_3
    const/16 v2, 0xd

    if-ne v0, v2, :cond_4

    .line 113
    const-string/jumbo v2, "\\r"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 114
    :cond_4
    const/16 v2, 0x9

    if-ne v0, v2, :cond_5

    .line 115
    const-string/jumbo v2, "\\t"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 116
    :cond_5
    const/16 v2, 0x8

    if-ne v0, v2, :cond_6

    .line 117
    const-string/jumbo v2, "\\b"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 118
    :cond_6
    const/16 v2, 0x20

    if-lt v0, v2, :cond_0

    .line 121
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 123
    .end local v0    # "c":C
    :cond_7
    const-string/jumbo v2, "\""

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    return-void
.end method
