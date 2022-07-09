.class public abstract Lorg/jivesoftware/smackx/packet/JingleDescription;
.super Ljava/lang/Object;
.source "JingleDescription.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/JingleDescription$Audio;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field public static final NODENAME:Ljava/lang/String; = "description"


# instance fields
.field private final payloads:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lorg/jivesoftware/smackx/packet/JingleDescription;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/packet/JingleDescription;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    .line 53
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
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "pts":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    monitor-enter v3

    .line 93
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 94
    .local v1, "ptIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 95
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 96
    .local v0, "pt":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    new-instance v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;)V

    invoke-virtual {p0, v2}, Lorg/jivesoftware/smackx/packet/JingleDescription;->addPayloadType(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    goto :goto_0

    .line 98
    .end local v0    # "pt":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    .end local v1    # "ptIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .restart local v1    # "ptIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    :cond_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    return-void
.end method

.method public addPayloadType(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 3
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 77
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    monitor-enter v1

    .line 78
    if-nez p1, :cond_0

    .line 79
    :try_start_0
    sget-object v0, Lorg/jivesoftware/smackx/packet/JingleDescription;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v2, "Null payload type"

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->error(Ljava/lang/String;)V

    .line 83
    :goto_0
    monitor-exit v1

    .line 84
    return-void

    .line 81
    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getAudioPayloadTypesList()Ljava/util/List;
    .locals 5
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
    .line 127
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getPayloadTypes()Ljava/util/Iterator;

    move-result-object v0

    .line 130
    .local v0, "jinglePtsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 131
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 132
    .local v1, "jpt":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    instance-of v4, v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    if-eqz v4, :cond_0

    move-object v2, v1

    .line 133
    check-cast v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 134
    .local v2, "jpta":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 138
    .end local v1    # "jpt":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .end local v2    # "jpta":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    :cond_1
    return-object v3
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    const-string/jumbo v0, "description"

    return-object v0
.end method

.method public abstract getNamespace()Ljava/lang/String;
.end method

.method public getPayloadTypes()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/PayloadType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getPayloadTypesList()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getPayloadTypesCount()I
    .locals 2

    .prologue
    .line 147
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    monitor-enter v1

    .line 148
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    monitor-exit v1

    return v0

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getPayloadTypesList()Ljava/util/List;
    .locals 3
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
    .line 116
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    monitor-enter v1

    .line 117
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v1

    return-object v0

    .line 118
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 6

    .prologue
    .line 158
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    monitor-enter v4

    .line 161
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 162
    const-string/jumbo v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    const-string/jumbo v3, " xmlns=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getNamespace()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, "\" >"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/JingleDescription;->payloads:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 166
    .local v2, "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    if-eqz v2, :cond_0

    .line 167
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 172
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "payloadType":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 170
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_1
    const-string/jumbo v3, "</"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleDescription;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v5, ">"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
