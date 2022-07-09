.class Lcom/mongodb/NativeAuthenticationHelper;
.super Ljava/lang/Object;
.source "NativeAuthenticationHelper.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    return-void
.end method

.method static createHash(Ljava/lang/String;[C)[B
    .locals 8
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "password"    # [C

    .prologue
    .line 48
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, 0x14

    array-length v7, p1

    add-int/2addr v6, v7

    invoke-direct {v1, v6}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 50
    .local v1, "bout":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 51
    const-string/jumbo v6, ":mongo:"

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 52
    move-object v0, p1

    .local v0, "arr$":[C
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_1

    aget-char v2, v0, v3

    .line 53
    .local v2, "ch":C
    const/16 v6, 0x80

    if-lt v2, v6, :cond_0

    .line 54
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v7, "can\'t handle non-ascii passwords yet"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .end local v0    # "arr$":[C
    .end local v2    # "ch":C
    .end local v3    # "i$":I
    .end local v5    # "len$":I
    :catch_0
    move-exception v4

    .line 58
    .local v4, "ioe":Ljava/io/IOException;
    new-instance v6, Ljava/lang/RuntimeException;

    const-string/jumbo v7, "impossible"

    invoke-direct {v6, v7, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 55
    .end local v4    # "ioe":Ljava/io/IOException;
    .restart local v0    # "arr$":[C
    .restart local v2    # "ch":C
    .restart local v3    # "i$":I
    .restart local v5    # "len$":I
    :cond_0
    int-to-byte v6, v2

    :try_start_1
    invoke-virtual {v1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 52
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 60
    .end local v2    # "ch":C
    :cond_1
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-static {v6}, Lcom/mongodb/util/Util;->hexMD5([B)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    return-object v6
.end method

.method static getAuthCommand(Ljava/lang/String;[BLjava/lang/String;)Lcom/mongodb/DBObject;
    .locals 4
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "authHash"    # [B
    .param p2, "nonce"    # Ljava/lang/String;

    .prologue
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "key":Ljava/lang/String;
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 35
    .local v0, "cmd":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v2, "authenticate"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    const-string/jumbo v2, "user"

    invoke-virtual {v0, v2, p0}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    const-string/jumbo v2, "nonce"

    invoke-virtual {v0, v2, p2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    const-string/jumbo v2, "key"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-static {v3}, Lcom/mongodb/util/Util;->hexMD5([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    return-object v0
.end method

.method static getAuthCommand(Ljava/lang/String;[CLjava/lang/String;)Lcom/mongodb/DBObject;
    .locals 1
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "password"    # [C
    .param p2, "nonce"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/mongodb/NativeAuthenticationHelper;->createHash(Ljava/lang/String;[C)[B

    move-result-object v0

    invoke-static {p0, v0, p2}, Lcom/mongodb/NativeAuthenticationHelper;->getAuthCommand(Ljava/lang/String;[BLjava/lang/String;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method static getNonceCommand()Lcom/mongodb/BasicDBObject;
    .locals 3

    .prologue
    .line 44
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "getnonce"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method
