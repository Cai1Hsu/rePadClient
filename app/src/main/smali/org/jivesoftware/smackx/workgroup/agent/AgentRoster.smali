.class public Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;
.super Ljava/lang/Object;
.source "AgentRoster.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$1;,
        Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$AgentStatusListener;,
        Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;
    }
.end annotation


# static fields
.field private static final EVENT_AGENT_ADDED:I = 0x0

.field private static final EVENT_AGENT_REMOVED:I = 0x1

.field private static final EVENT_PRESENCE_CHANGED:I = 0x2


# instance fields
.field private connection:Lorg/jivesoftware/smack/Connection;

.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;",
            ">;"
        }
    .end annotation
.end field

.field private presenceMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jivesoftware/smack/packet/Presence;",
            ">;>;"
        }
    .end annotation
.end field

.field rosterInitialized:Z

.field private workgroupJID:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/Connection;Ljava/lang/String;)V
    .locals 5
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "workgroupJID"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->rosterInitialized:Z

    .line 68
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->connection:Lorg/jivesoftware/smack/Connection;

    .line 69
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->workgroupJID:Ljava/lang/String;

    .line 70
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    .line 71
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    .line 72
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->presenceMap:Ljava/util/Map;

    .line 74
    new-instance v1, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v2, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;

    invoke-direct {v1, v2}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    .line 75
    .local v1, "rosterFilter":Lorg/jivesoftware/smack/filter/PacketFilter;
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$AgentStatusListener;

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$AgentStatusListener;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$1;)V

    invoke-virtual {p1, v2, v1}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 77
    new-instance v2, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;

    invoke-direct {v2, p0, v3}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$PresencePacketListener;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster$1;)V

    new-instance v3, Lorg/jivesoftware/smack/filter/PacketTypeFilter;

    const-class v4, Lorg/jivesoftware/smack/packet/Presence;

    invoke-direct {v3, v4}, Lorg/jivesoftware/smack/filter/PacketTypeFilter;-><init>(Ljava/lang/Class;)V

    invoke-virtual {p1, v2, v3}, Lorg/jivesoftware/smack/Connection;->addPacketListener(Lorg/jivesoftware/smack/PacketListener;Lorg/jivesoftware/smack/filter/PacketFilter;)V

    .line 81
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;-><init>()V

    .line 82
    .local v0, "request":Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;->setTo(Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 84
    return-void
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->workgroupJID:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->presenceMap:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$500(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;ILjava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;
    .param p1, "x1"    # I
    .param p2, "x2"    # Ljava/lang/Object;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->fireEvent(ILjava/lang/Object;)V

    return-void
.end method

.method private fireEvent(ILjava/lang/Object;)V
    .locals 4
    .param p1, "eventType"    # I
    .param p2, "eventObject"    # Ljava/lang/Object;

    .prologue
    .line 258
    const/4 v1, 0x0

    .line 259
    .local v1, "listeners":[Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    monitor-enter v3

    .line 260
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;

    .line 261
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 262
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 264
    packed-switch p1, :pswitch_data_0

    .line 263
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 262
    .end local v0    # "i":I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 266
    .restart local v0    # "i":I
    :pswitch_0
    aget-object v3, v1, v0

    move-object v2, p2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;->agentAdded(Ljava/lang/String;)V

    goto :goto_1

    .line 269
    :pswitch_1
    aget-object v3, v1, v0

    move-object v2, p2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;->agentRemoved(Ljava/lang/String;)V

    goto :goto_1

    .line 272
    :pswitch_2
    aget-object v3, v1, v0

    move-object v2, p2

    check-cast v2, Lorg/jivesoftware/smack/packet/Presence;

    invoke-interface {v3, v2}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;->presenceChanged(Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_1

    .line 276
    :cond_0
    return-void

    .line 264
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 247
    move-object v0, p1

    .line 248
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 249
    invoke-static {p1}, Lorg/jivesoftware/smack/util/StringUtils;->parseBareAddress(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 251
    :cond_0
    return-object v0
.end method


# virtual methods
.method public addListener(Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;)V
    .locals 6
    .param p1, "listener"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;

    .prologue
    .line 104
    iget-object v5, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    monitor-enter v5

    .line 105
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 106
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->getAgents()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 110
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 113
    .local v1, "jid":Ljava/lang/String;
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 115
    invoke-interface {p1, v1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;->agentAdded(Ljava/lang/String;)V

    .line 116
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->presenceMap:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 117
    .local v3, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    if-eqz v3, :cond_0

    .line 118
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 119
    .local v2, "presences":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/packet/Presence;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 121
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smack/packet/Presence;

    invoke-interface {p1, v4}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;->presenceChanged(Lorg/jivesoftware/smack/packet/Presence;)V

    goto :goto_0

    .line 127
    .end local v0    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v1    # "jid":Ljava/lang/String;
    .end local v2    # "presences":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smack/packet/Presence;>;"
    .end local v3    # "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    :cond_1
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 6
    .param p1, "jid"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 175
    if-nez p1, :cond_0

    .line 186
    :goto_0
    return v2

    .line 178
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    monitor-enter v3

    .line 179
    :try_start_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 180
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 181
    .local v0, "entry":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 182
    const/4 v2, 0x1

    monitor-exit v3

    goto :goto_0

    .line 185
    .end local v0    # "entry":Ljava/lang/String;
    .end local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public getAgentCount()I
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getAgents()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 158
    .local v0, "agents":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    monitor-enter v3

    .line 159
    :try_start_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 160
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 162
    .end local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 163
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    return-object v2
.end method

.method public getPresence(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 7
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 199
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->getPresenceMapKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 200
    .local v1, "key":Ljava/lang/String;
    iget-object v5, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->presenceMap:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 201
    .local v4, "userPresences":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jivesoftware/smack/packet/Presence;>;"
    if-nez v4, :cond_1

    .line 202
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 203
    .local v3, "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 230
    :cond_0
    :goto_0
    return-object v3

    .line 209
    .end local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_1
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 211
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 213
    .restart local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 214
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smack/packet/Presence;

    .line 215
    .local v2, "p":Lorg/jivesoftware/smack/packet/Presence;
    if-nez v3, :cond_3

    .line 216
    move-object v3, v2

    goto :goto_1

    .line 219
    :cond_3
    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v5

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/Presence;->getPriority()I

    move-result v6

    if-le v5, v6, :cond_2

    .line 220
    move-object v3, v2

    goto :goto_1

    .line 224
    .end local v2    # "p":Lorg/jivesoftware/smack/packet/Presence;
    :cond_4
    if-nez v3, :cond_0

    .line 225
    new-instance v3, Lorg/jivesoftware/smack/packet/Presence;

    .end local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    sget-object v5, Lorg/jivesoftware/smack/packet/Presence$Type;->unavailable:Lorg/jivesoftware/smack/packet/Presence$Type;

    invoke-direct {v3, v5}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 226
    .restart local v3    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    invoke-virtual {v3, p1}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public reload()V
    .locals 2

    .prologue
    .line 92
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;

    invoke-direct {v0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;-><init>()V

    .line 93
    .local v0, "request":Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;->setTo(Ljava/lang/String;)V

    .line 94
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 95
    return-void
.end method

.method public removeListener(Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;)V
    .locals 2
    .param p1, "listener"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentRosterListener;

    .prologue
    .line 137
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    monitor-enter v1

    .line 138
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/AgentRoster;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 139
    monitor-exit v1

    .line 140
    return-void

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
