.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
.source "MultiMediaManager.java"


# static fields
.field public static final MEDIA_NAME:Ljava/lang/String; = "Multi"


# instance fields
.field private managers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;",
            ">;"
        }
    .end annotation
.end field

.field private preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 1
    .param p1, "transportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->managers:Ljava/util/List;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 50
    return-void
.end method


# virtual methods
.method public addMediaManager(Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;)V
    .locals 1
    .param p1, "manager"    # Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->managers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    return-void
.end method

.method public createMediaSession(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
    .locals 3
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 86
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->managers:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 87
    .local v1, "manager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPayloads()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 88
    invoke-virtual {v1, p1, p2, p3, p4}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->createMediaSession(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;

    move-result-object v2

    .line 91
    .end local v1    # "manager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    :goto_0
    return-object v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    const-string/jumbo v0, "Multi"

    return-object v0
.end method

.method public getPayloads()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    :cond_0
    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->managers:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .line 69
    .local v3, "manager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPayloads()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 70
    .local v4, "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    iget-object v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v4, v5}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 71
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 74
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "manager":Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
    .end local v4    # "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :cond_3
    return-object v2
.end method

.method public getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 96
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v0

    goto :goto_0
.end method

.method public removeMediaManager(Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;)V
    .locals 1
    .param p1, "manager"    # Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->managers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 58
    return-void
.end method

.method public setPreferredPayloadType(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 0
    .param p1, "preferredPayloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/multi/MultiMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 101
    return-void
.end method
