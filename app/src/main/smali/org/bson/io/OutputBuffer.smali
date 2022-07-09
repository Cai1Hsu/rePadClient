.class public abstract Lorg/bson/io/OutputBuffer;
.super Ljava/io/OutputStream;
.source "OutputBuffer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method

.method private writeCString(Ljava/lang/String;Z)I
    .locals 9
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "checkForNullCharacters"    # Z

    .prologue
    const/4 v7, 0x0

    .line 219
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 220
    .local v2, "len":I
    const/4 v3, 0x0

    .line 222
    .local v3, "total":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_4

    .line 223
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v0

    .line 225
    .local v0, "c":I
    if-eqz p2, :cond_0

    if-nez v0, :cond_0

    .line 226
    new-instance v4, Lorg/bson/BSONException;

    const-string/jumbo v5, "BSON cstring \'%s\' is not valid because it contains a null character at index %d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p1, v6, v7

    const/4 v7, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/bson/BSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 229
    :cond_0
    const/16 v4, 0x80

    if-ge v0, v4, :cond_1

    .line 230
    int-to-byte v4, v0

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 231
    add-int/lit8 v3, v3, 0x1

    .line 249
    :goto_1
    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v1, v4

    .line 250
    goto :goto_0

    .line 232
    :cond_1
    const/16 v4, 0x800

    if-ge v0, v4, :cond_2

    .line 233
    shr-int/lit8 v4, v0, 0x6

    add-int/lit16 v4, v4, 0xc0

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 234
    and-int/lit8 v4, v0, 0x3f

    add-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 235
    add-int/lit8 v3, v3, 0x2

    goto :goto_1

    .line 236
    :cond_2
    const/high16 v4, 0x10000

    if-ge v0, v4, :cond_3

    .line 237
    shr-int/lit8 v4, v0, 0xc

    add-int/lit16 v4, v4, 0xe0

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 238
    shr-int/lit8 v4, v0, 0x6

    and-int/lit8 v4, v4, 0x3f

    add-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 239
    and-int/lit8 v4, v0, 0x3f

    add-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 240
    add-int/lit8 v3, v3, 0x3

    goto :goto_1

    .line 242
    :cond_3
    shr-int/lit8 v4, v0, 0x12

    add-int/lit16 v4, v4, 0xf0

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 243
    shr-int/lit8 v4, v0, 0xc

    and-int/lit8 v4, v4, 0x3f

    add-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 244
    shr-int/lit8 v4, v0, 0x6

    and-int/lit8 v4, v4, 0x3f

    add-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 245
    and-int/lit8 v4, v0, 0x3f

    add-int/lit16 v4, v4, 0x80

    int-to-byte v4, v4

    invoke-virtual {p0, v4}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 246
    add-int/lit8 v3, v3, 0x4

    goto :goto_1

    .line 252
    .end local v0    # "c":I
    :cond_4
    invoke-virtual {p0, v7}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 253
    add-int/lit8 v3, v3, 0x1

    .line 254
    return v3
.end method


# virtual methods
.method public asString()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 86
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public asString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 95
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method public backpatchSize(I)V
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 268
    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    sub-int/2addr v0, p1

    invoke-virtual {p0, v0, p1}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 269
    return-void
.end method

.method protected backpatchSize(II)V
    .locals 1
    .param p1, "size"    # I
    .param p2, "additionalOffset"    # I

    .prologue
    .line 279
    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    sub-int/2addr v0, p1

    sub-int/2addr v0, p2

    invoke-virtual {p0, v0, p1}, Lorg/bson/io/OutputBuffer;->writeInt(II)V

    .line 280
    return-void
.end method

.method public abstract getPosition()I
.end method

