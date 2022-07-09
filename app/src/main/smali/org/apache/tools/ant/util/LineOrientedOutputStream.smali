.class public abstract Lorg/apache/tools/ant/util/LineOrientedOutputStream;
.super Ljava/io/OutputStream;
.source "LineOrientedOutputStream.java"


# static fields
.field private static final CR:I = 0xd

.field private static final INTIAL_SIZE:I = 0x84

.field private static final LF:I = 0xa


# instance fields
.field private buffer:Ljava/io/ByteArrayOutputStream;

.field private skip:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 42
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x84

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->skip:Z

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
    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 116
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->processBuffer()V

    .line 118
    :cond_0
    invoke-super {p0}, Ljava/io/OutputStream;->close()V

    .line 119
    return-void
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    return-void
.end method

.method protected processBuffer()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->processLine([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 83
    return-void

    .line 81
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->reset()V

    throw v0
.end method

.method protected abstract processLine(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected processLine([B)V
    .locals 1
    .param p1, "line"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->processLine(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public final write(I)V
    .locals 3
    .param p1, "cc"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0xd

    .line 54
    int-to-byte v0, p1

    .line 55
    .local v0, "c":B
    const/16 v1, 0xa

    if-eq v0, v1, :cond_0

    if-ne v0, v2, :cond_2

    .line 56
    :cond_0
    iget-boolean v1, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->skip:Z

    if-nez v1, :cond_1

    .line 57
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->processBuffer()V

    .line 62
    :cond_1
    :goto_0
    if-ne v0, v2, :cond_3

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->skip:Z

    .line 63
    return-void

    .line 60
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v1, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 62
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public final write([BII)V
    .locals 7
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0xd

    const/16 v5, 0xa

    .line 132
    move v2, p2

    .line 133
    .local v2, "offset":I
    move v1, v2

    .line 134
    .local v1, "blockStartOffset":I
    move v3, p3

    .line 135
    .local v3, "remaining":I
    :goto_0
    if-lez v3, :cond_4

    .line 136
    :goto_1
    if-lez v3, :cond_0

    aget-byte v4, p1, v2

    if-eq v4, v5, :cond_0

    aget-byte v4, p1, v2

    if-eq v4, v6, :cond_0

    .line 137
    add-int/lit8 v2, v2, 0x1

    .line 138
    add-int/lit8 v3, v3, -0x1

    goto :goto_1

    .line 141
    :cond_0
    sub-int v0, v2, v1

    .line 142
    .local v0, "blockLength":I
    if-lez v0, :cond_1

    .line 143
    iget-object v4, p0, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->buffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v4, p1, v1, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 145
    :cond_1
    :goto_2
    if-lez v3, :cond_3

    aget-byte v4, p1, v2

    if-eq v4, v5, :cond_2

    aget-byte v4, p1, v2

    if-ne v4, v6, :cond_3

    .line 146
    :cond_2
    aget-byte v4, p1, v2

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/util/LineOrientedOutputStream;->write(I)V

    .line 147
    add-int/lit8 v2, v2, 0x1

    .line 148
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 150
    :cond_3
    move v1, v2

    goto :goto_0

    .line 152
    .end local v0    # "blockLength":I
    :cond_4
    return-void
.end method
