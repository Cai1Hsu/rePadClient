.class Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;
.super Ljava/lang/Object;
.source "RoomListenerMultiplexor.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$1;,
        Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;,
        Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;
    }
.end annotation


# static fields
.field private static final monitors:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private filter:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;

.field private listener:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 48
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->monitors:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;)V
    .locals 2
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "filter"    # Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;
    .param p3, "listener"    # Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    if-nez p1, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Connection is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    if-nez p2, :cond_1

    .line 89
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Filter is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_1
    if-nez p3, :cond_2

    .line 92
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Listener is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 94
    :cond_2
    iput-object p1, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->connection:Lorg/jivesoftware/smack/Connection;

    .line 95
    iput-object p2, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->filter:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;

    .line 96
    iput-object p3, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->listener:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    .line 97
    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/Connection;->removeConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 145
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->listener:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 146
    return-void
.end method

.method public static getRoomMultiplexor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;
    .locals 5
    .param p0, "conn"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 62
    sget-object v2, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->monitors:Ljava/util/Map;

    monitor-enter v2

    .line 63
    :try_start_0
    sget-object v1, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->monitors:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->monitors:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 64
    :cond_0
    new-instance v0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

    new-instance v1, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;-><init>(Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$1;)V

    new-instance v3, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;-><init>(Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$1;)V

    invoke-direct {v0, p0, v1, v3}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;-><init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;)V

    .line 67
    .local v0, "rm":Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->init()V

    .line 72
    sget-object v1, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->monitors:Ljava/util/Map;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v1, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .end local v0    # "rm":Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;
    :cond_1
    sget-object v1, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->monitors:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;

    monitor-exit v2

    return-object v1

    .line 76
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public addRoom(Ljava/lang/String;Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;)V
    .locals 1
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "roomListener"    # Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->filter:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;->addRoom(Ljava/lang/String;)V

    .line 101
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->listener:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    invoke-virtual {v0, p1, p2}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;->addRoom(Ljava/lang/String;Lorg/jivesoftware/smackx/muc/PacketMultiplexListener;)V

    .line 102
    return-void
.end method

.method public connectionClosed()V
    .locals 0

    .prologue
    .line 105
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->cancel()V

    .line 106
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 109
    invoke-direct {p0}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->cancel()V

    .line 110
    return-void
.end method

.method public init()V
    .locals 3

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0, p0}, Lorg/jivesoftware/smack/Connection;->addConnectionListener(Lorg/jivesoftware/smack/ConnectionListener;)V

    .line 132
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->listener:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    iget-object v2, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->filter:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 133
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 0
    .param p1, "seconds"    # I

    .prologue
    .line 114
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 0
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 122
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 0

    .prologue
    .line 118
    return-void
.end method

.method public removeRoom(Ljava/lang/String;)V
    .locals 1
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 136
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->filter:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexFilter;->removeRoom(Ljava/lang/String;)V

    .line 137
    iget-object v0, p0, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor;->listener:Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/muc/RoomListenerMultiplexor$RoomMultiplexListener;->removeRoom(Ljava/lang/String;)V

    .line 138
    return-void
.end method
