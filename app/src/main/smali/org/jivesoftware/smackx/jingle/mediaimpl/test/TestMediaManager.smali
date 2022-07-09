.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
.source "TestMediaManager.java"


# static fields
.field public static final MEDIA_NAME:Ljava/lang/String; = "TestMedia"


# instance fields
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

.field private preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 1
    .param p1, "transportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->payloads:Ljava/util/List;

    .line 44
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 48
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
    .line 73
    const/4 v0, 0x0

    .line 75
    .local v0, "session":Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;

    .end local v0    # "session":Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;
    const-string/jumbo v4, ""

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    .line 77
    .restart local v0    # "session":Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaSession;
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    const-string/jumbo v0, "TestMedia"

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
    .line 56
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->payloads:Ljava/util/List;

    return-object v0
.end method

.method public getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 83
    :goto_0
    return-object v0

    :cond_0
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;->getPreferredPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v0

    goto :goto_0
.end method

.method public setPayloads(Ljava/util/List;)V
    .locals 1
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
    .line 60
    .local p1, "payloads":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/jingle/media/PayloadType;>;"
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->payloads:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 61
    return-void
.end method

.method public setPreferredPayloadType(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 0
    .param p1, "preferredPayloadType"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 87
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/test/TestMediaManager;->preferredPayloadType:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 88
    return-void
.end method
