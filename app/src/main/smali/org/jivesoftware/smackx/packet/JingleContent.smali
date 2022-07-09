.class public Lorg/jivesoftware/smackx/packet/JingleContent;
.super Ljava/lang/Object;
.source "JingleContent.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# static fields
.field public static final CREATOR:Ljava/lang/String; = "creator"

.field public static final NAME:Ljava/lang/String; = "name"

.field public static final NODENAME:Ljava/lang/String; = "content"


# instance fields
.field private creator:Ljava/lang/String;

.field private description:Lorg/jivesoftware/smackx/packet/JingleDescription;

.field private name:Ljava/lang/String;

.field private final transports:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleTransport;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "creator"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    .line 51
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->creator:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->name:Ljava/lang/String;

    .line 53
    return-void
.end method


# virtual methods
.method public addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V
    .locals 2
    .param p1, "transport"    # Lorg/jivesoftware/smackx/packet/JingleTransport;

    .prologue
    .line 108
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    monitor-enter v1

    .line 109
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

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

.method public addTransports(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleTransport;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "transports":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/packet/JingleTransport;>;"
    monitor-enter p1

    .line 121
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/JingleTransport;

    .line 122
    .local v1, "transport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/packet/JingleContent;->addJingleTransport(Lorg/jivesoftware/smackx/packet/JingleTransport;)V

    goto :goto_0

    .line 124
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "transport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    :catchall_0
    move-exception v2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    return-void
.end method

.method public getCreator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->creator:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Lorg/jivesoftware/smackx/packet/JingleDescription;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->description:Lorg/jivesoftware/smackx/packet/JingleDescription;

    return-object v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    const-string/jumbo v0, "content"

    return-object v0
.end method

.method public getJingleTransports()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleTransport;",
            ">;"
        }
    .end annotation

    .prologue
    .line 133
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContent;->getJingleTransportsList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getJingleTransportsCount()I
    .locals 2

    .prologue
    .line 153
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    monitor-enter v1

    .line 154
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 155
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getJingleTransportsList()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleTransport;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    monitor-enter v1

    .line 143
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-string/jumbo v0, ""

    return-object v0
.end method

.method public setDescription(Lorg/jivesoftware/smackx/packet/JingleDescription;)V
    .locals 0
    .param p1, "description"    # Lorg/jivesoftware/smackx/packet/JingleDescription;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->description:Lorg/jivesoftware/smackx/packet/JingleDescription;

    .line 90
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 6

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    monitor-enter v4

    .line 168
    :try_start_0
    const-string/jumbo v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContent;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, " creator=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->creator:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\' name=\'"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v5, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->name:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\'>"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->description:Lorg/jivesoftware/smackx/packet/JingleDescription;

    if-eqz v3, :cond_0

    .line 174
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->description:Lorg/jivesoftware/smackx/packet/JingleDescription;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/packet/JingleDescription;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleContent;->transports:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/JingleTransport;

    .line 179
    .local v2, "transport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/JingleTransport;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 182
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "transport":Lorg/jivesoftware/smackx/packet/JingleTransport;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 181
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    const-string/jumbo v3, "</"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContent;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ">"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 183
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
