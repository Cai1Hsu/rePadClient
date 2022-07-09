.class public Lorg/apache/tools/ant/util/ReaderInputStream;
.super Ljava/io/InputStream;
.source "ReaderInputStream.java"


# static fields
.field private static final BYTE_MASK:I = 0xff


# instance fields
.field private begin:I

.field private encoding:Ljava/lang/String;

.field private in:Ljava/io/Reader;

.field private slack:[B


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 1
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 35
    const-string/jumbo v0, "file.encoding"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->encoding:Ljava/lang/String;

    .line 48
    iput-object p1, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Ljava/lang/String;)V
    .locals 2
    .param p1, "reader"    # Ljava/io/Reader;
    .param p2, "encoding"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/ReaderInputStream;-><init>(Ljava/io/Reader;)V

    .line 61
    if-nez p2, :cond_0

    .line 62
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "encoding must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_0
    iput-object p2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->encoding:Ljava/lang/String;

    .line 66
    return-void
.end method


# virtual methods
.method public declared-synchronized available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    if-nez v0, :cond_0

    .line 162
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Stream Closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 164
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    if-eqz v0, :cond_1

    .line 165
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    array-length v0, v0

    iget v1, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-int/2addr v0, v1

    .line 170
    :goto_0
    monitor-exit p0

    return v0

    .line 167
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->ready()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v0

    if-eqz v0, :cond_2

    .line 168
    const/4 v0, 0x1

    goto :goto_0

    .line 170
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    if-eqz v0, :cond_0

    .line 200
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 201
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    .line 202
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 204
    :cond_0
    monitor-exit p0

    return-void

    .line 199
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mark(I)V
    .locals 3
    .param p1, "limit"    # I

    .prologue
    .line 149
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    invoke-virtual {v1, p1}, Ljava/io/Reader;->mark(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    monitor-exit p0

    return-void

    .line 150
    :catch_0
    move-exception v0

    .line 151
    .local v0, "ioe":Ljava/io/IOException;
    :try_start_1
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 177
    const/4 v0, 0x0

    return v0
.end method

.method public declared-synchronized read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 76
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    if-nez v2, :cond_0

    .line 77
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Stream Closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 81
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    if-eqz v2, :cond_2

    iget v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    iget-object v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    array-length v3, v3

    if-ge v2, v3, :cond_2

    .line 82
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    iget v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    aget-byte v1, v2, v3

    .line 83
    .local v1, "result":B
    iget v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    iget-object v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    array-length v3, v3

    if-ne v2, v3, :cond_1

    .line 84
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    :cond_1
    :goto_0
    and-int/lit16 v2, v1, 0xff

    .end local v1    # "result":B
    :goto_1
    monitor-exit p0

    return v2

    .line 87
    :cond_2
    const/4 v2, 0x1

    :try_start_2
    new-array v0, v2, [B

    .line 88
    .local v0, "buf":[B
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v2, v3}, Lorg/apache/tools/ant/util/ReaderInputStream;->read([BII)I

    move-result v2

    if-gtz v2, :cond_3

    .line 89
    const/4 v2, -0x1

    goto :goto_1

    .line 91
    :cond_3
    const/4 v2, 0x0

    aget-byte v1, v0, v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .restart local v1    # "result":B
    goto :goto_0
.end method

.method public declared-synchronized read([BII)I
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    .line 109
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    if-nez v4, :cond_0

    .line 110
    new-instance v2, Ljava/io/IOException;

    const-string/jumbo v3, "Stream Closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 112
    :cond_0
    if-nez p3, :cond_2

    .line 138
    :goto_0
    monitor-exit p0

    return v2

    .line 121
    .local v0, "buf":[C
    .local v1, "n":I
    :cond_1
    if-lez v1, :cond_2

    .line 122
    :try_start_1
    new-instance v2, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v2, v0, v4, v1}, Ljava/lang/String;-><init>([CII)V

    iget-object v4, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->encoding:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    .line 123
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    .line 115
    .end local v0    # "buf":[C
    .end local v1    # "n":I
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    if-nez v2, :cond_3

    .line 116
    new-array v0, p3, [C

    .line 117
    .restart local v0    # "buf":[C
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    invoke-virtual {v2, v0}, Ljava/io/Reader;->read([C)I

    move-result v1

    .line 118
    .restart local v1    # "n":I
    if-ne v1, v3, :cond_1

    move v2, v3

    .line 119
    goto :goto_0

    .line 127
    .end local v0    # "buf":[C
    .end local v1    # "n":I
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    sub-int/2addr v2, v3

    if-le p3, v2, :cond_4

    .line 128
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    sub-int p3, v2, v3

    .line 131
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    iget v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    invoke-static {v2, v3, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 133
    iget v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    add-int/2addr v2, p3

    iput v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    .line 134
    iget v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->begin:I

    iget-object v3, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    array-length v3, v3

    if-lt v2, v3, :cond_5

    .line 135
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_5
    move v2, p3

    .line 138
    goto :goto_0
.end method

.method public declared-synchronized reset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    if-nez v0, :cond_0

    .line 187
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Stream Closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 186
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 189
    :cond_0
    const/4 v0, 0x0

    :try_start_1
    iput-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->slack:[B

    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/util/ReaderInputStream;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->reset()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    monitor-exit p0

    return-void
.end method
