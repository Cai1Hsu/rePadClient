.class public final Lorg/apache/commons/net/io/Util;
.super Ljava/lang/Object;
.source "Util.java"


# static fields
.field public static final DEFAULT_COPY_BUFFER_SIZE:I = 0x400


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .locals 1
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 351
    if-eqz p0, :cond_0

    .line 353
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    :cond_0
    :goto_0
    return-void

    .line 354
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static closeQuietly(Ljava/net/Socket;)V
    .locals 1
    .param p0, "socket"    # Ljava/net/Socket;

    .prologue
    .line 367
    if-eqz p0, :cond_0

    .line 369
    :try_start_0
    invoke-virtual {p0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 373
    :cond_0
    :goto_0
    return-void

    .line 370
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static final copyReader(Ljava/io/Reader;Ljava/io/Writer;)J
    .locals 2
    .param p0, "source"    # Ljava/io/Reader;
    .param p1, "dest"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 340
    const/16 v0, 0x400

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/io/Util;->copyReader(Ljava/io/Reader;Ljava/io/Writer;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyReader(Ljava/io/Reader;Ljava/io/Writer;I)J
    .locals 7
    .param p0, "source"    # Ljava/io/Reader;
    .param p1, "dest"    # Ljava/io/Writer;
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 329
    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-static/range {v1 .. v6}, Lorg/apache/commons/net/io/Util;->copyReader(Ljava/io/Reader;Ljava/io/Writer;IJLorg/apache/commons/net/io/CopyStreamListener;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyReader(Ljava/io/Reader;Ljava/io/Writer;IJLorg/apache/commons/net/io/CopyStreamListener;)J
    .locals 9
    .param p0, "source"    # Ljava/io/Reader;
    .param p1, "dest"    # Ljava/io/Writer;
    .param p2, "bufferSize"    # I
    .param p3, "streamSize"    # J
    .param p5, "listener"    # Lorg/apache/commons/net/io/CopyStreamListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 263
    new-array v7, p2, [C

    .line 264
    .local v7, "buffer":[C
    const-wide/16 v2, 0x0

    .line 268
    .local v2, "total":J
    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {p0, v7}, Ljava/io/Reader;->read([C)I

    move-result v4

    .local v4, "chars":I
    const/4 v1, -0x1

    if-eq v4, v1, :cond_1

    .line 272
    if-nez v4, :cond_3

    .line 274
    invoke-virtual {p0}, Ljava/io/Reader;->read()I

    move-result v4

    .line 275
    if-gez v4, :cond_2

    .line 301
    :cond_1
    return-wide v2

    .line 278
    :cond_2
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 279
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 280
    const-wide/16 v5, 0x1

    add-long/2addr v2, v5

    .line 281
    if-eqz p5, :cond_0

    move-object v1, p5

    move-wide v5, p3

    .line 282
    invoke-interface/range {v1 .. v6}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 295
    .end local v4    # "chars":I
    :catch_0
    move-exception v8

    .line 297
    .local v8, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/commons/net/io/CopyStreamException;

    const-string/jumbo v5, "IOException caught while copying."

    invoke-direct {v1, v5, v2, v3, v8}, Lorg/apache/commons/net/io/CopyStreamException;-><init>(Ljava/lang/String;JLjava/io/IOException;)V

    throw v1

    .line 287
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v4    # "chars":I
    :cond_3
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p1, v7, v1, v4}, Ljava/io/Writer;->write([CII)V

    .line 288
    invoke-virtual {p1}, Ljava/io/Writer;->flush()V

    .line 289
    int-to-long v5, v4

    add-long/2addr v2, v5

    .line 290
    if-eqz p5, :cond_0

    move-object v1, p5

    move-wide v5, p3

    .line 291
    invoke-interface/range {v1 .. v6}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 2
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 219
    const/16 v0, 0x400

    invoke-static {p0, p1, v0}, Lorg/apache/commons/net/io/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;I)J
    .locals 7
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 208
    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    invoke-static/range {v1 .. v6}, Lorg/apache/commons/net/io/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;)J
    .locals 9
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I
    .param p3, "streamSize"    # J
    .param p5, "listener"    # Lorg/apache/commons/net/io/CopyStreamListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 179
    const/4 v7, 0x1

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-wide v4, p3

    move-object v6, p5

    invoke-static/range {v1 .. v7}, Lorg/apache/commons/net/io/Util;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;Z)J

    move-result-wide v0

    return-wide v0
.end method

.method public static final copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;IJLorg/apache/commons/net/io/CopyStreamListener;Z)J
    .locals 9
    .param p0, "source"    # Ljava/io/InputStream;
    .param p1, "dest"    # Ljava/io/OutputStream;
    .param p2, "bufferSize"    # I
    .param p3, "streamSize"    # J
    .param p5, "listener"    # Lorg/apache/commons/net/io/CopyStreamListener;
    .param p6, "flush"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/net/io/CopyStreamException;
        }
    .end annotation

    .prologue
    .line 96
    new-array v7, p2, [B

    .line 97
    .local v7, "buffer":[B
    const-wide/16 v2, 0x0

    .line 101
    .local v2, "total":J
    :cond_0
    :goto_0
    :try_start_0
    invoke-virtual {p0, v7}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "bytes":I
    const/4 v1, -0x1

    if-eq v4, v1, :cond_1

    .line 106
    if-nez v4, :cond_4

    .line 108
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v4

    .line 109
    if-gez v4, :cond_2

    .line 139
    :cond_1
    return-wide v2

    .line 112
    :cond_2
    invoke-virtual {p1, v4}, Ljava/io/OutputStream;->write(I)V

    .line 113
    if-eqz p6, :cond_3

    .line 114
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 116
    :cond_3
    const-wide/16 v5, 0x1

    add-long/2addr v2, v5

    .line 117
    if-eqz p5, :cond_0

    .line 118
    const/4 v4, 0x1

    move-object v1, p5

    move-wide v5, p3

    invoke-interface/range {v1 .. v6}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 133
    .end local v4    # "bytes":I
    :catch_0
    move-exception v8

    .line 135
    .local v8, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/commons/net/io/CopyStreamException;

    const-string/jumbo v5, "IOException caught while copying."

    invoke-direct {v1, v5, v2, v3, v8}, Lorg/apache/commons/net/io/CopyStreamException;-><init>(Ljava/lang/String;JLjava/io/IOException;)V

    throw v1

    .line 123
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v4    # "bytes":I
    :cond_4
    const/4 v1, 0x0

    :try_start_1
    invoke-virtual {p1, v7, v1, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 124
    if-eqz p6, :cond_5

    .line 125
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 127
    :cond_5
    int-to-long v5, v4

    add-long/2addr v2, v5

    .line 128
    if-eqz p5, :cond_0

    move-object v1, p5

    move-wide v5, p3

    .line 129
    invoke-interface/range {v1 .. v6}, Lorg/apache/commons/net/io/CopyStreamListener;->bytesTransferred(JIJ)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
