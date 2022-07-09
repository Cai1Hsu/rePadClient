.class public Lorg/jivesoftware/smackx/ChatStateManager;
.super Ljava/lang/Object;
.source "ChatStateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/ChatStateManager$1;,
        Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;,
        Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;
    }
.end annotation


# static fields
.field private static final filter:Lorg/jivesoftware/smack/filter/PacketFilter;

.field private static final managers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Connection;",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lorg/jivesoftware/smackx/ChatStateManager;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final chatStates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/jivesoftware/smack/Chat;",
            "Lorg/jivesoftware/smackx/ChatState;",
            ">;"
        }
    .end annotation
.end field

.field private final connection:Lorg/jivesoftware/smack/Connection;

.field private final incomingInterceptor:Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;

.field private final outgoingInterceptor:Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 57
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/jivesoftware/smackx/ChatStateManager;->managers:Ljava/util/Map;

    .line 60
    new-instance v0, Lorg/jivesoftware/smack/filter/NotFilter;

    new-instance v1, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;

    const-string/jumbo v2, "http://jabber.org/protocol/chatstates"

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketExtensionFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/filter/NotFilter;-><init>(Lorg/jivesoftware/smack/filter/PacketFilter;)V

    sput-object v0, Lorg/jivesoftware/smackx/ChatStateManager;->filter:Lorg/jivesoftware/smack/filter/PacketFilter;

    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smack/Connection;)V
    .locals 3
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    const/4 v1, 0x0

    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v0, Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;

    invoke-direct {v0, p0, v1}, Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;-><init>(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smackx/ChatStateManager$1;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->outgoingInterceptor:Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;

    .line 94
    new-instance v0, Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;

    invoke-direct {v0, p0, v1}, Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;-><init>(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smackx/ChatStateManager$1;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->incomingInterceptor:Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;

    .line 99
    new-instance v0, Lorg/jivesoftware/smack/util/collections/ReferenceMap;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/jivesoftware/smack/util/collections/ReferenceMap;-><init>(II)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->chatStates:Ljava/util/Map;

    .line 103
    iput-object p1, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    .line 104
    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/ChatStateManager;)Lorg/jivesoftware/smack/Connection;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ChatStateManager;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)Z
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ChatStateManager;
    .param p1, "x1"    # Lorg/jivesoftware/smack/Chat;
    .param p2, "x2"    # Lorg/jivesoftware/smackx/ChatState;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/ChatStateManager;->updateChatState(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/ChatStateManager;Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/ChatStateManager;
    .param p1, "x1"    # Lorg/jivesoftware/smack/Chat;
    .param p2, "x2"    # Lorg/jivesoftware/smackx/ChatState;

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/ChatStateManager;->fireNewChatState(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)V

    return-void
.end method

.method private fireNewChatState(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)V
    .locals 3
    .param p1, "chat"    # Lorg/jivesoftware/smack/Chat;
    .param p2, "state"    # Lorg/jivesoftware/smackx/ChatState;

    .prologue
    .line 165
    invoke-virtual {p1}, Lorg/jivesoftware/smack/Chat;->getListeners()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/MessageListener;

    .line 166
    .local v1, "listener":Lorg/jivesoftware/smack/MessageListener;
    instance-of v2, v1, Lorg/jivesoftware/smackx/ChatStateListener;

    if-eqz v2, :cond_0

    .line 167
    check-cast v1, Lorg/jivesoftware/smackx/ChatStateListener;

    .end local v1    # "listener":Lorg/jivesoftware/smack/MessageListener;
    invoke-interface {v1, p1, p2}, Lorg/jivesoftware/smackx/ChatStateListener;->stateChanged(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)V

    goto :goto_0

    .line 170
    :cond_1
    return-void
.end method

