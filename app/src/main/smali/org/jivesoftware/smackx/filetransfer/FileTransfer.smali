.class public abstract Lorg/jivesoftware/smackx/filetransfer/FileTransfer;
.super Ljava/lang/Object;
.source "FileTransfer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;,
        Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# instance fields
.field protected amountWritten:J

.field private error:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

.field private exception:Ljava/lang/Exception;

.field private fileName:Ljava/lang/String;

.field private filePath:Ljava/lang/String;

.field private fileSize:J

.field protected negotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

.field private peer:Ljava/lang/String;

.field private status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

.field private final statusMonitor:Ljava/lang/Object;

.field protected streamID:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;)V
    .locals 2
    .param p1, "peer"    # Ljava/lang/String;
    .param p2, "streamID"    # Ljava/lang/String;
    .param p3, "negotiator"    # Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    sget-object v0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->initial:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    iput-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    .line 47
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->statusMonitor:Ljava/lang/Object;

    .line 53
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    .line 66
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->peer:Ljava/lang/String;

    .line 67
    iput-object p2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->streamID:Ljava/lang/String;

    .line 68
    iput-object p3, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->negotiator:Lorg/jivesoftware/smackx/filetransfer/FileTransferNegotiator;

    .line 69
    return-void
.end method


# virtual methods
.method public abstract cancel()V
.end method

.method public getAmountWritten()J
    .locals 2

    .prologue
    .line 325
    iget-wide v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    return-wide v0
.end method

.method public getError()Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;
    .locals 1

    .prologue
    .line 164
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->error:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    return-object v0
.end method

.method public getException()Ljava/lang/Exception;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->exception:Ljava/lang/Exception;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getFileSize()J
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileSize:J

    return-wide v0
.end method

.method public getPeer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->peer:Ljava/lang/String;

    return-object v0
.end method

.method public getProgress()D
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 125
    iget-wide v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    iget-wide v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileSize:J

    cmp-long v0, v0, v2

    if-gtz v0, :cond_1

    .line 126
    :cond_0
    const-wide/16 v0, 0x0

    .line 128
    :goto_0
    return-wide v0

    :cond_1
    iget-wide v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    long-to-double v0, v0

    iget-wide v2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileSize:J

    long-to-double v2, v2

    div-double/2addr v0, v2

    goto :goto_0
.end method

.method public getStatus()Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    return-object v0
.end method

.method public getStreamID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->streamID:Ljava/lang/String;

    return-object v0
.end method

.method public isDone()Z
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->cancelled:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->error:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->complete:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    sget-object v1, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->refused:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setError(Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    .prologue
    .line 153
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->error:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    .line 154
    return-void
.end method

.method protected setException(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 188
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->exception:Ljava/lang/Exception;

    .line 189
    return-void
.end method

.method protected setFileInfo(Ljava/lang/String;J)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "fileSize"    # J

    .prologue
    .line 72
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileName:Ljava/lang/String;

    .line 73
    iput-wide p2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileSize:J

    .line 74
    return-void
.end method

.method protected setFileInfo(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;
    .param p3, "fileSize"    # J

    .prologue
    .line 77
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->filePath:Ljava/lang/String;

    .line 78
    iput-object p2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileName:Ljava/lang/String;

    .line 79
    iput-wide p3, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileSize:J

    .line 80
    return-void
.end method

.method protected setStatus(Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;)V
    .locals 2
    .param p1, "status"    # Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    .prologue
    .line 192
    iget-object v1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->statusMonitor:Ljava/lang/Object;

    monitor-enter v1

    .line 193
    :try_start_0
    iput-object p1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    .line 194
    monitor-exit v1

    .line 195
    return-void

    .line 194
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected updateStatus(Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;)Z
    .locals 2
    .param p1, "oldStatus"    # Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;
    .param p2, "newStatus"    # Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    .prologue
    .line 198
    iget-object v1, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->statusMonitor:Ljava/lang/Object;

    monitor-enter v1

    .line 199
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    if-eq p1, v0, :cond_0

    .line 200
    const/4 v0, 0x0

    monitor-exit v1

    .line 203
    :goto_0
    return v0

    .line 202
    :cond_0
    iput-object p2, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->status:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    .line 203
    const/4 v0, 0x1

    monitor-exit v1

    goto :goto_0

    .line 204
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected writeToStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 210
    const/16 v3, 0x2000

    new-array v0, v3, [B

    .line 211
    .local v0, "b":[B
    const/4 v1, 0x0

    .line 212
    .local v1, "count":I
    const-wide/16 v4, 0x0

    iput-wide v4, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    .line 217
    :cond_0
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    iget-wide v4, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    int-to-long v6, v1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    .line 226
    :try_start_1
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v1

    .line 230
    const/4 v3, -0x1

    if-eq v1, v3, :cond_1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->getStatus()Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->cancelled:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 233
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->getStatus()Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->cancelled:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->getError()Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    move-result-object v3

    sget-object v4, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;->none:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    if-ne v3, v4, :cond_2

    iget-wide v4, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->amountWritten:J

    iget-wide v6, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->fileSize:J

    cmp-long v3, v4, v6

    if-eqz v3, :cond_2

    .line 235
    sget-object v3, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;->error:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;

    invoke-virtual {p0, v3}, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->setStatus(Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Status;)V

    .line 236
    sget-object v3, Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;->connection:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    iput-object v3, p0, Lorg/jivesoftware/smackx/filetransfer/FileTransfer;->error:Lorg/jivesoftware/smackx/filetransfer/FileTransfer$Error;

    .line 238
    :cond_2
    return-void

    .line 218
    :catch_0
    move-exception v2

    .line 219
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "error writing to output stream"

    invoke-direct {v3, v4, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 227
    .end local v2    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 228
    .restart local v2    # "e":Ljava/io/IOException;
    new-instance v3, Lorg/jivesoftware/smack/XMPPException;

    const-string/jumbo v4, "error reading from input stream"

    invoke-direct {v3, v4, v2}, Lorg/jivesoftware/smack/XMPPException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
