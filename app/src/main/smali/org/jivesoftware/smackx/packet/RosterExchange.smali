.class public Lorg/jivesoftware/smackx/packet/RosterExchange;
.super Ljava/lang/Object;
.source "RosterExchange.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# instance fields
.field private remoteRosterEntries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/RemoteRosterEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    .line 63
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/Roster;)V
    .locals 3
    .param p1, "roster"    # Lorg/jivesoftware/smack/Roster;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    .line 72
    invoke-virtual {p1}, Lorg/jivesoftware/smack/Roster;->getEntries()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/RosterEntry;

    .line 73
    .local v1, "rosterEntry":Lorg/jivesoftware/smack/RosterEntry;
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/packet/RosterExchange;->addRosterEntry(Lorg/jivesoftware/smack/RosterEntry;)V

    goto :goto_0

    .line 75
    .end local v1    # "rosterEntry":Lorg/jivesoftware/smack/RosterEntry;
    :cond_0
    return-void
.end method


# virtual methods
.method public addRosterEntry(Lorg/jivesoftware/smack/RosterEntry;)V
    .locals 7
    .param p1, "rosterEntry"    # Lorg/jivesoftware/smack/RosterEntry;

    .prologue
    .line 84
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v2, "groupNamesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getGroups()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/RosterGroup;

    .line 87
    .local v0, "group":Lorg/jivesoftware/smack/RosterGroup;
    invoke-virtual {v0}, Lorg/jivesoftware/smack/RosterGroup;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    .end local v0    # "group":Lorg/jivesoftware/smack/RosterGroup;
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v2, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    .line 92
    .local v1, "groupNames":[Ljava/lang/String;
    new-instance v4, Lorg/jivesoftware/smackx/RemoteRosterEntry;

    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getUser()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lorg/jivesoftware/smack/RosterEntry;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v1}, Lorg/jivesoftware/smackx/RemoteRosterEntry;-><init>(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 95
    .local v4, "remoteRosterEntry":Lorg/jivesoftware/smackx/RemoteRosterEntry;
    invoke-virtual {p0, v4}, Lorg/jivesoftware/smackx/packet/RosterExchange;->addRosterEntry(Lorg/jivesoftware/smackx/RemoteRosterEntry;)V

    .line 96
    return-void
.end method

.method public addRosterEntry(Lorg/jivesoftware/smackx/RemoteRosterEntry;)V
    .locals 2
    .param p1, "remoteRosterEntry"    # Lorg/jivesoftware/smackx/RemoteRosterEntry;

    .prologue
    .line 104
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    monitor-enter v1

    .line 105
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    monitor-exit v1

    .line 107
    return-void

    .line 106
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    const-string/jumbo v0, "x"

    return-object v0
.end method

.method public getEntryCount()I
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 127
    const-string/jumbo v0, "jabber:x:roster"

    return-object v0
.end method

.method public getRosterEntries()Ljava/util/Iterator;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/RemoteRosterEntry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    monitor-enter v2

    .line 137
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/RosterExchange;->remoteRosterEntries:Ljava/util/List;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 138
    .local v0, "entries":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/RemoteRosterEntry;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    monitor-exit v2

    return-object v1

    .line 139
    .end local v0    # "entries":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/RemoteRosterEntry;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public toXML()Ljava/lang/String;
    .locals 5

    .prologue
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/RosterExchange;->getElementName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " xmlns=\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/RosterExchange;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/RosterExchange;->getRosterEntries()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/RemoteRosterEntry;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 174
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/RemoteRosterEntry;

    .line 175
    .local v2, "remoteRosterEntry":Lorg/jivesoftware/smackx/RemoteRosterEntry;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/RemoteRosterEntry;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 177
    .end local v2    # "remoteRosterEntry":Lorg/jivesoftware/smackx/RemoteRosterEntry;
    :cond_0
    const-string/jumbo v3, "</"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/RosterExchange;->getElementName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
