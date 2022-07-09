.class final Lorg/apache/commons/net/telnet/TelnetInputStream;
.super Ljava/io/BufferedInputStream;
.source "TelnetInputStream.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final EOF:I = -0x1

.field private static final WOULD_BLOCK:I = -0x2

.field static final _STATE_CR:I = 0x8

.field static final _STATE_DATA:I = 0x0

.field static final _STATE_DO:I = 0x4

.field static final _STATE_DONT:I = 0x5

.field static final _STATE_IAC:I = 0x1

.field static final _STATE_IAC_SB:I = 0x9

.field static final _STATE_SB:I = 0x6

.field static final _STATE_SE:I = 0x7

.field static final _STATE_WILL:I = 0x2

.field static final _STATE_WONT:I = 0x3


# instance fields
.field private __bytesAvailable:I

.field private final __client:Lorg/apache/commons/net/telnet/TelnetClient;

.field private __hasReachedEOF:Z

.field private __ioException:Ljava/io/IOException;

.field private volatile __isClosed:Z

.field private final __queue:[I

.field private __queueHead:I

.field private __queueTail:I

.field private __readIsWaiting:Z

.field private __receiveState:I

.field private final __suboption:[I

.field private __suboption_count:I

.field private final __thread:Ljava/lang/Thread;

.field private volatile __threaded:Z


# direct methods
.method constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;)V
    .locals 1
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "client"    # Lorg/apache/commons/net/telnet/TelnetClient;

    .prologue
    .line 89
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;Z)V

    .line 90
    return-void
.end method

