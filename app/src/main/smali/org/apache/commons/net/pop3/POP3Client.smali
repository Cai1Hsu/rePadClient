.class public Lorg/apache/commons/net/pop3/POP3Client;
.super Lorg/apache/commons/net/pop3/POP3;
.source "POP3Client.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Lorg/apache/commons/net/pop3/POP3;-><init>()V

    return-void
.end method

.method private static __parseStatus(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 6
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 59
    new-instance v3, Ljava/util/StringTokenizer;

    invoke-direct {v3, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 61
    .local v3, "tokenizer":Ljava/util/StringTokenizer;
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v5

    if-nez v5, :cond_1

    .line 82
    :cond_0
    :goto_0
    return-object v4

    .line 65
    :cond_1
    const/4 v2, 0x0

    .local v2, "size":I
    move v1, v2

    .line 69
    .local v1, "num":I
    :try_start_0
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 71
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 75
    invoke-virtual {v3}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 82
    new-instance v4, Lorg/apache/commons/net/pop3/POP3MessageInfo;

    invoke-direct {v4, v1, v2}, Lorg/apache/commons/net/pop3/POP3MessageInfo;-><init>(II)V

    goto :goto_0

    .line 77
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method private static __parseUID(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 5
    .param p0, "line"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 90
    new-instance v2, Ljava/util/StringTokenizer;

    invoke-direct {v2, p0}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 92
    .local v2, "tokenizer":Ljava/util/StringTokenizer;
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v4

    if-nez v4, :cond_1

    .line 113
    :cond_0
    :goto_0
    return-object v3

    .line 96
    :cond_1
    const/4 v1, 0x0

    .line 100
    .local v1, "num":I
    :try_start_0
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 102
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 106
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p0

    .line 113
    new-instance v3, Lorg/apache/commons/net/pop3/POP3MessageInfo;

    invoke-direct {v3, v1, p0}, Lorg/apache/commons/net/pop3/POP3MessageInfo;-><init>(ILjava/lang/String;)V

    goto :goto_0

    .line 108
    :catch_0
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_0
.end method


# virtual methods
.method public capa()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    move-result v0

    if-nez v0, :cond_0

    .line 125
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getAdditionalReply()V

    .line 126
    const/4 v0, 0x1

    .line 128
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public deleteMessage(I)Z
    .locals 4
    .param p1, "messageId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 305
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 306
    const/4 v2, 0x6

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 309
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 306
    goto :goto_0

    :cond_1
    move v0, v1

    .line 309
    goto :goto_0
.end method

.method public listMessage(I)Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 3
    .param p1, "messageId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 378
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 385
    :cond_0
    :goto_0
    return-object v0

    .line 381
    :cond_1
    const/4 v1, 0x4

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 385
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3Client;->_lastReplyLine:Ljava/lang/String;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/pop3/POP3Client;->__parseStatus(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public listMessages()[Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 408
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v3

    if-eq v3, v4, :cond_1

    .line 426
    :cond_0
    return-object v2

    .line 411
    :cond_1
    const/4 v3, 0x4

    invoke-virtual {p0, v3}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    move-result v3

    if-nez v3, :cond_0

    .line 414
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getAdditionalReply()V

    .line 417
    iget-object v3, p0, Lorg/apache/commons/net/pop3/POP3Client;->_replyLines:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    new-array v2, v3, [Lorg/apache/commons/net/pop3/POP3MessageInfo;

    .line 419
    .local v2, "messages":[Lorg/apache/commons/net/pop3/POP3MessageInfo;
    iget-object v3, p0, Lorg/apache/commons/net/pop3/POP3Client;->_replyLines:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 422
    .local v0, "en":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "line":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 423
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/commons/net/pop3/POP3Client;->__parseStatus(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;

    move-result-object v3

    aput-object v3, v2, v1

    .line 422
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public listUniqueIdentifier(I)Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 3
    .param p1, "messageId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 449
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 456
    :cond_0
    :goto_0
    return-object v0

    .line 452
    :cond_1
    const/16 v1, 0xb

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 456
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3Client;->_lastReplyLine:Ljava/lang/String;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/pop3/POP3Client;->__parseUID(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;

    move-result-object v0

    goto :goto_0
.end method

.method public listUniqueIdentifiers()[Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 479
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v3

    if-eq v3, v4, :cond_1

    .line 497
    :cond_0
    return-object v2

    .line 482
    :cond_1
    const/16 v3, 0xb

    invoke-virtual {p0, v3}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    move-result v3

    if-nez v3, :cond_0

    .line 485
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getAdditionalReply()V

    .line 488
    iget-object v3, p0, Lorg/apache/commons/net/pop3/POP3Client;->_replyLines:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    new-array v2, v3, [Lorg/apache/commons/net/pop3/POP3MessageInfo;

    .line 490
    .local v2, "messages":[Lorg/apache/commons/net/pop3/POP3MessageInfo;
    iget-object v3, p0, Lorg/apache/commons/net/pop3/POP3Client;->_replyLines:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 493
    .local v0, "en":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "line":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 494
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/commons/net/pop3/POP3Client;->__parseUID(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;

    move-result-object v3

    aput-object v3, v2, v1

    .line 493
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 151
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v2

    if-eqz v2, :cond_1

    .line 165
    :cond_0
    :goto_0
    return v0

    .line 155
    :cond_1
    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 159
    invoke-virtual {p0, v1, p2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 163
    invoke-virtual {p0, v1}, Lorg/apache/commons/net/pop3/POP3Client;->setState(I)V

    move v0, v1

    .line 165
    goto :goto_0
.end method

.method public login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 10
    .param p1, "username"    # Ljava/lang/String;
    .param p2, "timestamp"    # Ljava/lang/String;
    .param p3, "secret"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 210
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v8

    if-eqz v8, :cond_1

    .line 238
    :cond_0
    :goto_0
    return v6

    .line 214
    :cond_1
    const-string/jumbo v8, "MD5"

    invoke-static {v8}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    .line 215
    .local v5, "md5":Ljava/security/MessageDigest;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 216
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v1

    .line 217
    .local v1, "digest":[B
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v8, 0x80

    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 219
    .local v2, "digestBuffer":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    array-length v8, v1

    if-ge v4, v8, :cond_3

    .line 220
    aget-byte v8, v1, v4

    and-int/lit16 v3, v8, 0xff

    .line 221
    .local v3, "digit":I
    const/16 v8, 0xf

    if-gt v3, v8, :cond_2

    .line 222
    const-string/jumbo v8, "0"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 227
    .end local v3    # "digit":I
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v8, 0x100

    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 228
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const/16 v8, 0x20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 230
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    const/16 v8, 0x9

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v8, v9}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v8

    if-nez v8, :cond_0

    .line 236
    invoke-virtual {p0, v7}, Lorg/apache/commons/net/pop3/POP3Client;->setState(I)V

    move v6, v7

    .line 238
    goto :goto_0
.end method

.method public logout()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    const/4 v0, 0x1

    .line 259
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 260
    invoke-virtual {p0, v2}, Lorg/apache/commons/net/pop3/POP3Client;->setState(I)V

    .line 262
    :cond_0
    invoke-virtual {p0, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    .line 263
    iget v1, p0, Lorg/apache/commons/net/pop3/POP3Client;->_replyCode:I

    if-nez v1, :cond_1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public noop()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 281
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 282
    const/4 v2, 0x7

    invoke-virtual {p0, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    move-result v2

    if-nez v2, :cond_0

    .line 284
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 282
    goto :goto_0

    :cond_1
    move v0, v1

    .line 284
    goto :goto_0
.end method

.method public reset()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 326
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v2

    if-ne v2, v0, :cond_1

    .line 327
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    move-result v2

    if-nez v2, :cond_0

    .line 329
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 327
    goto :goto_0

    :cond_1
    move v0, v1

    .line 329
    goto :goto_0
.end method

.method public retrieveMessage(I)Ljava/io/Reader;
    .locals 3
    .param p1, "messageId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 528
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 535
    :cond_0
    :goto_0
    return-object v0

    .line 531
    :cond_1
    const/4 v1, 0x5

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 535
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v1, p0, Lorg/apache/commons/net/pop3/POP3Client;->_reader:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0
.end method

.method public retrieveMessageTop(II)Ljava/io/Reader;
    .locals 4
    .param p1, "messageId"    # I
    .param p2, "numLines"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 570
    if-ltz p2, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 578
    :cond_0
    :goto_0
    return-object v0

    .line 573
    :cond_1
    const/16 v1, 0xa

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(ILjava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 578
    new-instance v0, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    iget-object v1, p0, Lorg/apache/commons/net/pop3/POP3Client;->_reader:Ljava/io/BufferedReader;

    invoke-direct {v0, v1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    goto :goto_0
.end method

.method public status()Lorg/apache/commons/net/pop3/POP3MessageInfo;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x3

    .line 349
    invoke-virtual {p0}, Lorg/apache/commons/net/pop3/POP3Client;->getState()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    .line 355
    :cond_0
    :goto_0
    return-object v0

    .line 352
    :cond_1
    invoke-virtual {p0, v3}, Lorg/apache/commons/net/pop3/POP3Client;->sendCommand(I)I

    move-result v1

    if-nez v1, :cond_0

    .line 355
    iget-object v0, p0, Lorg/apache/commons/net/pop3/POP3Client;->_lastReplyLine:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/net/pop3/POP3Client;->__parseStatus(Ljava/lang/String;)Lorg/apache/commons/net/pop3/POP3MessageInfo;

    move-result-object v0

    goto :goto_0
.end method
