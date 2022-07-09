.class public Lorg/jivesoftware/smackx/MessageEventManager;
.super Ljava/lang/Object;
.source "MessageEventManager.java"


# instance fields
.field private con:Lorg/jivesoftware/smack/Connection;

.field private messageEventNotificationListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/MessageEventNotificationListener;",
            ">;"
        }
    .end annotation
.end field

.field private messageEventRequestListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/MessageEventRequestListener;",
            ">;"
        }
    .end annotation
.end field

.field private packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private packetListener:Lorg/jivesoftware/smack/PacketListener;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "con"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    .line 51
    new-instance v0, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v1, "x"

    const-string/jumbo v2, "jabber:x:event"

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 60
    iput-object p1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    .line 61
    invoke-direct {p0}, Lorg/jivesoftware/smackx/MessageEventManager;->init()V

    .line 62
    return-void
.end method

.method static synthetic access$000(Lorg/jivesoftware/smackx/MessageEventManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/MessageEventManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smackx/MessageEventManager;->fireMessageEventRequestListeners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/MessageEventManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/MessageEventManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smackx/MessageEventManager;->fireMessageEventNotificationListeners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static addNotificationsRequests(Lorg/jivesoftware/smack/packet/Message;ZZZZ)V
    .locals 1
    .param p0, "message"    # Lorg/jivesoftware/smack/packet/Message;
    .param p1, "offline"    # Z
    .param p2, "delivered"    # Z
    .param p3, "displayed"    # Z
    .param p4, "composing"    # Z

    .prologue
    .line 79
    new-instance v0, Lorg/jivesoftware/smackx/packet/MessageEvent;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;-><init>()V

    .line 80
    .local v0, "messageEvent":Lorg/jivesoftware/smackx/packet/MessageEvent;
    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setOffline(Z)V

    .line 81
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setDelivered(Z)V

    .line 82
    invoke-virtual {v0, p3}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setDisplayed(Z)V

    .line 83
    invoke-virtual {v0, p4}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setComposing(Z)V

    .line 84
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 85
    return-void
.end method

.method private fireMessageEventNotificationListeners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "packetID"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;

    .prologue
    .line 176
    const/4 v2, 0x0

    .line 178
    .local v2, "listeners":[Lorg/jivesoftware/smackx/MessageEventNotificationListener;
    iget-object v5, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    monitor-enter v5

    .line 179
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v2, v4, [Lorg/jivesoftware/smackx/MessageEventNotificationListener;

    .line 181
    iget-object v4, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 182
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    :try_start_1
    const-class v4, Lorg/jivesoftware/smackx/MessageEventNotificationListener;

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v4, p3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 188
    .local v3, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_0

    .line 189
    aget-object v4, v2, v1

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 188
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 182
    .end local v1    # "i":I
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 191
    :catch_0
    move-exception v0

    .line 192
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 198
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_0
    :goto_1
    return-void

    .line 193
    :catch_1
    move-exception v0

    .line 194
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_1

    .line 195
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1
.end method

.method private fireMessageEventRequestListeners(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "packetID"    # Ljava/lang/String;
    .param p3, "methodName"    # Ljava/lang/String;

    .prologue
    .line 146
    const/4 v2, 0x0

    .line 148
    .local v2, "listeners":[Lorg/jivesoftware/smackx/MessageEventRequestListener;
    iget-object v5, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    monitor-enter v5

    .line 149
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v2, v4, [Lorg/jivesoftware/smackx/MessageEventRequestListener;

    .line 150
    iget-object v4, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 151
    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 153
    :try_start_1
    const-class v4, Lorg/jivesoftware/smackx/MessageEventRequestListener;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Lorg/jivesoftware/smackx/MessageEventManager;

    aput-object v7, v5, v6

    invoke-virtual {v4, p3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 157
    .local v3, "method":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v4, v2

    if-ge v1, v4, :cond_0

    .line 158
    aget-object v4, v2, v1

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    const/4 v6, 0x1

    aput-object p2, v5, v6

    const/4 v6, 0x2

    aput-object p0, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    .line 157
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 151
    .end local v1    # "i":I
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :catchall_0
    move-exception v4

    :try_start_2
    monitor-exit v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v4

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    .line 167
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :cond_0
    :goto_1
    return-void

    .line 162
    :catch_1
    move-exception v0

    .line 163
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_1

    .line 164
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v0

    .line 165
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1
.end method

.method private init()V
    .locals 3

    .prologue
    .line 202
    new-instance v0, Lorg/jivesoftware/smackx/MessageEventManager$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/MessageEventManager$1;-><init>(Lorg/jivesoftware/smackx/MessageEventManager;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    .line 225
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    iget-object v2, p0, Lorg/jivesoftware/smackx/MessageEventManager;->packetFilter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 226
    return-void
.end method


# virtual methods
.method public addMessageEventNotificationListener(Lorg/jivesoftware/smackx/MessageEventNotificationListener;)V
    .locals 2
    .param p1, "messageEventNotificationListener"    # Lorg/jivesoftware/smackx/MessageEventNotificationListener;

    .prologue
    .line 120
    iget-object v1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    monitor-enter v1

    .line 121
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    :cond_0
    monitor-exit v1

    .line 125
    return-void

    .line 124
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public addMessageEventRequestListener(Lorg/jivesoftware/smackx/MessageEventRequestListener;)V
    .locals 2
    .param p1, "messageEventRequestListener"    # Lorg/jivesoftware/smackx/MessageEventRequestListener;

    .prologue
    .line 94
    iget-object v1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    monitor-enter v1

    .line 95
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_0
    monitor-exit v1

    .line 99
    return-void

    .line 98
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 301
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    if-eqz v0, :cond_0

    .line 302
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    iget-object v1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->packetListener:Lorg/jivesoftware/smack/PacketListener;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/Connection;->removePacketListener(Lorg/jivesoftware/smack/PacketListener;)V

    .line 304
    :cond_0
    return-void
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 307
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/MessageEventManager;->destroy()V

    .line 308
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 309
    return-void
.end method

.method public removeMessageEventNotificationListener(Lorg/jivesoftware/smackx/MessageEventNotificationListener;)V
    .locals 2
    .param p1, "messageEventNotificationListener"    # Lorg/jivesoftware/smackx/MessageEventNotificationListener;

    .prologue
    .line 134
    iget-object v1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    monitor-enter v1

    .line 135
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventNotificationListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 136
    monitor-exit v1

    .line 137
    return-void

    .line 136
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public removeMessageEventRequestListener(Lorg/jivesoftware/smackx/MessageEventRequestListener;)V
    .locals 2
    .param p1, "messageEventRequestListener"    # Lorg/jivesoftware/smackx/MessageEventRequestListener;

    .prologue
    .line 108
    iget-object v1, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    monitor-enter v1

    .line 109
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/MessageEventManager;->messageEventRequestListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 110
    monitor-exit v1

    .line 111
    return-void

    .line 110
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public sendCancelledNotification(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "packetID"    # Ljava/lang/String;

    .prologue
    .line 290
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 292
    .local v1, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MessageEvent;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;-><init>()V

    .line 293
    .local v0, "messageEvent":Lorg/jivesoftware/smackx/packet/MessageEvent;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setCancelled(Z)V

    .line 294
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setPacketID(Ljava/lang/String;)V

    .line 295
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 297
    iget-object v2, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 298
    return-void
.end method

.method public sendComposingNotification(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "packetID"    # Ljava/lang/String;

    .prologue
    .line 272
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 274
    .local v1, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MessageEvent;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;-><init>()V

    .line 275
    .local v0, "messageEvent":Lorg/jivesoftware/smackx/packet/MessageEvent;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setComposing(Z)V

    .line 276
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setPacketID(Ljava/lang/String;)V

    .line 277
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 279
    iget-object v2, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 280
    return-void
.end method

.method public sendDeliveredNotification(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "packetID"    # Ljava/lang/String;

    .prologue
    .line 236
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 238
    .local v1, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MessageEvent;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;-><init>()V

    .line 239
    .local v0, "messageEvent":Lorg/jivesoftware/smackx/packet/MessageEvent;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setDelivered(Z)V

    .line 240
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setPacketID(Ljava/lang/String;)V

    .line 241
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 243
    iget-object v2, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 244
    return-void
.end method

.method public sendDisplayedNotification(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "packetID"    # Ljava/lang/String;

    .prologue
    .line 254
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1, p1}, Lorg/jivesoftware/smack/packet/Message;-><init>(Ljava/lang/String;)V

    .line 256
    .local v1, "msg":Lorg/jivesoftware/smack/packet/Message;
    new-instance v0, Lorg/jivesoftware/smackx/packet/MessageEvent;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/packet/MessageEvent;-><init>()V

    .line 257
    .local v0, "messageEvent":Lorg/jivesoftware/smackx/packet/MessageEvent;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setDisplayed(Z)V

    .line 258
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/packet/MessageEvent;->setPacketID(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 261
    iget-object v2, p0, Lorg/jivesoftware/smackx/MessageEventManager;->con:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v2, v1}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 262
    return-void
.end method
