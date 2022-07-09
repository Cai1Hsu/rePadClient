.class public Lorg/apache/tools/ant/util/TeeOutputStream;
.super Ljava/io/OutputStream;
.source "TeeOutputStream.java"


# instance fields
.field private left:Ljava/io/OutputStream;

.field private right:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V
    .locals 0
    .param p1, "left"    # Ljava/io/OutputStream;
    .param p2, "right"    # Ljava/io/OutputStream;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->left:Ljava/io/OutputStream;

    .line 39
    iput-object p2, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    .line 40
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->left:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 52
    return-void

    .line 50
    :catchall_0
    move-exception v0

    iget-object v1, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v0
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->left:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 61
    return-void
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->left:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 93
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->left:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 70
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 71
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->left:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 82
    iget-object v0, p0, Lorg/apache/tools/ant/util/TeeOutputStream;->right:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 83
    return-void
.end method
