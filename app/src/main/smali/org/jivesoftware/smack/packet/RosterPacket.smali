.class public Lorg/jivesoftware/smack/packet/RosterPacket;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "RosterPacket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;,
        Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;,
        Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    }
.end annotation


# instance fields
.field private final rosterItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/RosterPacket$Item;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    .line 268
    return-void
.end method


# virtual methods
.method public addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V
    .locals 2
    .param p1, "item"    # Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .prologue
    .line 43
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    monitor-enter v1

    .line 44
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    monitor-exit v1

    .line 46
    return-void

    .line 45
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getChildElementXML()Ljava/lang/String;
    .locals 5

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<query xmlns=\"jabber:iq:roster\">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    iget-object v4, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    monitor-enter v4

    .line 74
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .line 75
    .local v1, "entry":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-virtual {v1}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 77
    .end local v1    # "entry":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    .end local v2    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    const-string/jumbo v3, "</query>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getRosterItemCount()I
    .locals 2

    .prologue
    .line 54
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    monitor-enter v1

    .line 55
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 56
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getRosterItems()Ljava/util/Collection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/packet/RosterPacket$Item;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    monitor-enter v1

    .line 66
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/RosterPacket;->rosterItems:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 67
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
