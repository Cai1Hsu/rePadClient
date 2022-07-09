.class final Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;
.super Ljava/io/OutputStream;
.source "OutputStreamFunneler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/OutputStreamFunneler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Funnel"
.end annotation


# instance fields
.field private closed:Z

.field private final this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->closed:Z

    .line 42
    monitor-enter p1

    .line 43
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$004(Lorg/apache/tools/ant/util/OutputStreamFunneler;)I

    .line 44
    monitor-exit p1

    .line 45
    return-void

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method constructor <init>(Lorg/apache/tools/ant/util/OutputStreamFunneler;Lorg/apache/tools/ant/util/OutputStreamFunneler$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler;
    .param p2, "x1"    # Lorg/apache/tools/ant/util/OutputStreamFunneler$1;

    .prologue
    .line 38
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;-><init>(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V

    return-void
.end method

.method static access$500(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;

    .prologue
    .line 38
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->closed:Z

    return v0
.end method

.method static access$502(Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;Z)Z
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;
    .param p1, "x1"    # Z

    .prologue
    .line 38
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->closed:Z

    return p1
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
    .line 76
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0, p0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$300(Lorg/apache/tools/ant/util/OutputStreamFunneler;Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;)V

    .line 77
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
    .line 48
    iget-object v1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    monitor-enter v1

    .line 49
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$100(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V

    .line 50
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$200(Lorg/apache/tools/ant/util/OutputStreamFunneler;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 51
    monitor-exit v1

    .line 52
    return-void

    .line 51
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public write(I)V
    .locals 2
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    monitor-enter v1

    .line 56
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$100(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V

    .line 57
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$200(Lorg/apache/tools/ant/util/OutputStreamFunneler;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 58
    monitor-exit v1

    .line 59
    return-void

    .line 58
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    monitor-enter v1

    .line 63
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$100(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V

    .line 64
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$200(Lorg/apache/tools/ant/util/OutputStreamFunneler;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 65
    monitor-exit v1

    .line 66
    return-void

    .line 65
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public write([BII)V
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v1, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    monitor-enter v1

    .line 70
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$100(Lorg/apache/tools/ant/util/OutputStreamFunneler;)V

    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/util/OutputStreamFunneler$Funnel;->this$0:Lorg/apache/tools/ant/util/OutputStreamFunneler;

    invoke-static {v0}, Lorg/apache/tools/ant/util/OutputStreamFunneler;->access$200(Lorg/apache/tools/ant/util/OutputStreamFunneler;)Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 72
    monitor-exit v1

    .line 73
    return-void

    .line 72
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
