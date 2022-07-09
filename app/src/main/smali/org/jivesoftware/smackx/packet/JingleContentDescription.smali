.class public abstract Lorg/jivesoftware/smackx/packet/JingleContentDescription;
.super Ljava/lang/Object;
.source "JingleContentDescription.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;,
        Lorg/jivesoftware/smackx/packet/JingleContentDescription$Audio;
    }
.end annotation


# static fields
.field public static final NODENAME:Ljava/lang/String; = "description"


# instance fields
.field private final payloads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    .line 50
    return-void
.end method


# virtual methods
.method public addAudioPayloadTypes(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p1, "pts":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    monitor-enter v3

    .line 86
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 87
    .local v1, "ptIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 88
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 89
    .local v0, "pt":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    new-instance v2, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;)V

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->addJinglePayloadType(Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;)V

    goto :goto_0

    .line 91
    .end local v0    # "pt":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    .end local v1    # "ptIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "ptIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    return-void
.end method

.method public addJinglePayloadType(Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;)V
    .locals 2
    .param p1, "pt"    # Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;

    .prologue
    .line 74
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    monitor-enter v1

    .line 75
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    monitor-exit v1

    .line 77
    return-void

    .line 76
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getAudioPayloadTypesList()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->getJinglePayloadTypes()Ljava/util/Iterator;

    move-result-object v0

    .line 123
    .local v0, "jinglePtsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;

    .line 125
    .local v1, "jpt":Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
    instance-of v4, v1, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;

    if-eqz v4, :cond_0

    move-object v2, v1

    .line 126
    check-cast v2, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;

    .line 127
    .local v2, "jpta":Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;->getPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 131
    .end local v1    # "jpt":Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
    .end local v2    # "jpta":Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;
    :cond_1
    return-object v3
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    const-string/jumbo v0, "description"

    return-object v0
.end method

.method public getJinglePayloadTypes()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->getJinglePayloadTypesList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getJinglePayloadTypesCount()I
    .locals 2

    .prologue
    .line 140
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    monitor-enter v1

    .line 141
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 142
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getJinglePayloadTypesList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 109
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    monitor-enter v1

    .line 110
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 111
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public abstract getNamespace()Ljava/lang/String;
.end method

.method public toXML()Ljava/lang/String;
    .locals 6

    .prologue
    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    monitor-enter v4

    .line 154
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 155
    const-string/jumbo v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    const-string/jumbo v3, " xmlns=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\" >"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->payloads:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 159
    .local v1, "pt":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 160
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;

    .line 161
    .local v2, "pte":Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 165
    .end local v1    # "pt":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;>;"
    .end local v2    # "pte":Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 163
    .restart local v1    # "pt":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;>;"
    :cond_0
    :try_start_1
    const-string/jumbo v3, "</"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ">"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .end local v1    # "pt":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;>;"
    :cond_1
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 167
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