.method constructor <init>(Ljava/io/InputStream;Lorg/apache/commons/net/telnet/TelnetClient;Z)V
    .locals 3
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "client"    # Lorg/apache/commons/net/telnet/TelnetClient;
    .param p3, "readerThread"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 67
    invoke-direct {p0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 58
    const/16 v0, 0x200

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    .line 59
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    .line 68
    iput-object p2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    .line 69
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    .line 70
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 71
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    .line 74
    const/16 v0, 0x801

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    .line 75
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    .line 76
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    .line 77
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 78
    iput-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 79
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    .line 80
    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    .line 81
    if-eqz p3, :cond_0

    .line 82
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    .line 86
    :goto_0
    return-void

    .line 84
    :cond_0
    iput-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    goto :goto_0
.end method

.method private __processChar(I)Z
    .locals 5
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 315
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v3

    .line 317
    :try_start_0
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-nez v2, :cond_0

    const/4 v0, 0x1

    .line 318
    .local v0, "bufferWasEmpty":Z
    :cond_0
    :goto_0
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-lt v2, v4, :cond_2

    .line 322
    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v2, :cond_1

    .line 324
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 327
    :try_start_1
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 329
    :catch_0
    move-exception v1

    .line 331
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_2
    throw v1

    .line 354
    .end local v0    # "bufferWasEmpty":Z
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 338
    .restart local v0    # "bufferWasEmpty":Z
    :cond_1
    :try_start_3
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v4, "Queue is full! Cannot process another character."

    invoke-direct {v2, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 343
    :cond_2
    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    if-eqz v2, :cond_3

    iget-boolean v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v2, :cond_3

    .line 345
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 348
    :cond_3
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    iget v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    aput p1, v2, v4

    .line 349
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 351
    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v4, v4

    if-lt v2, v4, :cond_4

    .line 352
    const/4 v2, 0x0

    iput v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueTail:I

    .line 354
    :cond_4
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 355
    return v0
.end method

.method private __read(Z)I
    .locals 7
    .param p1, "mayBlock"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x6

    const/4 v5, 0x0

    .line 135
    :goto_0
    if-nez p1, :cond_0

    invoke-super {p0}, Ljava/io/BufferedInputStream;->available()I

    move-result v1

    if-nez v1, :cond_0

    .line 136
    const/4 v0, -0x2

    .line 303
    :goto_1
    return v0

    .line 140
    :cond_0
    invoke-super {p0}, Ljava/io/BufferedInputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-gez v0, :cond_1

    .line 141
    const/4 v0, -0x1

    goto :goto_1

    .line 144
    :cond_1
    and-int/lit16 v0, v0, 0xff

    .line 147
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 149
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_processAYTResponse()V

    .line 150
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_spyRead(I)V

    .line 157
    iget v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    .line 173
    :cond_2
    :pswitch_1
    const/16 v1, 0xff

    if-ne v0, v1, :cond_3

    .line 175
    const/4 v1, 0x1

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 150
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    .line 161
    :pswitch_2
    if-nez v0, :cond_2

    goto :goto_0

    .line 180
    :cond_3
    const/16 v1, 0xd

    if-ne v0, v1, :cond_5

    .line 182
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 184
    :try_start_2
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/apache/commons/net/telnet/TelnetClient;->_requestedDont(I)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 185
    const/16 v1, 0x8

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    .line 189
    :goto_2
    monitor-exit v2

    goto :goto_1

    :catchall_1
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1

    .line 187
    :cond_4
    const/4 v1, 0x0

    :try_start_3
    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    .line 191
    :cond_5
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_1

    .line 196
    :pswitch_3
    packed-switch v0, :pswitch_data_1

    .line 223
    :pswitch_4
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    .line 224
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processCommand(I)V

    goto :goto_0

    .line 199
    :pswitch_5
    const/4 v1, 0x2

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 202
    :pswitch_6
    const/4 v1, 0x3

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 205
    :pswitch_7
    const/4 v1, 0x4

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 208
    :pswitch_8
    const/4 v1, 0x5

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 212
    :pswitch_9
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    .line 213
    iput v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 217
    :pswitch_a
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_1

    .line 220
    :pswitch_b
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto :goto_0

    .line 229
    :pswitch_c
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 231
    :try_start_4
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processWill(I)V

    .line 232
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 233
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 234
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 233
    :catchall_2
    move-exception v1

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1

    .line 237
    :pswitch_d
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 239
    :try_start_6
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processWont(I)V

    .line 240
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 241
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 242
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 241
    :catchall_3
    move-exception v1

    :try_start_7
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    throw v1

    .line 245
    :pswitch_e
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 247
    :try_start_8
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processDo(I)V

    .line 248
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 249
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 250
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 249
    :catchall_4
    move-exception v1

    :try_start_9
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    throw v1

    .line 253
    :pswitch_f
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 255
    :try_start_a
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1, v0}, Lorg/apache/commons/net/telnet/TelnetClient;->_processDont(I)V

    .line 256
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 257
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 258
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 257
    :catchall_5
    move-exception v1

    :try_start_b
    monitor-exit v2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    throw v1

    .line 262
    :pswitch_10
    packed-switch v0, :pswitch_data_2

    .line 269
    iget v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    array-length v2, v2

    if-ge v1, v2, :cond_6

    .line 270
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    aput v0, v1, v2

    .line 274
    :cond_6
    iput v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 265
    :pswitch_11
    const/16 v1, 0x9

    iput v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 277
    :pswitch_12
    sparse-switch v0, :sswitch_data_0

    .line 295
    :cond_7
    :goto_3
    iput v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 280
    :sswitch_0
    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    monitor-enter v2

    .line 282
    :try_start_c
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    iget v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    invoke-virtual {v1, v3, v4}, Lorg/apache/commons/net/telnet/TelnetClient;->_processSuboption([II)V

    .line 283
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v1}, Lorg/apache/commons/net/telnet/TelnetClient;->_flushOutputStream()V

    .line 284
    monitor-exit v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 285
    iput v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__receiveState:I

    goto/16 :goto_0

    .line 284
    :catchall_6
    move-exception v1

    :try_start_d
    monitor-exit v2
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    throw v1

    .line 288
    :sswitch_1
    iget v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    iget-object v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    array-length v2, v2

    if-ge v1, v2, :cond_7

    .line 289
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption:[I

    iget v2, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__suboption_count:I

    aput v0, v1, v2

    goto :goto_3

    .line 157
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
        :pswitch_0
        :pswitch_2
        :pswitch_12
    .end packed-switch

    .line 196
    :pswitch_data_1
    .packed-switch 0xf0
        :pswitch_b
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_9
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_a
    .end packed-switch

    .line 262
    :pswitch_data_2
    .packed-switch 0xff
        :pswitch_11
    .end packed-switch

    .line 277
    :sswitch_data_0
    .sparse-switch
        0xf0 -> :sswitch_0
        0xff -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method _start()V
    .locals 3

    .prologue
    .line 94
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    if-nez v1, :cond_0

    .line 111
    :goto_0
    return-void

    .line 99
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 104
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getPriority()I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 105
    .local v0, "priority":I
    const/16 v1, 0xa

    if-le v0, v1, :cond_1

    .line 106
    const/16 v0, 0xa

    .line 108
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setPriority(I)V

    .line 109
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 110
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public available()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 561
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v1

    .line 563
    :try_start_0
    iget v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    invoke-super {p0}, Ljava/io/BufferedInputStream;->available()I

    move-result v2

    add-int/2addr v0, v2

    monitor-exit v1

    return v0

    .line 564
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 577
    invoke-super {p0}, Ljava/io/BufferedInputStream;->close()V

    .line 579
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v1

    .line 581
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    .line 582
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 584
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 586
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__thread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 589
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 590
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 592
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    .line 593
    return-void

    .line 590
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public markSupported()Z
    .locals 1

    .prologue
    .line 554
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, -0x2

    const/4 v3, -0x1

    .line 364
    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v4

    .line 369
    :goto_0
    :try_start_0
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    if-eqz v5, :cond_0

    .line 372
    iget-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 373
    .local v1, "e":Ljava/io/IOException;
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 374
    throw v1

    .line 480
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 377
    :cond_0
    :try_start_1
    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-nez v5, :cond_7

    .line 380
    iget-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    if-eqz v5, :cond_1

    .line 381
    monitor-exit v4

    move v0, v3

    .line 477
    :goto_1
    return v0

    .line 385
    :cond_1
    iget-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v5, :cond_2

    .line 387
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v5}, Ljava/lang/Object;->notify()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 390
    const/4 v5, 0x1

    :try_start_2
    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    .line 391
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    .line 392
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 394
    :catch_0
    move-exception v1

    .line 396
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v3, Ljava/io/InterruptedIOException;

    const-string/jumbo v5, "Fatal thread interruption during read."

    invoke-direct {v3, v5}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 402
    .end local v1    # "e":Ljava/lang/InterruptedException;
    :cond_2
    const/4 v5, 0x1

    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 404
    const/4 v2, 0x1

    .line 410
    .local v2, "mayBlock":Z
    :cond_3
    :try_start_4
    invoke-direct {p0, v2}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__read(Z)I
    :try_end_4
    .catch Ljava/io/InterruptedIOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result v0

    .local v0, "ch":I
    if-gez v0, :cond_4

    .line 411
    if-eq v0, v7, :cond_4

    .line 412
    :try_start_5
    monitor-exit v4

    goto :goto_1

    .line 416
    .end local v0    # "ch":I
    :catch_1
    move-exception v1

    .line 418
    .local v1, "e":Ljava/io/InterruptedIOException;
    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 420
    :try_start_6
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 421
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 424
    :try_start_7
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    const-wide/16 v8, 0x64

    invoke-virtual {v6, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 429
    :goto_2
    :try_start_8
    monitor-exit v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 430
    :try_start_9
    monitor-exit v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    move v0, v3

    goto :goto_1

    .line 429
    :catchall_1
    move-exception v3

    :try_start_a
    monitor-exit v5
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :try_start_b
    throw v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 436
    .end local v1    # "e":Ljava/io/InterruptedIOException;
    .restart local v0    # "ch":I
    :cond_4
    if-eq v0, v7, :cond_5

    .line 438
    :try_start_c
    invoke-direct {p0, v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__processChar(I)Z
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_2
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 450
    :cond_5
    const/4 v2, 0x0

    .line 454
    :try_start_d
    invoke-super {p0}, Ljava/io/BufferedInputStream;->available()I

    move-result v5

    if-lez v5, :cond_6

    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v6, v6

    add-int/lit8 v6, v6, -0x1

    if-lt v5, v6, :cond_3

    .line 456
    :cond_6
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__readIsWaiting:Z

    goto :goto_0

    .line 441
    :catch_2
    move-exception v1

    .line 443
    .local v1, "e":Ljava/lang/InterruptedException;
    iget-boolean v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    if-eqz v5, :cond_5

    .line 444
    monitor-exit v4

    move v0, v3

    goto :goto_1

    .line 464
    .end local v0    # "ch":I
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v2    # "mayBlock":Z
    :cond_7
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    aget v0, v3, v5

    .line 466
    .restart local v0    # "ch":I
    iget v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    iget-object v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    array-length v5, v5

    if-lt v3, v5, :cond_8

    .line 467
    const/4 v3, 0x0

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queueHead:I

    .line 470
    :cond_8
    iget v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 473
    iget v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-nez v3, :cond_9

    iget-boolean v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    if-eqz v3, :cond_9

    .line 474
    iget-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V

    .line 477
    :cond_9
    monitor-exit v4
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    goto/16 :goto_1

    .line 426
    .end local v0    # "ch":I
    .local v1, "e":Ljava/io/InterruptedIOException;
    .restart local v2    # "mayBlock":Z
    :catch_3
    move-exception v6

    goto :goto_2
.end method

.method public read([B)I
    .locals 2
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 498
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/commons/net/telnet/TelnetInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x1

    .line 521
    const/4 v4, 0x1

    if-ge p3, v4, :cond_1

    .line 522
    const/4 v3, 0x0

    .line 546
    :cond_0
    :goto_0
    return v3

    .line 526
    :cond_1
    iget-object v4, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v4

    .line 528
    :try_start_0
    iget v5, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    if-le p3, v5, :cond_2

    .line 529
    iget p3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__bytesAvailable:I

    .line 531
    :cond_2
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 533
    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->read()I

    move-result v0

    .local v0, "ch":I
    if-eq v0, v3, :cond_0

    .line 537
    move v1, p2

    .line 541
    .local v1, "off":I
    :goto_1
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "offset":I
    .local v2, "offset":I
    int-to-byte v4, v0

    aput-byte v4, p1, p2

    .line 543
    add-int/lit8 p3, p3, -0x1

    if-lez p3, :cond_3

    invoke-virtual {p0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->read()I

    move-result v0

    if-ne v0, v3, :cond_4

    .line 546
    :cond_3
    sub-int v3, v2, v1

    move p2, v2

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_0

    .line 531
    .end local v0    # "ch":I
    .end local v1    # "off":I
    :catchall_0
    move-exception v3

    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .end local p2    # "offset":I
    .restart local v0    # "ch":I
    .restart local v1    # "off":I
    .restart local v2    # "offset":I
    :cond_4
    move p2, v2

    .end local v2    # "offset":I
    .restart local p2    # "offset":I
    goto :goto_1
.end method

.method public run()V
    .locals 10

    .prologue
    const/4 v6, 0x1

    .line 599
    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    .line 604
    :cond_0
    :goto_0
    :try_start_0
    iget-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-nez v6, :cond_1

    .line 608
    const/4 v6, 0x1

    :try_start_1
    invoke-direct {p0, v6}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__read(Z)I
    :try_end_1
    .catch Ljava/io/InterruptedIOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v0

    .local v0, "ch":I
    if-gez v0, :cond_3

    .line 668
    .end local v0    # "ch":I
    :cond_1
    :goto_1
    iget-object v7, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v7

    .line 670
    const/4 v6, 0x1

    :try_start_2
    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    .line 671
    const/4 v6, 0x1

    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__hasReachedEOF:Z

    .line 672
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v6}, Ljava/lang/Object;->notify()V

    .line 673
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 675
    const/4 v6, 0x0

    iput-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__threaded:Z

    .line 676
    return-void

    .line 612
    :catch_0
    move-exception v1

    .line 614
    .local v1, "e":Ljava/io/InterruptedIOException;
    :try_start_3
    iget-object v7, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v7
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 616
    :try_start_4
    iput-object v1, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 617
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    invoke-virtual {v6}, Ljava/lang/Object;->notifyAll()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 620
    :try_start_5
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    const-wide/16 v8, 0x64

    invoke-virtual {v6, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 628
    :cond_2
    :try_start_6
    monitor-exit v7

    goto :goto_0

    .line 629
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v6
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    .line 659
    .end local v1    # "e":Ljava/io/InterruptedIOException;
    :catch_1
    move-exception v3

    .line 661
    .local v3, "ioe":Ljava/io/IOException;
    iget-object v7, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__queue:[I

    monitor-enter v7

    .line 663
    :try_start_8
    iput-object v3, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__ioException:Ljava/io/IOException;

    .line 664
    monitor-exit v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 665
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v6}, Lorg/apache/commons/net/telnet/TelnetClient;->notifyInputListener()V

    goto :goto_1

    .line 622
    .end local v3    # "ioe":Ljava/io/IOException;
    .restart local v1    # "e":Ljava/io/InterruptedIOException;
    :catch_2
    move-exception v2

    .line 624
    .local v2, "interrupted":Ljava/lang/InterruptedException;
    :try_start_9
    iget-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z

    if-eqz v6, :cond_2

    .line 625
    monitor-exit v7
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_1

    .line 630
    .end local v1    # "e":Ljava/io/InterruptedIOException;
    .end local v2    # "interrupted":Ljava/lang/InterruptedException;
    :catch_3
    move-exception v5

    .line 634
    .local v5, "re":Ljava/lang/RuntimeException;
    :try_start_a
    invoke-super {p0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1

    goto :goto_1

    .line 641
    .end local v5    # "re":Ljava/lang/RuntimeException;
    .restart local v0    # "ch":I
    :cond_3
    const/4 v4, 0x0

    .line 644
    .local v4, "notify":Z
    :try_start_b
    invoke-direct {p0, v0}, Lorg/apache/commons/net/telnet/TelnetInputStream;->__processChar(I)Z
    :try_end_b
    .catch Ljava/lang/InterruptedException; {:try_start_b .. :try_end_b} :catch_4
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_1

    move-result v4

    .line 654
    :cond_4
    if-eqz v4, :cond_0

    .line 655
    :try_start_c
    iget-object v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__client:Lorg/apache/commons/net/telnet/TelnetClient;

    invoke-virtual {v6}, Lorg/apache/commons/net/telnet/TelnetClient;->notifyInputListener()V

    goto :goto_0

    .line 646
    :catch_4
    move-exception v1

    .line 648
    .local v1, "e":Ljava/lang/InterruptedException;
    iget-boolean v6, p0, Lorg/apache/commons/net/telnet/TelnetInputStream;->__isClosed:Z
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_1

    if-eqz v6, :cond_4

    goto :goto_1

    .line 664
    .end local v0    # "ch":I
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v4    # "notify":Z
    .restart local v3    # "ioe":Ljava/io/IOException;
    :catchall_1
    move-exception v6

    :try_start_d
    monitor-exit v7
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    throw v6

    .line 673
    .end local v3    # "ioe":Ljava/io/IOException;
    :catchall_2
    move-exception v6

    :try_start_e
    monitor-exit v7
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_2

    throw v6
.end method
