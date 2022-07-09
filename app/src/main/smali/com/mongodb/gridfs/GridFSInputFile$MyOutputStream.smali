.class Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;
.super Ljava/io/OutputStream;
.source "GridFSInputFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/gridfs/GridFSInputFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyOutputStream"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/gridfs/GridFSInputFile;


# direct methods
.method constructor <init>(Lcom/mongodb/gridfs/GridFSInputFile;)V
    .locals 0

    .prologue
    .line 351
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 398
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->access$200(Lcom/mongodb/gridfs/GridFSInputFile;Z)V

    .line 400
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v0}, Lcom/mongodb/gridfs/GridFSInputFile;->access$300(Lcom/mongodb/gridfs/GridFSInputFile;)V

    .line 402
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v0}, Lcom/mongodb/gridfs/GridFSInputFile;->access$401(Lcom/mongodb/gridfs/GridFSInputFile;)V

    .line 403
    return-void
.end method

.method public write(I)V
    .locals 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 360
    new-array v0, v3, [B

    .line 361
    .local v0, "byteArray":[B
    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 362
    invoke-virtual {p0, v0, v2, v3}, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->write([BII)V

    .line 363
    return-void
.end method

.method public write([BII)V
    .locals 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 372
    move v1, p2

    .line 373
    .local v1, "offset":I
    move v0, p3

    .line 374
    .local v0, "length":I
    const/4 v2, 0x0

    .line 375
    .local v2, "toCopy":I
    :cond_0
    :goto_0
    if-lez v0, :cond_2

    .line 376
    move v2, v0

    .line 377
    int-to-long v4, v2

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    iget-wide v6, v3, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v3

    int-to-long v8, v3

    sub-long/2addr v6, v8

    cmp-long v3, v4, v6

    if-lez v3, :cond_1

    .line 378
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    iget-wide v4, v3, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v3, v4

    iget-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v4}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v4

    sub-int v2, v3, v4

    .line 380
    :cond_1
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->access$100(Lcom/mongodb/gridfs/GridFSInputFile;)[B

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v4}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v4

    invoke-static {p1, v1, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 381
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v3, v2}, Lcom/mongodb/gridfs/GridFSInputFile;->access$012(Lcom/mongodb/gridfs/GridFSInputFile;I)I

    .line 382
    add-int/2addr v1, v2

    .line 383
    sub-int/2addr v0, v2

    .line 384
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-static {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v3

    int-to-long v4, v3

    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    iget-wide v6, v3, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 385
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lcom/mongodb/gridfs/GridFSInputFile;->access$200(Lcom/mongodb/gridfs/GridFSInputFile;Z)V

    goto :goto_0

    .line 388
    :cond_2
    return-void
.end method
