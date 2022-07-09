.class public Lorg/jivesoftware/smack/ReconnectionManager;
.super Ljava/lang/Object;
.source "ReconnectionManager.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field done:Z

.field private randomBase:I

.field private reconnectionThread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    new-instance v0, Lorg/jivesoftware/smack/ReconnectionManager$1;

    invoke-direct {v0}, Lorg/jivesoftware/smack/ReconnectionManager$1;-><init>()V

    invoke-static {v0}, Lorg/jivesoftware/smack/Connection;->addConnectionCreationListener(Lorg/jivesoftware/smack/ConnectionCreationListener;)V

    .line 55
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    iput v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    .line 58
    iput-object p1, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 59
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smack/ReconnectionManager$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "x1"    # Lorg/jivesoftware/smack/ReconnectionManager$1;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/ReconnectionManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/ReconnectionManager;

    .prologue
    .line 36
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I

    return v0
.end method

.method static synthetic access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/ReconnectionManager;

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smack/ReconnectionManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smack/ReconnectionManager;

    .prologue
    .line 36
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method private isReconnectionAllowed()Z
    .locals 1

    .prologue
    .line 68
    iget-boolean v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->isReconnectionAllowed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public connectionClosed()V
    .locals 1

    .prologue
    .line 188
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    .line 189
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 4
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 192
    const/4 v3, 0x0

    iput-boolean v3, p0, Lorg/jivesoftware/smack/ReconnectionManager;->done:Z

    .line 193
    instance-of v3, p1, Lorg/jivesoftware/smack/XMPPException;

    if-eqz v3, :cond_1

    move-object v2, p1

    .line 194
    check-cast v2, Lorg/jivesoftware/smack/XMPPException;

    .line 195
    .local v2, "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    invoke-virtual {v2}, Lorg/jivesoftware/smack/XMPPException;->getStreamError()Lorg/jivesoftware/smack/packet/StreamError;

    move-result-object v0

    .line 198
    .local v0, "error":Lorg/jivesoftware/smack/packet/StreamError;
    if-eqz v0, :cond_1

    .line 199
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/StreamError;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 201
    .local v1, "reason":Ljava/lang/String;
    const-string/jumbo v3, "conflict"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 210
    .end local v0    # "error":Lorg/jivesoftware/smack/packet/StreamError;
    .end local v1    # "reason":Ljava/lang/String;
    .end local v2    # "xmppEx":Lorg/jivesoftware/smack/XMPPException;
    :cond_0
    :goto_0
    return-void

    .line 207
    :cond_1
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    invoke-virtual {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->reconnect()V

    goto :goto_0
.end method

.method protected notifyAttemptToReconnectIn(I)V
    .locals 3
    .param p1, "seconds"    # I

    .prologue
    .line 180
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 181
    iget-object v2, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v2, v2, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ConnectionListener;

    .line 182
    .local v1, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/ConnectionListener;->reconnectingIn(I)V

    goto :goto_0

    .line 185
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_0
    return-void
.end method

.method protected notifyReconnectionFailed(Ljava/lang/Exception;)V
    .locals 3
    .param p1, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 167
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 168
    iget-object v2, p0, Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v2, v2, Lorg/jivesoftware/smack/Connection;->connectionListeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/ConnectionListener;

    .line 169
    .local v1, "listener":Lorg/jivesoftware/smack/ConnectionListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smack/ConnectionListener;->reconnectionFailed(Ljava/lang/Exception;)V

    goto :goto_0

    .line 172
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/jivesoftware/smack/ConnectionListener;
    :cond_0
    return-void
.end method

.method protected declared-synchronized reconnect()V
    .locals 2

    .prologue
    .line 84
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_1

    .line 159
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 90
    :cond_1
    :try_start_1
    new-instance v0, Lorg/jivesoftware/smack/ReconnectionManager$2;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smack/ReconnectionManager$2;-><init>(Lorg/jivesoftware/smack/ReconnectionManager;)V

    iput-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    .line 155
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    const-string/jumbo v1, "Smack Reconnection Manager"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 157
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager;->reconnectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 214
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 218
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 225
    return-void
.end method
