.class public Lorg/apache/tools/ant/util/LazyFileOutputStream;
.super Ljava/io/OutputStream;
.source "LazyFileOutputStream.java"


# instance fields
.field private alwaysCreate:Z

.field private append:Z

.field private closed:Z

.field private file:Ljava/io/File;

.field private fos:Ljava/io/FileOutputStream;

.field private opened:Z


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z

    .prologue
    .line 78
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;-><init>(Ljava/io/File;ZZ)V

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/io/File;ZZ)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .param p3, "alwaysCreate"    # Z

    .prologue
    const/4 v0, 0x0

    .line 90
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 38
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->opened:Z

    .line 39
    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->closed:Z

    .line 91
    iput-object p1, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->file:Ljava/io/File;

    .line 92
    iput-boolean p2, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->append:Z

    .line 93
    iput-boolean p3, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->alwaysCreate:Z

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;-><init>(Ljava/lang/String;Z)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "append"    # Z

    .prologue
    .line 58
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lorg/apache/tools/ant/util/LazyFileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 59
    return-void
.end method

.method private declared-synchronized ensureOpened()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->closed:Z

    if-eqz v0, :cond_0

    .line 154
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->file:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " has already been closed."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 157
    :cond_0
    :try_start_1
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->opened:Z

    if-nez v0, :cond_1

    .line 158
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->append:Z

    invoke-direct {v0, v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->fos:Ljava/io/FileOutputStream;

    .line 159
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->opened:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    :cond_1
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->alwaysCreate:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->closed:Z

    if-nez v0, :cond_0

    .line 112
    invoke-direct {p0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;->ensureOpened()V

    .line 114
    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->opened:Z

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->fos:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 117
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    monitor-exit p0

    return-void

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public open()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;->ensureOpened()V

    .line 104
    return-void
.end method

.method public declared-synchronized write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;->ensureOpened()V

    .line 149
    iget-object v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->fos:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/FileOutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    monitor-exit p0

    return-void

    .line 148
    :catchall_0
    move-exception v0

    monitor-exit p0

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
    .line 126
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/tools/ant/util/LazyFileOutputStream;->write([BII)V

    .line 127
    return-void
.end method

.method public declared-synchronized write([BII)V
    .locals 1
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/util/LazyFileOutputStream;->ensureOpened()V

    .line 139
    iget-object v0, p0, Lorg/apache/tools/ant/util/LazyFileOutputStream;->fos:Ljava/io/FileOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    monitor-exit p0

    return-void

    .line 138
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
