.class public Lorg/apache/tools/tar/TarInputStream;
.super Ljava/io/FilterInputStream;
.source "TarInputStream.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final BYTE_MASK:I = 0xff

.field private static final LARGE_BUFFER_SIZE:I = 0x8000

.field private static final SMALL_BUFFER_SIZE:I = 0x100


# instance fields
.field protected buffer:Lorg/apache/tools/tar/TarBuffer;

.field protected currEntry:Lorg/apache/tools/tar/TarEntry;

.field protected debug:Z

.field protected entryOffset:J

.field protected entrySize:J

.field protected hasHitEOF:Z

.field protected oneBuf:[B

.field protected readBuf:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 67
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/tools/tar/TarInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 76
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/tar/TarInputStream;-><init>(Ljava/io/InputStream;II)V

    .line 77
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;II)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    const/4 v1, 0x0

    .line 86
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 88
    new-instance v0, Lorg/apache/tools/tar/TarBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/tools/tar/TarBuffer;-><init>(Ljava/io/InputStream;II)V

    iput-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    .line 90
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->oneBuf:[B

    .line 91
    iput-boolean v1, p0, Lorg/apache/tools/tar/TarInputStream;->debug:Z

    .line 92
    iput-boolean v1, p0, Lorg/apache/tools/tar/TarInputStream;->hasHitEOF:Z

    .line 93
    return-void
.end method


# virtual methods
.method public available()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    iget-wide v0, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    iget-wide v2, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 136
    const v0, 0x7fffffff

    .line 138
    :goto_0
    return v0

    :cond_0
    iget-wide v0, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    iget-wide v2, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/tools/tar/TarBuffer;->close()V

    .line 111
    return-void
.end method

.method public copyEntryContents(Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 390
    const v2, 0x8000

    new-array v0, v2, [B

    .line 393
    .local v0, "buf":[B
    :goto_0
    array-length v2, v0

    invoke-virtual {p0, v0, v3, v2}, Lorg/apache/tools/tar/TarInputStream;->read([BII)I

    move-result v1

    .line 395
    .local v1, "numRead":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 401
    return-void

    .line 399
    :cond_0
    invoke-virtual {p1, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public getNextEntry()Lorg/apache/tools/tar/TarEntry;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 206
    iget-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->hasHitEOF:Z

    if-eqz v8, :cond_0

    .line 207
    const/4 v8, 0x0

    .line 286
    :goto_0
    return-object v8

    .line 210
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    if-eqz v8, :cond_4

    .line 211
    iget-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    iget-wide v10, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    sub-long v4, v8, v10

    .line 213
    .local v4, "numToSkip":J
    iget-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->debug:Z

    if-eqz v8, :cond_1

    .line 214
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "TarInputStream: SKIP currENTRY \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    invoke-virtual {v10}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' SZ "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-wide v10, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " OFF "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-wide v10, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "  skipping "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, " bytes"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 221
    :cond_1
    :goto_1
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-lez v8, :cond_3

    .line 222
    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/tar/TarInputStream;->skip(J)J

    move-result-wide v6

    .line 223
    .local v6, "skipped":J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-gtz v8, :cond_2

    .line 224
    new-instance v8, Ljava/lang/RuntimeException;

    const-string/jumbo v9, "failed to skip current tar entry"

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 227
    :cond_2
    sub-long/2addr v4, v6

    goto :goto_1

    .line 230
    .end local v6    # "skipped":J
    :cond_3
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    .line 233
    .end local v4    # "numToSkip":J
    :cond_4
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v8}, Lorg/apache/tools/tar/TarBuffer;->readRecord()[B

    move-result-object v1

    .line 235
    .local v1, "headerBuf":[B
    if-nez v1, :cond_7

    .line 236
    iget-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->debug:Z

    if-eqz v8, :cond_5

    .line 237
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v9, "READ NULL RECORD"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 239
    :cond_5
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->hasHitEOF:Z

    .line 247
    :cond_6
    :goto_2
    iget-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->hasHitEOF:Z

    if-eqz v8, :cond_9

    .line 248
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    .line 264
    :goto_3
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    if-eqz v8, :cond_e

    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    invoke-virtual {v8}, Lorg/apache/tools/tar/TarEntry;->isGNULongNameEntry()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 266
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 267
    .local v3, "longName":Ljava/lang/StringBuffer;
    const/16 v8, 0x100

    new-array v0, v8, [B

    .line 268
    .local v0, "buf":[B
    const/4 v2, 0x0

    .line 269
    .local v2, "length":I
    :goto_4
    invoke-virtual {p0, v0}, Lorg/apache/tools/tar/TarInputStream;->read([B)I

    move-result v2

    if-ltz v2, :cond_b

    .line 270
    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v8, v0, v9, v2}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4

    .line 240
    .end local v0    # "buf":[B
    .end local v2    # "length":I
    .end local v3    # "longName":Ljava/lang/StringBuffer;
    :cond_7
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v8, v1}, Lorg/apache/tools/tar/TarBuffer;->isEOFRecord([B)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 241
    iget-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->debug:Z

    if-eqz v8, :cond_8

    .line 242
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v9, "READ EOF RECORD"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 244
    :cond_8
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->hasHitEOF:Z

    goto :goto_2

    .line 250
    :cond_9
    new-instance v8, Lorg/apache/tools/tar/TarEntry;

    invoke-direct {v8, v1}, Lorg/apache/tools/tar/TarEntry;-><init>([B)V

    iput-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    .line 252
    iget-boolean v8, p0, Lorg/apache/tools/tar/TarInputStream;->debug:Z

    if-eqz v8, :cond_a

    .line 253
    sget-object v8, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "TarInputStream: SET CURRENTRY \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    invoke-virtual {v10}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, "\' size = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    invoke-virtual {v10}, Lorg/apache/tools/tar/TarEntry;->getSize()J

    move-result-wide v10

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 259
    :cond_a
    const-wide/16 v8, 0x0

    iput-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    .line 261
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    invoke-virtual {v8}, Lorg/apache/tools/tar/TarEntry;->getSize()J

    move-result-wide v8

    iput-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    goto/16 :goto_3

    .line 272
    .restart local v0    # "buf":[B
    .restart local v2    # "length":I
    .restart local v3    # "longName":Ljava/lang/StringBuffer;
    :cond_b
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarInputStream;->getNextEntry()Lorg/apache/tools/tar/TarEntry;

    .line 273
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    if-nez v8, :cond_c

    .line 276
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 279
    :cond_c
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    if-lez v8, :cond_d

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->charAt(I)C

    move-result v8

    if-nez v8, :cond_d

    .line 281
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v3, v8}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 283
    :cond_d
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/tar/TarEntry;->setName(Ljava/lang/String;)V

    .line 286
    .end local v0    # "buf":[B
    .end local v2    # "length":I
    .end local v3    # "longName":Ljava/lang/StringBuffer;
    :cond_e
    iget-object v8, p0, Lorg/apache/tools/tar/TarInputStream;->currEntry:Lorg/apache/tools/tar/TarEntry;

    goto/16 :goto_0
.end method

.method public getRecordSize()I
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/tools/tar/TarBuffer;->getRecordSize()I

    move-result v0

    return v0
.end method

.method public mark(I)V
    .locals 0
    .param p1, "markLimit"    # I

    .prologue
    .line 184
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 175
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, -0x1

    .line 298
    iget-object v2, p0, Lorg/apache/tools/tar/TarInputStream;->oneBuf:[B

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v4, v3}, Lorg/apache/tools/tar/TarInputStream;->read([BII)I

    move-result v0

    .line 299
    .local v0, "num":I
    if-ne v0, v1, :cond_0

    :goto_0
    return v1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarInputStream;->oneBuf:[B

    aget-byte v1, v1, v4

    and-int/lit16 v1, v1, 0xff

    goto :goto_0
.end method

.method public read([BII)I
    .locals 11
    .param p1, "buf"    # [B
    .param p2, "offset"    # I
    .param p3, "numToRead"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 316
    const/4 v5, 0x0

    .line 318
    .local v5, "totalRead":I
    iget-wide v6, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    iget-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    cmp-long v6, v6, v8

    if-ltz v6, :cond_0

    .line 319
    const/4 v6, -0x1

    .line 379
    :goto_0
    return v6

    .line 322
    :cond_0
    int-to-long v6, p3

    iget-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    add-long/2addr v6, v8

    iget-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    cmp-long v6, v6, v8

    if-lez v6, :cond_1

    .line 323
    iget-wide v6, p0, Lorg/apache/tools/tar/TarInputStream;->entrySize:J

    iget-wide v8, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    sub-long/2addr v6, v8

    long-to-int p3, v6

    .line 326
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    if-eqz v6, :cond_2

    .line 327
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    array-length v6, v6

    if-le p3, v6, :cond_3

    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    array-length v4, v6

    .line 330
    .local v4, "sz":I
    :goto_1
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    invoke-static {v6, v10, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 332
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    array-length v6, v6

    if-lt v4, v6, :cond_4

    .line 333
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    .line 343
    :goto_2
    add-int/2addr v5, v4

    .line 344
    sub-int/2addr p3, v4

    .line 345
    add-int/2addr p2, v4

    .line 348
    .end local v4    # "sz":I
    :cond_2
    :goto_3
    if-lez p3, :cond_7

    .line 349
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v6}, Lorg/apache/tools/tar/TarBuffer;->readRecord()[B

    move-result-object v2

    .line 351
    .local v2, "rec":[B
    if-nez v2, :cond_5

    .line 353
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "unexpected EOF with "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " bytes unread"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .end local v2    # "rec":[B
    :cond_3
    move v4, p3

    .line 327
    goto :goto_1

    .line 335
    .restart local v4    # "sz":I
    :cond_4
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    array-length v6, v6

    sub-int v1, v6, v4

    .line 336
    .local v1, "newLen":I
    new-array v0, v1, [B

    .line 338
    .local v0, "newBuf":[B
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    invoke-static {v6, v4, v0, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 340
    iput-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    goto :goto_2

    .line 357
    .end local v0    # "newBuf":[B
    .end local v1    # "newLen":I
    .end local v4    # "sz":I
    .restart local v2    # "rec":[B
    :cond_5
    move v4, p3

    .line 358
    .restart local v4    # "sz":I
    array-length v3, v2

    .line 360
    .local v3, "recLen":I
    if-le v3, v4, :cond_6

    .line 361
    invoke-static {v2, v10, p1, p2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 363
    sub-int v6, v3, v4

    new-array v6, v6, [B

    iput-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    .line 365
    iget-object v6, p0, Lorg/apache/tools/tar/TarInputStream;->readBuf:[B

    sub-int v7, v3, v4

    invoke-static {v2, v4, v6, v10, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 372
    :goto_4
    add-int/2addr v5, v4

    .line 373
    sub-int/2addr p3, v4

    .line 374
    add-int/2addr p2, v4

    goto :goto_3

    .line 367
    :cond_6
    move v4, v3

    .line 369
    invoke-static {v2, v10, p1, p2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_4

    .line 377
    .end local v2    # "rec":[B
    .end local v3    # "recLen":I
    .end local v4    # "sz":I
    :cond_7
    iget-wide v6, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    int-to-long v8, v5

    add-long/2addr v6, v8

    iput-wide v6, p0, Lorg/apache/tools/tar/TarInputStream;->entryOffset:J

    move v6, v5

    .line 379
    goto/16 :goto_0
.end method

.method public reset()V
    .locals 0

    .prologue
    .line 190
    return-void
.end method

.method public setDebug(Z)V
    .locals 1
    .param p1, "debug"    # Z

    .prologue
    .line 101
    iput-boolean p1, p0, Lorg/apache/tools/tar/TarInputStream;->debug:Z

    .line 102
    iget-object v0, p0, Lorg/apache/tools/tar/TarInputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0, p1}, Lorg/apache/tools/tar/TarBuffer;->setDebug(Z)V

    .line 103
    return-void
.end method

.method public skip(J)J
    .locals 9
    .param p1, "numToSkip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    const/16 v5, 0x2000

    new-array v4, v5, [B

    .line 157
    .local v4, "skipBuf":[B
    move-wide v2, p1

    .line 158
    .local v2, "skip":J
    :goto_0
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-lez v5, :cond_0

    .line 159
    array-length v5, v4

    int-to-long v6, v5

    cmp-long v5, v2, v6

    if-lez v5, :cond_1

    array-length v5, v4

    int-to-long v6, v5

    :goto_1
    long-to-int v1, v6

    .line 160
    .local v1, "realSkip":I
    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5, v1}, Lorg/apache/tools/tar/TarInputStream;->read([BII)I

    move-result v0

    .line 161
    .local v0, "numRead":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_2

    .line 166
    .end local v0    # "numRead":I
    .end local v1    # "realSkip":I
    :cond_0
    sub-long v6, p1, v2

    return-wide v6

    :cond_1
    move-wide v6, v2

    .line 159
    goto :goto_1

    .line 164
    .restart local v0    # "numRead":I
    .restart local v1    # "realSkip":I
    :cond_2
    int-to-long v6, v0

    sub-long/2addr v2, v6

    goto :goto_0
.end method
