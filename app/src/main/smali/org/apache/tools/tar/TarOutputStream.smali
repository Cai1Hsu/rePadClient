.class public Lorg/apache/tools/tar/TarOutputStream;
.super Ljava/io/FilterOutputStream;
.source "TarOutputStream.java"


# static fields
.field public static final LONGFILE_ERROR:I = 0x0

.field public static final LONGFILE_GNU:I = 0x2

.field public static final LONGFILE_TRUNCATE:I = 0x1


# instance fields
.field protected assemBuf:[B

.field protected assemLen:I

.field protected buffer:Lorg/apache/tools/tar/TarBuffer;

.field private closed:Z

.field protected currBytes:J

.field protected currName:Ljava/lang/String;

.field protected currSize:J

.field protected debug:Z

.field protected longFileMode:I

.field protected oneBuf:[B

.field protected recordBuf:[B


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "os"    # Ljava/io/OutputStream;

    .prologue
    .line 66
    const/16 v0, 0x2800

    const/16 v1, 0x200

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/tools/tar/TarOutputStream;-><init>(Ljava/io/OutputStream;II)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I

    .prologue
    .line 75
    const/16 v0, 0x200

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/tar/TarOutputStream;-><init>(Ljava/io/OutputStream;II)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;II)V
    .locals 2
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "blockSize"    # I
    .param p3, "recordSize"    # I

    .prologue
    const/4 v1, 0x0

    .line 85
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 56
    iput v1, p0, Lorg/apache/tools/tar/TarOutputStream;->longFileMode:I

    .line 59
    iput-boolean v1, p0, Lorg/apache/tools/tar/TarOutputStream;->closed:Z

    .line 87
    new-instance v0, Lorg/apache/tools/tar/TarBuffer;

    invoke-direct {v0, p1, p2, p3}, Lorg/apache/tools/tar/TarBuffer;-><init>(Ljava/io/OutputStream;II)V

    iput-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    .line 88
    iput-boolean v1, p0, Lorg/apache/tools/tar/TarOutputStream;->debug:Z

    .line 89
    iput v1, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    .line 90
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    .line 91
    new-array v0, p3, [B

    iput-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    .line 92
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->oneBuf:[B

    .line 93
    return-void
.end method

.method private writeEOFRecord()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 348
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 349
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    const/4 v2, 0x0

    aput-byte v2, v1, v0

    .line 348
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 352
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    invoke-virtual {v1, v2}, Lorg/apache/tools/tar/TarBuffer;->writeRecord([B)V

    .line 353
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    iget-boolean v0, p0, Lorg/apache/tools/tar/TarOutputStream;->closed:Z

    if-nez v0, :cond_0

    .line 146
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarOutputStream;->finish()V

    .line 147
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/tools/tar/TarBuffer;->close()V

    .line 148
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/tar/TarOutputStream;->closed:Z

    .line 151
    :cond_0
    return-void
.end method

.method public closeEntry()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 219
    iget v1, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    if-lez v1, :cond_1

    .line 220
    iget v0, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 221
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    aput-byte v6, v1, v0

    .line 220
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 224
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    invoke-virtual {v1, v2}, Lorg/apache/tools/tar/TarBuffer;->writeRecord([B)V

    .line 226
    iget-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    iget v1, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    int-to-long v4, v1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    .line 227
    iput v6, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    .line 230
    .end local v0    # "i":I
    :cond_1
    iget-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    iget-wide v4, p0, Lorg/apache/tools/tar/TarOutputStream;->currSize:J

    cmp-long v1, v2, v4

    if-gez v1, :cond_2

    .line 231
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "entry \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/tar/TarOutputStream;->currName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' closed at \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-wide v4, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' before the \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-wide v4, p0, Lorg/apache/tools/tar/TarOutputStream;->currSize:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' bytes specified in the header were written"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 236
    :cond_2
    return-void
.end method

.method public finish()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-direct {p0}, Lorg/apache/tools/tar/TarOutputStream;->writeEOFRecord()V

    .line 134
    invoke-direct {p0}, Lorg/apache/tools/tar/TarOutputStream;->writeEOFRecord()V

    .line 135
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/tools/tar/TarBuffer;->flushBlock()V

    .line 136
    return-void
.end method

.method public getRecordSize()I
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0}, Lorg/apache/tools/tar/TarBuffer;->getRecordSize()I

    move-result v0

    return v0
.end method

.method public putNextEntry(Lorg/apache/tools/tar/TarEntry;)V
    .locals 8
    .param p1, "entry"    # Lorg/apache/tools/tar/TarEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x0

    const/16 v4, 0x64

    .line 175
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v4, :cond_0

    .line 177
    iget v1, p0, Lorg/apache/tools/tar/TarOutputStream;->longFileMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    .line 180
    new-instance v0, Lorg/apache/tools/tar/TarEntry;

    const-string/jumbo v1, "././@LongLink"

    const/16 v2, 0x4c

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/tar/TarEntry;-><init>(Ljava/lang/String;B)V

    .line 183
    .local v0, "longLinkEntry":Lorg/apache/tools/tar/TarEntry;
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    int-to-long v2, v1

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/tar/TarEntry;->setSize(J)V

    .line 184
    invoke-virtual {p0, v0}, Lorg/apache/tools/tar/TarOutputStream;->putNextEntry(Lorg/apache/tools/tar/TarEntry;)V

    .line 185
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/tar/TarOutputStream;->write([B)V

    .line 186
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/apache/tools/tar/TarOutputStream;->write(I)V

    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/tar/TarOutputStream;->closeEntry()V

    .line 195
    .end local v0    # "longLinkEntry":Lorg/apache/tools/tar/TarEntry;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    invoke-virtual {p1, v1}, Lorg/apache/tools/tar/TarEntry;->writeEntryHeader([B)V

    .line 196
    iget-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    invoke-virtual {v1, v2}, Lorg/apache/tools/tar/TarBuffer;->writeRecord([B)V

    .line 198
    iput-wide v6, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    .line 200
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 201
    iput-wide v6, p0, Lorg/apache/tools/tar/TarOutputStream;->currSize:J

    .line 205
    :goto_0
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/tar/TarOutputStream;->currName:Ljava/lang/String;

    .line 206
    return-void

    .line 188
    :cond_1
    iget v1, p0, Lorg/apache/tools/tar/TarOutputStream;->longFileMode:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 189
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "file name \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' is too long ( > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " bytes)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 203
    :cond_2
    invoke-virtual {p1}, Lorg/apache/tools/tar/TarEntry;->getSize()J

    move-result-wide v2

    iput-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currSize:J

    goto :goto_0
.end method

.method public setBufferDebug(Z)V
    .locals 1
    .param p1, "debug"    # Z

    .prologue
    .line 122
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v0, p1}, Lorg/apache/tools/tar/TarBuffer;->setDebug(Z)V

    .line 123
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debugF"    # Z

    .prologue
    .line 113
    iput-boolean p1, p0, Lorg/apache/tools/tar/TarOutputStream;->debug:Z

    .line 114
    return-void
.end method

.method public setLongFileMode(I)V
    .locals 0
    .param p1, "longFileMode"    # I

    .prologue
    .line 103
    iput p1, p0, Lorg/apache/tools/tar/TarOutputStream;->longFileMode:I

    .line 104
    return-void
.end method

.method public write(I)V
    .locals 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 247
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->oneBuf:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 249
    iget-object v0, p0, Lorg/apache/tools/tar/TarOutputStream;->oneBuf:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lorg/apache/tools/tar/TarOutputStream;->write([BII)V

    .line 250
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "wBuf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/tar/TarOutputStream;->write([BII)V

    .line 262
    return-void
.end method

.method public write([BII)V
    .locals 7
    .param p1, "wBuf"    # [B
    .param p2, "wOffset"    # I
    .param p3, "numToWrite"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 279
    iget-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iget-wide v4, p0, Lorg/apache/tools/tar/TarOutputStream;->currSize:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 280
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "request to write \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\' bytes exceeds size in header of \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-wide v4, p0, Lorg/apache/tools/tar/TarOutputStream;->currSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\' bytes for entry \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/tar/TarOutputStream;->currName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 294
    :cond_0
    iget v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    if-lez v2, :cond_1

    .line 295
    iget v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    add-int/2addr v2, p3

    iget-object v3, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    array-length v3, v3

    if-lt v2, v3, :cond_3

    .line 296
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    sub-int v0, v2, v3

    .line 298
    .local v0, "aLen":I
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    iget-object v3, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    iget v4, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    invoke-static {v2, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 300
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    iget v3, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    invoke-static {p1, p2, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 302
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    iget-object v3, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    invoke-virtual {v2, v3}, Lorg/apache/tools/tar/TarBuffer;->writeRecord([B)V

    .line 304
    iget-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    iget-object v4, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    array-length v4, v4

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    .line 305
    add-int/2addr p2, v0

    .line 306
    sub-int/2addr p3, v0

    .line 307
    iput v6, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    .line 323
    .end local v0    # "aLen":I
    :cond_1
    :goto_0
    if-lez p3, :cond_2

    .line 324
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    array-length v2, v2

    if-ge p3, v2, :cond_4

    .line 325
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    iget v3, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 328
    iget v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    add-int/2addr v2, p3

    iput v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    .line 341
    :cond_2
    return-void

    .line 309
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemBuf:[B

    iget v3, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    add-int/2addr p2, p3

    .line 313
    iget v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    add-int/2addr v2, p3

    iput v2, p0, Lorg/apache/tools/tar/TarOutputStream;->assemLen:I

    .line 314
    const/4 p3, 0x0

    goto :goto_0

    .line 333
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->buffer:Lorg/apache/tools/tar/TarBuffer;

    invoke-virtual {v2, p1, p2}, Lorg/apache/tools/tar/TarBuffer;->writeRecord([BI)V

    .line 335
    iget-object v2, p0, Lorg/apache/tools/tar/TarOutputStream;->recordBuf:[B

    array-length v1, v2

    .line 337
    .local v1, "num":I
    iget-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    int-to-long v4, v1

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/tar/TarOutputStream;->currBytes:J

    .line 338
    sub-int/2addr p3, v1

    .line 339
    add-int/2addr p2, v1

    goto :goto_0
.end method
