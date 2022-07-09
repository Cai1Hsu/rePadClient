.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
.source "ScreenShareMediaManager.java"


# static fields
.field public static final MEDIA_NAME:Ljava/lang/String; = "ScreenShare"


# instance fields
.field private decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

.field private encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

.field private payloads:Ljava/util/List;
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
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 2
    .param p1, "transportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->payloads:Ljava/util/List;

    .line 48
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .line 49
    iput-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .line 53
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->setupPayloads()V

    .line 54
    return-void
.end method

.method private setupPayloads()V
    .locals 4

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->payloads:Ljava/util/List;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    const/16 v2, 0x1e

    const-string/jumbo v3, "sshare"

    invoke-direct {v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    return-void
.end method


# virtual methods
.method public createMediaSession(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/JingleSession;)Lorg/jivesoftware/smackx/jingle/media/JingleMediaSession;
    .locals 6
    .param p1, "payloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .param p2, "remote"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p3, "local"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p4, "jingleSession"    # Lorg/jivesoftware/smackx/jingle/JingleSession;

    .prologue
    .line 81
    const/4 v0, 0x0

    .line 82
    .local v0, "session":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;

    .end local v0    # "session":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;
    const-string/jumbo v4, "Screen"

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 83
    .restart local v0    # "session":Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    if-eqz v1, :cond_0

    .line 84
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->setEncoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;)V

    .line 86
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    if-eqz v1, :cond_1

    .line 87
    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareSession;->setDecoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;)V

    .line 89
    :cond_1
    return-object v0
.end method

.method public getDecoder()Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    return-object v0
.end method

.method public getEncoder()Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    const-string/jumbo v0, "ScreenShare"

    return-object v0
.end method

.method public getPayloads()Ljava/util/List;
    .locals 1
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
    .line 69
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->payloads:Ljava/util/List;

    return-object v0
.end method

.method public getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 1

    .prologue
    .line 93
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v0

    return-object v0
.end method

.method public setDecoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;)V
    .locals 0
    .param p1, "decoder"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->decoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageDecoder;

    .line 102
    return-void
.end method

.method public setEncoder(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;)V
    .locals 0
    .param p1, "encoder"    # Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/ScreenShareMediaManager;->encoder:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;

    .line 110
    return-void
.end method