.method public static getInstance(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ChatStateManager;
    .locals 5
    .param p0, "connection"    # Lorg/jivesoftware/smack/Connection;

    .prologue
    .line 71
    if-nez p0, :cond_0

    .line 72
    const/4 v0, 0x0

    .line 86
    :goto_0
    return-object v0

    .line 74
    :cond_0
    sget-object v3, Lorg/jivesoftware/smackx/ChatStateManager;->managers:Ljava/util/Map;

    monitor-enter v3

    .line 76
    :try_start_0
    sget-object v2, Lorg/jivesoftware/smackx/ChatStateManager;->managers:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 78
    .local v1, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lorg/jivesoftware/smackx/ChatStateManager;>;"
    if-nez v1, :cond_1

    .line 79
    new-instance v0, Lorg/jivesoftware/smackx/ChatStateManager;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/ChatStateManager;-><init>(Lorg/jivesoftware/smack/Connection;)V

    .line 80
    .local v0, "manager":Lorg/jivesoftware/smackx/ChatStateManager;
    invoke-direct {v0}, Lorg/jivesoftware/smackx/ChatStateManager;->init()V

    .line 81
    sget-object v2, Lorg/jivesoftware/smackx/ChatStateManager;->managers:Ljava/util/Map;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    :goto_1
    monitor-exit v3

    goto :goto_0

    .line 87
    .end local v0    # "manager":Lorg/jivesoftware/smackx/ChatStateManager;
    .end local v1    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lorg/jivesoftware/smackx/ChatStateManager;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 84
    .restart local v1    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lorg/jivesoftware/smackx/ChatStateManager;>;"
    :cond_1
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/ChatStateManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v0    # "manager":Lorg/jivesoftware/smackx/ChatStateManager;
    goto :goto_1
.end method

.method private init()V
    .locals 3

    .prologue
    .line 107
    iget-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getChatManager()Lorg/jivesoftware/smack/ChatManager;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/ChatStateManager;->outgoingInterceptor:Lorg/jivesoftware/smackx/ChatStateManager$OutgoingMessageInterceptor;

    sget-object v2, Lorg/jivesoftware/smackx/ChatStateManager;->filter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-virtual {v0, v1, v2}, Lorg/jivesoftware/smack/ChatManager;->addOutgoingMessageInterceptor(Lorg/jivesoftware/smack/PacketInterceptor;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 109
    iget-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Lorg/jivesoftware/smack/Connection;->getChatManager()Lorg/jivesoftware/smack/ChatManager;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smackx/ChatStateManager;->incomingInterceptor:Lorg/jivesoftware/smackx/ChatStateManager$IncomingMessageInterceptor;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/ChatManager;->addChatListener(Lorg/jivesoftware/smack/ChatManagerListener;)V

    .line 111
    iget-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-static {v0}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->getInstanceFor(Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smackx/ServiceDiscoveryManager;

    move-result-object v0

    const-string/jumbo v1, "http://jabber.org/protocol/chatstates"

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/ServiceDiscoveryManager;->addFeature(Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method private updateChatState(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)Z
    .locals 2
    .param p1, "chat"    # Lorg/jivesoftware/smack/Chat;
    .param p2, "newState"    # Lorg/jivesoftware/smackx/ChatState;

    .prologue
    .line 156
    iget-object v1, p0, Lorg/jivesoftware/smackx/ChatStateManager;->chatStates:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/ChatState;

    .line 157
    .local v0, "lastChatState":Lorg/jivesoftware/smackx/ChatState;
    if-eq v0, p2, :cond_0

    .line 158
    iget-object v1, p0, Lorg/jivesoftware/smackx/ChatStateManager;->chatStates:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    const/4 v1, 0x1

    .line 161
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 142
    if-ne p0, p1, :cond_0

    const/4 v1, 0x1

    .line 147
    :goto_0
    return v1

    .line 143
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 145
    check-cast v0, Lorg/jivesoftware/smackx/ChatStateManager;

    .line 147
    .local v0, "that":Lorg/jivesoftware/smackx/ChatStateManager;
    iget-object v1, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    iget-object v2, v0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/jivesoftware/smackx/ChatStateManager;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public setCurrentState(Lorg/jivesoftware/smackx/ChatState;Lorg/jivesoftware/smack/Chat;)V
    .locals 4
    .param p1, "newState"    # Lorg/jivesoftware/smackx/ChatState;
    .param p2, "chat"    # Lorg/jivesoftware/smack/Chat;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jivesoftware/smack/XMPPException;
        }
    .end annotation

    .prologue
    .line 127
    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    .line 128
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Arguments cannot be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 130
    :cond_1
    invoke-direct {p0, p2, p1}, Lorg/jivesoftware/smackx/ChatStateManager;->updateChatState(Lorg/jivesoftware/smack/Chat;Lorg/jivesoftware/smackx/ChatState;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 138
    :goto_0
    return-void

    .line 133
    :cond_2
    new-instance v1, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v1}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 134
    .local v1, "message":Lorg/jivesoftware/smack/packet/Message;
    new-instance v0, Lorg/jivesoftware/smackx/packet/ChatStateExtension;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smackx/packet/ChatStateExtension;-><init>(Lorg/jivesoftware/smackx/ChatState;)V

    .line 135
    .local v0, "extension":Lorg/jivesoftware/smackx/packet/ChatStateExtension;
    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    .line 137
    invoke-virtual {p2, v1}, Lorg/jivesoftware/smack/Chat;->sendMessage(Lorg/jivesoftware/smack/packet/Message;)V

    goto :goto_0
.end method
