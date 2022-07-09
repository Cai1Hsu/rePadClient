.class Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;
.super Ljava/io/InputStream;
.source "GridFSDBFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/gridfs/GridFSDBFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyInputStream"
.end annotation


# instance fields
.field _currentChunkIdx:I

.field _data:[B

.field final _numChunks:I

.field _offset:I

.field final synthetic this$0:Lcom/mongodb/gridfs/GridFSDBFile;


# direct methods
.method constructor <init>(Lcom/mongodb/gridfs/GridFSDBFile;)V
    .locals 1

    .prologue
    .line 110
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 194
    const/4 v0, -0x1

    iput v0, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    .line 195
    const/4 v0, 0x0

    iput v0, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    .line 111
    invoke-virtual {p1}, Lcom/mongodb/gridfs/GridFSDBFile;->numChunks()I

    move-result v0

    iput v0, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_numChunks:I

    .line 112
    return-void
.end method


# virtual methods
.method public available()I
    .locals 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    if-nez v0, :cond_0

    .line 116
    const/4 v0, 0x0

    .line 117
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    array-length v0, v0

    iget v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public close()V
    .locals 0

    .prologue
    .line 121
    return-void
.end method

.method public mark(I)V
    .locals 2
    .param p1, "readlimit"    # I

    .prologue
    .line 124
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "mark not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 130
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 3

    .prologue
    .line 134
    const/4 v2, 0x1

    new-array v0, v2, [B

    .line 135
    .local v0, "b":[B
    invoke-virtual {p0, v0}, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->read([B)I

    move-result v1

    .line 136
    .local v1, "res":I
    if-gez v1, :cond_0

    .line 137
    const/4 v2, -0x1

    .line 138
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    aget-byte v2, v0, v2

    and-int/lit16 v2, v2, 0xff

    goto :goto_0
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 142
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 3
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 147
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    iget-object v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    array-length v2, v2

    if-lt v1, v2, :cond_2

    .line 148
    :cond_0
    iget v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    add-int/lit8 v1, v1, 0x1

    iget v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_numChunks:I

    if-lt v1, v2, :cond_1

    .line 149
    const/4 v0, -0x1

    .line 158
    :goto_0
    return v0

    .line 151
    :cond_1
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    invoke-virtual {v1, v2}, Lcom/mongodb/gridfs/GridFSDBFile;->getChunk(I)[B

    move-result-object v1

    iput-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    .line 152
    const/4 v1, 0x0

    iput v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    .line 155
    :cond_2
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    array-length v1, v1

    iget v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 156
    .local v0, "r":I
    iget-object v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    iget v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 157
    iget v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    goto :goto_0
.end method

.method public reset()V
    .locals 2

    .prologue
    .line 127
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "mark not supported"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public skip(J)J
    .locals 9
    .param p1, "numBytesToSkip"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v4, 0x0

    .line 165
    cmp-long v3, p1, v4

    if-gtz v3, :cond_0

    move-wide p1, v4

    .line 189
    .end local p1    # "numBytesToSkip":J
    :goto_0
    return-wide p1

    .line 168
    .restart local p1    # "numBytesToSkip":J
    :cond_0
    iget v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    iget v6, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_numChunks:I

    if-ne v3, v6, :cond_1

    move-wide p1, v4

    .line 171
    goto :goto_0

    .line 174
    :cond_1
    const-wide/16 v0, 0x0

    .line 175
    .local v0, "offsetInFile":J
    iget v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    if-ltz v3, :cond_2

    .line 176
    iget v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    int-to-long v4, v3

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget-wide v6, v3, Lcom/mongodb/gridfs/GridFSDBFile;->_chunkSize:J

    mul-long/2addr v4, v6

    iget v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    int-to-long v6, v3

    add-long v0, v4, v6

    .line 177
    :cond_2
    add-long v4, p1, v0

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget-wide v6, v3, Lcom/mongodb/gridfs/GridFSDBFile;->_length:J

    cmp-long v3, v4, v6

    if-ltz v3, :cond_3

    .line 178
    iget v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_numChunks:I

    iput v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    .line 179
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    .line 180
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget-wide v4, v3, Lcom/mongodb/gridfs/GridFSDBFile;->_length:J

    sub-long p1, v4, v0

    goto :goto_0

    .line 183
    :cond_3
    iget v2, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    .line 184
    .local v2, "temp":I
    add-long v4, p1, v0

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget-wide v6, v3, Lcom/mongodb/gridfs/GridFSDBFile;->_chunkSize:J

    div-long/2addr v4, v6

    long-to-int v3, v4

    iput v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    .line 185
    iget v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    if-eq v2, v3, :cond_4

    .line 186
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget v4, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_currentChunkIdx:I

    invoke-virtual {v3, v4}, Lcom/mongodb/gridfs/GridFSDBFile;->getChunk(I)[B

    move-result-object v3

    iput-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_data:[B

    .line 187
    :cond_4
    add-long v4, p1, v0

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->this$0:Lcom/mongodb/gridfs/GridFSDBFile;

    iget-wide v6, v3, Lcom/mongodb/gridfs/GridFSDBFile;->_chunkSize:J

    rem-long/2addr v4, v6

    long-to-int v3, v4

    iput v3, p0, Lcom/mongodb/gridfs/GridFSDBFile$MyInputStream;->_offset:I

    goto :goto_0
.end method
