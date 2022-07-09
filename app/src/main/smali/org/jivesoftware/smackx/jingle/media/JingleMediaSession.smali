.class public abstract Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
.super Ljava/lang/Object;
.source "JingleMediaSession.java"


# instance fields
.field private jingleSession:Lorg/jivesoftware/smackx/jingle/JingleSession;

.field private local:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

.field private mediaLocator:Ljava/lang/String;

.field private mediaReceivedListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;",
            ">;"
        }
    .end annotation
.end field

.field private payloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

.field private remote:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V
    .locals 1
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "mediaLocator"    # Ljava/lang/String;
    .param p5, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaReceivedListeners:Ljava/util/List;

    .line 65
    iput-object p3, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->local:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 66
    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->remote:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .line 67
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->payloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 68
    iput-object p4, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaLocator:Ljava/lang/String;

    .line 69
    iput-object p5, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->jingleSession:Lorg/jivesoftware/smackx/jingle/JingleSession;

    .line 70
    return-void
.end method


# virtual methods
.method public addMediaReceivedListener(Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;)V
    .locals 1
    .param p1, "mediaReceivedListener"    # Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;

    .prologue
    .line 123
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaReceivedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    return-void
.end method

.method public getJingleSession()Lorg/jivesoftware/smackx/jingle/JingleSession;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->jingleSession:Lorg/jivesoftware/smackx/jingle/JingleSession;

    return-object v0
.end method

.method public getLocal()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->local:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    return-object v0
.end method

.method public getMediaLocator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaLocator:Ljava/lang/String;

    return-object v0
.end method

.method public getPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->payloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    return-object v0
.end method

.method public getRemote()Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->remote:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    return-object v0
.end method

.method public abstract initialize()V
.end method

.method public mediaReceived(Ljava/lang/String;)V
    .locals 3
    .param p1, "participant"    # Ljava/lang/String;

    .prologue
    .line 179
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaReceivedListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;

    .line 180
    .local v1, "mediaReceivedListener":Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;
    invoke-interface {v1, p1}, Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;->mediaReceived(Ljava/lang/String;)V

    goto :goto_0

    .line 182
    .end local v1    # "mediaReceivedListener":Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;
    :cond_0
    return-void
.end method

.method public removeAllMediaReceivedListener()V
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaReceivedListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 140
    return-void
.end method

.method public removeMediaReceivedListener(Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;)V
    .locals 1
    .param p1, "mediaReceivedListener"    # Lorg/jivesoftware/smackx/jingle/media/MediaReceivedListener;

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaReceivedListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 133
    return-void
.end method

.method public setMediaLocator(Ljava/lang/String;)V
    .locals 0
    .param p1, "mediaLocator"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;->mediaLocator:Ljava/lang/String;

    .line 115
    return-void
.end method

.method public abstract setTrasmit(Z)V
.end method

.method public abstract startReceive()V
.end method

.method public abstract startTrasmit()V
.end method

.method public abstract stopReceive()V
.end method

.method public abstract stopTrasmit()V
.end method
