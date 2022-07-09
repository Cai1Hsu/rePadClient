.class public Lorg/apache/tools/ant/util/LeadPipeInputStream;
.super Ljava/io/PipedInputStream;
.source "LeadPipeInputStream.java"


# static fields
.field private static final BYTE_MASK:I = 0xff


# instance fields
.field private managingPc:Lorg/apache/tools/ant/ProjectComponent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/io/PipedInputStream;-><init>()V

    .line 43
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/io/PipedInputStream;-><init>()V

    .line 52
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/LeadPipeInputStream;->setBufferSize(I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/io/PipedOutputStream;)V
    .locals 0
    .param p1, "src"    # Ljava/io/PipedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0, p1}, Ljava/io/PipedInputStream;-><init>(Ljava/io/PipedOutputStream;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/io/PipedOutputStream;I)V
    .locals 0
    .param p1, "src"    # Ljava/io/PipedOutputStream;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0, p1}, Ljava/io/PipedInputStream;-><init>(Ljava/io/PipedOutputStream;)V

    .line 75
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/util/LeadPipeInputStream;->setBufferSize(I)V

    .line 76
    return-void
.end method


# virtual methods
.method public log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "loglevel"    # I

    .prologue
    .line 150
    iget-object v0, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/ProjectComponent;->log(Ljava/lang/String;I)V

    .line 159
    :goto_0
    return-void

    .line 153
    :cond_0
    const/4 v0, 0x1

    if-le p2, v0, :cond_1

    .line 154
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 156
    :cond_1
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public declared-synchronized read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    monitor-enter p0

    const/4 v2, -0x1

    .line 87
    .local v2, "result":I
    :try_start_0
    invoke-super {p0}, Ljava/io/PipedInputStream;->read()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 101
    :cond_0
    :goto_0
    monitor-exit p0

    return v2

    .line 88
    :catch_0
    move-exception v0

    .line 89
    .local v0, "eyeOhEx":Ljava/io/IOException;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 90
    .local v1, "msg":Ljava/lang/String;
    const-string/jumbo v3, "write end dead"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v3, "pipe broken"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 92
    :cond_1
    iget v3, p0, Ljava/io/PipedInputStream;->in:I

    if-lez v3, :cond_0

    iget v3, p0, Ljava/io/PipedInputStream;->out:I

    iget-object v4, p0, Ljava/io/PipedInputStream;->buffer:[B

    array-length v4, v4

    if-ge v3, v4, :cond_0

    iget v3, p0, Ljava/io/PipedInputStream;->out:I

    iget v4, p0, Ljava/io/PipedInputStream;->in:I

    if-le v3, v4, :cond_0

    .line 94
    iget-object v3, p0, Ljava/io/PipedInputStream;->buffer:[B

    iget v4, p0, Ljava/io/PipedInputStream;->out:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Ljava/io/PipedInputStream;->out:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    goto :goto_0

    .line 97
    :cond_2
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "error at LeadPipeInputStream.read():  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/util/LeadPipeInputStream;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 85
    .end local v0    # "eyeOhEx":Ljava/io/IOException;
    .end local v1    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized setBufferSize(I)V
    .locals 7
    .param p1, "size"    # I

    .prologue
    .line 109
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->buffer:[B

    array-length v2, v2

    if-le p1, v2, :cond_1

    .line 110
    new-array v0, p1, [B

    .line 111
    .local v0, "newBuffer":[B
    iget v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->in:I

    if-ltz v2, :cond_0

    .line 112
    iget v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->in:I

    iget v3, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I

    if-le v2, v3, :cond_2

    .line 113
    iget-object v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->buffer:[B

    iget v3, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I

    iget v4, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I

    iget v5, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->in:I

    iget v6, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I

    sub-int/2addr v5, v6

    invoke-static {v2, v3, v0, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 122
    :cond_0
    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->buffer:[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    .end local v0    # "newBuffer":[B
    :cond_1
    monitor-exit p0

    return-void

    .line 115
    .restart local v0    # "newBuffer":[B
    :cond_2
    :try_start_1
    iget-object v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->buffer:[B

    array-length v2, v2

    iget v3, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I

    sub-int v1, v2, v3

    .line 116
    .local v1, "outlen":I
    iget-object v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->buffer:[B

    iget v3, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I

    const/4 v4, 0x0

    invoke-static {v2, v3, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 117
    iget-object v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->buffer:[B

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->in:I

    invoke-static {v2, v3, v0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 118
    iget v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->in:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->in:I

    .line 119
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->out:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 109
    .end local v0    # "newBuffer":[B
    .end local v1    # "outlen":I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 0
    .param p1, "pc"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/apache/tools/ant/util/LeadPipeInputStream;->managingPc:Lorg/apache/tools/ant/ProjectComponent;

    .line 142
    return-void
.end method

.method public setManagingTask(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 132
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/LeadPipeInputStream;->setManagingComponent(Lorg/apache/tools/ant/ProjectComponent;)V

    .line 133
    return-void
.end method
