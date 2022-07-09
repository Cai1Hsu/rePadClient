.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;
.super Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;
.source "JmfMediaManager.java"


# static fields
.field private static final LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

.field public static final MEDIA_NAME:Ljava/lang/String; = "JMF"


# instance fields
.field private mediaLocator:Ljava/lang/String;

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
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-class v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;

    invoke-static {v0}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->getLogger(Ljava/lang/Class;)Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    sput-object v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 1
    .param p1, "mediaLocator"    # Ljava/lang/String;
    .param p2, "transportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    .line 68
    invoke-direct {p0, p2}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->payloads:Ljava/util/List;

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->mediaLocator:Ljava/lang/String;

    .line 69
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->mediaLocator:Ljava/lang/String;

    .line 70
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->setupPayloads()V

    .line 71
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V
    .locals 1
    .param p1, "transportManager"    # Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;

    .prologue
    .line 58
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/JingleMediaManager;-><init>(Lorg/jivesoftware/smackx/jingle/nat/JingleTransportManager;)V

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->payloads:Ljava/util/List;

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->mediaLocator:Ljava/lang/String;

    .line 59
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->setupPayloads()V

    .line 60
    return-void
.end method

.method private static runLinuxPreInstall()V
    .locals 0

    .prologue
    .line 165
    return-void
.end method

.method public static setupJMF()V
    .locals 8

    .prologue
    .line 131
    const-string/jumbo v5, "user.home"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 132
    .local v2, "homeDir":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    const-string/jumbo v5, ".jmf"

    invoke-direct {v3, v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    .local v3, "jmfDir":Ljava/io/File;
    const-string/jumbo v5, "java.class.path"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "classpath":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "path.separator"

    invoke-static {v6}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    const-string/jumbo v5, "java.class.path"

    invoke-static {v5, v0}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 138
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 139
    invoke-virtual {v3}, Ljava/io/File;->mkdir()Z

    .line 141
    :cond_0
    new-instance v4, Ljava/io/File;

    const-string/jumbo v5, "jmf.properties"

    invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    .local v4, "jmfProperties":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 145
    :try_start_0
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    :cond_1
    :goto_0
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->runLinuxPreInstall()V

    .line 158
    new-instance v5, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {v5, v6, v7}, Lorg/jivesoftware/smackx/jingle/mediaimpl/JMFInit;-><init>([Ljava/lang/String;Z)V

    .line 161
    return-void

    .line 147
    :catch_0
    move-exception v1

    .line 148
    .local v1, "ex":Ljava/io/IOException;
    sget-object v5, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->LOGGER:Lorg/jivesoftware/smackx/jingle/SmackLogger;

    const-string/jumbo v6, "Failed to create jmf.properties"

    invoke-virtual {v5, v6}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 149
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method private setupPayloads()V
    .locals 5

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->payloads:Ljava/util/List;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    const/4 v2, 0x3

    const-string/jumbo v3, "gsm"

    invoke-direct {v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->payloads:Ljava/util/List;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    const/4 v2, 0x4

    const-string/jumbo v3, "g723"

    invoke-direct {v1, v2, v3}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->payloads:Ljava/util/List;

    new-instance v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    const/4 v2, 0x0

    const-string/jumbo v3, "PCMU"

    const/16 v4, 0x3e80

    invoke-direct {v1, v2, v3, v4}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;-><init>(ILjava/lang/String;I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
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
    .line 82
    new-instance v0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;

    iget-object v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->mediaLocator:Ljava/lang/String;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/AudioMediaSession;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Ljava/lang/String;Lorg/jivesoftware/smackx/jingle/JingleSession;)V

    return-object v0
.end method

.method public getMediaLocator()Ljava/lang/String;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->mediaLocator:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 168
    const-string/jumbo v0, "JMF"

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
    .line 100
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->payloads:Ljava/util/List;

    return-object v0
.end method

.method public setMediaLocator(Ljava/lang/String;)V
    .locals 0
    .param p1, "mediaLocator"    # Ljava/lang/String;

    .prologue
    .line 118
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/jmf/JmfMediaManager;->mediaLocator:Ljava/lang/String;

    .line 119
    return-void
.end method