.method public hex()Ljava/lang/String;
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .local v0, "buf":Ljava/lang/StringBuilder;
    :try_start_0
    new-instance v2, Lorg/bson/io/OutputBuffer$1;

    invoke-direct {v2, p0, v0}, Lorg/bson/io/OutputBuffer$1;-><init>(Lorg/bson/io/OutputBuffer;Ljava/lang/StringBuilder;)V

    invoke-virtual {p0, v2}, Lorg/bson/io/OutputBuffer;->pipe(Ljava/io/OutputStream;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 116
    :catch_0
    move-exception v1

    .line 117
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "impossible"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public md5()Ljava/lang/String;
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 130
    :try_start_0
    const-string/jumbo v3, "MD5"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 135
    .local v2, "md5":Ljava/security/MessageDigest;
    invoke-virtual {v2}, Ljava/security/MessageDigest;->reset()V

    .line 138
    :try_start_1
    new-instance v3, Lorg/bson/io/OutputBuffer$2;

    invoke-direct {v3, p0, v2}, Lorg/bson/io/OutputBuffer$2;-><init>(Lorg/bson/io/OutputBuffer;Ljava/security/MessageDigest;)V

    invoke-virtual {p0, v3}, Lorg/bson/io/OutputBuffer;->pipe(Ljava/io/OutputStream;)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 153
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lcom/mongodb/util/Util;->toHex([B)Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 132
    .end local v2    # "md5":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "Error - this implementation of Java doesn\'t support MD5."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 149
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v2    # "md5":Ljava/security/MessageDigest;
    :catch_1
    move-exception v1

    .line 150
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    const-string/jumbo v4, "impossible"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public abstract pipe(Ljava/io/OutputStream;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract seekEnd()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract seekStart()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract setPosition(I)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract size()I
.end method

.method public toByteArray()[B
    .locals 4

    .prologue
    .line 72
    :try_start_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 73
    .local v0, "bout":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->pipe(Ljava/io/OutputStream;)I

    .line 74
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 76
    .end local v0    # "bout":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v1

    .line 77
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string/jumbo v3, "should be impossible"

    invoke-direct {v2, v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " pos: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public truncateToPosition(I)V
    .locals 0
    .param p1, "newPosition"    # I

    .prologue
    .line 289
    invoke-virtual {p0, p1}, Lorg/bson/io/OutputBuffer;->setPosition(I)V

    .line 290
    return-void
.end method

.method public abstract write(I)V
.end method

.method public abstract write([B)V
.end method

.method public abstract write([BII)V
.end method

.method public writeCString(Ljava/lang/String;)I
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 213
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public writeDouble(D)V
    .locals 3
    .param p1, "x"    # D

    .prologue
    .line 197
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToRawLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/bson/io/OutputBuffer;->writeLong(J)V

    .line 198
    return-void
.end method

.method public writeInt(I)V
    .locals 1
    .param p1, "x"    # I

    .prologue
    .line 157
    shr-int/lit8 v0, p1, 0x0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 158
    shr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 159
    shr-int/lit8 v0, p1, 0x10

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 160
    shr-int/lit8 v0, p1, 0x18

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 161
    return-void
.end method

.method public writeInt(II)V
    .locals 1
    .param p1, "pos"    # I
    .param p2, "x"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 179
    invoke-virtual {p0}, Lorg/bson/io/OutputBuffer;->getPosition()I

    move-result v0

    .line 180
    .local v0, "save":I
    invoke-virtual {p0, p1}, Lorg/bson/io/OutputBuffer;->setPosition(I)V

    .line 181
    invoke-virtual {p0, p2}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 182
    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->setPosition(I)V

    .line 183
    return-void
.end method

.method public writeIntBE(I)V
    .locals 1
    .param p1, "x"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 168
    shr-int/lit8 v0, p1, 0x18

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 169
    shr-int/lit8 v0, p1, 0x10

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 170
    shr-int/lit8 v0, p1, 0x8

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 171
    invoke-virtual {p0, p1}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 172
    return-void
.end method

.method public writeLong(J)V
    .locals 5
    .param p1, "x"    # J

    .prologue
    const-wide/16 v2, 0xff

    .line 186
    const/4 v0, 0x0

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 187
    const/16 v0, 0x8

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 188
    const/16 v0, 0x10

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 189
    const/16 v0, 0x18

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 190
    const/16 v0, 0x20

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 191
    const/16 v0, 0x28

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 192
    const/16 v0, 0x30

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 193
    const/16 v0, 0x38

    shr-long v0, p1, v0

    and-long/2addr v0, v2

    long-to-int v0, v0

    int-to-byte v0, v0

    invoke-virtual {p0, v0}, Lorg/bson/io/OutputBuffer;->write(I)V

    .line 194
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 201
    invoke-virtual {p0, v1}, Lorg/bson/io/OutputBuffer;->writeInt(I)V

    .line 202
    invoke-direct {p0, p1, v1}, Lorg/bson/io/OutputBuffer;->writeCString(Ljava/lang/String;Z)I

    move-result v0

    .line 203
    .local v0, "strLen":I
    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/bson/io/OutputBuffer;->backpatchSize(II)V

    .line 204
    return-void
.end method
