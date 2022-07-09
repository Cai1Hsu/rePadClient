.class public Lorg/apache/tools/ant/DemuxOutputStream;
.super Ljava/io/OutputStream;
.source "DemuxOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/DemuxOutputStream$1;,
        Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    }
.end annotation


# static fields
.field private static final CR:I = 0xd

.field private static final INTIAL_SIZE:I = 0x84

.field private static final LF:I = 0xa

.field private static final MAX_SIZE:I = 0x400


# instance fields
.field private buffers:Ljava/util/WeakHashMap;

.field private isErrorStream:Z

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;Z)V
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "isErrorStream"    # Z

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 65
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/DemuxOutputStream;->buffers:Ljava/util/WeakHashMap;

    .line 88
    iput-object p1, p0, Lorg/apache/tools/ant/DemuxOutputStream;->project:Lorg/apache/tools/ant/Project;

    .line 89
    iput-boolean p2, p0, Lorg/apache/tools/ant/DemuxOutputStream;->isErrorStream:Z

    .line 90
    return-void
.end method

.method private getBufferInfo()Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    .locals 4

    .prologue
    .line 98
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 99
    .local v1, "current":Ljava/lang/Thread;
    iget-object v2, p0, Lorg/apache/tools/ant/DemuxOutputStream;->buffers:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    .line 100
    .local v0, "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    if-nez v0, :cond_0

    .line 101
    new-instance v0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    .end local v0    # "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;-><init>(Lorg/apache/tools/ant/DemuxOutputStream$1;)V

    .line 102
    .restart local v0    # "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    const/16 v3, 0x84

    invoke-direct {v2, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-static {v0, v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$102(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Ljava/io/ByteArrayOutputStream;)Ljava/io/ByteArrayOutputStream;

    .line 103
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$202(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Z)Z

    .line 104
    iget-object v2, p0, Lorg/apache/tools/ant/DemuxOutputStream;->buffers:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    :cond_0
    return-object v0
.end method

.method private removeBuffer()V
    .locals 2

    .prologue
    .line 128
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 129
    .local v0, "current":Ljava/lang/Thread;
    iget-object v1, p0, Lorg/apache/tools/ant/DemuxOutputStream;->buffers:Ljava/util/WeakHashMap;

    invoke-virtual {v1, v0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    return-void
.end method

.method private resetBufferInfo()V
    .locals 3

    .prologue
    .line 113
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    .line 114
    .local v1, "current":Ljava/lang/Thread;
    iget-object v2, p0, Lorg/apache/tools/ant/DemuxOutputStream;->buffers:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    .line 116
    .local v0, "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    :try_start_0
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 120
    :goto_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {v0, v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$102(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Ljava/io/ByteArrayOutputStream;)Ljava/io/ByteArrayOutputStream;

    .line 121
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$202(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Z)Z

    .line 122
    return-void

    .line 117
    :catch_0
    move-exception v2

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    invoke-virtual {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->flush()V

    .line 199
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->removeBuffer()V

    .line 200
    return-void
.end method

.method public flush()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->getBufferInfo()Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    move-result-object v0

    .line 210
    .local v0, "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 211
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/DemuxOutputStream;->processFlush(Ljava/io/ByteArrayOutputStream;)V

    .line 213
    :cond_0
    return-void
.end method

.method protected processBuffer(Ljava/io/ByteArrayOutputStream;)V
    .locals 3
    .param p1, "buffer"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 171
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    .line 172
    .local v0, "output":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DemuxOutputStream;->project:Lorg/apache/tools/ant/Project;

    iget-boolean v2, p0, Lorg/apache/tools/ant/DemuxOutputStream;->isErrorStream:Z

    invoke-virtual {v1, v0, v2}, Lorg/apache/tools/ant/Project;->demuxOutput(Ljava/lang/String;Z)V

    .line 173
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->resetBufferInfo()V

    .line 174
    return-void
.end method

.method protected processFlush(Ljava/io/ByteArrayOutputStream;)V
    .locals 3
    .param p1, "buffer"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 185
    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "output":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/DemuxOutputStream;->project:Lorg/apache/tools/ant/Project;

    iget-boolean v2, p0, Lorg/apache/tools/ant/DemuxOutputStream;->isErrorStream:Z

    invoke-virtual {v1, v0, v2}, Lorg/apache/tools/ant/Project;->demuxFlush(Ljava/lang/String;Z)V

    .line 187
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->resetBufferInfo()V

    .line 188
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "cc"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    int-to-byte v1, p1

    .line 142
    .local v1, "c":B
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->getBufferInfo()Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    move-result-object v0

    .line 144
    .local v0, "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    const/16 v2, 0xa

    if-ne v1, v2, :cond_1

    .line 146
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 147
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/DemuxOutputStream;->processBuffer(Ljava/io/ByteArrayOutputStream;)V

    .line 156
    :goto_0
    const/16 v2, 0xd

    if-ne v1, v2, :cond_3

    const/4 v2, 0x1

    :goto_1
    invoke-static {v0, v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$202(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;Z)Z

    .line 157
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$200(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v2

    const/16 v3, 0x400

    if-le v2, v3, :cond_0

    .line 158
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/DemuxOutputStream;->processBuffer(Ljava/io/ByteArrayOutputStream;)V

    .line 160
    :cond_0
    return-void

    .line 149
    :cond_1
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$200(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 151
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/DemuxOutputStream;->processBuffer(Ljava/io/ByteArrayOutputStream;)V

    .line 154
    :cond_2
    invoke-static {v0}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_0

    .line 156
    :cond_3
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public write([BII)V
    .locals 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xd

    const/16 v6, 0xa

    .line 226
    move v3, p2

    .line 227
    .local v3, "offset":I
    move v1, v3

    .line 228
    .local v1, "blockStartOffset":I
    move v4, p3

    .line 229
    .local v4, "remaining":I
    invoke-direct {p0}, Lorg/apache/tools/ant/DemuxOutputStream;->getBufferInfo()Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;

    move-result-object v2

    .line 230
    .local v2, "bufferInfo":Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;
    :goto_0
    if-lez v4, :cond_4

    .line 231
    :goto_1
    if-lez v4, :cond_0

    aget-byte v5, p1, v3

    if-eq v5, v6, :cond_0

    aget-byte v5, p1, v3

    if-eq v5, v7, :cond_0

    .line 232
    add-int/lit8 v3, v3, 0x1

    .line 233
    add-int/lit8 v4, v4, -0x1

    goto :goto_1

    .line 236
    :cond_0
    sub-int v0, v3, v1

    .line 237
    .local v0, "blockLength":I
    if-lez v0, :cond_1

    .line 238
    invoke-static {v2}, Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;->access$100(Lorg/apache/tools/ant/DemuxOutputStream$BufferInfo;)Ljava/io/ByteArrayOutputStream;

    move-result-object v5

    invoke-virtual {v5, p1, v1, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 240
    :cond_1
    :goto_2
    if-lez v4, :cond_3

    aget-byte v5, p1, v3

    if-eq v5, v6, :cond_2

    aget-byte v5, p1, v3

    if-ne v5, v7, :cond_3

    .line 241
    :cond_2
    aget-byte v5, p1, v3

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/DemuxOutputStream;->write(I)V

    .line 242
    add-int/lit8 v3, v3, 0x1

    .line 243
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 245
    :cond_3
    move v1, v3

    goto :goto_0

    .line 247
    .end local v0    # "blockLength":I
    :cond_4
    return-void
.end method
