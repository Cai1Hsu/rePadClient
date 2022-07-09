.class Lorg/apache/tools/zip/ZipFile$BoundedInputStream;
.super Ljava/io/InputStream;
.source "ZipFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BoundedInputStream"
.end annotation


# instance fields
.field private addDummyByte:Z

.field private loc:J

.field private remaining:J

.field private final this$0:Lorg/apache/tools/zip/ZipFile;


# direct methods
.method constructor <init>(Lorg/apache/tools/zip/ZipFile;JJ)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/zip/ZipFile;
    .param p2, "start"    # J
    .param p4, "remaining"    # J

    .prologue
    .line 684
    iput-object p1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 682
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 685
    iput-wide p4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    .line 686
    iput-wide p2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    .line 687
    return-void
.end method


# virtual methods
.method addDummy()V
    .locals 1

    .prologue
    .line 737
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 738
    return-void
.end method

.method public read()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    const/4 v0, 0x0

    .line 690
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    sub-long v4, v2, v6

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gtz v1, :cond_1

    .line 691
    iget-boolean v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    if-eqz v1, :cond_0

    .line 692
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 699
    :goto_0
    return v0

    .line 695
    :cond_0
    const/4 v0, -0x1

    goto :goto_0

    .line 697
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipFile;->access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    monitor-enter v1

    .line 698
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipFile;->access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v0

    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    add-long v4, v2, v6

    iput-wide v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {v0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 699
    iget-object v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v0}, Lorg/apache/tools/zip/ZipFile;->access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->read()I

    move-result v0

    monitor-exit v1

    goto :goto_0

    .line 700
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 704
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gtz v1, :cond_2

    .line 705
    iget-boolean v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    if-eqz v1, :cond_1

    .line 706
    iput-boolean v0, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->addDummyByte:Z

    .line 707
    aput-byte v0, p1, p2

    .line 708
    const/4 v0, 0x1

    .line 729
    :cond_0
    :goto_0
    return v0

    .line 710
    :cond_1
    const/4 v0, -0x1

    goto :goto_0

    .line 713
    :cond_2
    if-lez p3, :cond_0

    .line 717
    int-to-long v2, p3

    iget-wide v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_3

    .line 718
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    long-to-int p3, v2

    .line 720
    :cond_3
    const/4 v0, -0x1

    .line 721
    .local v0, "ret":I
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v2

    monitor-enter v2

    .line 722
    :try_start_0
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    iget-wide v4, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {v1, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 723
    iget-object v1, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/tools/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/tools/zip/ZipFile;->access$600(Lorg/apache/tools/zip/ZipFile;)Ljava/io/RandomAccessFile;

    move-result-object v1

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v0

    .line 724
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 725
    if-lez v0, :cond_0

    .line 726
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    int-to-long v4, v0

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->loc:J

    .line 727
    iget-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    int-to-long v4, v0

    sub-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/tools/zip/ZipFile$BoundedInputStream;->remaining:J

    goto :goto_0

    .line 724
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
