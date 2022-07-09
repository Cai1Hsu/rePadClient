.class public Lorg/apache/commons/compress/utils/CountingInputStream;
.super Ljava/io/FilterInputStream;
.source "CountingInputStream.java"


# instance fields
.field private bytesRead:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 35
    return-void
.end method


# virtual methods
.method protected final count(J)V
    .locals 3
    .param p1, "read"    # J

    .prologue
    .line 64
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_0

    .line 65
    iget-wide v0, p0, Lorg/apache/commons/compress/utils/CountingInputStream;->bytesRead:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/commons/compress/utils/CountingInputStream;->bytesRead:J

    .line 67
    :cond_0
    return-void
.end method

.method public getBytesRead()J
    .locals 2

    .prologue
    .line 74
    iget-wide v0, p0, Lorg/apache/commons/compress/utils/CountingInputStream;->bytesRead:J

    return-wide v0
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    iget-object v1, p0, Lorg/apache/commons/compress/utils/CountingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 40
    .local v0, "r":I
    if-ltz v0, :cond_0

    .line 41
    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/compress/utils/CountingInputStream;->count(J)V

    .line 43
    :cond_0
    return v0
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/compress/utils/CountingInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 4
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v1, p0, Lorg/apache/commons/compress/utils/CountingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 52
    .local v0, "r":I
    if-ltz v0, :cond_0

    .line 53
    int-to-long v2, v0

    invoke-virtual {p0, v2, v3}, Lorg/apache/commons/compress/utils/CountingInputStream;->count(J)V

    .line 55
    :cond_0
    return v0
.end method
